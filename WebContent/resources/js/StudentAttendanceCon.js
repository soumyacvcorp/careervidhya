var app=angular.module("App");

app.controller("studentAttCon",studentAttCon);
 
function studentAttCon($scope,$http,$q){
	
	var attScope=this;
	attScope.attendance_batch="select";
	attScope.attendance_subject="select";
	attScope.today_topic="select";
	attScope.attDashbordTime="overall";
	attScope.selectDashbord="default";
	$scope.showAttTopicError=false;
	$scope.subjectDashBoard=[{"ind":false,"data":"JAVA","data":"Java","srt":"Java"},{"ind":false,"data":"Aptitude","srt":"Aptitude"},{"ind":false,"data":"Communication","srt":"Communication"},{"ind":false,"data":"Linux & DB","srt":"Linux_DB"}];
	$scope.batchDashBoard=[];
	$scope.batchDashBoardtopic=[];
	$scope.attDashbordSearchData=[];
	$scope.showSendMailLoader=false;
	$scope.attDashHelp=true;
	$scope.seletcAllAttendanceDashbord=false;
	$scope.myAttReport=false;
	$scope.datemaplistshow=false;
	$scope.topicDashBoardtopic=[];
	attScope.attIndStuddatashow='overall';
	
	$scope.isToday=function(date){
		var today=new Date();
	    var todayDate= today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);	
		 return date==todayDate;
	};
	
	$scope.datemaplistshowfunction=function(v){
		$scope.datemaplistshow=true;
		$scope.datemaplistshowwork=v.workDate!=undefined?v.workDate.split(','):[];
		$scope.datemaplistshowpresent=v.present;
		console.log(v);
	}
	 
	
	//attance
	$scope.showAttStudentList=true;
	//$scope.seletcAllAttendance=false;
	
	
	$scope.showAttDashbord=false;
	$scope.showAttDashbordClick=function(){
		$scope.showAttDashbord=!$scope.showAttDashbord;
		$scope.getActiveBatch();
		$scope.getAttDashbordData();
	}
	$scope.filterDashBord=function(){
		attScope.serchData="";
		$scope.seletcAllAttendanceDashbord=false;
		//var subList=toStringCheckBox($scope.subjectDashBoard);
		var batchList=toStringCheckBox($scope.batchDashBoard);
		$scope.attDashbordSearchData=angular.copy($scope.attDashbordMainData);
		var d=[];
		for(var i=0;$scope.attDashbordSearchData!=undefined && i<$scope.attDashbordSearchData.length;i++){
			//var s1= changeAttanceBySubjectFilter($scope.attDashbordSearchData[i],subList);
			var s2= changeAttanceByDate($scope.attDashbordSearchData[i],attScope.attDashbordTime);
			if(batchList==undefined || batchList.toString().trim()=='NA'){
				if((((s2.workingDateList!=null && s2.workingDateList!=undefined && s2.workingDateList!='')?s2.workingDateList.split(',').length:0)-((s2.attance!=null && s2.attance!=undefined && s2.attance!='')?s2.attance.split(',').length:0))>=1)	
				d.push(s2);
			}
			else{
				if(batchList.toString().trim().split(',').indexOf($scope.attDashbordSearchData[i].batch.toString().trim())>=0){
					if((((s2.workingDateList!=null && s2.workingDateList!=undefined && s2.workingDateList!='')?s2.workingDateList.split(',').length:0)-((s2.attance!=null && s2.attance!=undefined && s2.attance!='')?s2.attance.split(',').length:0))>=1)
					d.push(s2);
				}
			}
		}
		$scope.attDashbordSearchData=d;
	}
	
	
	$scope.getTopicListBySelect=function(batch,sub){
		$scope.topicDashBoardtopicShow=[];
		if(sub=='NA'){
			$scope.topicDashBoardtopicShow=angular.copy($scope.topicDashBoardtopic);
		}
		else{
			var data=angular.copy($scope.topicDashBoardtopic);
			for(var i=0;i<data.length;i++){
				if(sub.toString().trim().split(',').indexOf(data[i].subject)>=0 ){
					$scope.topicDashBoardtopicShow.push(data[i]);
				}
			}
		}
		
	}
	
	
	////att report
	$scope.getAttRepo=function(data){
		
		
		console.log("---------------");
		console.log(data);
		$scope.myAttReport=true;
		$scope.myAttListStatusList=[];
		var arr=data.workingDateList.split(",");
		for(var i=0;i<arr.length;i++){
			if(arr[i]!=undefined && arr[i]!=""){
				var d=arr[i].trim().split("@");
				if(chk1($scope.myAttListStatusList,d[0])){
					for(var j=0;j<$scope.myAttListStatusList.length;j++){
						if($scope.myAttListStatusList[j].date==d[0]){
							var newReport={"subject":fullName1(d[1]),"status":(data.attance!=undefined)?(data.attance.indexOf(arr[i])!=-1)?true:false:false,"topic":$scope.TopicListByBatch[data.batch][arr[i]]!=undefined?$scope.TopicListByBatch[data.batch][arr[i]]:'Not Updated'};		
							$scope.myAttListStatusList[j].report.push(newReport);
						}
					}
				}
				else{
					var newData={};
					newData.date=d[0];
					newData.report=[{"subject":fullName1(d[1]),"status":(data.attance!=undefined)?(data.attance.indexOf(arr[i])!=-1)?true:false:false,"topic":$scope.TopicListByBatch[data.batch][arr[i]]!=undefined?$scope.TopicListByBatch[data.batch][arr[i]]:'Not Updated'}];
					$scope.myAttListStatusList.push(newData);
				}
			}
		}
		$scope.myAttListStatusListshow=angular.copy($scope.myAttListStatusList);
	}
	//filter of ind stud
	$scope.filterindstuddata=function(){
		var v=angular.copy($scope.myAttListStatusList);
		if(attScope.attIndStuddatashow=='overall'){
			$scope.myAttListStatusListshow=v;
		}
		else{
			if(attScope.attIndStuddatashow=='present') var x=true;
			else var x=false; 
			
			var data=[];
			for(var i=0;i<v.length;i++){
				var newData={};
				newData.date=v[i].date;
				newData.report=[];
				for(var j=0;j<v[i].report.length;j++){
					if(v[i].report[j].status==x){
						newData.report.push(v[i].report[j]);
					}
				}
				if(newData.report.length>0) data.push(newData);
			}
			$scope.myAttListStatusListshow=data;
		}
	}
	
	function fullName1(v){
		if(v=="J")
   		  return "Java";
   	  	else if(v=="A")
   	  	  return "Aptitude";
   	    else if(v=="C")
   	      return "Communication";
   	    else return "Linux & DB";
	}
	
	function chk1(arr,v){
		var b=false;
		for(var i=0;i<arr.length;i++){
			if(arr[i].date==v){
				b=true;
				break;
			}
		}
		return b;
	}
	
	function checkDate(inputText,inputText2)
	  {
	      var b=false;
	      if(inputText!=undefined && inputText2!=undefined){
	    	  var pdate = inputText.split('-');
	    	  var pdate2 = inputText2.split('-');
	    	  
	    	  if(pdate.length==3 && pdate2.length==3)
	    	  {   
	    		  var mm  = parseInt(pdate[1]);
	    		  var dd = parseInt(pdate[2]);
	    		  var yy = parseInt(pdate[0]);
	    		  var tddd = parseInt(pdate2[2]);
	              var tdmm = parseInt(pdate2[1]);
	              var tdyy = parseInt(pdate2[0]);  
	    		  
	    	   if((yy>2016) && (dd>0 && dd<32) && (mm>0 && mm<13)){
	            if( (!(yy % 4) && yy % 100) || !(yy % 400) ) var ListofDays = [31,29,31,30,31,30,31,31,30,31,30,31];
	            else var ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];
	            if(ListofDays[mm-1]>=dd){
	                if((tdmm<mm)||(tdmm==mm && tddd<=dd)){
	                    b=true;
	                }
	            }
	         }
	        }
	      }
	  return b;
	  }
	
	function changeAttanceByDate(data,time){
		var t=0;
		var sub=['J','A','C','L'];
		if(time=='overall') t=0;
		else if(time=='today') t=1;
		else if(time=='last 7 days') t=7;
		else if(time=='last 30 days') t=30;
		else t=-1;
		if(t==-1){
			if(data.workingDateList!=undefined){
				var arr=data.workingDateList.trim().split(',');
				var b=true;
				var v="";
				var date=attScope.showDashbord_date;
				    for(var j=0;j<sub.length;j++){
						if(arr.indexOf(date+'@'+sub[j])>=0){
							if(b){
								v=date+'@'+sub[j];
								b=false;
							}
							else{
								v=v+","+date+'@'+sub[j];
							}
						}
					}
				data.workingDateList=v;
			}
			if(data.attance!=undefined){
				var arr=data.attance.trim().split(',');
				var b=true;
				var v="";
				var date=attScope.showDashbord_date;
				    for(var j=0;j<sub.length;j++){
						if(arr.indexOf(date+'@'+sub[j])>=0){
							if(b){
								v=date+'@'+sub[j];
								b=false;
							}
							else{
								v=v+","+date+'@'+sub[j];
							}
						}
				    }
				data.attance=v;
			}
		}
		else if(t!=0){
			if(data.workingDateList!=undefined){
				var arr=data.workingDateList.trim().split(',');
				var b=true;
				var v="";
				for(var i=0;i<t;i++){
					var today = new Date(new Date().getTime() - (i * 24 * 60 * 60 * 1000));
				    var date=today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
				    for(var j=0;j<sub.length;j++){
						if(arr.indexOf(date+'@'+sub[j])>=0){
							if(b){
								v=date+'@'+sub[j];
								b=false;
							}
							else{
								v=v+","+date+'@'+sub[j];
							}
						}
					}
				}
				data.workingDateList=v;
			}
			if(data.attance!=undefined){
				var arr=data.attance.trim().split(',');
				var b=true;
				var v="";
				for(var i=0;i<t;i++){
					var today = new Date(new Date().getTime() - (i * 24 * 60 * 60 * 1000));
				    var date=today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
				    for(var j=0;j<sub.length;j++){
						if(arr.indexOf(date+'@'+sub[j])>=0){
							if(b){
								v=date+'@'+sub[j];
								b=false;
							}
							else{
								v=v+","+date+'@'+sub[j];
							}
						}
					}
				}
				data.attance=v;
			}
		}
		return data;
	}
	function dcrOrd(a,b){
		var v1=a.split("@");
		var v2=b.split("@");
		return getmyDate(v2[0])-getmyDate(v1[0]);
	}
	function getmyDate(s){
		var a=s.split(/-|\//);
		return new Date(a[0],a[1]-1,a[2]);
	}
	
	$scope.changeAttanceBySubjectFilter=function(data,sub){
		var wrk=0,att=0;
			if(data.workingDateList!=undefined){
				var arr=data.workingDateList.toString().trim().split(',');
				for(var i=0;i<arr.length;i++){
					if(arr[i]!=undefined && arr[i]!=""){
						var d=arr[i].trim().split('@');
						if(sub==d[1]) {
							wrk++;
						}
					}	
				}
			}
			
			if(data.attance!=undefined){
				var arr=data.attance.toString().trim().split(',');
				for(var i=0;i<arr.length;i++){
					if(arr[i]!=undefined && arr[i]!=""){
						var d=arr[i].trim().split('@');
						if(sub==d[1]) {
							att++;
						}
					}	
				}
			}
			
			return (wrk-att)+" / "+wrk;
	}
	function toStringCheckBox(v){
		var out="NA";
		var b=true;
		for(var i=0;i<v.length;i++){
			if(v[i].ind) {
				if(b){
					out=v[i].srt;
					b=false;
				}
				else{
					out=out+","+v[i].srt;
				}
				
			}
			
		}
		return out;
	}
	$scope.selectAllattDashbord=function(){
		for(var i=0;i<$scope.attDashbordSearchData.length;i++){
			if(((($scope.attDashbordSearchData[i].workingDateList!=null && $scope.attDashbordSearchData[i].workingDateList!=undefined && $scope.attDashbordSearchData[i].workingDateList!='')?$scope.attDashbordSearchData[i].workingDateList.split(',').length:0)-(($scope.attDashbordSearchData[i].attance!=null && $scope.attDashbordSearchData[i].attance!=undefined && $scope.attDashbordSearchData[i].attance!='')?$scope.attDashbordSearchData[i].attance.split(',').length:0))>=1)
			$scope.attDashbordSearchData[i].sendMail=$scope.seletcAllAttendanceDashbord;
		}
	}
	
	$scope.selectAllattDashbordTopic=function(){
		for(var i=0;i<$scope.topicMissedListByStudentShow.length;i++){
			$scope.topicMissedListByStudentShow[i].sendMail=$scope.seletcAllAttendanceDashbordTopic;
		}
	}
	$scope.getMissedTopic=function(data){
		var topic='NA';
		if((((data.workingDateList!=null && data.workingDateList!=undefined && data.workingDateList!='')?data.workingDateList.split(',').length:0)-((data.attance!=null && data.attance!=undefined && data.attance!='')?data.attance.split(',').length:0))>=1){
			var arr=data.workingDateList.trim().split(',');
			var b=true;
			var v=[];
			var cnt=0; 
			for(var i=0;i<arr.length;i++){
				if(arr[i]!=undefined && arr[i]!=""){
					var d=arr[i].trim().split("@");
					if(!chk1(data.attance,d[0])){
						var t=$scope.TopicListByBatch[data.batch][arr[i]]!=undefined?$scope.TopicListByBatch[data.batch][arr[i]]:'NA';
						if(t=='NA') cnt++;
						else{
							if(v.indexOf(t)<0){
								v.push(t);
							}
						}
					}	
				}
			}
			if(cnt>0) topic=v.toString()+" & "+cnt+" more";
			else topic=v.toString();
		}
		return topic;
	}
	
	$scope.sendMail=function(){
		var v=[];
		if(attScope.selectDashbord=='default'){
			for(var i=0;i<$scope.attDashbordSearchData.length;i++){
				if($scope.attDashbordSearchData[i].sendMail==true){
					var msg=attScope.sendmailmsg;
					msg=msg.replace(new RegExp('{name}', 'gi'),$scope.attDashbordSearchData[i].name );
					msg=msg.replace(new RegExp('{batch}', 'gi'),$scope.attDashbordSearchData[i].batch );
					msg=msg.replace(new RegExp('{absent}', 'gi'),($scope.attDashbordSearchData[i].workingDateList!=undefined?$scope.attDashbordSearchData[i].workingDateList.split(',').length:0) - ($scope.attDashbordSearchData[i].attance!=undefined?$scope.attDashbordSearchData[i].attance.split(',').length:0));
					msg=msg.replace(new RegExp('{duration}', 'gi'),attScope.attDashbordTime!='Select Date'?attScope.attDashbordTime:attScope.showDashbord_date);
					msg=msg.replace(new RegExp('{missedTopic}', 'gi'),$scope.getMissedTopic(angular.copy($scope.attDashbordSearchData[i])));
					var data={"email":$scope.attDashbordSearchData[i].email,"message":msg};
					v.push(data);
				}
			}
		}
		else if(attScope.selectDashbord=='topic'){
			for(var i=0;i<$scope.topicMissedListByStudentShow.length;i++){
				if($scope.topicMissedListByStudentShow[i].sendMail==true){
					var msg=attScope.sendmailmsg;
					msg=msg.replace(new RegExp('{name}', 'gi'),$scope.topicMissedListByStudentShow[i].name );
					msg=msg.replace(new RegExp('{batch}', 'gi'),$scope.topicMissedListByStudentShow[i].batch );
					msg=msg.replace(new RegExp('{subjectList}', 'gi'),toStringCheckBox($scope.subjectDashBoard));
					msg=msg.replace(new RegExp('{topicList}', 'gi'),toStringCheckBox($scope.topicDashBoardtopicShow));
					var data={"email":$scope.attDashbordSearchData[i].email,"message":msg};
					v.push(data);
				}
			}
		}
		
		$scope.showSendMailLoader=true;
		$http.post('sendBlockMsg', v)
		  .then(
			   function(response){
				   if(response.data.status=="true"){
					   document.getElementById('success').style.display='block';
						document.getElementById('reportT').innerHTML="successfully sent E-mail";
						$('#success').flash_message({
					        text: ' ',
					        how: 'append',
					        idR :'success'
					    });
						attScope.sendmailmsg="";
						$scope.filterDashBord();
						$scope.showSendMail=false;
						$scope.showSendMailLoader=false;
				   }
				   else{
					   document.getElementById('fail').style.display='block';
						document.getElementById('reportF').innerHTML="Error Occur in sent E-mail";
						$('#fail').flash_message({
					        text: ' ',
					        how: 'append',
					        idR :'fail'
					    });
						$scope.showSendMailLoader=false;
				   }
			 });
		
	}
	
	$scope.getAttDashbordData=function(){
		$http.get("getDataAttDashbord").then(function(response){
			$scope.attDashbordMainData=[];
			var data=response.data["attDashbordData"];
			for(var i=0;i<data.length;i++){
				if((((data[i].workingDateList!=null && data[i].workingDateList!=undefined && data[i].workingDateList!='')?data[i].workingDateList.split(',').length:0)-((data[i].attance!=null && data[i].attance!=undefined && data[i].attance!='')?data[i].attance.split(',').length:0))>=1){
					var arr=data[i].workingDateList.trim().split(',');
					data[i].workingDateListMain=data[i].workingDateList;
					var b=true;
					var v="";
					for(var j=0;j<arr.length;j++){
						var kj=(arr[j]!=undefined && arr[j]!=null && arr[j]!='')?arr[j].split('@')[0]:undefined;
						if(checkDate(kj,data[i].joinDate)){
							if(b){
								v=arr[j];
								b=false;
							}
							else{
								v=v+","+arr[j];
							}
						}
					}
					
					data[i].workingDateList=v;
					
					if((((data[i].workingDateList!=null && data[i].workingDateList!=undefined && data[i].workingDateList!='')?data[i].workingDateList.split(',').length:0)-((data[i].attance!=null && data[i].attance!=undefined && data[i].attance!='')?data[i].attance.split(',').length:0))>=1)
					$scope.attDashbordMainData.push(data[i]);
				}
			}
			$scope.attDashbordSearchData=angular.copy($scope.attDashbordMainData);
			$scope.getTopicCoverPerBatch();
		});
	}
	
	$scope.getTopicCoverPerBatch=function(){
		$scope.TopicListByBatch={};
		$http.get("getCTopicListOfAllBatch").then(function(response){
			var data=response.data["topicList"];
			for(var i=0;i<data.length;i++){
				var batch=data[i].batch;
				if($scope.TopicListByBatch[batch]==undefined){
					$scope.TopicListByBatch[batch]={};
					var arr=data[i].dayList.trim().split(',');
					for(var j=0;j<arr.length;j++){
						if(arr[j]!=undefined){
							var date=arr[j]+"@"+getSortFrom(data[i].subject);
							$scope.TopicListByBatch[batch][date]=data[i].topic;
						}
					}
				}
				else{
					var arr=data[i].dayList.trim().split(',');
					for(var j=0;j<arr.length;j++){
						if(arr[j]!=undefined){
							var date=arr[j]+"@"+getSortFrom(data[i].subject);
							if($scope.TopicListByBatch[batch][date]!=undefined){
								$scope.TopicListByBatch[batch][date]+="-#-"+data[i].topic;
							}
							else{
								$scope.TopicListByBatch[batch][date]=data[i].topic;
							}
						}
					}
				}
				if($scope.TopicListByBatch[batch].topicCover==undefined)$scope.TopicListByBatch[batch].topicCover=[];
				$scope.TopicListByBatch[batch].topicCover.push({'topic':data[i].topic,'subject':data[i].subject,'workDate':data[i].dayList});
				
			}
			$scope.getTopicMissedListByStudent();
		});
	}
	
	$scope.getTopicMissedListByStudent=function(){
		$scope.topicMissedListByStudent=[];
		var subArr=[];
		for(var i=0;i<$scope.attDashbordMainData.length;i++){
			var v={'name':$scope.attDashbordMainData[i].name,'batch':$scope.attDashbordMainData[i].batch,'email':$scope.attDashbordMainData[i].email,'sunjectwise':{}};
			var dd=false;
			for(var j=0;$scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover!=undefined && j<$scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover.length;j++){
				if($scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover[j].workDate!=undefined){
					var d='';
					var b=true,c=false;
					var arr=$scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover[j].workDate.split(",");
					for(var k=0;k<arr.length;k++){
						if(arr[k]!=undefined && arr[k].includes('-')){
							var ss=arr[k]+'@'+getSortFrom($scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover[j].subject);
							if($scope.attDashbordMainData[i].attance!=undefined && $scope.attDashbordMainData[i].attance.includes(ss)){
								if(b){
									d=arr[k];
									b=false;
								}
								else d=d+','+arr[k];
							}
							else{
								c=true;
								dd=true;
							}
						}
					}
					if(c){
						var sub=angular.copy(getRealFrom($scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover[j].subject));
						if(v.sunjectwise[sub]==undefined) v.sunjectwise[sub]=[];
						var g={};
						g.workDate=angular.copy($scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover[j].workDate);
						g.present=angular.copy(d);
						var t=angular.copy($scope.TopicListByBatch[$scope.attDashbordMainData[i].batch].topicCover[j].topic);
						g.topic=t;
						if(subArr.indexOf(t+"-##-"+sub)<0) subArr.push(t+"-##-"+sub);
						v.sunjectwise[sub].push(g);
					}
					
				}
			}
			if(dd)$scope.topicMissedListByStudent.push(angular.copy(v));
		}
		for(var i=0;i<subArr.length;i++){
			if(subArr[i]!=undefined){
				var data=subArr[i].split("-##-");
				if(data.length==2){ 
					var v={"ind":false,"data":data[0],"srt":data[0],"subject":data[1]};
					$scope.topicDashBoardtopic.push(v);
				}
			}
		}
		$scope.topicMissedListByStudentShow=angular.copy($scope.topicMissedListByStudent);
		//console.log($scope.topicDashBoardtopic);
		$scope.topicDashBoardtopicShow=angular.copy($scope.topicDashBoardtopic);
	}
	
	///topic report
	$scope.chngTopicFilter=function(){
		var batchList=toStringCheckBox($scope.batchDashBoardtopic);
		var subList=toStringCheckBox($scope.subjectDashBoard);
		//var topicList=toStringCheckBox($scope.topicDashBoardtopic);
		$scope.getTopicListBySelect(batchList,subList);
		//$scope.topicMissedListByStudentShow=[];
		var data=[];
		for(var i=0;i<$scope.topicMissedListByStudent.length;i++){
			var d={};
			var v=angular.copy($scope.topicMissedListByStudent[i]);
			if(batchList=='NA' || batchList.toString().trim().split(',').indexOf(v.batch.toString())>=0){
				d.name=v.name;
				d.batch=v.batch;
				d.email=v.email;
				if(subList!='NA'){
					d.sunjectwise={};
					var arr=subList.toString().trim().split(',');
					var b=false;
					for(var j=0;j<arr.length;j++){
						if(v.sunjectwise[arr[j]]!=undefined) {
							d.sunjectwise[arr[j]]=v.sunjectwise[arr[j]];
							b=true;
						}
					}
					if(b)data.push(d);
				}
				else{
					d.sunjectwise=v.sunjectwise;
					data.push(d);
				}
			}
		}
		$scope.topicMissedListByStudentShow=data;
		$scope.topicMissedListByStudentShowbytopic=angular.copy($scope.topicMissedListByStudentShow);
	}
	$scope.chngTopicFilterbyTopic=function(){
		var data=[];
		var topicList=toStringCheckBox($scope.topicDashBoardtopicShow);
		var subList=toStringCheckBox($scope.subjectDashBoard);
		var batchList=toStringCheckBox($scope.batchDashBoardtopic);
		if(subList=="NA") subList="Java,Aptitude,Communication,Linux_DB";
		console.log(topicList);
		for(var i=0;i<$scope.topicMissedListByStudentShowbytopic.length;i++){
			var d={};
			var v=angular.copy($scope.topicMissedListByStudentShowbytopic[i]);
			if(batchList=='NA' || batchList.toString().trim().split(',').indexOf(v.batch.toString())>=0){
				d.name=v.name;
				d.batch=v.batch;
				d.email=v.email;
				if(topicList!='NA'){
					d.sunjectwise={};
					var arr=subList.toString().trim().split(',');
					var b=false;
					for(var j=0;j<arr.length;j++){
						if(v.sunjectwise[arr[j]]!=undefined) {
							for(var k=0;k<v.sunjectwise[arr[j]].length;k++){
								if(topicList.includes(v.sunjectwise[arr[j]][k].topic)){
									if(d.sunjectwise[arr[j]]==undefined) d.sunjectwise[arr[j]]=[];
									d.sunjectwise[arr[j]].push(v.sunjectwise[arr[j]][k]);
									b=true;
								}
							}
						}
					}
					if(b)data.push(d);
				}
				else{
					d.sunjectwise=v.sunjectwise;
					data.push(d);
				}
			}
		}
		$scope.topicMissedListByStudentShow=data;	
	}
	
	function getSortFrom(v){
		if(v=="Java")
	   		return "J";
	   	else if(v=="Math")
	    	return "A";
	   	else if(v=="Comms")
	   	    return "C";
	   	else return "L";
	}
	function getRealFrom(v){
		if(v=="Math")
	    	return "Aptitude";
	   	else if(v=="Comms")
	   	    return "Communication";
	   	else if(v=="Msql")
	   	    return "Linux_DB";
	   	else if(v=="Linux")
	   	    return "Linux_DB";
	   	else return v;
	}
	
	$scope.getActiveBatch=function(){
		$scope.batchDashBoard=[];
		$http.get("getActiveBatches").then(function(response){
			var data=response.data["batches"];
			for(var i=0;i<data.length;i++){
				var v={"ind":false,"data":data[i].batchNumber,"srt":data[i].batchNumber};
				$scope.batchDashBoard.push(v);
				$scope.batchDashBoardtopic.push(v);
			}
		});
	}
	
	$scope.getTotalWorkingDayList=function(batch){
		$http.get("getTotalWorkingDayList/"+batch).then(function(response){
			var date=response.data.workingListdayList.split(',');
			if(date!=undefined){
			$scope.workingDateList=[];
			for(var i=0;i<date.length;i++){
				if(date[i]!=undefined){
					if(date[i].includes("@"+$scope.sub)){
						var v=date[i].split('@');
						$scope.workingDateList.push(v[0]);
					}
				}
			}
			function dmyOrdA(a,b){ return myDate(b)-myDate(a);}
			function myDate(s){var a=s.split(/-|\//); return new Date(a[0],a[1]-1,a[2]);}
			$scope.workingDateList.sort(dmyOrdA);
			$scope.studentData=[];
			$http.get("viewBatch/"+batch).then(function(response){
				var d=response.data.studentsList;
				for(var i=0;i<d.length;i++){
					var stud={"name":d[i].fullName,"attance":[],"pre":0,"abs":0,"total":$scope.workingDateList.length};
					var p=0,ab=0;
					if($scope.workingDateList!==undefined){
					for(var j=0;j<$scope.workingDateList.length;j++){
						if(d[i].attendance!=undefined){
							if(d[i].attendance.includes($scope.workingDateList[j]+"@"+$scope.sub)){
								stud.attance.push(true);
								p++;
							}
							else{
								stud.attance.push(false);
								ab++;
							}
						}
						else{
							stud.attance.push(false);
							ab++;
						}
					}
					}
					stud.pre=p;
					stud.abs=ab;
					$scope.studentData.push(stud);
				}
				
			});
		}
	  });
		
	};
	
	$scope.textDate=function(date){
		  var b="NA";
		  var pdate = date.split('-');
		  var monthList = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
		  if(pdate.length==3)
		    {   
		        var mm  = parseInt(pdate[1]);
		        var dd = pdate[2];  
		        b=monthList[mm-1]+"-"+dd;
		    }
		  return b;
	}
	
	$scope.attanceValid= function(){
	    var b=false;
	    var error_line="Please select valid";
	    $scope.att_error="";
	    var b=false,c=false,d=false;
	    if($scope.validatedate(attScope.attendance_date)){
	        b=true;
	    }
	    else error_line+=" Date";
	    if(attScope.attendance_batch!="select" && attScope.attendance_batch!=undefined){
       	 	c=true;
	    }
	    else error_line+=" Batch";
	    if(attScope.attendance_subject!="select" && attScope.attendance_subject!=undefined){
            d=true;
        }
        else error_line+=" Subject";
	    if(b && c && d) $scope.attBlockShow(1);
	    else  $scope.att_error=error_line;
	}

	$scope.validatedate=function(inputText)
	  {
	      var b=false;
	  var pdate = inputText.split('-');
	  if(pdate.length==3)
	    {   
	        var mm  = parseInt(pdate[1]);
	        var dd = parseInt(pdate[2]);
	        var yy = parseInt(pdate[0]);  
	        if((yy>2016) && (dd>0 && dd<32) && (mm>0 && mm<13)){
	            if( (!(yy % 4) && yy % 100) || !(yy % 400) ) var ListofDays = [31,29,31,30,31,30,31,31,30,31,30,31];
	            else var ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];
	            if(ListofDays[mm-1]>=dd){
	                var today = new Date();
	                var tddd = today.getDate();
	                var tdmm = today.getMonth()+1;
	                var tdyy = today.getFullYear();
	                if((tdmm>mm)||(tdmm==mm && tddd>=dd)){
	                    b=true;
	                }
	            }
	        }
	    }
	  return b;
	  }

	
	$scope.attBlockShow=function(value){
	      if(value==0){
	    	  $scope.showAttStudentList=true;
	      }
	      else{
	    	  if(attScope.attendance_subject=="Java")
	    		  $scope.sub="J";
	    	  else if(attScope.attendance_subject=="Aptitude")
	    		  $scope.sub="A";
	    	  else if(attScope.attendance_subject=="Communication")
	    		  $scope.sub="C";
	    	  else $scope.sub="L";
	    	  
	    	  $scope.getTopicComListListByBatch();
	    	  $scope.getStudentListByBatch();
	    	  $scope.showAttStudentList=false;
	    	  $scope.getTotalWorkingDayList(attScope.attendance_batch);
	    	  
	      }
	  }
	
	$scope.getStudentListByBatch=function(){
		$http.get("viewBatchAtt/"+attScope.attendance_batch+"/"+attScope.attendance_date+"@"+$scope.sub).then(function(response){
			$scope.sudentListByBatch=response.data["studentsList"];
		});
	};
	
	
	attScope.selectAll=function(){
		var obj=$scope.sudentListByBatch;
		if($scope.seletcAllAttendance==true){
			for(var i=0;i<obj.length;i++){
				obj[i]['attendance']=true;
			}
		}
		else{
			for(var i=0;i<obj.length;i++){
				obj[i]['attendance']=false;
			}
		}
		
	};
	attScope.selectAllChng=function(){
		var b=true;
		var obj=$scope.sudentListByBatch;
		for(var i=0;i<obj.length;i++){
			if(obj[i]['attendance']==false){
				b=false;
				break;
			}
		}
		$scope.seletcAllAttendance=b;
	};
	
	$scope.getStudentAttSetter =function(){ 
		  $scope.showAttTopicError=false;
		  $http.post('viewBatchAtt/'+attScope.attendance_batch+"/"+attScope.attendance_date+"@"+$scope.sub, $scope.sudentListByBatch)
		  .then(
			   function(response){
				   if(response.data.status=="yes"){
					   document.getElementById('success').style.display='block';
						document.getElementById('reportT').innerHTML="successfully Updated";
						$('#success').flash_message({
					        text: ' ',
					        how: 'append',
					        idR :'success'
					    });
						var today=new Date();
					    var todayDate= today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);	
						 
					    if($scope.isToday(attScope.attendance_date) && attScope.today_topic!=null && attScope.today_topic != "select"){
					    	$scope.setTodayUpdate(todayDate,attScope.today_topic);
					    	attScope.attendance_batch="select";
					    	attScope.attendance_subject="select";
					    	attScope.today_topic="select";
					    }
					    
						
					   $scope.attBlockShow(0);
					   
				   }
				   else{
					   document.getElementById('fail').style.display='block';
						document.getElementById('reportF').innerHTML="Error Occur in Update";
						$('#fail').flash_message({
					        text: ' ',
					        how: 'append',
					        idR :'fail'
					    });
				   }
			 });
	};
	
	/*$scope.getStudentAttSetter=function(){
		var ref=$scope.sudentListRef;
		var chng=$scope.sudentListByBatch;
		$scope.addAtt=[];
		$scope.removeAtt=[];
		console.log(chng);
		console.log(ref);
		for(var i=0;i<chng.length;i++){
			console.log(chng[i]['attendance']+"  -  "+ref[i]['attendance']);
			if(chng[i]['attendance']!=ref[i]['attendance']){
				if(chng[i]['attendance']==true) $scope.addAtt.push(chng[i]);
				else $scope.removeAtt.push(chng[i]);
			}
		}

		console.log($scope.addAtt);
		console.log($scope.removeAtt);
		
		
	}*/
	
	//end attance
	
	$scope.getTopicComListListByBatch=function(){
		var prom1,pom2;
		
	    	  if(attScope.attendance_subject=="Aptitude")
		    	  $scope.convertSubject="Math";
	    	  else if(attScope.attendance_subject=="Linux & DB")
		    	  $scope.convertSubject="MySql";
	    	  else if(attScope.attendance_subject=="Communication")
		    	  $scope.convertSubject="Comms";
	    	  else $scope.convertSubject=attScope.attendance_subject;
	    	  
		pom1=$http.get("syllabusUpdate/"+attScope.attendance_batch+"/"+$scope.convertSubject).then(function(response){
			$scope.topicComListByBatch=response.data["topicComList"];
			if( $scope.convertSubject=="MySql"){
				pom1=$http.get("syllabusUpdate/"+attScope.attendance_batch+"/linux").then(function(response){
					$scope.topicComListByBatch.concat(response.data["topicComList"]);
				});
			}
			
		});
		pom2=$scope.getTopicsListByBatch();
	return $q.all([pom1,pom2]);
	};
	
	$scope.getTopicsListByBatch=function(){
	   return $http.get("getTopicList/"+$scope.convertSubject).then(function(response){
			$scope.topicListBySub=response.data["topicList"];
		});
	};
	
	$scope.setTodayUpdate =function(date,topicAddToday){ 
			for(var i=0;i<$scope.topicListBySub.length;i++){
				if($scope.topicListBySub[i].topicName==topicAddToday){
					var b=false;
					$scope.id_ofTopic=$scope.topicListBySub[i].topic_id;
					if($scope.topicComListByBatch!=null){
						var j=0;
						for(j=0;j<$scope.topicComListByBatch.length;j++){
							if($scope.topicListBySub[i].topic_id==$scope.topicComListByBatch[j].topic_id){
								b=true;
								$scope.id_there=$scope.topicComListByBatch[j].topicCover_id;
								break;
							}
						}
					}
					if(b){
						if($scope.topicComListByBatch[j].dayList.indexOf(date)<0){
						$http.post('updateTodayTopic/'+$scope.id_there)
						.then(
							   function(response){
								   if(response.data.status==1){
									  console.log("succes update topic");
									  $scope.getTopicComListListByBatch();
									   
								   }
								   else{

										  console.log("Fail update topic");
								   }
							 });
						}
						else{
							 $scope.showTodayUdate=false;
						}
					}
					else{
						$http.post("addTodayTopic/"+attScope.attendance_batch+"/"+$scope.id_ofTopic)
						.then(
							   function(response){
								   if(response.data.status==true){
										  console.log("succes update topic");
										 $scope.getTopicComListListByBatch();
									   
								   }
								   else{
									   console.log("Fail update topic");
								   }
							 });
					}
				}
				else{}
			}
	};
	
	$scope.addNewTopic=false;
	$scope.addNewTopicClick=function(){
		$scope.AddNewTopic_errorMsg="";
		if(attScope.att_topicAddTopicName!=null && attScope.att_topicAddTopicAppDay !=null){
			if(attScope.att_topicAddTopicAppDay>0 && attScope.att_topicAddTopicAppDay<11){
				 $scope.addNewToipcDB();
			}
			else{
				$scope.AddNewTopic_errorMsg="Approx day must be in a range ( 1 - 10 )";
			}
		}
		else{
			$scope.AddNewTopic_errorMsg="Topic name & Approx day must be a valid data";
		}
	};
	
	 $scope.addNewToipcDB=function(){
			var max=0;
			for(var i=0;i<$scope.topicListBySub;i++){
				if(max<$scope.topicListBySub.flowNumber) max=$scope.topicListBySub.flowNumber;
			}
			max+=1;
			//addTopic/{topic}/{approx}/{subject}/{flow}/{dres}/{vres}
			$http.post("addTopic/"+attScope.att_topicAddTopicName+"/"+attScope.att_topicAddTopicAppDay+"/"+attScope.attendance_subject+"/"+max+"/"+((attScope.att_topicAddTopicDocRes!=null)?("'"+attScope.att_topicAddTopicDocRes+"'"):"NULL")+"/"+((attScope.att_topicAddTopicVideoRes!=null)?("'"+attScope.att_topicAddTopicVideoRes+"'"):"NULL"))
			.then(
				   function(response){
					   if(response.data.status==true){
						   document.getElementById('success').style.display='block';
							document.getElementById('reportT').innerHTML="successfully Updated";
							$('#success').flash_message({
						        text: ' ',
						        how: 'append',
						        idR :'success'
						    });
						   
						   
						   $scope.getTopicComListListByBatch();
						   $scope.addNewTopic=false;
						   attScope.today_topic=attScope.att_topicAddTopicName;
						   
		
					   }
					   else{
						   document.getElementById('fail').style.display='block';
							document.getElementById('reportF').innerHTML="Error Occur in Update";
							$('#fail').flash_message({
						        text: ' ',
						        how: 'append',
						        idR :'fail'
						    });
					   }
				   });
		 };
	
}
