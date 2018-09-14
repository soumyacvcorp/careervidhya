var app=angular.module('App');

app.controller("updateDriveCon",updateDriveCon);
 
function updateDriveCon($scope,$http,$q){
	
	var driveScope=this;
	$scope.addNewDriveReport=false;
	$scope.driveList=false;
	$scope.companyList=true;
	$scope.drive_erro='';
	$scope.addNewReoprt_errorMsg='';
	driveScope.company='select';
	driveScope.bond='NO';
	driveScope.certificates ='NO';
	$scope.studentDriveList=false;
	$scope.addnewCompany='';
	$scope.updateDrive.newCompanyType='select';
	$scope.studentDelete=false;
	$scope.studentEdit=false;
	$scope.addStudentDrive=false;
	$scope.addnewStudentDriveError="";
	$scope.indShowSave=false;
	$scope.backUpStudentData=[];
	$scope.totalOffferUs=0;
	$scope.searchStudentDataList=[];
	$scope.showSearchStud=true;
	$scope.showSearchNameAddStudetList=true;
	$scope.showSearchCompanyAddStudetList=true;
	$scope.showSendMail=false;
	
	 

	
	$scope.roundInd=[false,false,false,false,false];
	$scope.roundDataArr=['Written','GD/JAM/Communication','Technical','Coding','HR'];
	$scope.rondData='';
	
	
	$scope.l2={'padding' :'5px 5px 5px 0px','width':'50%'};
	$scope.r2={'padding' :'5px 0px 5px 5px','width':'50%'};
	$scope.l1={'padding' :'5px 5px 5px 0px','width':'100%'};
	
	$scope.indShowSaveFun=function(){
		if( $scope.newStudentDataList.length>0){
			 $scope.indShowSave=true;
		}
		else $scope.indShowSave=false;
	}
	
	$scope.setRoundData=function(){
		var b=true;
		$scope.rondData="";
		for(var i=0;i<$scope.roundInd.length;i++){
			if(b && $scope.roundInd[i]){
				$scope.rondData=$scope.roundDataArr[i];
				b=false;
			}
			else{
				if($scope.roundInd[i]){
					$scope.rondData+=","+$scope.roundDataArr[i];
				}
			}
		}
	}
	$scope.getTotalDrive=function(list){
		var c=0,offer=0;
		for(var i=0;i<list.length;i++){
			
			var data=list[i].placementDriveList;
			
			c+=data!=undefined?data.length:0;
			
			if(data!=undefined && data.length>0){
				var countP=0;
				for(var k=0;k<data.length;k++){
					var studentList=data[k].studentReportList;
					if(studentList!=undefined && studentList.length>0){
						for(var j=0;j<studentList.length;j++){
							if(studentList[j].finalReport=='YES') countP++;
							let obj = Object.assign({}, studentList[j]);
							obj.writtenRound_Status=$scope.showRoundIndSearch('Written',data[k].roundList,studentList[j]);
							obj.comsRound_Status=$scope.showRoundIndSearch('GD/JAM/Communication',data[k].roundList,studentList[j]);
							obj.technicalRound1_Status=$scope.showRoundIndSearch('Technical',data[k].roundList,studentList[j]);
							obj.technicalRound2_Status=$scope.showRoundIndSearch('Coding',data[k].roundList,studentList[j]);
							obj.hrround_Status=$scope.showRoundIndSearch('HR',data[k].roundList,studentList[j]);
							obj.finalReport=studentList[j].finalReport=='YES'?'PLACED':'NOT';
							obj.companyName=list[i].name;
							obj.roundList=data[k].roundList;
							obj.designation=data[k].designation;
							obj.driveDate=data[k].driveDate;
							obj.driveLocation=data[k].driveLocation;
							obj.initialSalary=data[k].initalSalary;
							obj.laterSalary=data[k].laterSalary;
							obj.salary=$scope.getSalary(data[k].initalSalary,data[k].laterSalary);
							obj.jobLocation=data[k].jobLocation;
							obj.bondIsAvl=data[k].bondIsAvl;
							obj.submissionCertificates=data[k].submissionCertificates;
						
							$scope.searchStudentDataList.push(obj);
						}
					}
				}
				offer+=countP;
			}
		}
		 $scope.totalOffferUs=offer;
		 $scope.totalDriveUs=c;
		 $scope.mainSearchStudentDataList=angular.copy($scope.searchStudentDataList);
	}
	$scope.showRoundIndSearch=function(round,roundlist,list){
		var out='-';
		if(roundlist.includes(round)){
			  switch(round){
				case 'Written': out=(list.writtenRound_Status =='A')?'OK':'NO';break;
				case 'GD/JAM/Communication': out=(list.comsRound_Status=='A')?'OK':'NO';break;
				case 'Technical': out=(list.technicalRound1_Status=='A')?'OK':'NO';break;
				case 'Coding': out=(list.technicalRound2_Status=='A')?'OK':'NO';break;
				case 'HR': out=(list.hrround_Status=='A')?'OK':'NO';break;
			  }
		}
		return out;
	}
	
	$scope.serchDriveList=function(){
		$scope.searchStudentDataList=angular.copy($scope.mainSearchStudentDataList);
		var data=driveScope.serchData.toLowerCase();
		if(data!=undefined && data!='' && $scope.mainSearchStudentDataList!=undefined){
			var d=[];
			for(var i=0;i<$scope.mainSearchStudentDataList.length;i++){
				var obj= $scope.mainSearchStudentDataList[i];
				if(obj.finalReport.toLowerCase().includes(data) || obj.designation.toLowerCase().includes(data) || obj.companyName.toLowerCase().includes(data) ||	obj.salary.toLowerCase().includes(data) ||obj.name.toLowerCase().includes(data) || obj.batchNumber.toString().toLowerCase().includes(data)){
					d.push(obj);
				}
			}
			$scope.searchStudentDataList=d;
			$scope.showSearchStud=false;
		}
		else{
			$scope.showSearchStud=true;
			 $scope.searchStudentDataList=angular.copy($scope.mainSearchStudentDataList);
		}
	}
	
	$scope.getDriveData=function(v){
		$http.get("getPlacementDriveList").then(function(response){
			$scope.placementDriveListCompany=response.data["placementDriveList"];
			$scope.getTotalDrive($scope.placementDriveListCompany);
			if(v){
				$scope.placementDriveList=$scope.placementDriveListCompany[$scope.sipuIndex].placementDriveList;
			}
		});
	}
	$scope.getDriveData(false);
	
	$scope.saveCompanyDetails=function(){
		$scope.addnewCompany='';
		var err="Select Valid "
		var a=false,b=false,c=false;
		if(driveScope.newCompanyName!=undefined && driveScope.newCompanyName!=''){
			a=true;
		}
		else err+="Company-name ";
		if(driveScope.newCompanyType!=undefined && driveScope.newCompanyType!='select'){
			b=true;
		}
		else err+="Company-type ";
		if(driveScope.newCompanyUrl!=undefined && driveScope.newCompanyUrl!=''){
			c=true;
		}
		else err+="Company-Url ";	
		if(a && b && c){
			var data={"name":driveScope.newCompanyName,"companyUrl":driveScope.newCompanyUrl,"location":driveScope.newCompanyLocation,"logo":driveScope.newCompanyLogoUrl,"companyType":driveScope.newCompanyType};
			$http.post('addNewCompany', data)
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
							$scope.getDriveData();
							$scope.addNewRound=false;
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
			$scope.addnewCompany=err;
		}
	}
	
	$scope.getCompanySR=function(list){
		var out=0;
		var data=list.placementDriveList;
		if(data!=undefined && data.length>0){
			var countP=0;
			var countT=0;
			for(var i=0;i<data.length;i++){
				var studentList=data[i].studentReportList;
				if(studentList!=undefined && studentList.length>0){
					for(var j=0;j<studentList.length;j++){
						if(studentList[j].finalReport=='YES') countP++;
						countT++;
					}
				}
			}
			out=(countP*100)/countT;
		}
			
		return $scope.myRound(out);
	}
	
	
	$scope.getOfferByCompany=function(list){
		var out=0;
		var data=list.placementDriveList;
		if(data!=undefined && data.length>0){
			var countP=0;
			for(var i=0;i<data.length;i++){
				var studentList=data[i].studentReportList;
				if(studentList!=undefined && studentList.length>0){
					for(var j=0;j<studentList.length;j++){
						if(studentList[j].finalReport=='YES') countP++;
					}
				}
			}
			out=countP;
		}
		return out;
	}
	$scope.showCompanyDriveList=function(list,i){
		$scope.fullData=$scope.placementDriveListCompany[i];
		$scope.sipuIndex=i;
		var data=$scope.fullData.placementDriveList;
		$scope.placementDriveList=data;
		$scope.showHide(0);
	}
	
	$scope.showHide=function(v){
		if(v==0){
			$scope.driveList=true;
			$scope.companyList=false;
		}
		else{
			$scope.driveList=false;
			$scope.companyList=true;
		}
	}
	
	$scope.getStudentDriveStatus=function(list,driveRoundList){
		var out=[];
		for(var i=0;i<driveRoundList.length;i++){
			if(driveRoundList[i]=='Written'){
				if(list.writtenRound_Status!=undefined && list.writtenRound_Status =='A') out.push(true);
				else out.push(false);
			}
			else if(driveRoundList[i]=='GD/JAM/Communication'){
				if(list.comsRound_Status!=undefined && list.comsRound_Status =='A') out.push(true);
				else out.push(false);
			}
			else if(driveRoundList[i]=='Technical'){
				if(list.technicalRound1_Status!=undefined && list.technicalRound1_Status =='A') out.push(true);
				else out.push(false);
			}
			else if(driveRoundList[i]=='Coding'){
				if(list.technicalRound2_Status!=undefined && list.technicalRound2_Status =='A') out.push(true);
				else out.push(false);
			}
			else if(driveRoundList[i]=='HR'){
				if(list.hrround_Status!=undefined && list.hrround_Status =='A') out.push(true);
				else out.push(false);
			}
			else out.push(false);
		}
		return out;
	}
	$scope.removeFromList=function(list,index){
		for(var i=0;i<$scope.backUpStudentData.length;i++){
			if($scope.backUpStudentData[i].student_id==list.student_id){
				$scope.allStudentsList.push($scope.backUpStudentData[i]);
				$scope.backUpStudentData.splice(i, 1);
				break;
			}
		}
		$scope.newStudentDataList.splice(index, 1);
		
		$scope.indShowSaveFun();
	}
	$scope.editStudDetails=function(list){
		$scope.studentEdit=true;
		$scope.editStudentDriveId=list.id;
		$scope.editStudentData={'status':list.finalReport,'dataED':[]};
		var out=$scope.getStudentDriveStatus(list,$scope.driveRoundList);
		for(var i=0;i<$scope.driveRoundList.length;i++){
			var data={};
			data.name=$scope.driveRoundList[i];
			data.value=out[i]?'Clear':'Not';
			$scope.editStudentData.dataED.push(data);
		}
	}
	$scope.getMyValue=function(v){
		var out='NA';
		for(var i=0;i<$scope.editStudentData.dataED.length;i++){
			if($scope.editStudentData.dataED[i].name==v){
				out=$scope.editStudentData.dataED[i].value=='Clear'?'A':'NA';
			}
		}
		return out; 
	}
	
	$scope.backSutdentAdd=function(){
		$scope.addStudentDrive=false;
		$scope.addnewStudentDriveError="";
		driveScope.studentSerchData="";
		$scope.indShowSave=false;
		$scope.addNewDriveReport=true;
		$scope.newStudentDataList=[];
	}
	
	$scope.addStudentINtoDriveList=function(){
			
			var b=true;
			if($scope.mainInd){
				b=false;
				$http.post('addNewPlacementDrive', $scope.newdrivedata)
				  .then(
					   function(response){
						   if(response.data.status=="yes"){
								for(var i=0;i<$scope.newStudentDataList.length;i++){
									$scope.newStudentDataList[i].driveId=response.data.id;
								}
								
								$http.post('addNewStudentIntoDriveList', $scope.newStudentDataList)
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
												$scope.addStudentDrive=false;
												$scope.getDriveData(true);
												driveScope.driveDate=undefined;
												$scope.rondData=undefined;
												driveScope.driveLoction=undefined;
												driveScope.initialSalary=undefined;
												driveScope.laterSalary=undefined;
												driveScope.designation=undefined;
												driveScope.bond=="NO";
												driveScope.bondDuration=undefined;
												driveScope.certificates=undefined;
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
			if(b){
			$http.post('addNewStudentIntoDriveList', $scope.newStudentDataList)
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
							
							
							$scope.addStudentDrive=false;
							if($scope.mainInd) $scope.getDriveData(false);
							else $scope.getStudentDriveListafter($scope.driveId,$scope.driveRoundList);
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
	$scope.addStudentInDriveList=function(v){
		$scope.getAllStudent(v);
		$scope.addStudentDrive=true;
		driveScope.studentSerchData="";
		$scope.mainInd=v;
		$scope.indShowSave=false;
		$scope.newStudentDataList=[];
		$scope.addnewStudentDriveError="";

	}
	$scope.clearNamesearch=function(){
		driveScope.studentDataToAddNameSearch='';
		$scope.showSearchNameAddStudetList=!$scope.showSearchNameAddStudetList;
	}
	$scope.clearCompanysearch=function(){
		driveScope.studentDataToAddCompanySearch='';
		$scope.showSearchCompanyAddStudetList=!$scope.showSearchCompanyAddStudetList;
	}
	$scope.setStudentDataToAdd=function(){
		driveScope.studentSerchData='';
		$scope.addnewStudentDriveError="";
		var b=true;
		  for(var i=0;i<$scope.allStudentsList.length;i++){
			 if($scope.allStudentsList[i].click!=undefined && $scope.allStudentsList[i].click==true){
				 b=false;
				 if(!$scope.mainInd) {
					 var studentData={"roundData":[],"company_id":$scope.showdriveReport.companyId,'driveId':$scope.showdriveReport.id,"student_id":'',"designation":$scope.showdriveReport.designation,"bond":$scope.showdriveReport.bondIsAvl,"bondduration":$scope.showdriveReport.bondDuration,"certificates":$scope.showdriveReport.submissionCertificates,"initialSalary":$scope.showdriveReport.initalSalary,"laterSalary":$scope.showdriveReport.laterSalary,"name":"","batchNumber":"","finalReport":"NO","writtenRound_Status":"NA","hrround_Status":"NA","technicalRound1_Status":"NA","technicalRound2_Status":"NA","comsRound_Status":"NA"};
					 var d=$scope.showdriveReport.roundList.split(",");
				 }
				 else{
					var studentData={"roundData":[],"company_id":$scope.newdrivedata.companyId,'driveId':'',"student_id":'',"designation":$scope.newdrivedata.designation,"bond":$scope.newdrivedata.bondIsAvl,"bondduration":$scope.newdrivedata.bondDuration,"certificates":$scope.newdrivedata.submissionCertificates,"initialSalary":$scope.newdrivedata.initalSalary,"laterSalary":$scope.newdrivedata.laterSalary,"name":"","batchNumber":"","finalReport":"NO","writtenRound_Status":"NA","hrround_Status":"NA","technicalRound1_Status":"NA","technicalRound2_Status":"NA","comsRound_Status":"NA"};
					 var d=$scope.newdrivedata.roundList.split(",");
				 }
				 $scope.driveRoundListShowData=d;
				 for(var j =0;j<d.length;j++){
					studentData.roundData.push({'name':d[j],'value':'Not'});
				 }
				 studentData.student_id=$scope.allStudentsList[i].student_id;
				 studentData.name=$scope.allStudentsList[i].fullName;
				 studentData.batchNumber=$scope.allStudentsList[i].batchNumber;
				 $scope.newStudentDataList.push(studentData);
				 $scope.indShowSaveFun();
				 var stud=$scope.allStudentsList.splice(i, 1);
				 i--;
				 stud[0].click=false;
				 $scope.backUpStudentData.push(stud[0]);
			 }
		  }
		  if(b) $scope.addnewStudentDriveError="Select a valid Student";
				
		
	}
	
	
	
	$scope.getAllStudent=function(data){
		$http.get("viewAll").then(function(response){
			var v=response.data["studentsList"];
			if(data){
				$scope.allStudentsList=v;
			}
			else{
			$scope.allStudentsList=[];
			for( var j=0;j<$scope.showdriveReport.studentReportList.length;j++){
				for(var i=0;i<v.length;i++){
					if(v[i].student_id==$scope.showdriveReport.studentReportList[j].student_id){
						v.splice(i,1);
						break;
					}
				}
			}
			$scope.allStudentsList=v;
			}
			
		});
	}
	$scope.setStatus=function(v,k,index,data,round){
		var c=0;
		for(var i=0;i<round.length;i++){
			if(round[i].value=='Clear') c++;
			if(round[i].name=='Written'){
				v.writtenRound_Status=round[i].value=='Clear'?'A':'NA';
			}
			else if(round[i].name=='GD/JAM/Communication'){
				v.comsRound_Status=round[i].value=='Clear'?'A':'NA';
			}
			else if(round[i].name=='Technical'){
				v.technicalRound1_Status=round[i].value=='Clear'?'A':'NA';
			}
			else if(round[i].name=='Coding'){
				v.technicalRound2_Status=round[i].value=='Clear'?'A':'NA';
			}
			else if(round[i].name=='HR'){
				v.hrround_Status=round[i].value=='Clear'?'A':'NA';
			}
		}
		v.finalReport=(c==round.length)?'YES':'NO';
	}
	
	$scope.saveEditStudDetails=function(){
		$scope.saveStudentData={'status':'NO','written':'NA','communication':'NA','technical':'NA','coding':'NA','hr':'NA'};
		for(var i=0;i<$scope.driveRoundList.length;i++){
			if($scope.driveRoundList[i]=='Written'){
				$scope.saveStudentData.written=$scope.getMyValue($scope.driveRoundList[i]);
			}
			else if($scope.driveRoundList[i]=='GD/JAM/Communication'){
				$scope.saveStudentData.communication=$scope.getMyValue($scope.driveRoundList[i]);
			}
			else if($scope.driveRoundList[i]=='Technical'){
				$scope.saveStudentData.technical=$scope.getMyValue($scope.driveRoundList[i]);
			}
			else if($scope.driveRoundList[i]=='Coding'){
				$scope.saveStudentData.coding=$scope.getMyValue($scope.driveRoundList[i]);
			}
			else if($scope.driveRoundList[i]=='HR'){
				$scope.saveStudentData.hr=$scope.getMyValue($scope.driveRoundList[i]);
			}
		}
		
		var s='YES';
		for(var i=0;i<$scope.editStudentData.dataED.length;i++){
			if($scope.editStudentData.dataED[i].value=='Not') {
				s='NO';
				break;
			}
		}
		
		
		
		$scope.saveStudentData.status=s;
		$http.post('editStudDriveDetails/'+$scope.editStudentDriveId, $scope.saveStudentData)
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
						
						$scope.getStudentDriveListafter($scope.driveId,$scope.driveRoundList);
						$scope.studentEdit=false;
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
	
	$scope.showStudentDriveList=function(list,round){
			$scope.showdriveReport=list;
			$scope.driveRoundList=round;
			$scope.driveId=list.id;
			$scope.studentDriveList=true;
	}
	$scope.getStudentDriveListafter=function(id,round){
		 $http.get("getStudentDriveReportList/"+id).then(function(response){
			 $scope.showdriveReport.studentReportList=response.data["studentReportList"];
		});
		
	}
	$scope.deleteStudDetails=function(id){
		$scope.studentDelete=true;
		$scope.deleteStudentDriveId=id;
	}
	$scope.deleteStudentDriveDetails=function(){
		$http.get("deleteStudDriveDetails/"+$scope.deleteStudentDriveId).then(function(response){
			var ind=response.data.status;
			if(ind){
				   document.getElementById('success').style.display='block';
					document.getElementById('reportT').innerHTML="successfully Deleted";
					$('#success').flash_message({
				        text: ' ',
				        how: 'append',
				        idR :'success'
				    });
					$scope.studentDelete=false;
					$scope.getStudentDriveListafter($scope.driveId,$scope.driveRoundList);
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
	
	
	$scope.getPlacedCount=function(list){
		var out=0;
		if(list!=undefined){
			for(var i=0;i<list.length;i++){
				if(list[i].finalReport=='YES') out++;
			}
		}
		return out;
	}
	$scope.getSalary=function(iSalary,lSalary){
		var out="NA";
		if(iSalary!=undefined && lSalary!=undefined && iSalary!=0.0 && lSalary!=0.0){
			out=$scope.myRound(iSalary)+"L - "+$scope.myRound(lSalary)+"L";
		}
		else if(iSalary!=undefined && iSalary!=0){
			out=$scope.myRound(iSalary)+"L";
		}
		else if(lSalary!=undefined && lSalary!=0){
			out=$scope.myRound(lSalary)+"L";
		}
		return out;
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
	$scope.addNewDriveOfComapnyDeatis=function(){
		$scope.addNewReoprt_errorMsg='';
		var err="Enter Valid "
		var errArr=[false,false,false,false,false,false];
		if(driveScope.driveDate !=undefined && $scope.validatedate(driveScope.driveDate)){
			errArr[0]=true;
		}
		else err+="Date ";
		$scope.rondData
		if($scope.rondData !=undefined && $scope.rondData!=''){
			errArr[1]=true;
		}
		else err+="Rounds ";
		if(driveScope.driveLoction !=undefined && driveScope.driveLoction!=''){
			errArr[2]=true;
		}
		else err+="Drive-Location ";
		if(driveScope.initialSalary !=undefined || driveScope.laterSalary !=undefined){
			if(driveScope.initialSalary ==undefined ) err+="Initial-Salary ";
			else errArr[3]=true;
		}
		else err+="Salary ";
		if(driveScope.designation !=undefined && driveScope.designation!=''){
			errArr[4]=true;
		}
		else err+="Designation ";
		if(driveScope.bond=="YES"){
			if(driveScope.bondDuration !=undefined){
			errArr[5]=true;
			}
			else err+="Bond-Duration ";
		}
		else errArr[5]=true;
		if(errArr.indexOf(false)==-1) {
			
			$scope.newdrivedata={"companyId":$scope.fullData.company_id,"driveDate":driveScope.driveDate,"roundList":$scope.rondData,"bondIsAvl":driveScope.bond=='YES'?true:false,"bondDuration":driveScope.bondDuration,"driveLocation":driveScope.driveLoction,"jobLocation":driveScope.jobLocation,"initalSalary":driveScope.initialSalary,"laterSalary":driveScope.laterSalary,"designation":driveScope.designation,"submissionCertificates":driveScope.certificates=='YES'?true:false};
			$scope.addNewDriveReport=false;
			$scope.addStudentInDriveList(true);
		}
		else 
			$scope.addNewReoprt_errorMsg=err;
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
	
	
	
	
	
	
}