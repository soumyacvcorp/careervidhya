<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="https://www.gstatic.com/firebasejs/4.9.1/firebase.js"></script>
		<script src="https://cdn.firebase.com/libs/firebaseui/2.5.1/firebaseui.js"></script>
		<link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/2.5.1/firebaseui.css" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>
	    
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <title>Placement Needs</title>
	    <!-- Latest compiled and minified CSS -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
	    <!-- jQuery library -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
	    <!-- Latest compiled JavaScript -->
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    
    
    .bgBlack{
      background-color:black !important;
    }
    .bgTp{
      background-color:transperant !important;
    }
        body
        {
            font-family: Segoe UI Semibold !important;
        }
        form 
        {
			text-align: left;
			width: 100%;
			margin: 0 auto;
		}

		input,
		textarea {
			display: block;
			width: 100%;
			border: 0;
			padding: 10px 5px;
		  background: white no-repeat;
			
			/*
			* IMPORTANT PART HERE
			*/
			
		  /* 2 imgs : 1px gray line (normal state) AND 2px green line (focus state) */
			background-image: linear-gradient(to bottom, #1abc9c, #1abc9c), linear-gradient(to bottom, silver, silver);
			/* sizes for the 2 images (default state) */
			background-size: 0 2px, 100% 1px;
			/* positions for the 2 images. Change both "50%" to "0%" or "100%" and tri again */
			background-position: 50% 100%, 50% 100%;
		
			/* animation solely on background-size */
		  transition: background-size 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
		
		}
		.rowMarginClassPlacement
		{
			margin-right:0px !important;
		}
		
		input:focus,
		textarea:focus{
		  /* sizes for the 2 images (focus state) */
			background-size: 100% 2px, 100% 1px;
			outline: none;
		}
		.placemntBtns
		{
			background-color:#1abc9c;margin:auto;display:block;border-radius:0px !important;border:1px solid #1abc9c;color:#fff;
			padding:1% 2% !important;
		}
		.placemntBtns:hover
		{
			background-color:#1abc9c !important;
			color:#fff;
		}
		.placemntBtns:visited
		{
			background-color:#1abc9c !important;
			color:#fff;
		}
		.orPlacementClass
		{
			text-align:center !important;color:#fff !important; margin-top: 30px !important;
		}
		@media only screen and (max-width: 768px) {
			.rowMarginClassPlacement
			{
				margin-right:-15px !important;
			}
			.orPlacementClass
			{
				margin-top: 10px !important;
			}
		}
    </style>
</head>
<body style="" ng-app="App" ng-controller="FormController">
<div class="container-fluid">
	<div class="row rowMarginClassPlacement">
		<div class="col-md-2 col-xs-0"></div>
		<div class="col-md-8 col-xs-12" style="padding:1%;background: #395444;">
			<h2 style="color:#fff;text-align:center;">Placement Needs</h2> 
			<div class="container-fluid">
			<input id="sign-in-button" type="email" ng-model="email" placeholder="Enter Email / Login ID"><br> 
			<button id="verifyButton" ng-click="validateStudent()" class="btn btn-default placemntBtns">Verify It's You</button>
			<br>
			<div id="detailsOTP" style="display:none">
				<p style="text-align:left;color:#fff">Name : <span>{{fullName}}</span></p>
				<p style="text-align:left;color:#fff">PhoneNo : <span>+91 {{mobileNumber}}</span><br><br></p>
				<div class="row" style="text-align:center">
					<div class="col-sm-3 col-md-3"></div>
					<div id="OTPDiv" class="col-sm-6 col-md-6">
					 	<p style="color:#fff">Enter OTP Code Sent to Your Mobile Number <b><i> +91{{mobileNumber}}</i></b></p>
						<input type="text" ng-model="code" style="width:50% !importanat"/><br>
						<button ng-click="validateCode()"  class="btn btn-default placemntBtns">Confirm</button>
						<span style="color:gray">OTP Problem or Change email ?</span> 
						<button onclick="location.reload()" class="btn btn-default placemntBtns">Reset</button>
				    </div>
				    <div class="col-sm-3 col-md-3"></div>
				</div>
		    </div>
			<form id="formToDisplay" style="display:none">
			    <div class="row">
			        <div class="col-md-6">
			        	<label for="tenthBoard" style="color:#fff;text-align:left !important;font-size:11px;">10th Board <span style="color:red">*</span> </label>
			            <select placeholder="10 class Board" ng-model="sscBoard"   ng-options="n for n in sscBoardData" style="width:100%;height: 40px;" name="tenthboard" id="tenthboard">
			               
			            </select>
			        </div>
			        <div class="col-md-6">
			        	<label for="tenthmarks" style="color:#fff;text-align:left !important;font-size:11px;">10th Math Marks <span style="color:red">*</span> </label>
			            <input ng-model="sscMaths" type="text" placeholder=" 10Th Math Marks" name="tenthmarks"  id="tenthmarks"/>
			            
			        </div>
			    </div>
			    <div class="row">
			        <div class="col-md-6">
			        	<label for="tenthmarks" style="color:#fff;text-align:left !important;font-size:11px;">Inter Board <span style="color:red">*</span> </label>
			            <select placeholder="11 & 12 class Board" ng-options="n for n in interBoardData" ng-model="interBoard" style="width:100%;height: 40px;" name="interboard" id="interboard">
			            
			            </select>
			        </div>
			        <div class="col-md-6" style="margin-top:0.3%;">
			        	<div class="row">
			        		<div class="col-md-4 col-xs-12">
			        			<label for="intermarks" style="color:#fff;text-align:left !important;font-size:11px;">1st Year Math Marks <span style="color:red">*</span> </label>
			        			<input ng-model="inter1stYrMaths" ng-change="calculatePercentage()" type="number" placeholder="1st Yr Math marks" name="intermarks"  id="intermarks"/>
			            		
			        		</div>
			        		<div class="col-md-4 col-xs-12">
			        			<label for="intermarks" style="color:#fff;text-align:left !important;font-size:11px;">2nd Year Math Marks <span style="color:red">*</span> </label>
			        			<input ng-model="inter2ndYrMaths" ng-change="calculatePercentage()" type="number" placeholder="2nd Yr Math marks" name="intermarks"  id="intermarks"/>
			            		
			        		</div>
			        		<div class="col-md-1 col-xs-12"><h5 class="orPlacementClass">OR</h5></div>
			        		<div class="col-md-3 col-xs-12">
			        			<label for="intermarks" style="color:#fff;font-size:11px;">Total % <span style="color:red">*</span></label>
			        			<input ng-model="interMaths" type="text" placeholder=" Total %" name="intermarks"  id="intermarks"/>
			            		
			        		</div>
			        	</div>
			            
			        </div>
			    </div>
			    <div class="row" style="margin-top:1%;">
			        <div class="col-md-6">
			        	<label for="fbLink" style="color:#fff;text-align:left !important;font-size:11px;">Enter Facebook link <span style="color:red">*</span> </label>
			            <input ng-model="fbLink" type="text" placeholder="Facebook link" name="fblink"  id="fblink"/>
			            
			        </div>
			        <div class="col-md-6">
			        	<label for="lnLink" style="color:#fff;text-align:left !important;font-size:11px;">Enter Linkedin link</label>
			            <input ng-model="lnLink" type="text" style="float:left;" placeholder=" Linkedin link" name="linkedin"  id="linkedin"/>
			    
			        </div>
			    </div>
			    <div class="submit" style="width:30%;margin:auto;margin-top:5%;display:block;">
			        <button id="MathSaveButton" ng-click="saveMathsScore()" class="btn btn-default placemntBtns" style="padding: 3% 10% !important;">SAVE</button>
			    </div>
			 </form>  
			 
			 
			<div id="notplacediv" style="display:none;">
			<h3 style="text-align:left;color:#fff;">Drive/Walk-in Experiences if any in CVCORP/Outside?</h3>   
			<p style="color:white">Note: Fill Up the multiple companies details you have been one after other</p>
			<br> 
			 <div class="row" id="interviewsCountForm">
			        <div class="col-md-2">
			       <span style="color:#fff"> Enter Number of Walk-ins you have been</span>
			        </div>
			        <div class="col-md-1">
			            <input ng-model="interviewsCount" type="number" name="fblink" id="interviewsCount"/>
			            <label for="interviesCount"></label>
			        </div>
			        
			        <div class="col-md-3">
			            <button id="getFormButton" class="btn btn-default placemntBtns" style="padding: 3% 10% !important;" ng-click="getCount()" >Get Form</button>
			            <label for="interviesCount"></label>
			        </div>
			        
			        <div class="col-md-6">
			           
			        </div>
			    </div>
			
			<div id="companyData" style="display:none;">
				
				 <div class="row"><div class="col-md-6"></div><div class="col-md-6"><span ng-repeat="v in numbers"><span style="padding:3%;border:1px solid black; border-radius:10%;" ng-class="{ bgBlack:v==1 }" id="{{v}}"><span style="color:white;">{{v}}</span></span></span></div></div>  
				<form>				
					<div class="row">
					   
			    		<div class="col-md-6">
			        		<input list="namesList" ng-model="name" ng-change="fetchCompanies()" type="text" placeholder="Company Name" name="companyname"  id="companyname"/>
			        		<datalist id="namesList">
			        		<option ng-repeat="c in companies" value="{{c.name}}"/>
			        		</datalist>
			        		<label for="companyname"></label>
			    		</div>
					    <div class="col-md-6">
					      <!--  <input ng-model="URL" type="text" placeholder="Comapny URL" name="companyurl"  id="companyurl"/>
					        <label for="companyurl"></label> -->
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					       <!--   <input ng-model="location" type="text" placeholder="Location" name="location"  id="location"/>
					        <label for="location"></label>-->
					    </div>
					    <div class="col-md-6">
					        
					    </div>
					</div>
					<div class="row">
			    		<div class="col-md-6">
			        		<h4 style="text-align:left;color:#fff;">Rounds You have gone through</h4>
						</div>
						<div class="col-md-2">
			    			<div  style="margin-top:6%;color:#fff;text-align:left;">
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="WrittenRound_Status" type="checkbox" style="width:15px;height:15px;" name="levewritten" id="levewritten"> Written Test</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="ComsRound_Status" type="checkbox" style="width:15px;height:15px;" name="f2ftexhlevel1" id="f2ftexhlevel1">GD/JAM/Communication</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="TechnicalRound1_Status" type="checkbox" style="width:15px;height:15px;" name="gdround" id="gdround"> Technical Level 1</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="TechnicalRound2_Status" type="checkbox" style="width:15px;height:15px;" name="jamround" id="jamround">Technical Level 2</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="HRRound_Status" type="checkbox" style="width:15px;height:15px;" name="jamround" id="jamround" >HR/Final Level</label>
							</div>
			    		</div>
			    		<div class="col-md-4"></div>
					</div>
				    <textarea ng-model="description" placeholder="Any thing to Say / Experience / description about the drive?"></textarea>  
			      <div class="row">
			      	<div class="col-md-3">
			      		<h4 style="text-align:left;color:#fff;">Got Offer in above Mentioned Company?</h4>
			      	</div>
			      	<div class="col-md-2">
			      		<div style="margin-top:6%;color:#fff">
			      			<label class="radio-inline"><input type="radio" ng-model="FinalReport" value="YES" style="width:15px;height:15px;"/> Yes</label>
			      			<label class="radio-inline"><input type="radio" checked ng-model="FinalReport" value="NO" style="width:15px;height:15px;"/> No</label>
			      		</div>
			      	</div>
			      	<div class="col-md-7"></div>
			      </div>
			      <div ng-show="FinalReport == 'YES'">
			      <div class="row" >
			      	<div class="col-md-3">
			      		<h4 style="text-align:left;color:#fff;">Any Bond?</h4>
			      	</div>
			      	<div class="col-md-2">
			      		<div style="margin-top:6%;color:#fff">
			      			<label class="radio-inline"><input type="radio" ng-model="bond" value="YES" style="width:15px;height:15px;"/> Yes</label>
			      			<label class="radio-inline"><input type="radio" checked ng-model="bond" value="NO" style="width:15px;height:15px;"/> No</label>
			      		</div>
			      	</div>
			      	<div class="col-md-7"></div>
			      </div>
			      <div ng-show="bond == 'YES'">
					  <div class="row" style="color:#fff">
					  	<div class="col-md-6">
					  		<h4 style="text-align:left;color:#fff;">Bond Duration in Months</h4>
					  		<input ng-model="bondduration" type="number" style="color:#000;" placeholder="Bond Duration in months"/>
					  	</div>
					  	<div class="col-md-6">
					  		<h4 style="text-align:left;color:#fff;">Any Submission of Original Certificates ?</h4>
					  		<div style="float:left;width:23%;">
						  		<label class="radio-inline"><input type="radio" ng-model="certificates" value="YES" style="width:15px;height:15px;"/> Yes</label>
					      		<label class="radio-inline"><input type="radio" ng-model="certificates" value="NO" style="width:15px;height:15px;"/> No</label>
					      		
							</div>
					  	</div>
					  </div>
				 </div><br>
				  <div class="row">
		    		<div class="col-md-6">
		        		<input ng-model="initialSalary" type="text" placeholder="Initial Salary in Lacks Ex 3.4" name="initialsal"/>
		        		<label for="initialSalary"></label>
		    		</div>
				    <div class="col-md-6">
				        <input ng-model="laterSalary" type="text" placeholder="Enter Later Salary (if Any)" name="latersal"/>
				        <label for="latersal"></label>
				    </div>
				</div>
				<div class="row">
		    		<div class="col-md-6">
		        		<input ng-model="designation" type="text" placeholder="Enter Your designation" name="designation"  id="designation"/>
		        		<label for="designation"></label>
		    		</div>
				    <div class="col-md-6">
				        <input ng-model="technicalstack" type="text" placeholder="Technical Stack or Role" name="technicalstack"/>
				        <label for="technicalstack"></label>
				    </div>
				</div>
				</div>
				 <div class="submit" style="width:30%;margin:auto;margin-top:5%;display:block;">
			        <button ng-click="saveDriveData()" id="saveDriveButton" class="btn btn-default placemntBtns" style="padding: 3% 10% !important;">SAVE</button>
			    </div>
				</form> 
				</div>              
			</div>
		</div>
		</div>
		<div class="col-md-2 col-xs-0"></div>
	</div>
</div>
<script>
    
    
    var app=angular.module("App",[]);
    app.controller("FormController",formController);

    var config = {
    	    apiKey: "AIzaSyC6EkDY-MEaaKdXS-QnHb0qyeis_ywkURo",
    	    authDomain: "careervidhya-8159c.firebaseapp.com",
    	    databaseURL: "https://careervidhya-8159c.firebaseio.com",
    	    projectId: "careervidhya-8159c",
    	    storageBucket: "",
    	    messagingSenderId: "73302709188"
    	  };
    
    firebase.initializeApp(config);
    
    firebase.auth().useDeviceLanguage();

    window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('sign-in-button', {
    	  'size': 'invisible',
    	  'callback': function(response) {
    	    // reCAPTCHA solved, allow signInWithPhoneNumber.
    	   // onSignInSubmit();
    	  }
    	});
    
    function formController($http,$scope,$window)
    {  
    	
    	
    	$scope.sscBoardData=["Select 10 Board","SSC","CBSE","ICSE","BSE","Others"];
    	$scope.interBoardData=["Select 11+12 Board","Inter","CBSE","ICSE","BSE","Others"];
    	$scope.sscBoard="SSC";
    	$scope.interBoard="Inter";
    	$scope.load="Verify It's You";
    	$scope.companies=[];
    	$scope.interviewsCount=0;
    	//$scope.phoneNumber = "+919573883212";
    	  var appVerifier = window.recaptchaVerifier;
    	  
    	  $scope.sendOTP=function(){
    		  console.log($scope.mobileNumber);
    	  firebase.auth().signInWithPhoneNumber("+91"+String($scope.mobileNumber), appVerifier)
    	      .then(function (confirmationResult) {
    	        // SMS sent. Prompt user to type the code from the message, then sign the
    	        // user in with confirmationResult.confirm(code)
    	        window.confirmationResult = confirmationResult;
    	      }).catch(function (error) {
    	        alert("Erron in sending otp");
    	      });
    	  }
    	 
    	  $scope.validateCode=function(){
    		  console.log($scope.code);
    		  $scope.code=String($scope.code);
    		confirmationResult.confirm($scope.code).then(function (result) {
    		  // User signed in successfully.
    		  console.log("Done");
    		  document.getElementById("formToDisplay").style.display="block";
    		  document.getElementById("OTPDiv").style.display="none";
    		  document.getElementById("sign-in-button").style.display="none";
    		  document.getElementById("verifyButton").style.display="none";
    		  
    		 // var user = result.user;
    		  // ...
    		}).catch(function (error) {
    		  // User couldn't sign in (bad verification code?)
    		  // ...
    		  console.log("Bad verification code");
    		});
    	  }
    		
    	  
    	  
    	  
    		$scope.validateStudent=function(){
    			document.getElementById("verifyButton").innerHTML="<i class='fa fa-refresh fa-spin fa-3x fa-fw'></i>";
    			//document.getElementById("loader").style.display="block";
    			//document.getElementById("verifyButton").innerHTML="<i class='fa fa-refresh fa-spin fa-3x fa-fw'></i>";
    			
    		$http.get("getStudent/"+$scope.email+"/any").then(
    		function(response)
    		{
    			if(response.data!=null && response.data!=""){
    			document.getElementById("detailsOTP").style.display="block";
    			console.log(response);
    			$scope.fullName=response.data.fullName;
    			$scope.mobileNumber=response.data.mobile;
    			$scope.student_id=response.data.student_id;
    			$scope.sendOTP();
    			document.getElementById("verifyButton").style.display="none";
    			document.getElementById("sign-in-button").style.display="none";
    			//document.getElementById("loader").style.display="none";
    			}
    			else{
    				document.getElementById("verifyButton").innerHTML="Verify It's You";
    				alert("Enter Valid Email Id (Your Registered Email in CareerVidhya Online Portal)");
    				
    			}
    			}
    		
    		);
    		};
    		
    		
    		
    		$scope.saveMathsScore=function()
    		{
    			
    			document.getElementById("MathSaveButton").innerHTML="<i class='fa fa-refresh fa-spin fa-3x fa-fw'></i>";
    			$scope.jsonFormat={
    	    			fbLink:$scope.fbLink,
    	    			lnLink:$scope.lnLink,
    	    			sscBoard:$scope.sscBoard,
    	    			sscMaths:$scope.sscMaths,
    	    			interBoard:$scope.interBoard,
    	    			interMaths:$scope.interMaths,
    	    			email:$scope.email,
    	    			student_id:$scope.student_id
    	    	};
    			console.log($scope.jsonFormat);
    			$http.post("updateMath",$scope.jsonFormat).then(
    			function(response)
    			{
    				if(response.data.status)
    					{
    					document.getElementById("formToDisplay").style.display="none";
    					document.getElementById("notplacediv").style.display="block";
    					
    					}
    					else
    					{
    					 alert("Save Not Success full please enter valid data and Try again");
    					}
    			}
    			);
    			
    			
    		};
    	
    		
    		
    		$scope.WrittenRound_Status="NA";
    		$scope.TechnicalRound1_Status="NA";
    		$scope.TechnicalRound2_Status="NA";
    		$scope.HRRound_Status="NA";
    		$scope.ComsRound_Status="NA";
    		
    		
    		
    		
    		$scope.saveDriveData=function()
    		{
    			document.getElementById("saveDriveButton").innerHTML="<i class='fa fa-refresh fa-spin fa-3x fa-fw'></i>";
    			
    			$scope.drivesData={
    	    			
    	    		    name:$scope.name,
    	    			student_id:$scope.student_id,
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
    	    			FinalReport:$scope.FinalReport,
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
    					 if($scope.flowCount==$scope.interviewsCount)
    						 document.write("<center><h1>Thank You! for Submitting the Data</h1></center>");
    					 else{
    						 document.getElementById($scope.flowCount+"").style.backgroundColor="transparent";
    						 if($scope.flowCount+1<=$scope.interviewsCount)
    						 document.getElementById(($scope.flowCount+1)+"").style.backgroundColor="black";
    						 $scope.WrittenRound_Status="NA";
    				    		$scope.TechnicalRound1_Status="NA";
    				    		$scope.TechnicalRound2_Status="NA";
    				    		$scope.HRRound_Status="NA";
    				    		$scope.ComsRound_Status="NA";
    				    		$scope.name="";
    				    		$scope.FinalReport="NO";
    						 alert("Data Saved Enter another company's data");
    					 }
    					 $scope.flowCount++;
    					
    					 
    					}
    					else
    					{
    					 alert("Save Not Success full please enter valid data and Try again");
    					}
    			}
    			);
    			document.getElementById("saveDriveButton").innerHTML="SAVE";
    		};
    	
    	$scope.fetchCompanies=function()
    	{
    		
    		
    		if($scope.name!=null && $scope.name.length>=1)
    		$http.get("companies/"+$scope.name).then(function(response){
    			console.log(response);
    			$scope.companies=response.data.companies;
    		});
    	};
    	
    	
    	$scope.getCount=function(){
    		$scope.flowCount=1;
    		$scope.numbers=[];
    		

    		
    		if($scope.interviewsCount!=null && $scope.interviewsCount!="" && $scope.interviewsCount>=1)
    			{
    			document.getElementById("companyData").style.display="block";
    			for(var i=1;i<=$scope.interviewsCount;i++)
    				$scope.numbers.push(parseInt(i));
    			
        	   
    			document.getElementById("interviewsCountForm").style.display="none";	
    			}
    		else if($scope.interviewsCount==0)
    			{
    			 if(confirm("Are You sure You have no walk-in experiences?"))
    				 {
    				 document.write("<center><h1>Thank You for Submitting the Data<br>Prepare Well, Opportunities Comes at any time</h1></center>");
    				 alert("Prepare Well, Opportunities Comes at any time");
    				 }
    			 
    		
    			}
    		else{
    			alert("Enter proper data");
    		}
    		
    		
    		
        		
    	};
    	
    	
    	$scope.calculatePercentage=function(){
    		
    		if($scope.inter1stYrMaths!="" && $scope.inter1stYrMaths>0 && $scope.inter1stYrMaths<=150 )
    			{
    				$scope.interMaths=(($scope.inter1stYrMaths+$scope.inter2ndYrMaths)/300)*100;
    				$scope.interMaths=parseInt($scope.interMaths);
    			}
    	};
    	
    	
    	}
    
    
  // Initialize Firebase
  
  
  
  
  
  
  
  /*
  window.recaptchaVerifier.render().then(function(widgetId) {
	  grecaptcha.reset(widgetId);
	});
	*/
	
</script>
    
    
</body>
</html>