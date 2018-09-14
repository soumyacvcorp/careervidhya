var app=angular.module("App");

app.controller("OfflineExamMarkCon",OfflineExamMarkCon);
 
function OfflineExamMarkCon($scope,$http,$q){
	
	var mrkScope=this;
	$scope.showMrkStudentList=true;
	$scope.showInd=false;
	$scope.topicInd=false;
	$scope.showMarkList=false;
	$scope.showEditMark=false;
	$scope.showTopicList=false;
	mrkScope.batch="select";
	mrkScope.subject="select";
	mrkScope.examType="select";
	mrkScope.topicSingle="select";
	$scope.topicList=[];
	$scope.activeStudentList=[];
	$scope.overallTopic=false;
	$scope.showGiveMark=true;
	$scope.ind=false;
	$scope.editMarksheetErrorData="";
	$scope.showSendMailLoader=false;
	
	$scope.getTopicsListByBatch=function(){
		   return $http.get("getTopicList/"+$scope.sub).then(function(response){
				var mydata=response.data["topicList"];
				for(var i=0;i<mydata.length;i++){
					mydata[i].check=false;
				}
				$scope.topicListData=mydata;
			});
		};
		
		$scope.changeState=function(v){
			if(v){
				$scope.overallTopic=false;
			}
			else{
				for(var i=0;i<$scope.topicListData.length;i++){
					$scope.topicListData[i].check=false;
				}
			}
		}
	$scope.selectTopic=function(){
		if(!$scope.overallTopic){
			$scope.topicList=[];
		  for(var i=0;i<$scope.topicListData.length;i++){
			if($scope.topicListData[i].check){
				console.log($scope.topicListData[i].topicName);
				$scope.topicList.push($scope.topicListData[i].topicName);
			}
		  }
		}
		else{
				$scope.topicList=['Overall'];
		}
		
		$scope.showTopicList=false;
		console.log(topicList);
	}
	
	$scope.myRound=function(k){
		var v=""+k;
		if(v.includes(".")){
			var s="";
			var arr=v.split(".");
			s=arr[0];
			var ch=arr[1].split('');
			if(ch[0]=='0') return s;
			else{
				if(ch.length>=2){
					s=s+"."+ch[0]+ch[1];
				}
				else{
					s=s+"."+ch[0];
				}
				return s;
			}
		}
		else return v;
	}
	
	$scope.topicListString=function(list){
		console.log("start "+list.length);
		var s=""
		for(var i=0;i<list.length;i++){
			console.log("run "+i);
			if(i==0) s=list[i];
			else s+=" , "+list[i];
		}

		console.log("end "+s);
		return s;
	}
	
	$scope.markUpdateHomePage=function(){
	    var error_line="Please select valid";
	    $scope.mrk_error="";
	    var c=false,d=false,c=false;
	    if(mrkScope.batch!="select" && mrkScope.batch!=undefined){
       	 	c=true;
	    }
	    else error_line+=" Batch";
	    if(mrkScope.subject!="select" && mrkScope.subject!=undefined){
            d=true;
        }
        else error_line+=" Subject";
	    if(c && d) $scope.attBlockShow(1);
	    else  $scope.mrk_error=error_line;
	}
	
	$scope.attBlockShow=function(value){
	      if(value==0){
	    	  $scope.showMrkStudentList=true;
	      }
	      else{
	    	  if(mrkScope.subject=="Java")
	    		  $scope.sub="Java";
	    	  else if(mrkScope.subject=="Aptitude")
	    		  $scope.sub="Math";
	    	  else if(mrkScope.subject=="Communication")
	    		  $scope.sub="Comms";
	    	  else $scope.sub="Linux";
	    	  $scope.showMrkStudentList=false;
	    	  $scope.getExamList();
	    	  $scope.getTopicsListByBatch();
	    	  $scope.getActiveStudentList();
	    	  
	      }
	  }
	
	$scope.addScore=function(){
		var error_line="Please select valid";
	    $scope.AddNewReoprt_errorMsg="";
	    var a=false,b=false,d=false,e=false,f=false;
	    
	    if($scope.validatedate(mrkScope.examDate)){
       	 	a=true;
	    }
	    else error_line+=" Date";
	    if(mrkScope.examType!="select" && mrkScope.examType!=undefined){
            b=true;
            if(mrkScope.fullMark>0 && mrkScope.fullMark<=600){
           	 	d=true;
    	    }
    	    else error_line+=" Fullmark";
            if($scope.validDuration(undefined,mrkScope.mint)){
            	console.log($scope.examDuration);
           	 e=true;
    	    }
    	    else error_line+=" Duration";
            if(!$scope.topicInd){
            	var x=$scope.topicListString($scope.topicList);
            	console.log(x);
            	if(x!="" && x!=undefined){
            		f=true;
            		$scope.offlineExamTopic=x;
            	}
            	else error_line+=" Topic";
            }
            else{
            	if(mrkScope.topicSingle!="select" && mrkScope.topicSingle!=undefined){
            		f=true;
            		$scope.offlineExamTopic=mrkScope.topicSingle;
            	}
            	else error_line+=" Topic";
            }
        }
        else error_line+=" Exam-type";
	    if(a && b && d && e && f){
	    	$scope.showGiveMark=false;
	    }
	    else  $scope.AddNewReoprt_errorMsg=error_line;
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
	
	$scope.validDuration=function(h,m){
		if(h!=undefined || m!=undefined){
			if(h!=undefined && m!=undefined)
			{
				if(h>0 && h<=24 && m>1 && m<=59){
					$scope.examDuration=((h==undefined)?0:h*60)+((m==undefined)?0:m);
					return true;
				}
				else return false;
			}
			else if(h!=undefined)
			{
				if(h>0 && h<=24){
					$scope.examDuration=(h==undefined)?0:h*60;
					return true;
				}
				else return false;
			}
			else if(m!=undefined)
			{
				if(m>1 && m<=120){
					$scope.examDuration=(m==undefined)?0:m;
					return true;
				}
				else return false;
			}
		}
		else return false;
	}
	
	$scope.examTypeChange = function(){
		$scope.topicList=[];
		var type=mrkScope.examType;
		if(type!="select" && type!=undefined){
			$scope.showInd=true;
			if(type=="Topic-Wise Test"){
				$scope.topicInd=true;
			}
			else $scope.topicInd=false;
		}
		else $scope.showInd=false;
	}
	
	$scope.getExamList=function(){
		return $http.get("getOfflineExamList/"+mrkScope.batch+"/"+mrkScope.subject).then(function(response){
			$scope.examList=response.data["offlineExamList"];
			console.log($scope.examList);
		});
	};
	$scope.getActiveStudentList=function(){
		return $http.get("viewBatch/"+mrkScope.batch).then(function(response){
			var output=response.data["studentsList"];
			var obj;
			for(var i=0;i<output.length;i++){
				obj={};
				obj.studentEmailId=output[i].email;
				obj.studentName=output[i].fullName;
				obj.score=-1;
				obj.remark="";
				obj.id;
				$scope.activeStudentList.push(obj);
			}
		});
	};
	
		$scope.convertTime=function(min){
			if(min<60)
				return min+"m"
			else {
				if(min%60==0)
					return (min/60)+"h";
				else return ((min-(min%60))/60)+"h : "+(min%60)+"m"
			}
		}
		
		
		
		
		$scope.successRate=function(marklist,fullmark){
			var out=0.0;
			if(marklist!=null){
				var count=0;
				var sum=0;
				for(var i=0;i<marklist.length;i++){
					if(marklist[i].score>-1){
						count++;
						sum+=marklist[i].score;
					}
				}
				out=((sum/count)*100)/fullmark;
			}
			return out;
		}
		
		$scope.showMarkListPage=function(m){
			$scope.showMarkList=true;
			$scope.markSheet=m;
		}
		
		$scope.editMarkSheet=function(list,v){
			$scope.showEditMark=true;
			$scope.studentMark=list;
			mrkScope.editStudentScore=list.score;
			mrkScope.editStudentRemark=list.remark;
			mrkScope.editStudentId=list.id;
			mrkScope.editStudentFullmark=v;
			$scope.afterEditScoreShowlist=list;
			console.log(mrkScope.editStudentFullmark+"-"+mrkScope.editStudentId+"-"+mrkScope.editStudentRemark+"-"+mrkScope.editStudentScore);
		}
		
		$scope.editMarksheetValidation=function(){
			$scope.editMarksheetErrorData="";
			if(mrkScope.editStudentScore>=0 && mrkScope.editStudentScore<=mrkScope.editStudentFullmark)
			{
				$scope.editMarksheetServer(mrkScope.editStudentId,mrkScope.editStudentScore,(mrkScope.editStudentRemark!="" && mrkScope.editStudentRemark!=undefined)?"'"+mrkScope.editStudentRemark+"'":"NULL");
			}
			else{
				$scope.editMarksheetErrorData="Invalid score ( 0-"+mrkScope.editStudentFullmark+" )";
			}
		}
		
		$scope.editMarksheetServer=function(a,b,c){
			$http.get('editOfflineExamScore/'+a+"/"+b+"/"+c)
			  .then(
				   function(response){
					   if(response.data.status=="yes"){
						   document.getElementById('success').style.display='block';
							document.getElementById('reportT').innerHTML="successfully Edited";
							$('#success').flash_message({
						        text: ' ',
						        how: 'append',
						        idR :'success'
						    });
							$scope.showEditMark=false;
							$scope.getExamList();
							$scope.afterEditScoreShowlist.score=b;
							$scope.afterEditScoreShowlist.remark=mrkScope.editStudentRemark;
							
					   }
					   else{
						   document.getElementById('fail').style.display='block';
							document.getElementById('reportF').innerHTML="Error Occur in Edit";
							$('#fail').flash_message({
						        text: ' ',
						        how: 'append',
						        idR :'fail'
						    });
					   }
				 });
		}
		
		$scope.newExamUpdate =function(){ 
			$scope.ind=false;
			for(var i=0;i<$scope.activeStudentList.length;i++){
				if($scope.activeStudentList[i].score<-1 || $scope.activeStudentList[i].score>mrkScope.fullMark){
					$scope.ind=true;
					break;
				}
			}
			if(!$scope.ind){
				var myurl=encodeURI('addOfflineExam/'+mrkScope.batch+"/"+mrkScope.examDate+"/"+mrkScope.subject+"/"+mrkScope.examType+"/"+$scope.offlineExamTopic+"/"+$scope.examDuration+"/"+mrkScope.fullMark);
				console.log(myurl);
			  $http.post(myurl, $scope.activeStudentList)
			  .then(
				   function(response){
					   if(response.data.status=="yes"){
							for(var i=0;i<$scope.topicListData.length;i++){
								$scope.topicListData[i].check=false;
							}
							
							var sendMark=[];
							for(var i=0;i<$scope.activeStudentList.length;i++){
								if($scope.activeStudentList[i].score!=-1){
									var v={'email':$scope.activeStudentList[i].studentEmailId,'message':''};
									var score=angular.copy($scope.activeStudentList[i].score);
									var remark=angular.copy($scope.activeStudentList[i].remark);
									v.message='Hi '+$scope.activeStudentList[i].studentName+" ,     Your Score is "+score+" / "+mrkScope.fullMark+" in "+mrkScope.examType+" of "+mrkScope.subject+" which was conducted on "+mrkScope.examDate+" Exam Subject : "+$scope.offlineExamTopic+" ";
									v.message+=(remark!=undefined && remark!="")?"Feedback : "+remark:"";
									v.message+=" Regards, CVCORP ( Your Career Partner )";
									sendMark.push(v);
								}
								$scope.activeStudentList[i].score=-1;
								$scope.activeStudentList[i].remark="";
							}
							
							$scope.showSendMailLoader=true;
							$http.post('sendBlockMsg', sendMark)
							  .then(
								   function(response){
									   if(response.data.status=="true"){
										   document.getElementById('success').style.display='block';
											document.getElementById('reportT').innerHTML="successfully mark Updated ,sent E-mail";
											$('#success').flash_message({
										        text: ' ',
										        how: 'append',
										        idR :'success'
										    });
											$scope.showGiveMark=true;
											$scope.addNewReport=false;
											mrkScope.examType="select";
											mrkScope.topicSingle="select";
											$scope.topicList=[];
											$scope.overallTopic=false;
											
											$scope.getExamList();
											mrkScope.fullMark=null;
											mrkScope.hour=null;
											mrkScope.mint=null;
											$scope.showInd=false;
											$scope.topicInd=false;
											$scope.showSendMailLoader=false;
									   }
									   else{
										   document.getElementById('fail').style.display='block';
											document.getElementById('reportF').innerHTML="Error Occur";
											$('#fail').flash_message({
										        text: ' ',
										        how: 'append',
										        idR :'fail'
										    });
											$scope.showSendMailLoader=false;
									   }
								 });
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
		};
		
	
}