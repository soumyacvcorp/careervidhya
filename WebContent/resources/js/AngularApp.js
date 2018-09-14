var app=angular.module("App",["xeditable", "ui.bootstrap","chart.js"]);
//,"angularUtils.directives.dirPagination"

app.controller("viewController",viewController);

app.constant("appUrl","http://35.168.121.16");

app.run(['editableOptions', function(editableOptions) {
	  editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
	}]);




app.service("studentsService",function($http){
	
	var studentsList=[];
	
	var getStudents=function(fn){
		
		if(studentsList.length==0){
		$http.get("viewAll").then(function(response){
			studentsList=response.data["studentsList"];
			
			 fn(studentsList);
			//currentScope.filteredData=currentScope.studentsList;
			//currentScope.JSONToCSVConvertor(currentScope.studentsList,"Testing",true);
			
		});
		}
		else{
			fn(studentsList);
		}
	};
	var modifyStudent=function(st)
	{
		
		
		$http.post("updateStudent",st).then(function(response){
			var data=response.data;
			if(data["status"]){
				   document.getElementById('success').style.display='block';
				document.getElementById('reportT').innerHTML=data["notification"];
				$('#success').flash_message({
			        text: ' ',
			        how: 'append',
			        idR :'success'
			    });
				
				
				}
				else{
					document.getElementById('fail').style.display='block';
					document.getElementById('reportF').innerHTML=data["notification"];
					$('#fail').flash_message({
				        text: ' ',
				        how: 'append',
				        idR :'fail'
				    });
					
				}
		});
		
		
	};
	
	return {
		getStudents: getStudents,
	    modifyStudent:modifyStudent
	};
});






function viewController($http, appUrl,$scope, $window,studentsService)
{
	
	
	
	
	
	
	var currentScope=this;
	
	currentScope.filteredData=[];
	
	$scope.degree=0;
	$scope.aggregate=0;
	$scope.inter=0;
	$scope.SSC=0;
	
	$scope.activeStatus=true;
	$scope.doneStatus=false;
	$scope.placedStatus=false;
	
	
	$scope.getIndcolor=function(v){
		if(v<40) return {'color':'red'};
		else if(v>=40 && v<=65) return {'color':'yellow'};
		else return {'color':'red'};
	}
	//$scope.pageValues=10;
	this.requestAllStudents=function(){
		studentsService.getStudents(function(studentsList){
			currentScope.studentsList=studentsList; 
		
		});
	};
	
	//karnakar written code start
	
	$scope.sort=function(keyname){
		$scope.sortKey=keyname;
		$scope.reverse=!$scope.reverse;
		//console.log('Sort fun called');
	}
	//karnakar written code end
	
	
	$scope.getAttOfStudent=function(stud){
		if((stud.workingDate!=null && stud.workingDate!=undefined && stud.workingDate!='')&&(stud.attendance!=null && stud.attendance!=undefined && stud.attendance!='')){
			var arr=stud.workingDate.trim().split(',');
			var W=0;
			for(var j=0;j<arr.length;j++){
				var kj=(arr[j]!=undefined && arr[j]!=null && arr[j]!='')?arr[j].split('@')[0]:undefined;
				if(checkDate(kj,stud.joinDate)){
					W++;
				}
			}
			var p=stud.attendance.trim().split(',').length;
			return Math.round((p*100)/W)+"%";
		}
		else return "0%";
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
	
	
	this.requestBatchStudents=function(batchNumber){
		$('#ajaxPageLoader').show();
		$http.get("viewBatch/"+batchNumber).then(function(response){
			currentScope.studentsList=response.data["studentsList"];
			$('#ajaxPageLoader').hide();
			//currentScope.filteredData=currentScope.studentsList;
		});
	};
	
	
	
	
	
	// Change the selector if needed
	var $table = $('table.tableNewClass'),
	    $bodyCells = $table.find('table.tableNewClass.tbody tr:first').children(),
	    colWidth;

	console.log("Resizing is being executed");
	// Adjust the width of thead cells when window resizes
	$(window).resize(function() {
	    // Get the tbody columns width array
	    colWidth = $bodyCells.map(function() {
	        return $(this).width();
	    }).get();
	    
	    // Set the width of thead columns
	    $table.find('table.tableNewClass.thead tr:first').children().each(function(i, v) {
	        $(v).width(colWidth[i]);
	    });    
	}).resize(); // Trigger resize handler
	
	
	
	
	// Selection
	
	$scope.selectAll=function()
	{
		console.log("test checkbox");
		
		var source=$scope.checkAll;
		
		if(source){
			currentScope.filteredData=$scope.fstudentsList.slice();
		    console.log(currentScope.filteredData);
		}
		else
			currentScope.filteredData=[];
		
		console.log("test checkbox"+source);
		 var checkboxes = document.querySelectorAll('.tableNewClass input[type="checkbox"]');
		    for (var i = 0; i < checkboxes.length; i++) {
		    	if (checkboxes[i].checked != source)
	        	{
	            	checkboxes[i].checked = source;
	        	}
		    }
	};
	
	
	// Add or Remove
	
	this.checkStudent=function(st,event)
	{
		var element=event.currentTarget;
		var isFound=false;
		var index=-1;
			    for(var i=0;i<currentScope.filteredData.length;i++)
			    	{
			    	  if(currentScope.filteredData[i].email==st.email)
			    		  {
			    		  isFound=true;
			    		  index=i;
			    		  }
			    	}
			    if(!isFound)
			    	{
			    	 if(element.checked)
			    		 currentScope.filteredData.push(st);
			    	}
			    else
			    	{
			    	if(!element.checked)
			    		 currentScope.filteredData.splice(index,1);
			    	}
			
	};
	
	//attance
	
	
	
	// Form Editable
	
	$scope.genders=[
	                {value:"male",text:"Male"},
	                {value:"female",text:"Female"}
	                ];
	
	$scope.graduationTypes=[
	                {value:"BTech",text:"BTech"},
	                {value:"MTech",text:"MTech"},
	                {value:"MCA",text:"MCA"},
	                {value:"MBA",text:"MBA"},
	                {value:"Degree",text:"Degree"},
	                {value:"Others",text:"Others"}
	                ];
	
	$scope.states=[
	                {value:"Telangana",text:"Telangana"},
	                {value:"AndhraPradesh",text:"Andhra Pradesh"},
	                {value:"Others",text:"Others"}
	                ];
	$scope.graduationBranches=[
	                {value:"CSE",text:"CSE"},
	                {value:"IT",text:"IT"},
	                {value:"ECE",text:"ECE"},
	                {value:"EEE",text:"EEE"},
	                {value:"MECH",text:"MECH"},
	                {value:"CIVIL",text:"CIVIL"},
	                {value:"Aeronautical",text:"Aeronautical"},
	                {value:"EIE",text:"Electronics & Instrumentation Engineering"},
	                {value:"Mechatronics Engineering",text:"Mechatronics Engineering"},
	                {value:"BSC Computers",text:"BSC Computers"},
	                {value:"BSC General",text:"BSC General"},
	                {value:"BA",text:"BA"},
	                {value:"Other",text:"Any Other"}
	              
	                ];
	
	$scope.statuses=[
	                 {value:"placed",text:"Placed"},
	                 {value:"active",text:"Active"},
	                 {value:"done",text:"Course Finished"},
	                 ];
	 
	
	// Filter Students Data
	//Create Dynamic year according to current year
	$scope.yearValues=[];
	$scope.checkedYears=[];
	
	$scope.batches= mySort($window.batchNos);
	function mySort (arr){
		console.log(arr);
		for(var i=0;i<arr.length-1;i++){
			for(var j=i+1;j<arr.length;j++){
				if(parseInt(arr[i])<parseInt(arr[j])){
					var temp=arr[i];
					arr[i]=arr[j];
					arr[j]=temp;
				}
			}
		}
		console.log(arr);
		return arr;
	}
	$scope.checkedBatches=[];
	
	
	$scope.branchValues=["CSE&IT","ECE","EEE","MECH","CIVIL","BSC","BCOM","Others","EIE"];
	$scope.checkedBranches=[];
	
	
	$scope.Paid=false;
	$scope.pPaid=false;
	$scope.nPaid=false;
	$scope.free=false;
	
	
	(function(){
		var year=new Date().getFullYear();
		var i=0;
		for(i=year+1;i>=year-4;i--)
			{
			$scope.yearValues.push(i);
			$scope.checkedYears.push(-1);
			}
		for(i=0;i<$scope.branchValues.length;i++)
		{
		$scope.checkedBranches.push("NA");
		}
		//console.log(batchNos);
		console.log($scope.batches.length);
		for(i=0;i<$scope.batches.length;i++)
		{
			
		$scope.checkedBatches.push(-1);
		}
		
	}());
	

	
$scope.statusFilter=function(st){
		
		if( !$scope.activeStatus && !$scope.doneStatus && !$scope.placedStatus)
			return true;
		var a=false,n=false,p=false;
		if($scope.activeStatus!=false)
			a= (st.status=='active');
		if($scope.doneStatus!=false)
			n= (st.status=='done');
		if($scope.placedStatus!=false)
			p= (st.status=='placed');
		
		return a || n || p;
		
	};
	
	
	
	$scope.yearOfPassFilter=function(st)
	{
		var count=0;
		for(var i=0;i<$scope.checkedYears.length;i++){
			if($scope.checkedYears[i]==st.graduationYOP)
				return true;
			if($scope.checkedYears[i]==-1)
			count++;
		}
		return count==$scope.checkedYears.length;
	};
	
	
	

	$scope.branchFilter=function(st)
	{
	  var count=0;
		for(var i=0;i<$scope.checkedBranches.length;i++){
			if($scope.checkedBranches[i].indexOf(st.graduationBranch)!=-1)
				return true;
			if($scope.checkedBranches[i]=="NA")
			count++;
		}
		return count==$scope.checkedBranches.length;
	};
	
	
	$scope.batchFilterChecked=false;
	
	$scope.batchFilter=function(st)
	{
		var count=0;
		for(var i=0;i<$scope.batches.length;i++){
			if(parseInt($scope.checkedBatches[i])==st.batchNumber)
				return true;
			if($scope.checkedBatches[i]==-1)
			count++;
		}
		return count==$scope.checkedBatches.length;
	};
	
	
	
	
	
	$scope.sscFilter=function(st)
	{
		
		return $scope.SSC<=st.sscPercentage;
	};
	/*$scope.yearOfPassFilter=fucntion(st)
	{
		return $scope.yearOfPass==st.graduationYOP;
	}*/
	
	$scope.interFilter=function(st)
	{
		return $scope.inter<=st.interPercentage;
	};
	
	$scope.sscMaths=0;
	$scope.interMaths=0;
	
	
	
	
	
	$scope.sscMathsFilter=function(st)
	{
		
		return $scope.sscMaths<=st.sscMaths;
	};
	
	$scope.interMathsFilter=function(st)
	{
		return $scope.interMaths<=st.interMaths;
	};
	
	$scope.aggregateFilter=function(st)
	{
		
		return $scope.aggregate<=st.aggregate;
	};
	
	$scope.degreeFilter=function(st)
	{
		
		return $scope.degree<=st.graduationPercentage;
	};
	
	$scope.fee=-1;

	$scope.feeFilter=function(st)
	{
		if(!$scope.Paid && !$scope.pPaid && !$scope.free && !$scope.nPaid)
			return true;
	
		var b1,b2=false,b3,b4,b5;
		
		if($scope.Paid==true)
			 b1= st.feePaid-st.feeTotal==0;
		if($scope.pPaid==true && st.feeTotal!=0 && st.feePaid!=0)
			b2= true;
		if($scope.free==true)
			b3= st.feeTotal==0;
		if($scope.nPaid==true)
			b4= st.feePaid==0 && st.feeTotal!=0;
		else
			b5= false;
		return b1 || b2 || b3 || b4 || b5;
	}
	
	
	this.resetFilters=function()
	{
		//Resetting

		$scope.sscMaths=0;
		$scope.interMaths=0;
		
		$scope.Paid=false;
		$scope.pPaid=false;
		$scope.nPaid=false;
		$scope.free=false;
		
		//Resetting status
		$scope.activeStatus=false;
		$scope.doneStatus=false;
		$scope.placedStatus=false;
		
		//$scope.fee=-1;
		$scope.degree=0;
		$scope.aggregate=0;
		$scope.inter=0;
		$scope.SSC=0;
		$scope.genderI="";
		$scope.graduationType="";
		$scope.branchName="";
		$scope.yearOfPass="";
		$scope.studentSearchStr="";
		$scope.batchNumber="";
		$scope.checkedYears=[];
		$scope.checkedBranches=[];
		$scope.checkedBatches=[];
		
		for(i=0;i<$scope.branchValues.length;i++)
		{
		$scope.checkedBranches.push("NA");
		}
		
		for(i=0;i<$scope.batches.length;i++)
		{
			
		$scope.checkedBatches.push(-1);
		}
		
		var year=new Date().getFullYear();
		var i=0;
		for(i=year+1;i>=year-4;i--)
			{
			
			$scope.checkedYears.push(-1);
			}
		
	}
	
	
	$scope.isCCVisibile=false;
	$scope.isBCCVisibile=false;
	
	
	$scope.sendMail=function()
	{
		console.log("Testing Send MAil");
		var emails=[];
		for(var i=0;i<currentScope.filteredData.length;i++)
			emails.push(currentScope.filteredData[i].email);
		$scope.mailData={
			recipients:emails,
		    ccrecipients:$scope.ccrecipients,
		    bccrecipients:$scope.bccrecipients,
		    subject:$scope.subject,
		    message:$scope.message 
		};
		
		
		$http.post("sendMailJSON",	$scope.mailData	   ).then(function(response){
			 
			 
			 var data=response.data;
			 if(data["status"]){
				 $("#closeMailModal").click();
				   document.getElementById('success').style.display='block';
				document.getElementById('reportT').innerHTML=data["notification"];
				
				$('#success').flash_message({
			        text: ' ',
			        how: 'append',
			        idR :'success'
			    });
				
				
				}
				else{
					document.getElementById('fail').style.display='block';
					document.getElementById('reportF').innerHTML=data["notification"];
					$('#fail').flash_message({
				        text: ' ',
				        how: 'append',
				        idR :'fail'
				    });
					
				}
			 
		});
	};
	$scope.ccrecipients=[];
	$scope.prepareCC=function()
	{
		console.log("Test prepare");
		if($scope.ccrecipient.indexOf(",")>0 || $scope.ccrecipient.indexOf(" ")>0){
			$scope.ccrecipients.push($scope.ccrecipient.substring(0,$scope.ccrecipient.length-1));
		    $scope.ccrecipient="";
		}
	}
	$scope.bccrecipients=[];
	$scope.prepareBCC=function()
	{
		console.log("Test prepare");
		if($scope.bccrecipient.indexOf(",")>0 || $scope.bccrecipient.indexOf(";")>0){
			$scope.bccrecipients.push($scope.bccrecipient.substring(0,$scope.bccrecipient.length-1));
		    $scope.bccrecipient="";
		}
	}
	
	
	
	this.JSONToCSVConvertor=function () {
	    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
		
		var JSONData=currentScope.filteredData.slice();
		 var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
		
		 
		 
		var checkBoxes=document.getElementsByName("fieldToSelect");
		console.log(checkBoxes);
		
		//Delete Fields
		for(var k=0;k<arrData.length;k++)
			{
		delete arrData[k].student_id;
		delete arrData[k].isRegistered;
		delete arrData[k].houseNo;
		delete arrData[k].city;
		delete arrData[k].state;
		delete arrData[k].attendancePerc;
		delete arrData[k].password_hash;
		delete arrData[k].attendance;
		delete arrData[k].$$hashKey;
		
			}
		
		
		
		for(var i=0;i<checkBoxes.length;i++)
			{
			  if(!checkBoxes[i].checked)
				  {
				  for(var l=0;l<arrData.length;l++){
				  switch(parseInt(checkBoxes[i].value))
				  {
				  case 0: delete arrData[l].fullName; break;
				  case 2: delete arrData[l].batchNumber; break;
				  case 3: delete arrData[l].email; break;
				  case 4: delete arrData[l].parentName; break;
				  case 6: delete arrData[l].mobile; break;
				  case 7: delete arrData[l].gender; break;
				  case 8: delete arrData[l].dob; break;
				  case 9: delete arrData[l].graduationCity; break;
				  case 11: delete arrData[l].locality; break;
				  case 14: delete arrData[l].mobile_Parent; break;
				  case 15: delete arrData[l].feePaid; break;
				  case 16: delete arrData[l].feeTotal; break;
				  case 17: delete arrData[l].sscPercentage; break;
				  case 18: delete arrData[l].interPercentage; break;
				  case 19: delete arrData[l].graduationPercentage; break;
				  case 20: delete arrData[l].graduationCollege; break;
				  case 21: delete arrData[l].graduationYOP; break;
				  case 22: delete arrData[l].graduationType; break;
				  case 23: delete arrData[l].graduationBranch; break;
				  case 26: delete arrData[l].aggregate; break;
				  case 28: delete arrData[l].joinDate;
				  
				  }
				  }
				  }
			}
		
		
		console.log(arrData);
		
		var ReportTitle="students_list"+new Date();
		var ShowLabel=true;
		
	   
	    
	    var CSV = '';    
	    //Set Report title in first row or line
	    
	    CSV += ReportTitle + '\r\n\n';

	    //This condition will generate the Label/Header
	    if (ShowLabel) {
	        var row = "";
	        
	        //This loop will extract the label from 1st index of on array
	        for (var index in arrData[0]) {
	            
	            //Now convert each value to string and comma-seprated
	        	//console.log("Now convert each value to string and comma-seprated");
	            row += index + ',';
	           // console.log(row);
	        }

	        row = row.slice(0, -1);
	        
	        //append Label row with line break
	        CSV += row + '\r\n';
	    }
	    
	    //1st loop is to extract each row
	    for (var i = 0; i < arrData.length; i++) {
	        var row = "";
	        
	        //2nd loop will extract each column and convert it in string comma-seprated
	       // console.log("2nd loop will extract each column and convert it in string comma-seprated");
	        for (var index in arrData[i]) {
	            row += '"' + arrData[i][index] + '",';
	          // console.log(row);
	        }

	        row.slice(0, row.length - 1);
	        
	        //add a line break after each row
	        CSV += row + '\r\n';
	    }

	    if (CSV == '') {        
	        alert("Invalid data");
	        return;
	    }   
	    
	    //Generate a file name
	    var fileName = "MyReport_";
	    //this will remove the blank-spaces from the title and replace it with an underscore
	    fileName += ReportTitle.replace(/ /g,"_");   
	    
	    //Initialize file format you want csv or xls
	    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
	    
	    // Now the little tricky part.
	    // you can use either>> window.open(uri);
	    // but this will not work in some browsers
	    // or you will not get the correct file extension    
	    
	    //this trick will generate a temp <a /> tag
	    var link = document.createElement("a");    
	    link.href = uri;
	    
	    //set the visibility hidden so it will not effect on your web-layout
	    link.style = "visibility:hidden";
	    link.download = fileName + ".csv";
	    
	    //this part will append the anchor tag and remove it after automatic click
	    document.body.appendChild(link);
	    link.click();
	    document.body.removeChild(link);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	this.showhide=function(e)
	{
		var e=document.getElementById(e);
		if(e.style.display=="none")
			e.style.display="block";
		else
			e.style.display="none";
		
	};
	
	
	
	
	
	
	
	
	// Fetch Report View Progress
	
	
	this.fetchReport=function(email){ 
		
		let url="getStudentReport/"+email+"/any";
		
			//document.getElementById("V"+email).style.display="none";
			//document.getElementById("ChartProgress").style.display="block";
			
			$('#ajaxPageLoader').show();
			
	    $http.get(url).then(function(data) {
	    	console.log(data);
	    	//data = JSON.parse(data.data);
	    	data=data.data;
	    	console.log(data);
	    	if(data["scorePerc"]!=null)
	    		{
	    	displayChart("ChartM",data["scorePerc"],"Students overall Exams %","Secured %","Lost %");
	    	document.getElementById("ChartM").style.display='block';
	    	document.getElementById("ChartMError").innerHTML="Student took  <strong>"+data["testCount"]+"</strong> exams in total";
	    	document.getElementById("ChartMError").style.color='#908684';
	    	document.getElementById("ChartMError").style.fontSize="16px";
	    		}
	    	else{
	    		document.getElementById("ChartMError").innerHTML="<p style='color:#ff6666 !important;text-align:center !important;font-size:18px !important;'>Student might not taken any exam</p>";
	    	}
	    	if(data["attendancePerc"]!=-1){
	    	displayChart("ChartA",data["attendancePerc"],"Students overall attendance %","Present %","Absent %");
	    	document.getElementById("ChartA").style.display='block';
	    	}else{
	    		document.getElementById("ChartAError").innerHTML="<p style='color:#ff6666 !important;text-align:center !important;font-size:18px !important;'>Attendance of Student is not updated</p>";
	    	}
	    	$('#ajaxPageLoader').hide();
	    });
		
	}
	
	
	this.displayD=function (e)
	{
		console.log(e);

		if(document.getElementById(e).style.display=='none')
			document.getElementById(e).style.display='block';
		else
			document.getElementById(e).style.display='none';
	}
	
	this.convertToInt=function(v)
	{
		return parseInt(v);
	}
	$scope.butifytheName=function(name)
	{
		if(name!=undefined){
		var names=name.split(" ");
		var bName="";
		for(var i=0;i<names.length;i++)
			{
			 bName=bName+((names[i].charAt(0)+"").toUpperCase())+names[i].substring(1,names[i].length).toLowerCase()+" ";
			}
		return bName;
		}
		else
			return "Student Area";
	}
	
	
	
	
	this.updateFee=function(t)
	{
		console.log("Test fee Pay");
		if(t.feePaid>=t.feeTotal)
		{
		alert("fee already paid");
		}
	else if(document.getElementById(t.email+"Fee").value!=""){
		var v=document.getElementById(t.email+"Fee").value;
		var pay=v;
		v= parseInt(v)+parseInt(t.feePaid);
		//document.getElementById("feeLoad").style.display='block';
		if(confirm("Are you confirm that student"+t.fullName+" is paying"+pay+" Rupees?"))
			{
			
			
		//sendData("updateFee/"+t.email,"/"+v,"feeLoad",-1);
		
		 $http.get("updateFee/"+t.email+"/"+v).then(function(data) {
			 
			 data=data.data;
			 
			 if(data["status"]){
				   document.getElementById('success').style.display='block';
				document.getElementById('reportT').innerHTML=data["notification"];
				$('#success').flash_message({
			        text: ' ',
			        how: 'append',
			        idR :'success'
			    });
				
				
				}
				else{
					document.getElementById('fail').style.display='block';
					document.getElementById('reportF').innerHTML=data["notification"];
					$('#fail').flash_message({
				        text: ' ',
				        how: 'append',
				        idR :'fail'
				    });
					
				}
		
		//document.getElementById("feeLoad").style.display='none';
		//document.getElementById(e).style.display='none';
		 });
		
			}
	}
		
	}
	
	this.updateTotalFee=function(email)
	{
	
		
		var val=document.getElementById('totalFee_'+email).value;
		$http.get("updateTotalFee/"+email+"/"+val).then(function(data){
			
			data=data.data;
			
			if(data["status"]){
				   document.getElementById('success').style.display='block';
				document.getElementById('reportT').innerHTML=data["notification"];
				$('#success').flash_message({
			        text: ' ',
			        how: 'append',
			        idR :'success'
			    });
				
				
				}
				else{
					document.getElementById('fail').style.display='block';
					document.getElementById('reportF').innerHTML=data["notification"];
					$('#fail').flash_message({
				        text: ' ',
				        how: 'append',
				        idR :'fail'
				    });
					
				}
			
		});
		
	};
	
	
	$scope.previousSelection=null;
	this.studentDetails=function(student,$event)
	{
		if($scope.previousSelection!=null)
			$scope.previousSelection.style.backgroundColor="#ffffff";
		$scope.previousSelection=$event.currentTarget;
		console.log($event.currentTarget);
		$event.currentTarget.style.backgroundColor="#b0dcd9";
	  currentScope.student=student;
	 // document.getElementById('viewMore_Student').style.display="block";
	}


	$scope.findDuration=function(joinDate){
		//console.log(joinDate);
		
		if(joinDate!=null && joinDate!="null"){
		var one_day=1000*60*60*24;    // Convert both dates to milliseconds
		var date1_ms = new Date(joinDate).getTime();   
		var date2_ms = new Date().getTime();    // Calculate the difference in milliseconds  
		
		var difference_ms = date2_ms - date1_ms; 
		
		 //console.log(Math.round(difference_ms/one_day));
		 // Convert back to days and return   
		 
		return Math.round(difference_ms/one_day);
		}
		else{
			//console.log("Test");
			return 'NA';
		}
	};
	
	$scope.saveStudent= function(){
		console.log("testing");
	
		 studentsService.modifyStudent(currentScope.student);
	};
	
	$scope.showCompanyEdits=false;
	
		$scope.fetchCompanies=function()
    	{
    		
    		
    		if($scope.companyName!=null && $scope.companyName.length>=1)
    		$http.get("companies/"+$scope.companyName).then(function(response){
    			console.log(response);
    			$scope.companies=response.data.companies;
    		});
    	};

    	
    	$scope.WrittenRound_Status="NA";
		$scope.TechnicalRound1_Status="NA";
		$scope.TechnicalRound2_Status="NA";
		$scope.HRRound_Status="NA";
		$scope.ComsRound_Status="NA";
    	
    	$scope.saveDriveData=function()
		{
			
			
			$scope.drivesData={
	    			
	    		    name:$scope.companyName,
	    			student_id:currentScope.student.student_id,
	    			WrittenRound_Status:$scope.WrittenRound_Status,
	    			ComsRound_Status:$scope.ComsRound_Status,
	    			description:$scope.description,
	    			TechnicalRound1_Status:$scope.TechnicalRound1_Status,
	    			TechnicalRound2_Status:$scope.TechnicalRound2_Status,
	    			HRRound_Status:$scope.HRRound_Status,
	    			bond:$scope.bond,
	    			bondduration:$scope.bondduration,
	    			initialSalary:$scope.initialSalary,
	    			laterSalary:$scope.laterSalary,
	    			designation:$scope.designation,
	    			FinalReport:"YES",
	    			certificates:$scope.certificates,
	    			technicalstack:$scope.technicalstack
	    			
	    			
	    	};
			console.log($scope.drivesData);
			$http.post("updateDrive",$scope.drivesData).then(
			function(response)
			{
				if(response.data.status)
					{
					 console.log("success");
					}
					else
					{
					 alert("Save Not Success full please enter valid data and Try again");
					}
			}
			);
			
		};
	
}