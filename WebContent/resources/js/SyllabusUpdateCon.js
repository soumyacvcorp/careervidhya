var app=angular.module("App");

app.controller("studentSlyCon",studentSlyCon);
 
function studentSlyCon($scope,$http,$timeout,$q){
	
	var slyScope=this;
	slyScope.sly_batch="select";
	slyScope.sly_subject="select";
	
	$scope.showsyllabus=true;
	$scope.showTodayUdate=false;
	$scope.showTopicUpdateToday=true;
	$scope.showsSylEdit=false;
	
	$scope.slyValid= function(){
	    var b=false;
	    var error_line="Please select valid";
	    $scope.sly_error="";
	    var b=false;
	    if(slyScope.sly_subject!="select" && slyScope.sly_subject!=undefined){
	        if(slyScope.sly_batch!="select" && slyScope.sly_batch!=undefined){
	            b=true;
	        }
	        else error_line+=" Batch";
	    }
	    else error_line+=" Subject";
	    if(!b) $scope.sly_error=error_line;
	    else $scope.slyBlockShow(1);
	}

	$scope.slyBlockShow=function(value){
	      if(value==0){
	    	  $scope.showsyllabus=true;
	      }
	      else{
	    	  if(slyScope.sly_subject=="Java")
	    	  $scope.convertSubject="Java";
	    	  else if(slyScope.sly_subject=="Aptitude")
		    	  $scope.convertSubject="Math";
	    	  else if(slyScope.sly_subject=="Linux")
		    	  $scope.convertSubject="Linux";
	    	  else if(slyScope.sly_subject=="DataBase")
		    	  $scope.convertSubject="MySql";
	    	  else if(slyScope.sly_subject=="Communication")
		    	  $scope.convertSubject="Comms";
	    	  $scope.getTopicComListListByBatch();
	    	  
	    	  $scope.showsyllabus=false;
	      }
	  }
	
	$scope.getTopicComListListByBatch=function(){
		var prom1,pom2;
		pom1=$http.get("syllabusUpdate/"+slyScope.sly_batch+"/"+$scope.convertSubject).then(function(response){
			console.log("cal1");
			$scope.topicComListByBatch=response.data["topicComList"];
			
		});
		pom2=$scope.getTopicsListByBatch();
	return $q.all([pom1,pom2]);
	};
	$scope.getTopicsListByBatch=function(){
	   return $http.get("getTopicList/"+$scope.convertSubject).then(function(response){
			console.log("cal2");
			$scope.topicListBySub=response.data["topicList"];
		});
	};
	$scope.getDaylistinHtmlFormat=function(list){
		var s="";
		for(var i=0;i<list.length;i++){
			s=s+list[i]+" ";
		}
		return s;
	};
	$scope.clickTodayUpdate=function(){
		slyScope.sly_topicAddToday="";
		if($scope.showTodayUdate==false) $scope.showTodayUdate=true;
		else $scope.showTodayUdate=false;
	};
	$scope.clickTodayUpdateClose=function(){
		if($scope.showTodayUdate==true) $scope.showTodayUdate=false;
		else $scope.showTodayUdate=true;
	};
	$scope.clickTodayAddTopic=function(){
		if($scope.showTopicUpdateToday==true) $scope.showTopicUpdateToday=false;
		else $scope.showTopicUpdateToday=true;
	};
	$scope.clickEdit=function(){
		if($scope.showsSylEdit==true) $scope.showsSylEdit=false;
		else $scope.showsSylEdit=true;
	};
	$scope.clickEditTopic=function(topicObj){
		$scope.editValue=JSON.parse(JSON.stringify(topicObj));
		slyScope.sly_editTopicName=$scope.editValue.topicName;
		$scope.editTopicList=[];
		$scope.editTopicList.push(slyScope.sly_editTopicName);
		for(var i=0;i<$scope.topicListBySub.length;i++){
			var b=true;
			for(var j=0;j<$scope.topicComListByBatch.length;j++){
				if($scope.topicListBySub[i].topicName==$scope.topicComListByBatch[j].topicName){
					b=false;
					break;
				}
			}
			if(b) 
				$scope.editTopicList.push($scope.topicListBySub[i].topicName);
		}
		console.log($scope.editTopicList);
		$scope.clickEdit();
	};
	$scope.removeDateEditList=function(data){
		console.log(data);
		if($scope.editValue.dayList.length>1){
			var index = $scope.editValue.dayList.indexOf(data);
			$scope.editValue.dayList.splice(index, 1);
		}	
	};
	$scope.addDateEditList=function(date){
		if($scope.editValue.dayList!=undefined){
		  if($scope.validatedate(date) && $scope.editValue.dayList.indexOf(date)<0){
			if($scope.editValue.dayList.length>0 && $scope.editValue.dayList.length<10){
				$scope.editValue.dayList.push(date);
			}
		  }
		}
	};
	
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
	 };
	 
	 $scope.setTodayUpdateClick=function(){
		 $scope.Add_newTopic_error='';
		 if($scope.showTopicUpdateToday){
			// var today=new Date();
		    // var todayDate=today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
			 var a=false,b=false;
			 var err='Select valid '
		     if($scope.validatedate(slyScope.sly_dateAddToday)){
		    	 a=true;
			 }
		     else err+='Date ';
			 if(slyScope.sly_topicAddToday!=undefined && slyScope.sly_topicAddToday.trim()!=''){
				 b=true;
			 }
			 else err+='Topic ';
			 if(a && b)
			 $scope.setTodayUpdate(slyScope.sly_dateAddToday,slyScope.sly_topicAddToday);
			 else $scope.Add_newTopic_error=err;
		 }
		else{
			 var a=false,b=false,c=false;
			 var err='Select valid '
		     if($scope.validatedate(slyScope.sly_dateAddToday)){
		    	a=true;
			 }
		     else err+='Date ';
			 if(slyScope.sly_topicAddTopicName!=undefined && slyScope.sly_topicAddTopicName!=''){
				b=true;
			 }
			 else err+="Topic-Name ";
			 if(slyScope.sly_topicAddTopicAppDay!=undefined && slyScope.sly_topicAddTopicAppDay>0 &&slyScope.sly_topicAddTopicAppDay<11){
				c=true;
			 }
			 else err+="Approx-Day( 1 - 10 ) ";
			 if(a && b && c) $scope.addNewToipc(slyScope.sly_dateAddToday);
			 else $scope.Add_newTopic_error=err;
		}
	 };
	
	 $scope.addNewToipc=function(d){
		var max=0;
		for(var i=0;i<$scope.topicListBySub;i++){
			if(max<$scope.topicListBySub.flowNumber) max=$scope.topicListBySub.flowNumber;
		}
		max+=1;
		//addTopic/{topic}/{approx}/{subject}/{flow}/{dres}/{vres}
		$http.post("addTopic/"+slyScope.sly_topicAddTopicName+"/"+slyScope.sly_topicAddTopicAppDay+"/"+slyScope.sly_subject+"/"+max+"/"+((slyScope.sly_topicAddTopicDocRes!=null)?("'"+slyScope.sly_topicAddTopicDocRes+"'"):"NULL")+"/"+((slyScope.sly_topicAddTopicVideoRes!=null)?("'"+slyScope.sly_topicAddTopicVideoRes+"'"):"NULL"))
		.then(
			   function(response){
				   if(response.data.status==true){
					   $scope.getTopicComListListByBatch().then(function(res){
					   var today=new Date();
					   var todayDate=today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);	 
					   $scope.setTodayUpdate(d,slyScope.sly_topicAddTopicName);
					   });
	
				   }
			   });
	 };
	 
	$scope.setTodayUpdate =function(date,topicAddToday){ 
		console.log(date+" "+slyScope.sly_topicAddTopicName)
		console.log($scope.topicListBySub);
		console.log($scope.topicComListByBatch);
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
									   document.getElementById('success').style.display='block';
										document.getElementById('reportT').innerHTML="successfully Updated";
										$('#success').flash_message({
									        text: ' ',
									        how: 'append',
									        idR :'success'
									    });
									   $scope.showTodayUdate=false;
									   $scope.getTopicComListListByBatch();
									   
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
						}
						else{
							 $scope.showTodayUdate=false;
						}
					}
					else{
						$http.post("addTodayTopic/"+slyScope.sly_batch+"/"+$scope.id_ofTopic)
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
										 $scope.showTodayUdate=false;
										 $scope.getTopicComListListByBatch();
									   
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
					}
				}
				else{}
			}
	};
	
	$scope.editMyTopic=function(){
		console.log($scope.editValue);
		var v=$scope.editValue;
		for(var i=0;i<$scope.topicListBySub.length;i++){
			if(slyScope.sly_editTopicName==$scope.topicListBySub[i].topicName){
				var editdateList=""
				if(v.dayList.length!=0){
					editdateList="'"+v.dayList[0];
					for(var k=1;k<v.dayList.length;k++) editdateList=editdateList+","+v.dayList[k];
					
					editdateList=editdateList+"'";
				}
				else editdateList="NULL";
				$http.post("editTopicCover/"+$scope.topicListBySub[i].topic_id+"/"+v.topicCover_id+"/"+editdateList)
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
								 $scope.clickEdit();
								 $scope.getTopicComListListByBatch();
							   
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
				break;
			}
		}
	}
}

