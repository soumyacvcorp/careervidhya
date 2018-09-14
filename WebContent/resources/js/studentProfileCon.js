var app=angular.module("App",[]);

app.controller("studentProfileCon",studentProfileCon);
 
function studentProfileCon($scope,$http){
	
	var slyScope=this;
	$scope.myAttReport=false;
	
	$scope.linuxTopic=[];
	$scope.getFaculty=function(sub) {
		if($scope.facultyList!=undefined){
		for(var i=0;i<$scope.facultyList.length;i++){
			if($scope.facultyList[i].subjectToTeach.toLowerCase()==sub.toLowerCase()){
				return $scope.facultyList[i];
			}
		}	
		}
	};
	$scope.getAttRepo=function(){
		$scope.myAttListStatusList=[];
		var arr=$scope.workingListdayList.split(",");
		for(var i=0;i<arr.length;i++){
			if(arr[i]!=undefined && arr[i]!=""){
				var data=arr[i].trim().split("@");
				if(chk($scope.myAttListStatusList,data[0])){
					for(var j=0;j<$scope.myAttListStatusList.length;j++){
						if($scope.myAttListStatusList[j].date==data[0]){
							var newReport={"subject":fullName(data[1]),"status":($scope.attScope.indexOf(arr[i])!=-1)?true:false};		
							$scope.myAttListStatusList[j].report.push(newReport);
						}
					}
				}
				else{
					var newData={};
					newData.date=data[0];
					newData.report=[{"subject":fullName(data[1]),"status":($scope.attScope.indexOf(arr[i])!=-1)?true:false}];
					$scope.myAttListStatusList.push(newData);
				}
			}
		}
		
		console.log($scope.myAttListStatusList)
	}
	
	function fullName(v){
		if(v=="J")
   		  return "Java";
   	  	else if(v=="A")
   	  	  return "Aptitude";
   	    else if(v=="C")
   	      return "Communication";
   	    else return "Linux & DB";
	}
	
	function chk(arr,v){
		var b=false;
		for(var i=0;i<arr.length;i++){
			if(arr[i].date==v){
				b=true;
				break;
			}
		}
		return b;
	}
	
	$scope.getTopiStatusOverView=function(){
		var javaTotalTopicList=$scope.javaTopic.length;
		var java=$scope.topicStatusList.java;
		var javaCompleted=0;
		var javaMissed=0;
		for(var i=0;i<java.length;i++){
			if(java[i].status=="Completed" || java[i].status=="Update-Soon") javaCompleted++;
			else if(java[i].status=="Missed" || java[i].status=="Missed Some Part")
				javaMissed++;
		}
		$scope.javaCompletedPer={};
		$scope.javaCompletedPer.width=Math.round((javaCompleted*100)/javaTotalTopicList)+"%";
		$scope.javaMissedPer={};
		$scope.javaMissedPer.width=Math.round((javaMissed*100)/javaTotalTopicList)+"%";
		
		
		var aptiTotalTopicList=$scope.aptiTopic.length;
		var apti=$scope.topicStatusList.aptitude;
		var aptiCompleted=0;
		var aptiMissed=0;
		for(var i=0;i<apti.length;i++){
			if(apti[i].status=="Completed" || apti[i].status=="Update-Soon") aptiCompleted++;
			else if(apti[i].status=="Missed" || apti[i].status=="Missed Some Part")
				aptiMissed++;
		}
		$scope.aptiCompletedPer={};
		$scope.aptiCompletedPer.width=Math.round((aptiCompleted*100)/aptiTotalTopicList)+"%";
		$scope.aptiMissedPer={};
		$scope.aptiMissedPer.width=Math.round((aptiMissed*100)/aptiTotalTopicList)+"%";
		
		
		var commTotalTopicList=$scope.commTopic.length;
		var comm=$scope.topicStatusList.communication;
		var commCompleted=0;
		var commMissed=0;
		for(var i=0;i<comm.length;i++){
			if(comm[i].status=="Completed" || comm[i].status=="Update-Soon") commCompleted++;
			else if(comm[i].status=="Missed" || comm[i].status=="Missed Some Part")
				commMissed++;
		}
		$scope.commCompletedPer={};
		$scope.commCompletedPer.width=Math.round((commCompleted*100)/commTotalTopicList)+"%";
		$scope.commMissedPer={};
		$scope.commMissedPer.width=Math.round((commMissed*100)/commTotalTopicList)+"%";
		
		var linuxTotalTopicList=$scope.linuxTopic.length;
		var linux=$scope.topicStatusList.linux.concat($scope.topicStatusList.mysql);
		var linuxCompleted=0;
		var linuxMissed=0;
		for(var i=0;i<linux.length;i++){
			if(linux[i].status=="Completed" || linux[i].status=="Update-Soon") linuxCompleted++;
			else if(linux[i].status=="Missed" || linux[i].status=="Missed Some Part")
				linuxMissed++;
		}
		$scope.linuxCompletedPer={};
		$scope.linuxCompletedPer.width=Math.round((linuxCompleted*100)/linuxTotalTopicList)+"%";
		$scope.linuxMissedPer={};
		$scope.linuxMissedPer.width=Math.round((linuxMissed*100)/linuxTotalTopicList)+"%";
		console.log(linuxCompleted+"   "+linuxMissed);
		
	}

	$scope.getFacultyList=function(){
		$http.get("getFaculty").then(function(response){
			$scope.facultyList=response.data["facultyList"];
		});
	};
	
	$scope.getTotalWorkingDayList=function(batch){
		$http.get("getTotalWorkingDayList/"+batch).then(function(response){
			$scope.workingListdayList=response.data.workingListdayList;
			$scope.getAttRepo();
		});
	};
	$scope.getPercentge=function(score,full){
		var p=0.0;
		if(full!=0 && full>=score){
			p=(score*100)/full;
		}
		return $scope.myRound(p);
	}
	
	$scope.getTopicStatusList=function(email,batch){
		$http.get("getMyTopicStatus/"+email+"/"+batch).then(function(response){
			$scope.topicStatusList=response.data["allTopicStatusList"];
			$scope.getTopiStatusOverView();
		});
	};
	
	$scope.getJavatTopicsList=function(subject){
		$http.get("getTopicList/java").then(function(response){
		    $scope.javaTopic=response.data["topicList"];
		});
	};
	
	$scope.getAptiTopicsList=function(subject){
		$http.get("getTopicList/math").then(function(response){
			$scope.aptiTopic=response.data["topicList"];
		});
	};
	
	$scope.getCommTopicsList=function(subject){
		$http.get("getTopicList/comms").then(function(response){
			$scope.commTopic=response.data["topicList"];
		});
	};
	
	$scope.getLinuxTopicsList=function(subject){
		$http.get("getTopicList/linux").then(function(response){
			$scope.linuxTopic=$scope.linuxTopic.concat(response.data["topicList"]);
			console.log($scope.linuxTopic);
		});
		$http.get("getTopicList/mysql").then(function(response){
			$scope.linuxTopic=$scope.linuxTopic.concat(response.data["topicList"]);
			console.log($scope.linuxTopic);
		});
	};
	
	$scope.getExamList=function(email,batch){
		$http.get("getMyAllExamScore/"+email+"/"+batch).then(function(response){
			$scope.sudentScoreList=response.data["allExamList"];
		});
	};
	
	$scope.getCount=function(v){
		var count=0;
		if(v!=undefined && v!=""){
			var arr=v.trim().split(",");
			for(var i=0;i<arr.length;i++){
				if(arr[i] != undefined && arr[i]!="" && arr[i].length>0) count++; 
			}
		}
		return count; 
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
	//notification
	$scope.getNotification=function(batch){
		$http.get("getNotificationsByBatch/"+batch).then(function(response){
			$scope.notificationList=response.data["notificationList"];
		});
	};
	
	
	//time table
	$scope.getTimeTable=function(){
		console.log("chk1");
		$http.get("getTimeTable").then(function(response){
			var data=response.data["timeTableList"];
			console.log("chk2");
			$scope.timeTable={"head":{},"body":[]};
			for(var i=0;i<data.length;i++){
				if(data[i].indicate==0){
					$scope.timeTable.head={"header":data[i].header,"info":data[i].info.split("*#*")};
				}
				else if(data[i].indicate==2){
					var arr=data[i].info.split("*#*");
					var arr1=[];
					for(var j=0;j<$scope.timeTable.head.info.length;j++) arr1.push((arr[j]!=undefined)?arr[j]+"*1#1*"+j:"-"+"*1#1*"+j);
					var v={"header":data[i].header,"info":arr1};
					$scope.timeTable.body.push(v);
				}
			}

			console.log("chk3");
			console.log($scope.timeTable);
		});
	};
	$scope.getOriginalData=function(v){
		var arr=v.split("*1#1*");
		return arr[0];
	}
	
	$scope.getBackGroundColor=function(d){
		if(d==batchGlobal)  return {'background-color':'#fffee2'};
		else return {'background-color':'#fffff'};
	}
	$scope.getActiveBackGroundColor=function(index,batch){
		var data = $scope.timeTable.head.info[index];
		if(batch==batchGlobal){
		var d=new Date();
		var arr=data.split("-");
		var startTime=convertTime12to24(arr[0].trim());
		var endTime=convertTime12to24(arr[1].trim());
		var nowTime=d.getHours()+":"+d.getMinutes();
		var out=false;
		console.log("overall  start");
		if(chkTime(nowTime,startTime) && chkTime(endTime,nowTime)) out=true;
		

		console.log("overall  "+out);
		if(out)  return {'background-color':'#ccffd1','margin':'0px','padding':'0px'};
		else return {'margin':'0px','padding':'0px'};
		}
		else return {'margin':'0px','padding':'0px'};
	}
	
	function chkTime(big,sml){
		console.log(big+"   "+sml);
		var bigArr=big.split(":");
		var smlArr=sml.split(":");
		if(bigArr[0] > smlArr[0]){
			console.log("true1");
			return true;
		}
		else if(bigArr[0] == smlArr[0]){
			if(bigArr[1] >= smlArr[1]){
				console.log("true2");
				return true;
			}
			else {
				console.log("false1");
				return false;
			}
		}
		else{
			console.log("false2");
			return false;
		}
	}
	
	function convertTime12to24(time12h) {
		  const [time, modifier] = time12h.split(' ');

		  let [hours, minutes] = time.split(':');

		  if (hours === '12') {
		    hours = '00';
		  }

		  if (modifier === 'pm') {
		    hours = parseInt(hours, 10) + 12;
		  }

		  return hours +':'+ minutes;
		}
	
	$scope.callLoad=function(){
		$scope.getFacultyList();
		$scope.getExamList(emailGlobal,batchGlobal);
		$scope.getJavatTopicsList();
		$scope.getAptiTopicsList();
		$scope.getCommTopicsList();
		$scope.getLinuxTopicsList();
		$scope.getTopicStatusList(emailGlobal,batchGlobal);
		$scope.getTotalWorkingDayList(batchGlobal);
		$scope.attScope=attGlobal;
		$scope.getTimeTable();
		$scope.getNotification(batchGlobal);
	}
	$scope.callLoad();
	
}