<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="cv.models.CVStudent" %>
    <%@ page import="cv.services.JspServices" %>
    <%@ page import="cv.models.Admin" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>




<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<%
String name;
Admin admin=(Admin)request.getSession().getAttribute("admin");
name=admin.getName();
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var batchNos=[];
	var adminName='<%=name%>';
	$(document).ready( function(){
		<c:forEach items="${batches }" var="b">
		batchNos.push("${b.getBatchNumber()}");
		</c:forEach>
		console.log(batchNos.length);
		});
</script>
	<script src='https://code.responsivevoice.org/responsivevoice.js'></script>
	<title>Admin DashBoard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular-resource.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular-animate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/angular.chartjs/latest/angular-chart.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="<c:url value="/resources/js/ajaxOp.js"/>"></script>
	<script src="<c:url value="/resources/js/AngularApp.js"/>"></script>
	<script src="<c:url value="/resources/js/StudentAttendanceCon.js"/>"></script>
	<script src="<c:url value="/resources/js/OfflineExamMarkCon.js"/>"></script>
	<script src="<c:url value="/resources/js/SyllabusUpdateCon.js"/>"></script>
	<script src="<c:url value="/resources/js/UpdateDriveCon.js"/>"></script>
	<script src="<c:url value="/resources/js/dashboard.js"/>"></script>
	<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"/>"></script>
  	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="<c:url value="/resources/js/calenderviewController.js"/>"></script>
	
  <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js"/>"></script>
	 
	<!-- <script src="<c:url value="/resources/js/dirPagination.js"/>"></script>-->
	<!-- <script src="<c:url value="/resources/js/multiSelector.js"/>"></script> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
	<script src="https://rawgit.com/long2know/angular-directives-general/master/src/multiselect.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"> -->
	
	<script src="<c:url value="/resources/js/xeditable.js"/>"></script>
	<script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.14.3.js"></script>
	<!-- <script src="<c:url value="/resources/js/multiSelectBox.js"/>"></script> -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/flipChkBox.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/popup.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/dashboard.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/xeditable.css"/>"/>
	<!-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/multiSelector.css"/>"/> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/1.3.1/ui-bootstrap-tpls.min.js"></script>
	<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.7.0/lodash.min.js"></script>-->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/adminDashBoard.css"/>"/>

	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/datepicker.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/attance.css"/>"/>
	<script src="<c:url value="/resources/js/attance.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap-datepicker.js"/>"></script>
	<script src="<c:url value="/resources/js/hlite.js"/>"></script>
	<style>
	   #skitt-toggle-button
	    {
	   	float:right !important;
	    }
		output 
		{ 
		  position: relative;
		  background-image: linear-gradient(#444444, #999999);
		  width: 28px; 
		  height: 20px; 
		  text-align: center; 
		  color: white; 
		  border-radius: 10px; 
		  display: inline-block; 
		  font: bold 10px/5px Georgia;
		  /*bottom: 120%;
		  left: 0;*/
		  margin-left: 2% !important;
		}
	</style>
	<style>
		
		#chat,#chat:after,.chatbox
		{
			transition:all .4s ease-in-out
		}
		#chat,#close-chat,.minim-button,.maxi-button,.chat-text
		{
			font-weight:700;
			cursor:pointer;
			font-family:Arial,sans-serif;
			text-align:center;
			height:20px;
			line-height:20px;
		}
		#chat,#close-chat,.chatbox
		{
			border:1px solid #A8A8A8;
		}
		#chat:after,#chat:before
		{
			position:absolute;
			border-style:solid;
			content:"";
		}
		.chatbox
		{
			position:fixed;
			bottom:0;
			right:20px;
			margin:0 0 -450px;
			background-color:#00a69c;
			border-color:#00a69c;
			border-bottom:none;
			border-top-left-radius:5px;
			border-top-right-radius:5px;
			padding:28px 2px 0px 2px; 
			z-index:100000
		}
		.dropdown-submenu 
		{
    		position: relative;
    		fonct-size:12px;
    		font-family: Segoe UI,Trebuchet MS,Sans-Serif !important;
		}
		.dropdown-submenu>.dropdown-menu 
		{
			top: 0;
			left: 100%;
			margin-top: -6px;
			margin-left: -1px;
		   -webkit-border-radius: 0 6px 6px 6px;
		   -moz-border-radius: 0 6px 6px;
			border-radius: 0 6px 6px 6px;
		}
			
		.dropdown-submenu:hover>.dropdown-menu {
			display: block;
		}
			
		.dropdown-submenu>a:after {
			display: block;
			content: " ";
			float: right;
			width: 0;
			height: 0;
			border-color: transparent;
			border-style: solid;
			border-width: 5px 0 5px 5px;
			border-left-color: #ccc;
			margin-top: 5px;
			margin-right: -10px;
		}
			
		.dropdown-submenu:hover>a:after {
			border-left-color: #fff;
		}
			
		.dropdown-submenu.pull-left {
			float: none;
		}
			
		.dropdown-submenu.pull-left>.dropdown-menu {
			left: -100%;
			margin-left: 10px;
		   -webkit-border-radius: 6px 0 6px 6px;
		   -moz-border-radius: 6px 0 6px 6px;
			border-radius: 6px 0 6px 6px;
		}
		#close-chat
		{
		    position:absolute;
		    top:2px;
			right:2px;
			font-size:24px;
			border:1px solid #dedede;
			width:20px;
			background:#fefefe;
			z-index:2
		}
		#minim-chat,#maxi-chat
		{
			position:absolute;
			top:0;
			left:0;
			width:100%;
			height:20px;
			line-height:20px;
			cursor:pointer;
			z-index:1
		}
		.minim-button
		{
			position:absolute;
			top:2px;
			right:26px;
			font-size:24px;
			border:1px solid #dedede;
			width:20px;
			background:#fefefe
		}
		.maxi-button
		{
			position:absolute;
			top:2px;
			right:26px;
			font-size:24px;
			border:1px solid #dedede;
			width:20px;
			background:#fefefe;
		}
		.chat-text
		{
			position:absolute;
			top:5px;
			left:10px;
			color:#fff;
			font-size:16px;
		}
		#chat
		{
			width:5%;
			height:30px !important;
			position:fixed;
			top:10;
			right:0 !important;
			margin-top:0.5%;
			margin-right:1%;
			border-radius:3px;
			border-color:#00a69c;
			padding:5px 8px 5px 8px;
			font-size:12px;
			background-color:#00a69c;
			color:#fff;
			z-index:1;
			-webkit-transform:translateZ(0);
			transform:translateZ(0)
		}
		#chat:before
		{
			border-width:10px 11px 0 0;
			border-color:#A8A8A8 transparent transparent;
			left:7px;
			bottom:-10px
		}
		#chat:after
		{
			border-width:9px 8px 0 0;
			border-color:#00a69c transparent transparent;
			left:8px;
			bottom:-8px
		}
		#chat:hover
		{
			background:#ff6666;
			border-color:#ff6666;
			-webkit-animation-name:hvr-pulse-grow;
			animation-name:hvr-pulse-grow;
			-webkit-animation-duration:.3s;
			animation-duration:.3s;
			-webkit-animation-timing-function:linear;
			animation-timing-function:linear;
			-webkit-animation-iteration-count:infinite;
			animation-iteration-count:infinite;
			-webkit-animation-direction:alternate;
			animation-direction:alternate
		}
		#chat:hover:after
		{
			border-color:#ff6666 transparent transparent transparent !important;
			background-color:#ff6666 transparent transparent!important;
		}
		.animated-chat
		{
			-webkit-animation-duration:1s;
			animation-duration:1s;
			-webkit-animation-fill-mode:both;
			animation-fill-mode:both;
			-webkit-animation-timing-function:ease-in;
			animation-timing-function:ease-in
		}
		@-webkit-keyframes tada
		{	
			0%
			{
				-webkit-transform:scale(1)
			}
			10%,20%
			{
				-webkit-transform:scale(.9)rotate(-3deg)
			}
			30%,50%,70%,90%
			{
				-webkit-transform:scale(1.1)rotate(3deg)
			}
			40%,60%,80%
			{
				-webkit-transform:scale(1.1)rotate(-3deg)
			}
			100%
			{
				-webkit-transform:scale(1)rotate(0)
			}
		}
		@keyframes tada
		{
			0%
			{
				 transform:scale(1)
			}
			10%,20%
			{
				 transform:scale(.9)rotate(-3deg)
			}
			30%,50%,70%,90%
			{
			     transform:scale(1.1)rotate(3deg)
			}
			40%,60%,80%
			{
				 transform:scale(1.1)rotate(-3deg)
			}
			100%
			{
				 transform:scale(1)rotate(0)
			}
		}
			.tada
			{
				-webkit-animation-name:tada;
				animation-name:tada
			}
		@-webkit-keyframes hvr-pulse-grow
		{
			to
			{
				 -webkit-transform:scale(1.1);
				 transform:scale(1.1)
			}
		}
		@keyframes hvr-pulse-grow
		{
			to
			{
			 	 -webkit-transform:scale(1.1);
				 transform:scale(1.1)
			}
		}
			
		@media only screen and (max-width:768px)
		{
			#chat
			{
				width:50%;
				height:30px !important;
				position:relative;
				top:10;
				left:0 !important;
				border-color:#ff6666;
				background-color:#ff6666;
				z-index:0;
			}
			#chat:after
			{
				border-width:9px 8px 0 0;
				border-color:#ff6666 transparent transparent;
				left:8px;
				bottom:-8px
			}
			#chat:hover
			{
				background:#00a69c;
				border-color:#00a69c;
				-webkit-animation-name:hvr-pulse-grow;
				animation-name:hvr-pulse-grow;
				-webkit-animation-duration:.3s;
				animation-duration:.3s;
				-webkit-animation-timing-function:linear;
				animation-timing-function:linear;
				-webkit-animation-iteration-count:infinite;
				animation-iteration-count:infinite;
				-webkit-animation-direction:alternate;
				animation-direction:alternate
			}
			#chat:hover:after
			{
				border-color:#00a69c transparent transparent transparent !important;
				background-color:#00a69c transparent transparent!important;
			}
		}
</style>
		
<style>
		#style-8::-webkit-scrollbar-track{
			-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
			background-color: #F5F5F5;
			border-radius: 10px;
		}

		#style-8::-webkit-scrollbar
		{
			width: 10px;
			background-color: #F5F5F5;
		}

		#style-8::-webkit-scrollbar-thumb
		{
			border-radius: 10px;
			background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.44, rgb(122,153,217)), color-stop(0.72, rgb(73,125,189)), color-stop(0.86, rgb(28,58,148)));
		}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SpeechKITT/0.3.0/speechkitt.min.js"></script>
</head>

<body ng-app="App" ng-controller="viewController as view">

<!---------------------------------------------------- navbar start --------------------------------------------------------------------------->

<div class="container-fluid menuDiv" style="position: fixed; z-index: 1000; top: 0;">
	<nav class="navbar navbar-default navClass">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <!--<a href="student_index.html" class="navbar-brand"><img class="logo" src="images/cvcorpLogo.png"></a>-->
	    </div>
	    <div class="collapse navbar-collapse navCollapseClass" id="myNavbar">
	     <ul style="float:left;">
	     	<li style="list-style-type: none;"><i class="fas fa-spinner" style="float:left;display:none;color:#4e4e4e;" id="ajaxPageLoader"></i></li>
	     </ul>
	     <ul class="nav navbar-nav" style="float:right;">
	     	<li class="active">
		        <a href="#" onclick="displayDiv('welcome')" style="font-size: 12px !important;"><!--<i class="fa fa-home" aria-hidden="true"></i>--> HOME</a>
		    </li>
		    <li class="dropdown" style="font-size: 12px !important;">
				<a class="dropdown-toggle dropbtnClass" style="cursor:pointer;" data-toggle="dropdown"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> STUDENT'S<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li>
						<a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('stArea')" ng-click="view.requestAllStudents()"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> View Students</a>
					</li>
					<li>
						<a href="#" onclick="displayDiv('regForm')" style="font-size: 12px !important;"><!-- <i class="fa fa-user" aria-hidden="true"></i> --> Register a New Student</a>
					</li>
					<li>
						<a href="#" onclick="displayDiv('uploadFile')" style="font-size: 12px !important;"><!-- <i class="fa fa-upload" aria-hidden="true"></i> --> Upload Assignment File</a>
					</li>
					<li><a onclick="displayDiv('takeAttendance');/*verifyPresents();*/" style="font-size: 12px !important;"><!-- <i class="fa fa-male" aria-hidden="true"></i> --> Take Attendance</a></li>
					<li><a onclick="displayDiv('takeExamMark');/*verifyPresents();*/" style="font-size: 12px !important;"><!-- <i class="fa fa-male" aria-hidden="true"></i> --> Update Exam Mark</a></li>
					
					<li><a onclick="displayDiv('updateDrive');/*verifyPresents();*/" style="font-size: 12px !important;" ><!-- <i class="fa fa-male" aria-hidden="true"></i> --> Update Drive Details</a></li>
				</ul>
			</li>
			
		<!----------------------------------------------- Multiple choice menu begin ----------------------------------------------------->
		
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size: 12px !important;"><!-- <i class="fa fa-check-square" aria-hidden="true"></i> --> MULTICHOICE<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('pushQuestion')"> Push a New Question To DB</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('createQuestion')"> Create a New QP</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="sendData('getQuestionPapers/','Multiple','listQPapers',-1); displayDiv('qpapers')" > View QP's</a></li>			
			</ul>
		</li>
		
		<!----------------------------------------------- Multiple choice menu end --------------------------------------------------------->
			
		<!------------------------------------------------ QA menu begin ------------------------------------------------------------------->
		
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size: 12px !important;"><!-- <i class="fa fa-question-circle" aria-hidden="true"></i> --> THEORETICAL<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('QApushQuestion')"> Push a New Question To DB</a></li>
					<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('QAcreateQuestion')"> Create a New QP</a></li>
					<li><a style="cursor:pointer;font-size: 12px !important;" onclick="sendData('getQuestionPapers/','QA','listQAQPapers',-1); displayDiv('QAqpapers')"> View QP's</a></li>
				</ul>
			</li>
				
		<!------------------------------------------------ QA menu end --------------------------------------------------------------------->
			
		<!------------------------------------------------ View syllabus begin ------------------------------------------------------------->
			
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" style="font-size: 12px !important;"><!-- <i class="fa fa-book" aria-hidden="true"></i><i class="fa fa-book" aria-hidden="true"></i> --> SYLLABUS<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('upateSyllabus')">Update Syllabus</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('aptiSyllabus')">Aptitude & Reasoning</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('javaSyllabus')">Technical</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('commSyllabus')">Communication</a></li>
				<li><a style="cursor:pointer;font-size: 12px !important;" onclick="displayDiv('linuxSyllabus')">Linux & Database</a></li>
			</ul>
		</li>	
			
		<!------------------------------------------------ View Syllabus end ---------------------------------------------------------------->
		
		<!------------------------------------------------ organize batches start ----------------------------------------------------------->
		
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" style="font-size: 12px !important;"><!-- <i class="fa fa-users" aria-hidden="true"></i> --> BATCHES<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a onclick="displayDiv('addBatch')" style="font-size: 12px !important;"> Enroll a New Batch </a></li>
				<li><a onclick="displayDiv('viewBatches')" style="font-size: 12px !important;"> View All Batches and Info</a></li>
				<li><a href="#" onclick="displayDiv('welcome')" style="font-size: 12px !important;"><!-- <i class="fa fa-hourglass-start" aria-hidden="true"></i> --> Batch-Progress</a></li>
			</ul>
		</li>
			
		<!------------------------------------------------ organize batches end ------------------------------------------------------------>
		
		<!------------------------------------------------ batch progress start ------------------------------------------------------------>
	       
		<!------------------------------------------------ batch progress end --------------------------------------------------------------> 
		
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" style="font-size: 12px !important;"><!-- <i class="fa fa-flag-o" aria-hidden="true"></i> --> NOTIFICATIONS<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a onclick="displayDiv('viewNotifications')" style="font-size: 12px !important;"> View All Posted Notifications</a></li>
				<li><a onclick="displayDiv('addNotification')" style="font-size: 12px !important;"> Post a New Notification</a></li>
			</ul>
		</li>
		<li style="border-left: 1px solid #dbdbdb;border-right: 1px solid #dbdbdb;font-size: 12px !important;" class="dropdown"><a class="dropdown-toggle" style="cursor:pointer; height: 50px;" data-toggle="dropdown"><i style="padding:14%;float:left;border:1px solid #4e4e4e;border-radius: 50%;" class="fa fa-user" aria-hidden="true"></i><span style="float:right;margin-top: 30%;" class="caret"></span></a>
			<ul class="dropdown-menu" style="left:-104px !important;">
			    <li><p style="color:#444 !important;padding-left: 4%;font-size: 12px !important;text-align:left;">Welcome <span style="letter-spacing:1px;font-family: Segoe UI Semibold !important;font-weight:600;font-size:12px;"><i><%=name %></i></p></li>
				<li><p class="welcomeDate" id="welDate"></p></li>
			   	<li><p style="margin-left:4%"><a onclick="displayDiv('changePassword')" style="text-align:left;color:#444;cursor:pointer;font-size: 12px !important;"><i style="color:#444;" class="fa fa-wrench" aria-hidden="true"></i> Change Password</a></p></li>
			   	<li><p style="margin-left:4%"><a href="Logout" style="color:#444;text-decoration:none;"><i style="color:#444;text-align:left;font-size: 12px !important;" class="fa fa-power-off" aria-hidden="true"></i> Logout</a></p></li>
			</ul>
		</li>
	  </ul>
	  </div>
	  </div>
	</nav>
</div>

<!-------------------------------------------------------- navbar end ------------------------------------------------------------------------>
	
<!-------------------------------------------------------- Notification Response -------------------------------------------------------------->
	
<div id="success" style="position:fixed;text-align:center !important;z-index:1;color:#fff;left:0.5%;top:0%;border:1px solid #00a69c !important;background-color:green !important;display:none;opacity:1 !important; margin-top:60px; ">
  	<strong>Success!</strong><p id="reportT"> </p>
</div>
<div id="fail" style="position:fixed;text-align:center !important;z-index:1;color:#fff;background-color:red !important;left:0.5%;top:0%;border:1px solid #ff6666 !important;display:none;opacity:1 !important; margin-top:60px;">
  	<strong>Not success!</strong><p id="reportF"> </p>
</div>
 
  <!----------------------------------------------------- End of response ---------------------------------------------------------------------->
  
  <!----------------------------------------------------- Chat box code start  ----------------------------------------------------------------->
<div id="chat" class="animated-chat tada" onclick="loadChatbox();speakBegin()" style="margin-top: 50px"><span>Help </span><span><i class="fa fa-question-circle-o" aria-hidden="true"></i></span> </div>
<div class="chatbox" id="chatbox">
	<span class="chat-text">Hello <%=name %></span>
		<script>
			document.write('<div id="smartchatbox_img901621879" style="width: 280px; height: 260px;background-color:#fff; overflow: hidden; margin: auto; padding: 0;">');
			document.write('<div id="smartchatbox901621879" style="width: 280px; height: 260px;background-color:#fff; overflow: hidden; margin: auto; padding: 0; border:0; ">');
			document.write('Can I Create a New QuestionPaper?<br>'+
					   '<small>By the way, I can create a new question paper with the random'+
					    'questions and random topics.</small>'+
					   '<br>'+
					   '<button style="border:1px solid #00a69c !important;border-radius:5px;font-size:12px;background-color: transparent !important;color:#00a69c;"  onclick="assistantCreateQuestionPaper(\'Y\')">YES</button><button style="border:1px solid #00a69c !important;border-radius:5px;font-size:12px;background-color: transparent !important;color:#00a69c;" onclick="assistantCreateQuestionPaper(\'N\')" >NO</button></div></div>');
		</script>
	<span id="close-chat" onclick="closeChatbox()">&times;</span>
	<div id="minim-chat" onclick="minimChatbox()"><span class="minim-button">&minus;</span></div>
	<div id="maxi-chat" onclick="loadChatbox()"><span class="maxi-button">&plus;</span></div>
</div>
		<script>	
			function loadChatbox()
			{
				var e=document.getElementById("minim-chat");
				e.style.display="block";
				var e=document.getElementById("maxi-chat");
				e.style.display="none";
				var e=document.getElementById("chatbox");
				e.style.margin="0";
			}
			function closeChatbox()
			{
				var e=document.getElementById("chatbox");
				e.style.margin="0 0 -450px 0";
				responsiveVoice.speak("OK");
			}
			function minimChatbox()
			{
				var e=document.getElementById("minim-chat");
				e.style.display="none";
				var e=document.getElementById("maxi-chat");
				e.style.display="block";
				var e=document.getElementById("chatbox");
				e.style.margin="0 0 -260px 0";
			}
			
		</script>
		<!----------------------------------------------- Chat box code end  ------------------------------------------------------------------->
  		<!----------------------------------------------- container starts here ---------------------------------------------------------------->
		<div class="container-fluid" style="width:100%;margin-top:2.3%;">
			<div class="row" style="margin-top: 20px">
	    <!----------------------------------------------- Welcome Page -------------------------------------------------------------------------->
		<div id="welcome" ng-controller="dashBoardController as dcl" class="container-fluid welcomeRow" style="background-color:#efefef">
		
        <!-----------------------------------------------  Dashboard by Vishal ------------------------------------------------------------------>
        <div class="row dashboard">
            <div class="col-md-8 dashboard1" style="">
                <div class="row" >
                    <!---------------------------- Student Small Block Starts Here ------------------------------------->
                    <div class="col-md-6 dashboarda" style="">
                       <div class="row" style="margin-left:0px; margin-right:0px!important; background-color: #fff;">
                       <button style="color:#fff;background-color:#e8ad10; border-radius:10%; border:none; margin: 5px;" ng-click="dcl.studentAnalysisChart(dcl.branchesData)">Branches</button>
                       <button style="color:#fff;background-color:#e8ad10; border-radius:10%; border:none; margin: 5px;" ng-click="dcl.studentAnalysisChart(dcl.statusData)">Status</button>
                       <button style="color:#fff;background-color:#e8ad10; border-radius:10%; border:none; margin: 5px;" ng-click="dcl.studentAnalysisChart(dcl.aggregateData)">Aggregate</button>
                       <button style="color:#fff;background-color:#e8ad10; border-radius:10%; border:none; margin: 5px;" ng-click="dcl.studentAnalysisChart(dcl.genderData)">Gender</button>
                       <select style="float:right;border-color: #2d2102; background-color: #e8ad10; color: #fff; margin-right: 10px; margin-top: 0.3%;" ng-change="dcl.getBatchStudentAnalysis()" ng-model="dcl.selectedBatchNo">
                       <option ng-repeat="b in dcl.batchesNos" value="{{b}}">Batch-{{b}}</option>
                       </select>
                       </div>
                       <div id="studentAnalysis" style="height: 300px; width: 100%;"></div>
                       
                    </div>
                    <!----------------------------------------------Batch Small Block Start Here --------------------------------->
                    <div class="col-md-6 dashboardb" style="">
                       
                        <div class="row" style="margin-left:0px; margin-right:0px!important; background-color: #fff;">
                    
                       <button ng-repeat="b in dcl.batchesList" style="color:#fff;background-color:#3078f5;border-radius:10%;border:none; margin: 5px!important;" ng-click="dcl.getBatchProgress(b)">Batch-{{b.batchNumber}}</button>
                       
                       </div>
                        
                          <div id="batchProgressChart" style="height: 300px; width: 100%;">
                          
                          </div>
                       
                       
                    </div>
                </div>
                <!-------------------------------------- Row for Progress Bar Starts Here -------------------------------------------->
                <div class="row">
                    <!------------------------------------- Progress Bar Starts Here -------------------------------------------------->
                    <div class="col-md-6" style="padding:1%">
                       <br><br>
                       
                      <h1 style="text-align:center;color:#000 !important">Events Will be Shown Here</h1>  
                        
                        
                    </div>
                    <div class="col-md-6" style="padding:1%; margin-top: -10px!important;">
                        <!-------------------------------------------------- Calender Starts Here ----------------------------------->
                        <div class="calender" ng-controller="calenderViewCtrl as cl">
                            <header>
                                <button ng-click="cl.previousMonth()" class="month">«</button>
                                <h2> {{cl.MONTHS[cl.selectedMonth].name}} {{cl.selectedYear}}</h2>
                                <button class="month" ng-click="cl.nextMonth()">»</button>
                            </header>
                            <table>
                                <tr class="days1">
                                    <td class="days">S</td>
                                    <td class="days">M</td>
                                    <td class="days">T</td>
                                    <td class="days">W</td>
                                    <td class="days">Th</td>
                                    <td class="days">F</td>
                                    <td class="days">S</td>
                                </tr>
                               <tbody id="calenderDates">
                                  
                                  </tbody>
                            </table>
                        </div>
                        <!------------------------- Calender Ends Here --------------------------------------------------->
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4" style="">
            <!--  <div class="force-overflow"></div>-->
            <h2 style="text-align:center; font-size:19px;">BATCHES INFO</h2>
            <div class="small-box bg-green">
                <div class="inner">
                     <h3>{{dcl.allBatches[0].batchNumber}}</h3>
                     <p>Batches</p>
                </div>
                <div class="tabl tabl2">
                     <table>
                        <tr class="rowb">
                            <td>Finished Batches</td>
                            <td class="pad">: </td>
                            <td>{{dcl.allBatches.length-4+4}}</td>
                        </tr>
                        <tr class="rowb" style="background-color:#00a65a !important">
                            <td>Active Batches</td>
                            <td class="pad">: </td>
                            <td>04</td>
                        </tr>
                        <tr class="rowb">
                            <td>Last Batch</td>
                            <td class="pad">: </td>
                            <td>{{dcl.allBatches[0].batchNumber}}</td>
                         </tr>
                             <tr class="rowb" style="background-color:#00a65a !important">
                               <td>Start Date</td>
                               <td class="pad">: </td>
                               <td>{{dcl.allBatches[0].beginDate}}</td>
                             </tr>
                     </table>
				</div>
                     <a data-toggle="tab" href="#studentsList" class="small-box-footer"><!--More info <i class="fa fa-arrow-circle-right"></i>--></a>
                </div>

            <div id="style-8" style="height:335px; overflow:auto;">
            <div ng-repeat="b in dcl.allBatches">
                           <div class="block" style="">
                                    <div class="row">
                                        <div class="col-md-3" style="padding: 8px; margin-left: -5px;">
                                            <p class="pbatch" style="">{{b.batchNumber}}</p>
                                        </div>
                                        <div class="col-md-6" style="margin-left: 0px;">
                                            <p class="psdate" style=""><span><i class="fa fa-calendar-alt" style=""></i></span> Start Date: <span>{{b.beginDate}}</span></p>
                                            <p class="pedate" style=""><span><i class="fas fa-calendar" style=""></i></span> End Date: <span>{{b.endDate}}</span></p>
                                        </div>
                                        <div class="col-md-3">
                                            <span style="float: left;"><i class="fa fa-users fauser" style=""></i></span>
                                            <p style="font-size: 21px; margin: 0px; width: 37%; float: left; color: #28b779;">{{b.totalStudents}}</p>
                                            <button type="button" class="btn-style" style="">more<span style="margin-left: 2px;"><i class="fa fa-arrow-circle-right"></i></span></button>
                                        </div>
                                    </div>
                                </div>
                                <br>
                         </div>
                    </div>
            </div>
        </div>
    </div>
<!-- Welcome Page end-->
<!-- update drive -->
<div ng-controller="updateDriveCon as updateDrive" class="container-fluid" style="display:none;" id="updateDrive">
	<div class="col-lg-12" ng-show="companyList">
            <div class="col-lg-12">
                <div class="col-lg-6"><h3 style="margin-top: 10px!important;font-weight: 800">Placement Drive Report Board</h3></div>
                <div class="col-lg-6">
                <p style="text-align: center;margin-top:10px;"><span class="sub-heading">Company :</span> <span>{{placementDriveListCompany.length}}</span>   <span class="sub-heading">Drive :</span> <span>{{totalDriveUs}}</span>   <span class="sub-heading">Offer :</span> <span>{{totalOffferUs}}</span></p>
                </div>
                
            </div>
            <div class="col-lg-12">
                <div class="col-lg-6">
                	 		<input ng-model="updateDrive.serchData" class="form-control" ng-change="serchDriveList()" type="text" style="height: 34px!important;" placeholder="Search here......">
                </div>
                <div class="col-lg-6">
                <input type="submit" ng-click="addNewRound=!addNewRound" value="Add New Company" style="float: right; width: 200px;height: 34px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; color: white;background-color: darkslateblue"/>
                </div>
                
            </div>
            <div class="col-lg-12 col-xs-12 col-md-12 float-in-center myblock" style="margin: 5px 10px 10px ">
                <table ng-show="showSearchStud" class="myatttable table-hover table-striped">
                    <tr>
                        <th>Sl no.</th>
                        <th><span ng-show="showSearchCompanyAddStudetList" ng-click="showSearchCompanyAddStudetList=!showSearchCompanyAddStudetList" style="cursor: pointer;">Company</span><div class="myinput-container" ng-show="!showSearchCompanyAddStudetList"><input type="text" ng-model="updateDrive.studentDataToAddCompanySearch" class="myinput-field" style="height: 34px!important;color: black;text-align: center"><span class="my-close myicon" ng-click="clearCompanysearch()">&times;</span></div></th>
                        <th>Type</th>
                        <th>Success Rate</th>
                        <th>No. Drive</th>
                        <th>Offer</th>
                        <th>Report</th>
                    </tr>
                    <tr ng-repeat="list in placementDriveListCompany" ng-show="updateDrive.studentDataToAddCompanySearch!=undefined?updateDrive.studentDataToAddCompanySearch.trim()!=''?list.name.toLowerCase().includes(updateDrive.studentDataToAddCompanySearch.toLowerCase()):true:true">
                        <td style="padding:0px">{{$index + 1}}</td>
                        <td style="text-transform: uppercase;padding:0px">{{list.name}}</td>
                        <td style="padding:0px">{{list.companyType!=undefined?list.companyType:"NA"}}</td>
                        <td style="padding:0px">{{getCompanySR(list)}}%</td>
                        <td style="padding:0px">{{list.placementDriveList!=undefined?list.placementDriveList.length:0}}</td>
                        <td style="padding:0px">{{getOfferByCompany(list)}}</td>
                        <td style="padding:0px"><p style="font-size:12px;color:#33ccff;text-align:center;margin-top:10px;cursor: pointer;" ng-click="showCompanyDriveList(list,$index)">Show</p></td>
                    </tr>
                </table>
                <table ng-show="!showSearchStud" class="myatttable">
                    <tr>
                        <th>Sl no.</th>
                        <th>Name</th>
                        <th>Batch</th>
                        <th>Date</th>
                        <th>Company</th>
                        <th>Designation</th>
                        <th>Salary</th>
                        <th>Written</th>
                        <th>Comm</th>
                        <th>Technical</th>
                        <th>Coding</th>
                        <th>HR</th>
                        <th>Status</th>
                    </tr>
                    <tr ng-repeat="list in searchStudentDataList" ng-class="list.finalReport">
                        <td class="padding5px" >{{$index + 1}}</td>
                        <td class="padding5px">{{list.name}}</td>
                        <td class="padding5px" >{{list.batchNumber}}</td>
                        <td class="padding5px" >{{list.driveDate}}</td>
                        <td class="padding5px" style="text-transform: uppercase">{{list.companyName}}</td>
                        <td class="padding5px" >{{list.designation}}</td>
                        <td class="padding5px" >{{list.salary}}</td>
                        <td class="padding5px" ng-style="list.writtenRound_Status=='OK'?{'color':'green'}:{'color':'red'}">{{list.writtenRound_Status}}</td>
                        <td class="padding5px" ng-style="list.comsRound_Status=='OK'?{'color':'green'}:{'color':'red'}">{{list.comsRound_Status}}</td>
                        <td class="padding5px" ng-style="list.technicalRound1_Status=='OK'?{'color':'green'}:{'color':'red'}">{{list.technicalRound1_Status}}</td>
                        <td class="padding5px" ng-style="list.technicalRound2_Status=='OK'?{'color':'green'}:{'color':'red'}">{{list.technicalRound2_Status}}</td>
                        <td class="padding5px" ng-style="list.hrround_Status=='OK'?{'color':'green'}:{'color':'red'}">{{list.hrround_Status}}</td>
                        <td class="padding5px" ng-style="">{{list.finalReport}}</td>
                    </tr>
                </table>
            </div>
           
  		</div>
  		<div class="col-lg-12" ng-show="driveList">
            <div class="col-lg-12">
                <div class="col-lg-12"><h3 style="margin-top: 10px!important;font-weight: 800"><span ng-click="showHide(1)" style="color: deepskyblue;font-size: 15px;text-align: left;font-weight: 200;cursor: pointer;">Back</span>&nbsp;&nbsp;&nbsp;&nbsp;Placement Drive Report of <span style="color:green;">{{fullData.name}}</span></h3></div>
            </div>
            <div class="col-lg-12 col-xs-12 col-md-12 float-in-center myblock" style="margin: 5px 10px 10px ">
                <table class="myatttable table-hover table-striped">
                    <tr>
                        <th>Sl no.</th>
                        <th>Date</th>
                        <th>Rounds</th>
                        <th>Job-Location</th>
                        <th>Salary</th>
                        <th>Role</th>
                        <th>Drive-Location</th>
                        <th>Success Rate</th>
                        <th>Report</th>
                    </tr>
                    <tr ng-repeat="list in placementDriveList">
                        <td>{{$index + 1}}</td>
                        <td>{{list.driveDate}}</td>
                        <td style="font-size:10px;"><p style="margin:0px"  ng-repeat="round in list.roundList.split(',')">{{round}}</p></td>
                        <td>{{list.jobLocation}}</td>
                        <td>{{getSalary(list.initalSalary,list.laterSalary)}}</td>
                        <td>{{list.designation}}</td>
                        <td>{{list.driveLocation}}</td>
                        <td><span>( {{getPlacedCount(list.studentReportList)}} / {{list.studentReportList.length}} )</span><span>{{myRound((getPlacedCount(list.studentReportList)*100)/list.studentReportList.length)}}%</span></td>
                        <td><p style="font-size:12px;color:#33ccff;text-align:center;margin-top:10px;cursor: pointer;" ng-click="showStudentDriveList(list,list.roundList.split(','))">Show</p></td>
                    </tr>
                </table>
            </div>
            <div class="col-lg-12">
              <div class="col-lg-6">
              </div>
              <div class="col-lg-6">
            	<input type="submit" ng-click="addNewDriveReport=!addNewDriveReport" value="Add New Drive Report" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/>
              </div>
            </div>
            
  		</div>
  		
  		<div ng-show="addNewDriveReport" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="addNewDriveReport=!addNewDriveReport" >&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Add New Placement-Drive of {{fullData.name}}</p>
    			</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
  					<table class="show-in-table">
  					<tr>
  						<td style="padding:0px">
  						  <div class="col-lg-12">
                          	<p style="color: red;font-weight: 900; font-size: 9px;text-align: center;">{{addNewReoprt_errorMsg}}</p>
                          </div>
                        </td>
                    </tr>
  					<tr>
  					   <td style="padding:0px">
  					   
  						 <div>                          	
                            <div class="col-lg-12"  style="padding:0px" >
                                <div class="col-lg-12" style="padding:5px 5px 5px 0px">
                                	<p class="sub-heading setDoubleHead">Date</p>
                                	<div id="drivedatepicker" class="input-group date" data-date-format="yyyy-mm-dd">
                                        <input ng-model="updateDrive.driveDate" id="drive_date" class="form-control" type="text" name="" style="height: 34px!important;">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    </div>
                                </div>
                            
                               <!-- <div class="col-lg-6" style="padding:5px 0px 5px 5px ;">
                                    <p class="sub-heading setDoubleHead">Company</p>
                                    <select ng-model="updateDrive.company" class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <option>TCS</option>
                                        <option>google</option>
                                        <option>jFEWF</option>
                                        <option>PDWQq</option>
                                    </select>
                                    <p style="font-size:12px;color:#33ccff; text-align:right; margin:0px;cursor: pointer;" ng-click="addNewRound=!addNewRound">add company</p>
                                </div> --> 
                            </div> 
                            <div class="col-lg-12" style="padding:0px">
                            		<p style="padding:0px;margin:0px" class="sub-heading setDoubleHead">Rounds</p>
                            		<div class="col-lg-6" style="text-align: left">
                            			<input type="checkbox" ng-change="setRoundData()" ng-model="roundInd[0]" id="cb1" value="Written" /><label for="cb1" >  Written</label></br>
  										<input type="checkbox" ng-change="setRoundData()" ng-model="roundInd[1]" id="cb2" value="GD/JAM/Communication" /><label for="cb2" >  GD/JAM/Communication</label></br>
  										<input type="checkbox" ng-change="setRoundData()" ng-model="roundInd[2]" id="cb3" value="Technical" /><label for="cb3" >  Technical</label>
  										
                            		</div>
                            		<div class="col-lg-6" style="text-align: left">
                            			<input type="checkbox" ng-change="setRoundData()" ng-model="roundInd[3]" id="cb4" value="Coding" /><label for="cb4" >  Coding</label></br>
  										<input type="checkbox" ng-change="setRoundData()" ng-model="roundInd[4]" id="cb5" value="HR" /><label for="cb5" >  HR</label>
                            		</div>
  										
                            </div>
                             <div class="col-lg-12"  style="padding:0px" >
                                <div class="col-lg-6" style="padding:5px 5px 5px 0px">
                                	<p class="sub-heading setDoubleHead">Drive Location</p>
                                	<input ng-model="updateDrive.driveLoction" class="form-control" type="text" style="height: 34px!important;">
                                </div>
                                <div class="col-lg-6" style="padding:5px 0px 5px 5px">
                                	<p class="sub-heading setDoubleHead">Job Location</p>
                                	<input ng-model="updateDrive.jobLocation" class="form-control" type="text" style="height: 34px!important;">
                                </div>
                             </div>
                             <div class="col-lg-12"  style="padding:0px" >
                                <div class="col-lg-6" style="padding:5px 5px 5px 0px">
                                	<p class="sub-heading setDoubleHead">Initial Salary</p>
                                	<input ng-model="updateDrive.initialSalary" class="form-control" type="number" style="height: 34px!important;">
                                </div>
                                <div class="col-lg-6" style="padding:5px 0px 5px 5px">
                                	<p class="sub-heading setDoubleHead">Later Salary</p>
                                	<input ng-model="updateDrive.laterSalary" class="form-control" type="number" style="height: 34px!important;">
                                </div>
                             </div>
                             <div class="col-lg-12"  style="padding:0px" >
                                	<p class="sub-heading setDoubleHead">Designation</p>
                                	<input ng-model="updateDrive.designation" class="form-control" type="text" style="height: 34px!important;">
                             </div>
                             <div class="col-lg-12"  style="padding:0px" >
                                <div class="col-lg-6" ng-style="updateDrive.bond=='YES'?l2:l1">
                                	<p class="sub-heading setDoubleHead">Bond</p>
                                	<select ng-model="updateDrive.bond" class="form-control" style="height: 34px!important">
                                        <option value="NO">NO</option>
                                        <option>YES</option>
                                    </select>
                                </div>
                                <div class="col-lg-6" ng-show="updateDrive.bond=='YES'" ng-style="r2">
                                	<p class="sub-heading setDoubleHead">Bond Duration (in Month)</p>
                                	<input ng-model="updateDrive.bondDuration" class="form-control" type="number" style="height: 34px!important;">
                                </div>
                            </div>
                            <div class="col-lg-12" style="padding:0px" >
                                <div class="col-lg-6" style="padding:5px 5px 5px 0px">
                                	<p class="sub-heading setDoubleHead">Any submission of original certificates ?</p>
                                	<select ng-model="updateDrive.certificates" class="form-control" style="height: 34px!important">
                                        <option value="NO">NO</option>
                                        <option>YES</option>
                                    </select>
                                </div>
                                <div class="col-lg-6" style="padding:5px 0px 5px 5px" ><input type="submit" ng-click="addNewDriveOfComapnyDeatis()" value="Next" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin-top: 30px; color: white;background-color: darkslateblue"/></div>
                           </div>
                     </div>
                     
                     </td>
                     		
  					</tr>  
  				</table>
           </div>
       </div>
    </div>
    <div ng-show="studentDriveList" class="my-modal" >
  			<div class="mymodal-content" style="width:80%">
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="studentDriveList=!studentDriveList">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">DriveReport</p>
  				</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
                    <center>        	
                      <table class="myatttable table-hover table-striped" >
                      	<tr>
                        	<th style="font-size:10px">Sl no.</th>
                        	<th>Name</th>
                        	<th>Batch</th>
                        	<th ng-repeat="round in driveRoundList" ng-style="(round=='GD/JAM/Communication')?{'font-size':'10px'}:{'font-size':'13px'}">{{round}}</th>
                        	<th>Status</th>
                        	<th>Feedback</th>
                        	<th>Edit</th>
                        	<th>Delete</th>
                    	</tr>
                    	<tr  ng-repeat="list in showdriveReport.studentReportList">
                        	<td>{{$index+1}}</td>
                        	<td>{{list.name}}</td>
                        	<td>{{list.batchNumber}}</td>
                        	<td ng-repeat=" status in getStudentDriveStatus(list,driveRoundList) track by $index"><span ng-show="status" style="color:#009900;">Clear</span><span ng-show="!status" style="color:#cc0000;">Not</span></td>
                        	<td>{{list.finalReport=='YES'?'Placed':'Not Placed'}}</td>
                        	<td style="width:170px"><p class="showDriveRemark" >{{(list.description!=undefined)?(list.description!='null')?list.description:'NA':'NA'}}</p></td>
                        	<td><i class="fa fa-pencil" aria-hidden="true" ng-click="editStudDetails(list)"></i></td>
                        	<td><i class="fa fa-pencil" aria-hidden="true" ng-click="deleteStudDetails(list.id)"></i></td>
                    	</tr>
                      </table>
                      </center>
                      <table style="width:100%"><tr><td><input type="submit"  ng-click="addStudentInDriveList(false)" value="Add New Student" style="float: right; width: 150px;height: 30px; border-radius: 5px;font-weight: 500;border: 0px;font-size: 13px; margin: 9px; color: white;background-color: darkslateblue"/></td></tr></table>
                   
  			   </div>
	  		</div>
		</div>
    <div ng-show="addNewRound" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="addNewRound=!addNewRound" >&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Add new company details</p>
    			</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
  					<table class="show-in-table">
                      	   <tr>
                         	  	<td colspan="2"><p style="color: red;font-weight: 900; font-size: 9px;text-align: center;">{{addnewCompany}}</p></td>
                       	   </tr>
                           <tr>
                              	<td class="sub-heading">Name</td>
                              	<td><input ng-model="updateDrive.newCompanyName" value="" class="form-control" type="text" style="height: 34px!important;"></td> 
                           </tr>
                           <tr>
                              	<td class="sub-heading">Company Type</td>
                              	<td>
                              		<select ng-model="updateDrive.newCompanyType" class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <option>Product Base</option>
                                        <option>Service Base</option>
                                        <option>MNC</option>
                                        <option>Start-Up</option>
                                        <option>Consultancy</option>
                                        <option>Other</option>
                                    </select>
                              	</td> 
                           </tr>
                           <tr> 
                            	<td class="sub-heading" style="width:200px;">Url</td>
                            	<td><input ng-model="updateDrive.newCompanyUrl" value="" class="form-control" type="text" style="height: 34px!important;"></td> 
                           </tr>
                            <tr> 
                            	<td class="sub-heading">Logo Url</td>
                            	<td><input ng-model="updateDrive.newCompanyLogoUrl" value="" class="form-control" type="text" style="height: 34px!important;"></td> 
                           </tr>
                            <tr> 
                            	<td class="sub-heading">Location</td>
                            	<td><textarea ng-model="updateDrive.newCompanyLocation" class="form-control"  rows="3" style="height: 80px!important;"></textarea></td> 
                           </tr>
                           <tr>
                    			<td colspan="2"><input type="submit"  ng-click="saveCompanyDetails()" value="Save" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                    	   </tr>
                     
                        </table>
  				</div>
  			</div>
    </div>  
         <div ng-show="studentDelete" class="my-modal">
  			<div class="mymodal-content" style="margin-top:100px;" >
    			<div class="mymodal-header">
    			</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
  					<table class="myatttable "><tr><td colspan="2" style="padding:30px;font-size:18px;weight:600">You Want Delete this DETAILS ?</td></tr>
  					<tr>
  					<td><input type="submit"  ng-click="deleteStudentDriveDetails()" value="Yes" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: red"/></td>
  					<td><input type="submit"  ng-click="studentDelete=!studentDelete" value="No" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></td>
  					</tr>
  					</table>
  				</div>
  			</div>
  		</div>
  		<div ng-show="studentEdit" class="my-modal">
  			<div class="mymodal-content" style="margin-top:100px;" >
  				<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="studentEdit=!studentEdit" >&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Edit Student Drive details</p>
    			</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
  					
    			<table class="show-in-table">
                           <tr ng-repeat="list in editStudentData.dataED">
                              	<td class="sub-heading" style="width:50%">{{list.name}}</td>
                              	<td>
                              		 <select ng-model="list.value" class="form-control" style="height: 34px!important">
                                        <option value="Clear">Clear</option>
                                        <option>Not</option>
                                    </select>
                              	</td>
                           </tr>
                            <tr style="background-color:white;">
                    			<td colspan="2"><input type="submit"  ng-click="saveEditStudDetails()" value="Save" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                    	   </tr> 
                 </table>
                 </div>
  			</div>
  		</div> 
  		<div ng-show="addStudentDrive" class="my-modal">
  			<div class="mymodal-content" style="width:80%" >
  				<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span ng-show="!mainInd" class="my-close" ng-click="addStudentDrive=!addStudentDrive" >&times;</span><span ng-show="mainInd" class="my-close" ng-click="backSutdentAdd()" >&#x2190;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Add New Student Details</p>
    			</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
  					
    			<table class="show-in-table">
    					   <tr>
                         	  	<td colspan="4"><p style="color: red;font-weight: 900; font-size: 9px;text-align: center;padding:0px;margin:0px">{{addnewStudentDriveError}}</p></td>
                       	   </tr>
    			 			<tr>
                              	<td class="sub-heading" style="">Student name</td>
                              	<td colspan="2" class="dropdown" style="padding: 0px;">
                         
  									 <input ng-model="updateDrive.studentSerchData" ng-change="" class="form-control" style="height: 34px!important;">
  									 <div class="dropdown-menu" ng-show="updateDrive.studentSerchData!=undefined?updateDrive.studentSerchData.trim()!=''?true:false:false" style="display:block;margin-top: -12px;font-size:12px;max-height:200px;width: 450px;padding: 0px;overflow-y:scroll;">
								    		<div class="multiSelectDropDownList" ng-repeat="list in allStudentsList" ng-show="(list.fullName+' - '+list.batchNumber).toLowerCase().includes(updateDrive.studentSerchData.toLowerCase())"><input ng-model="list.click" type="checkbox"/>&nbsp;&nbsp;&nbsp;&nbsp;{{list.fullName}} - {{list.batchNumber}}</div> 
								     </div>
                              	</td>
                              	<td>
                              		<input type="submit"  ng-click="setStudentDataToAdd()" value="Add" style="float: left; border-radius: 5px;font-weight: 500;border: 0px;font-size: 16px; margin: 5px;padding:5px 20px; color: white;background-color: darkslateblue"/>
                              	</td>
                           </tr>
                           <tr ng-show="indShowSave">
                         	  	<td colspan="4">
                          			<table class="show-in-table">
                          			  <tr style="background-color: darkslateblue; color: white;">
                        				<th style="font-size:10px;padding: 10px 3px;text-align: center;">Sl no.</th>
                        				<th style="padding: 10px 3px;text-align: center;"><span ng-show="showSearchNameAddStudetList" ng-click="showSearchNameAddStudetList=!showSearchNameAddStudetList" style="cursor: pointer;">Name</span><div class="myinput-container" ng-show="!showSearchNameAddStudetList"><input type="text" ng-model="updateDrive.studentDataToAddNameSearch" class="myinput-field" style="height: 34px!important;color: black;text-align: center"><span class="my-close myicon" ng-click="clearNamesearch()">&times;</span></div></th>
                        				<th style="padding: 10px 3px;text-align: center;">Batch</th>
                        				<th ng-repeat="list in driveRoundListShowData" ng-style="(list=='GD/JAM/Communication')?{'font-size':'10px'}:{'font-size':'13px'}">{{list}}</th>
                        				<th style="padding: 10px 3px;text-align: center;">Status</th>
                        				<th style="padding: 10px 3px;text-align: center;">Remove</th>
                    				  </tr>
                           			  <tr ng-repeat="list in newStudentDataList" ng-init="index=$index" ng-show="updateDrive.studentDataToAddNameSearch!=undefined?updateDrive.studentDataToAddNameSearch.trim()!=''?list.name.toLowerCase().includes(updateDrive.studentDataToAddNameSearch.toLowerCase()):true:true">
                           			  	<td>{{$index+1}}</td>
                           			  	<td>{{list.name}}</td>
                           			  	<td>{{list.batchNumber}}</td>
                              			<td ng-repeat="lis in list.roundData">
                              		 		<select ng-model="lis.value" class="form-control" ng-change="setStatus(list,index,$index,lis.value,list.roundData)" style="height: 34px!important">
                                        		<option value="Clear">Clear</option>
                                        		<option>Not</option>
                                    		</select>
                              			</td>
                              			<td>{{list.finalReport}}</td>
                              			<td><span class="my-close" style="color:red!important" ng-click="removeFromList(list,$index)" >&times;</span></td>
                              		  </tr>
                              		</table>
                              	</td>
                           </tr>
                           
                            <tr style="background-color:white;" ng-show="indShowSave">
                    			<td colspan="4"><input type="submit"  ng-click="addStudentINtoDriveList()" value="Save" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                    	   </tr> 
                 </table>
                 </div>
  			</div>
  		</div>                  
</div>
<!-- end update drive -->
	
<!-- Take mark Page begin-->	
<div ng-controller="OfflineExamMarkCon as mrk" class="container-fluid" style="display:none;" id="takeExamMark">
	<div class="col-lg-12 container-fluid" id="mrkfrom" ng-show="showMrkStudentList">
            <div class="col-lg-3 not-to-mobile"></div>
            <div class="col-lg-6 col-xs-12 col-md-12 float-in-center myblock" style="margin: 10px">
                <div class="col-lg-12" style="padding-top: 10px!important;">
                    <center>
                        <h4>Exam Score Report Board</h4>
                        <p id="mrk_error" style="color: red;font-weight: 900; font-size: 9px;">{{mrk_error}}</p>
                        <table class="show-in-table">
                            <tr>
                             <td class="sub-heading">Batch</td>
                                <td>
                                <select ng-model="mrk.batch" id="mrk_batch" class="form-control"  style="height: 34px!important">
                                        <option value="select">select</option>
                                        <c:forEach items="${JspServices.getActiveBatch(batches)}" var="b">
											<option value="${b.getBatchNumber() }">${b.getBatchNumber() }</option>
										</c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr> 
                            	<td class="sub-heading">Subject</td>
                                <td>
                                	<select ng-model="mrk.subject" class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <option>Java</option>
                                        <option>Aptitude</option>
                                        <option>Communication</option>
                                        <option>Linux & DB</option>
                                    </select>
                                </td>
                            </tr>
                            <!--  -->
                        </table>
                    </center>
                    <div class="col-lg-12"><input type="submit" ng-click="markUpdateHomePage()" value="Show Me" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></div>
                </div>
            </div>
            <div class="col-lg-3 not-to-mobile"></div>
        </div>
        
        <div class="col-lg-12" id="attlist" ng-show="!(showMrkStudentList)">
            <div class="col-lg-12">
                <div class="col-lg-6"><h3 style="margin: 0px!important;font-weight: 800"><span ng-click="attBlockShow(0)" style="color: deepskyblue;font-size: 15px;text-align: left;font-weight: 200;cursor: pointer;">Back</span>&nbsp;&nbsp;&nbsp;&nbsp;Offline-Exam Report Board</h3></div>
                <div class="col-lg-6">
                    <p style="text-align: center;"><span class="sub-heading">Subject :</span> <span id=list_date>{{mrk.subject}}</span>   <span class="sub-heading">Batch :</span> <span id=list_batch>{{mrk.batch}}</span></p>
                </div>
                
            </div>
            <div class="col-lg-12 col-xs-12 col-md-12 float-in-center myblock" style="margin: 5px 10px 10px ">
                <table class="myatttable table-hover table-striped">
                    <tr>
                        <th>Sl no.</th>
                        <th>Date</th>
                        <th>Exam Type</th>
                        <th>Topic List</th>
                        <th>Duration</th>
                        <th>FullMark</th>
                        <th>Success Rate</th>
                        <th>Mark List</th>
                       
                    </tr>
                    <tr ng-repeat="list in examList">
                        <td>{{$index + 1}}</td>
                        <td>{{list.examDate}}</td>
                        <td>{{list.examType}}</td>
                        <td style="width:300px!important">{{list.topic}}</td>
                        <td>{{convertTime(list.duration)}}</td>
                        <td>{{list.fullmark}}</td>
                        <td>{{myRound(successRate(list.scoreList,list.fullmark))}}<span>%</span></td>
                        <td><p style="font-size:12px;color:#33ccff; text-align:center; margin-top:10px;cursor: pointer;" ng-click="showMarkListPage(list)">Show</p></td>
                    </tr>
                </table>
            </div>
            <div class="col-lg-12">
              <div class="col-lg-6"></div>
              
              <div class="col-lg-6">
            	<input type="submit" ng-click="addNewReport=true" value="Add New Report" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/>
              </div>
            </div>
            
  		</div>
  		<div ng-show="addNewReport" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading"  ng-show="showGiveMark" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="addNewReport=false" >&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Add New Exam Report ( </span>{{mrk.subject}}<span> / </span>{{mrk.batch}}<span> )</span></p>
    				<p class="sub-heading" ng-show="!showGiveMark" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span ng-show="!showSendMailLoader" ng-click="showGiveMark=!showGiveMark" > Back </span><img ng-show="showSendMailLoader" style="width: 30px;height: 30px;" src="https://www.danitadelimont.com/images/WaitCover.gif"/>&nbsp;&nbsp;&nbsp;( </span>{{mrk.subject}}<span> - </span>{{mrk.batch}}<span>         </span>Duration : {{convertTime(examDuration)}}<span>    </span>Fullmark : {{mrk.fullMark}}<span> )</span></p>
    			</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
  					<div ng-show="showGiveMark">        	
                          <table class="show-in-table">
                          	<tr>
                            	<td colspan="2"><p style="color: red;font-weight: 900; font-size: 9px;text-align: center;">{{AddNewReoprt_errorMsg}}</p></td>
                            </tr>
                            <tr style="padding-bottom:0px" >
                                <td style="width: 50%; padding-top:0px">
                                	<p class="sub-heading setDoubleHead">Date</p>
                                	<div id="mrkdatepicker" class="input-group date" data-date-format="yyyy-mm-dd">
                                        <input ng-model="mrk.examDate" id="mrk_date" class="form-control" type="text" name="" style="height: 34px!important;">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    </div>
                                </td>
                                <td style="width: 50%;padding-top:0px;">
                                    <p class="sub-heading setDoubleHead">Exam Type</p>
                                    <select ng-model="mrk.examType" ng-change="examTypeChange()" class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <option>Topic-Wise Test</option>
                                        <option>Weekly & monthly Test</option>
                                        <option>Mock Test</option>
                                        <option>Practices Test</option>
                                    </select>
                                </td>
                            </tr> 
                            <tr style="padding-top:0px;padding-bottom:0px;" ng-show="!topicInd && showInd">
                            	<td colspan="2" style="padding-top:0px;padding-bottom:0px">
                            		<p class="sub-heading setDoubleHead">Topic List</p>
                            		<p ng-repeat="topic in topicList">{{topic}}</p>
                            		<p style="font-size:12px;color:#33ccff; text-align:right; margin-top:10px;cursor: pointer;" ng-click="showTopicList=true">Select Topic</p>	
                            	</td>
                            </tr>
                            
                            <tr style="padding-top:0px;padding-bottom:0px" ng-show="topicInd && showInd">
                            	<td colspan="2" style="padding-top:0px;padding-bottom:0px">
                            		<p class="sub-heading setDoubleHead">Topic</p>
                                    <select ng-model="mrk.topicSingle" class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <option ng-repeat="topiclist in topicListData" >{{topiclist.topicName}}</option>
                                    </select>
                            	</td>
                            </tr>
                            <tr ng-show="showInd">
                                
                                <td style="width: 50%; padding-bottom:0px">
                                	<p class="sub-heading setDoubleHead">FullMark</p>
                              		<input ng-model="mrk.fullMark" class="form-control" type="number" style="height: 34px!important;">
                                </td>
                                <td style="width: 50%; padding-bottom:0px">
                                	<p class="sub-heading setDoubleHead">Duration</p>
                                	<div class="col-sm-12 col-xs-12 col-md-12">
                                	<div class="col-sm-5 col-xs-5 col-md-5" style="padding:0px;display:none">
                                		<input ng-model="mrk.hour" class="form-control" type="number" placeholder="HH" style="height: 34px!important;">
                                	</div>
                                	<div class="col-sm-2 col-xs-2 col-md-2" style="padding:0px;display:none">
                                		<p class="sub-heading setDoubleHead" style="weight:900; text-align:center">:</p>
                                	</div>
                                	<div class="col-sm-12 col-xs-12 col-md-12" style="padding:0px">
                                		<input ng-model="mrk.mint" class="form-control" type="number" placeholder="MM" style="height: 34px!important;">
                                	</div>
                                	</div>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%; padding-bottom:0px">
                                	</td>
                                <td style="width: 50%; padding-bottom:0px">
                                	<input type="submit" ng-click="addScore()" value="Next" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin-top: 20px; color: white;background-color: darkslateblue"/>
                                </td>
                            </tr>
               
                        </table>
                      </div>
                      <div ng-show="!showGiveMark">
                      	<center>        	
                      	<table class="myatttable table-hover table-striped" >
                      		<tr>
                        		<th style="font-size:10px;">Sl no.</th>
                        		<th>Name</th>
                        		<th>Score</th>
                        		<th>Remark</th>
                    		</tr>
                    		<tr ng-repeat="list in activeStudentList">
                        		<td>{{$index + 1}}</td>
                        		<td>{{list.studentName}}</td>
                        		<td><input value="" ng-model="list.score" class="form-control" type="number" style="height: 34px!important;"></td>
                        		<td><textarea class="remarkTextarea" ng-model="list.remark" rows="5" style="height: 34px;"></textarea></td>
                        	</tr>
                    		<tr>
                    			<td colspan="2"><p style="color: red;font-weight: 900; font-size: 9px;text-align: center;" ng-show="ind">Invalid Score</p></td>
                    			<td colspan="2"><input type="submit" ng-click="newExamUpdate()" ng-model="list.remark" value="Save" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                    	   </tr>
                      	</table>
                   		</center>
                      </div>
  				</div>
	  		</div>
		</div>
		<div ng-show="showMarkList" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="showMarkList=false">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Mark Sheet  ( </span>{{mrk.subject}}<span> - </span>{{mrk.batch}}<span>         </span>Duration : {{convertTime(markSheet.duration)}}<span>    </span>Fullmark : {{markSheet.fullmark}}<span> )</span></p>
  				</div>
  				<div class="mymodal-body" style="padding-bottom:30px">
                    <center>        	
                      <table class="myatttable table-hover table-striped" >
                      	<tr>
                        	<th>Sl no.</th>
                        	<th>Name</th>
                        	<th>Score</th>
                        	<th>Remark</th>
                        	<th>Edit</th>
                    	</tr>
                    	<tr ng-repeat="list in markSheet.scoreList">
                        	<td>{{$index + 1}}</td>
                        	<td>{{list.studentName}}</td>
                        	<td>{{list.score}}</td>
                        	<td class="showMarkRemark">{{list.remark}}</td>
                        	<td><i class="fa fa-pencil" aria-hidden="true" ng-click="editMarkSheet(list,markSheet.fullmark)"></i></td>
                    	</tr>
                    	
                      </table>
                   </center>
  			   </div>
	  		</div>
		</div>
		<div ng-show="showEditMark" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="showEditMark=false">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Edit Mark Sheet ( </span>{{studentMark.studentName}}<span> )</span></p>
  				</div>
  				<div class="mymodal-body" style="padding-bottom:30px">        	
                      <table class="show-in-table">
                      	   <tr>
                         	  	<td colspan="2"><p style="color: red;font-weight: 900; font-size: 9px;text-align: center;">{{editMarksheetErrorData}}</p></td>
                       	   </tr>
                           <tr>
                              	<td class="sub-heading">Score</td>
                              	<td><input ng-model="mrk.editStudentScore" value="" class="form-control" type="number" style="height: 34px!important;"></td> 
                           </tr>
                           <tr> 
                            	<td class="sub-heading">Remark</td>
                                <td><textarea ng-model="mrk.editStudentRemark" class="form-control"  rows="3" style="height: 80px!important;"></textarea></td> 
                           </tr>
                           <tr>
                    			<td colspan="2"><input type="submit"  ng-click="editMarksheetValidation()" value="Save" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                    	   </tr>
                        </table>
  				</div>
	  		</div>
		</div>
		
	    <div ng-show="showTopicList" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="showTopicList=false">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Topic List ( </span>{{mrk.subject}}<span> )</span></p>
  				</div>
  				<div class="mymodal-body" style="padding-bottom:30px">        	
                    <center>        	
                      <table class="myatttable table-hover table-striped" >
         
                      	<tr>
                        	<td><input type="checkbox" ng-model="overallTopic" ng-click="changeState(false)"></td>
                        	<td>Overall</td>
                        </tr>
                    	<tr ng-repeat="topiclist in topicListData">
                        	<td><input type="checkbox" ng-model="topiclist.check" ng-click="changeState(true)"></td>
                        	<td>{{topiclist.topicName}}</td>
                        </tr>
                        <tr>
                    		<td colspan="2"><input type="submit" ng-click="selectTopic()" value="Ok" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                    	</tr>
                    	
                      </table>
                   </center>
  				</div>
	  		</div>
		</div>
</div>
	
<!-- Take attendance Page begin-->	
<div ng-controller="studentAttCon as att" class="container-fluid" style="display:none;" id="takeAttendance">
 	<div class="col-lg-12 container-fluid" id="attfrom" ng-show="showAttStudentList">
            <div class="col-lg-3 not-to-mobile" ng-show="!showAttDashbord"></div>
            <div class="col-lg-6 col-xs-12 col-md-12 float-in-center myblock" ng-show="!showAttDashbord" style="margin: 10px">
                <div class="col-lg-12" style="padding-top: 10px!important;">
                    <center>
                        <h4>Attendance Report Board</h4>
                        <p id="att_error" style="color: red;font-weight: 900; font-size: 9px;">{{att_error}}</p>
                        <table class="show-in-table">
                            
                            <tr>
                                <td class="sub-heading">Batch</td>
                                <td>
                                    <select ng-model="att.attendance_batch" id="att_batch" class="form-control" id="sel1" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <c:forEach items="${JspServices.getActiveBatch(batches)}" var="b">
											<option value="${b.getBatchNumber() }">${b.getBatchNumber() }</option>
										</c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Subject</td>
                                <td>
                                   <select ng-model="att.attendance_subject" class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <option>Java</option>
                                        <option>Aptitude</option>
                                        <option>Communication</option>
                                        <option>Linux & DB</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Date</td>
                                <td>
                                    <div id="datepicker" class="input-group date" data-date-format="yyyy-mm-dd">
                                        <input ng-model="att.attendance_date" id="att_date" class="form-control" type="text" name="" style="height: 34px!important;">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    </div>
                                </td>
                            </tr>
                            
                        </table>
                    </center>
                    <div class="col-lg-12"><input type="submit" ng-click="attanceValid()" value="submit" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></div>
                    <div class="col-lg-12"><p ng-click="showAttDashbordClick()">show Dashbord</p></div>
                </div>
            </div>
            <div class="col-lg-3 not-to-mobile" ng-show="!showAttDashbord"></div>
            
            <div class="col-lg-12" ng-show="showAttDashbord">
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="showAttDashbord=!showAttDashbord">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Attendance Dashbord</span></p>
  				</div>
  				<div class="mymodal-body">        	
                  <div>
                   
                   		<div class="col-lg-12" style="padding:10px 0px;">
                   		  <div class="col-lg-4" style="padding: 0px;">
                   		  	<div class="col-lg-8" style="padding-right: 0px;">
                   		  		<input ng-show="att.selectDashbord=='default'" ng-model="att.serchData" class="form-control" ng-change="serchStudentList()" type="text" style="height: 34px!important;border-bottom-right-radius: 0px;border-top-right-radius: 0px; border-right: 0px;" placeholder="Search here......">
                   		  		<input ng-show="att.selectDashbord=='topic'" ng-model="att.serchDataTopic" class="form-control" type="text" style="height: 34px!important;border-bottom-right-radius: 0px;border-top-right-radius: 0px; border-right: 0px;" placeholder="Search here......">
                   		  	</div>
                   		  	<div class="col-lg-4" style="padding-left: 0px;" >
                   		  		<select class="form-control" ng-model="att.selectDashbord" style="height: 34px!important;border-top-left-radius: 0px;border-bottom-left-radius: 0px;">
                                 <option>default</option>
                                 <option>topic</option>
                            	</select>
                   		  	</div>
                   		  </div>
                   		  <div class="col-lg-2" style="padding: 0px 10px;" ng-show="att.selectDashbord=='topic'">
                   		  	<div class="dropdown" ng-show="att.selectDashbord=='default'">
					      		<button style="height: 34px;border-radius: 4px!important;" class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Subject
						  		<span class="caret"></span></button>
						  		<div class="dropdown-menu" style="font-size:12px;max-height:200px;overflow-y:scroll;">
						     		<div ng-repeat="sub in subjectDashBoard"><a tabindex="-1" href="#"><input type="checkbox" ng-model="sub.ind" ng-change="filterDashBord()"/> {{sub.data}}</a></Div> 
						    	</div>
						    </div>
						    <div class="dropdown" ng-show="att.selectDashbord=='topic'">
					      		<button style="height: 34px;border-radius: 4px!important;" class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Subject
						  		<span class="caret"></span></button>
						  		<div class="dropdown-menu" style="font-size:12px;max-height:200px;overflow-y:scroll;">
						     		<div ng-repeat="sub in subjectDashBoard"><a tabindex="-1" href="#"><input type="checkbox" ng-model="sub.ind" ng-change="chngTopicFilter()"/> {{sub.data}}</a></Div> 
						    	</div>
						    </div>
                   		  </div>
                   		  <div class="col-lg-2" style="padding: 0px 10px;">
                   		  	<div class="dropdown" ng-show="att.selectDashbord=='default'">
					      		<button style="height: 34px;border-radius: 4px!important;" class="dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Batch
						  		<span class="caret"></span></button>
						  		<div class="dropdown-menu" style="font-size:12px;max-height:200px;overflow-y:scroll;">
						     		<div ng-repeat="sub in batchDashBoard"><a style="color: black;" tabindex="-1" href="#"><input type="checkbox" ng-model="sub.ind" ng-change="filterDashBord()" /> {{sub.data}}</a></Div> 
						    	</div>
						    </div>
						    <div class="dropdown" ng-show="att.selectDashbord=='topic'">
					      		<button style="height: 34px;border-radius: 4px!important;" class="dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Batch
						  		<span class="caret"></span></button>
						  		<div class="dropdown-menu" style="font-size:12px;max-height:200px;overflow-y:scroll;">
						     		<div ng-repeat="sub in batchDashBoardtopic"><a style="color: black;" tabindex="-1" href="#"><input type="checkbox" ng-model="sub.ind" ng-change="chngTopicFilter()" /> {{sub.data}}</a></Div> 
						    	</div>
						    </div>
                   		  </div>
                   		  <div class="col-lg-2" style="padding: 0px 10px;">
                   		  	<select ng-model="att.attDashbordTime" ng-show="att.selectDashbord=='default'" class="form-control" style="height: 34px!important" ng-change="filterDashBord()">
                                 <option >overall</option>
                                 <option>today</option>
                                 <option>last 7 days</option>
                                 <option>last 30 days</option>
                                 <option>Select Date</option>
                            </select>
                            <div class="dropdown" ng-show="att.selectDashbord=='topic'">
					      		<button style="height: 34px;border-radius: 4px!important;" class="dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Topic
						  		<span class="caret"></span></button>
						  		<div class="dropdown-menu" style="font-size:12px;max-height:200px;overflow-y:scroll;">
						     		<div ng-repeat="sub in topicDashBoardtopicShow"><a style="color: black;" tabindex="-1" href="#"><input type="checkbox" ng-model="sub.ind" ng-change="chngTopicFilterbyTopic()" /> {{sub.data}}</a></Div> 
						    	</div>
						    </div>
                   		  </div>
                   		  <div class="col-lg-2" style="padding: 0px 10px;" ng-show="att.attDashbordTime=='Select Date' && att.selectDashbord=='default' ">
                   		  		<div id="datepicker123" class="input-group date" data-date-format="yyyy-mm-dd">
                                     <input ng-change="filterDashBord()"  ng-model="att.showDashbord_date" class="form-control" type="text" name="" style="height: 34px!important;">
                                     <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                   		  </div>
                   		  <div class="col-lg-2" style="padding: 0px 10px;">
                   		  	<input type="submit" ng-click="showSendMail=!showSendMail" value="Send Mail" style="height: 34px; border-radius: 5px;font-weight: 500;border: 0px;font-size: 13px; padding: 0px 10px; color: white;background-color: darkslateblue"/>
                   		  </div>
                   		</div>
                   		
                   		
                   		
               <table ng-show="att.selectDashbord=='default'" class="myAttTable table-hover table-striped" style="width:100%">
                   		
                    <tr>
                        <th>Select <input type="checkbox" ng-model="seletcAllAttendanceDashbord" ng-change="selectAllattDashbord()"/></th>
                        <th>Batch</th>
                        <th>Name</th>
                        <th>Java</th>
                        <th>Apti</th>
                        <th>Comm</th>
                        <th>Linux</th>
                        <th>Total</th>
                        <th>Details</th>
                    </tr>
                    <tr ng-repeat="studAtt in attDashbordSearchData" ng-show="((((studAtt.workingDateList!=null && studAtt.workingDateList!=undefined && studAtt.workingDateList!='')?studAtt.workingDateList.split(',').length:0)-((studAtt.attance!=null && studAtt.attance!=undefined && studAtt.attance!='')?studAtt.attance.split(',').length:0))>=1)?att.serchData!=undefined?att.serchData.trim()!=''?studAtt.name.trim().toLowerCase().includes(att.serchData.trim().toLowerCase())?true:false:true:true:false">
                        <td><input type="checkbox" ng-model="studAtt.sendMail"></td>
                        <td>{{studAtt.batch}}</td>
                        <td>{{studAtt.name}}</td>
                        <td>{{changeAttanceBySubjectFilter(studAtt,'J')}}</td>
                        <td>{{changeAttanceBySubjectFilter(studAtt,'A')}}</td>
                        <td>{{changeAttanceBySubjectFilter(studAtt,'C')}}</td>
                        <td>{{changeAttanceBySubjectFilter(studAtt,'L')}}</td>
                        <td>{{((studAtt.workingDateList!=null && studAtt.workingDateList!=undefined && studAtt.workingDateList!='')?studAtt.workingDateList.split(',').length:0)-((studAtt.attance!=null && studAtt.attance!=undefined && studAtt.attance!='')?studAtt.attance.split(',').length:0)}} / {{(studAtt.workingDateList!=null && studAtt.workingDateList!=undefined && studAtt.workingDateList!='')?studAtt.workingDateList.split(',').length:0}}</td>
                        <td><p style="font-size:12px;color:#33ccff;text-align:center;margin-top:10px;cursor: pointer;" ng-click="getAttRepo(studAtt)">Show</p></td>
                    </tr>
                  </table>
                  <table ng-show="att.selectDashbord=='topic'" class="myAttTable table-hover table-striped" style="width:100%">	
                    <tr>
                        <th>Select <input type="checkbox" ng-model="seletcAllAttendanceDashbordTopic" ng-change="selectAllattDashbordTopic()"/></th>
                        <th>Batch</th>
                        <th>Name</th>
                        <th>Details</th>
                    </tr>
                    <tr ng-repeat="list in topicMissedListByStudentShow  track by $index" ng-show="att.serchDataTopic!=undefined?att.serchDataTopic.trim()!=''?list.name.trim().toLowerCase().includes(att.serchDataTopic.trim().toLowerCase())?true:false:true:true">
                        <td><input type="checkbox" ng-model="list.sendMail"></td>
                        <td>{{list.batch}}</td>
                        <td>{{list.name}}</td>
                        <td>
                        	<table style="width:100%">
                       			<tr style="background-color:#ffffe6" ng-show="list.sunjectwise.Java!=undefined" ng-repeat="sub in list.sunjectwise.Java">
                       				<td ng-show="$index==0" rowspan="{{list.sunjectwise.Java.length}}">Java</td>
                        			<td>{{sub.topic}}
                        		      <table style="width:100%" ng-show="((((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0))<((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0))">
                       				   <tr style="padding: 0px;">
                       					<td style="padding: 0px;" ng-repeat="wrk in sub.workDate.split(',')" > <div ng-style="(sub.present!=undefined && sub.present!='' && wrk!=undefined && wrk!='')?(sub.present.includes(wrk))?{'background-color':'green','color':'green'}:{'background-color':'red','color':'red'}:{'background-color':'red','color':'red'}" style="height:5px;padding:0px;margin: 0px 1px;"><span style="font-size: 1px;">-</span> </div></td>
                       				   </tr>
                       				  </table>
                        			</td>
            			            <td>{{((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0)}} / {{(sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0}}</td>
			                        <td><p style="font-size:12px;color:#33ccff;text-align:center;margin:0px;cursor: pointer;" ng-click="datemaplistshowfunction(sub)">Show</p></td>                       			
                       			</tr>
                       			<tr style="background-color:#e6ffff" ng-show="list.sunjectwise.Aptitude!=undefined" ng-repeat="sub in list.sunjectwise.Aptitude">
                       				<td ng-show="$index==0" rowspan="{{list.sunjectwise.Aptitude.length}}">Aptitude</td>
                        			<td>{{sub.topic}}
                        		     <table style="width:100%" ng-show="((((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0))<((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0))">
                       				   <tr style="padding: 0px;">
                       					<td style="padding: 0px;" ng-repeat="wrk in sub.workDate.split(',')" > <div ng-style="(sub.present!=undefined && sub.present!='' && wrk!=undefined && wrk!='')?(sub.present.includes(wrk))?{'background-color':'green','color':'green'}:{'background-color':'red','color':'red'}:{'background-color':'red','color':'red'}" style="height:5px;padding:0px;margin: 0px 1px;"><span style="font-size: 1px;">-</span> </div></td>
                       				   </tr>
                       				  </table>
                        			</td>
            			            <td>{{((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0)}} / {{(sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0}}</td>
			                        <td><p style="font-size:12px;color:#33ccff;text-align:center;margin:0px;cursor: pointer;" ng-click="datemaplistshowfunction(sub)">Show</p></td>                       			
                       			</tr>
                       			<tr style="background-color:#eee6ff " ng-show="list.sunjectwise.Communication!=undefined" ng-repeat="sub in list.sunjectwise.Communication">
                       				<td ng-show="$index==0" rowspan="{{list.sunjectwise.Communication.length}}">Communication</td>
                        			<td>{{sub.topic}}
                        		      <table style="width:100%" ng-show="((((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0))<((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0))">
                       				   <tr style="padding: 0px;">
                       					<td style="padding: 0px;" ng-repeat="wrk in sub.workDate.split(',')" > <div ng-style="(sub.present!=undefined && sub.present!='' && wrk!=undefined && wrk!='')?(sub.present.includes(wrk))?{'background-color':'green','color':'green'}:{'background-color':'red','color':'red'}:{'background-color':'red','color':'red'}" style="height:5px;padding:0px;margin: 0px 1px;"><span style="font-size: 1px;">-</span> </div></td>
                       				   </tr>
                       				  </table>
                        			</td>
            			            <td>{{((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0)}} / {{(sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0}}</td>
			                        <td><p style="font-size:12px;color:#33ccff;text-align:center;margin:0px;cursor: pointer;" ng-click="datemaplistshowfunction(sub)">Show</p></td>                       			
                       			</tr>
                       			<tr style="background-color:#fff5e6" ng-show="list.sunjectwise.Linux_DB!=undefined" ng-repeat="sub in list.sunjectwise.Linux_DB">
                       				<td ng-show="$index==0" rowspan="{{list.sunjectwise.Linux_DB.length}}">Linux & DB</td>
                        			<td>{{sub.topic}}
                        			  <table style="width:100%" ng-show="((((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0))<((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0))">
                       				   <tr style="padding: 0px;">
                       					<td style="padding: 0px;" ng-repeat="wrk in sub.workDate.split(',')" > <div ng-style="(sub.present!=undefined && sub.present!='' && wrk!=undefined && wrk!='')?(sub.present.includes(wrk))?{'background-color':'green','color':'green'}:{'background-color':'red','color':'red'}:{'background-color':'red','color':'red'}" style="height:5px;padding:0px;margin: 0px 1px;"><span style="font-size: 1px;">-</span> </div></td>
                       				   </tr>
                       				  </table>
                        			</td>
            			            <td>{{((sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0)-((sub.present!=undefined && sub.present!='')?sub.present.split(',').length:0)}} / {{(sub.workDate!=undefined && sub.workDate!='')?sub.workDate.split(',').length:0}}</td>
			                        <td><p style="font-size:12px;color:#33ccff;text-align:center;margin:0px;cursor: pointer;" ng-click="datemaplistshowfunction(sub)">Show</p></td>                       			
                       			</tr>
                        	</table>
                        </td>
                     </tr>
                  </table>
                  </div>  
  				</div>
	  		</div>
  		</div>
  		<div ng-show="datemaplistshow" class="my-modal">
  			<div class="mymodal-content" style="width:50%" >
  				<div class="mymodal-body" style="padding:0px 10px 20px 10px"> 
  				<p class="sub-heading" style="color:#000!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" style="color:red!important" ng-click="datemaplistshow=!datemaplistshow">&times;</span></p>       	
                    <table class="myatttable table-hover table-striped">
               			<tr>
               				<td  ng-repeat="list in datemaplistshowwork" ng-style="(datemaplistshowpresent!=undefined && datemaplistshowpresent!='' && list!=undefined && list!='')?(datemaplistshowpresent.includes(list))?{'background-color':'green'}:{'background-color':'red'}:{'background-color':'red'}" style="color:white">{{list}}</td>
               			</tr>         	
                    </table>
  				</div>
	  		</div>
		</div>
        
        <div ng-show="myAttReport" class="my-modal">
  			<div class="mymodal-content" style="width:70%" >
    			<div class="mymodal-header">
    				<div class="col-lg-12">
    					<div class="col-lg-6">
    					<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="myAttReport=false">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Attendance Report</span></p>
    					</div>
    					<div class="col-lg-6">
    						<select ng-model="att.attIndStuddatashow" class="form-control" style="height: 34px!important" ng-change="filterindstuddata()">
                                 <option>overall</option>
                                 <option>present</option>
                                 <option>absent</option>
                            </select>
    					</div>
    				</div>
    				
  				</div>
  				<div class="mymodal-body" style="margin:0px 0px 20px 0px">        	
                    <table class="myatttable table-hover table-striped">
               			<tr>
               				<th style="font-size:7px">Sl no</th>
               				<th style="width:130px">Date</th>
               				<th>Report</th>
               			</tr>
               			<tr ng-repeat="list in myAttListStatusListshow">
                            <td>{{$index + 1}}</td>
               				<td>{{list.date}}</td>
               				<td>
               				<table style="width:100%">
               					<tr ng-repeat="report in list.report">
               						<td>{{report.subject}}</td>
               						<td ng-style="report.status?{'color':'green'}:{'color':'red'}">{{report.status?'Present':'Absent'}}</td>
               						<td ><p style="margin:0px" ng-repeat="tp in report.topic.split('-#-')">{{tp}}</p></td>
               					</tr>
               				</table>
               				</td>	
               			</tr>          	
                    </table>
  				</div>
	  		</div>
		</div>
        
    	<div class="col-lg-12" id="attlist" ng-show="!(showAttStudentList)">
            <div class="col-lg-12">
                <div class="col-lg-6"><h3 style="margin: 0px!important;font-weight: 800"><span ng-click="attBlockShow(0)" style="color: deepskyblue;font-size: 15px;text-align: left;font-weight: 200;cursor: pointer;">Back</span>&nbsp;&nbsp;&nbsp;&nbsp;Attendance Report Board&nbsp;&nbsp;&nbsp;&nbsp;<img src="/resources/images/report.png" ng-click="attReoprtHoll=!attReoprtHoll" style="width: 40px;height: 40px;margin-top:5px;" alt="Report"></h3></div>
                <div class="col-lg-6">
                    <p style="text-align: center;"><span class="sub-heading">Subject :</span> <span id=list_date>{{att.attendance_subject}}</span>   <span class="sub-heading">Date :</span> <span id=list_date>{{att.attendance_date}}</span>   <span class="sub-heading">Batch :</span> <span id=list_batch>{{att.attendance_batch}}</span></p>
                </div>
                
            </div>
            <div class="col-lg-12 col-xs-12 col-md-12 float-in-center myblock" style="margin: 5px 10px 10px ">
                <table class="myatttable table-hover table-striped">
                    <tr>
                        <th>Sl no.</th>
                        <th>Attendance <input type="checkbox" ng-model="seletcAllAttendance" ng-click="att.selectAll()"/> </th>
                        <th>Name</th>
                        <th>College</th>
                       
                    </tr>
                    <tr ng-repeat="studAtt in sudentListByBatch">
                        <td>{{$index + 1}}</td>
                        <td><input type="checkbox" ng-model="studAtt.attendance" ng-click="att.selectAllChng()" data-on-color="success" data-off-color="danger" data-on-text="P" data-off-text="A"></td>
                        <td>{{studAtt.name}}</td>
                        <td>{{studAtt.collegeName}}</td>    
                    </tr>
                </table>
            </div>
            <div class="col-lg-12">
              <div class="col-lg-6">
              <table ng-show="isToday(att.attendance_date)" style="margin-top:10px">
              	<tr>
              	    <td class="sub-heading" style="width:200px;">Today's Topic</td>
              		<td>
        				<p style="font-size:12px;color:red; text-align:right; margin-top:10px;margin:0px;padding-right: 30px;"ng-show="showAttTopicError">Select a valid Topic</p>
              			<select ng-model="att.today_topic" class="form-control" style="height: 34px!important">
                           <option value="select">select</option>
                           <option ng-repeat="topicList in topicListBySub">{{topicList.topicName}}</option>
                        </select>
                    </td>
              	</tr>
              	<tr>
              		<td colspan="2"><p style="font-size:12px;color:#33ccff; text-align:right; margin-top:10px;cursor: pointer;" ng-click="addNewTopic=true">Add New Topic</td>
          
              	</tr>
              	<tr>
              		<td colspan="2"><p style="font-size:12px;color:black; text-align:center; margin-top:10px"><b>Note : </b> For More-features go to ' Update Syllabus ' Tab.</p></td>
              	</tr>
              </table>
              </div>
              <div class="col-lg-6">
            	<input type="submit" ng-click="getStudentAttSetter()" value="submit" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/>
              </div>
            </div>
            
  </div>
  <div ng-show="attReoprtHoll" class="my-modal">
  			<div class="mymodal-content" style="width:90%" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="attReoprtHoll=!attReoprtHoll">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Attendance  Report Of Batch - {{att.attendance_batch}}</span></p>
  				</div>
  				<div class="mymodal-body">        	
                  <div style="overflow-x: auto;">
                   <table class="myAttTable table-hover table-striped">
                    <tr>
                        <th >Sl no.</th>
                        <th >Name</th>
                        <th>Report</th>
                        <th ng-repeat="list in workingDateList" class="fixedWidth">{{textDate(list)}}</th>
                       
                    </tr>
                    <tr ng-repeat="studAtt in studentData">
                        <td>{{$index + 1}}</td>
                        <td>{{studAtt.name}}</td>
                        <td>{{studAtt.pre}} / {{studAtt.total}}</td>
                        <td class="fixedWidth" ng-repeat="l in studAtt.attance track by $index" ng-style="l?{'color':'green'}:{'color':'red'}" >{{l?'P':'A'}}</td>
                    </tr>
                  </table>
                  </div>  
  				</div>
	  		</div>
  </div>
  <div ng-show="showSendMail" class="my-modal">
  			<div class="mymodal-content" style="width:40%" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-show="!showSendMailLoader" ng-click="showSendMail=!showSendMail">&times;</span><img ng-show="showSendMailLoader" style="width: 30px;height: 30px;" src="https://www.danitadelimont.com/images/WaitCover.gif"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Send Mail</span></p>
  				</div>
  				<div class="mymodal-body">        	
                  <div style="overflow-x: auto;">
                   <table class="myAttTable table-hover table-striped" style="width:100%">
                    <tr style="background-color:#fff!important">
                        <td colspan="2">
                        	<textarea ng-model="att.sendmailmsg" class="form-control"  rows="3" style="height: 150px!important;"></textarea>
                        </td>
                    </tr>
                    <tr style="background-color:#fff!important">
                    	<td>
                    		<span ng-show="attDashHelp" ng-click="attDashHelp=!attDashHelp">show HELP</span><span ng-show="!attDashHelp" ng-click="attDashHelp=!attDashHelp">close HELP</span>
                    	</td>
                    	<td>
                    		<div ng-show="att.sendmailmsg!=undefined?att.sendmailmsg!=''?true:false:false" class="col-lg-12"><input type="submit" ng-click="sendMail()" value="Send" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></div>
                    	</td>
                    </tr>
                    <tr style="background-color:#fff!important" ng-show="!attDashHelp">
                    	<td ng-show="att.selectDashbord=='default'">
                    		<p>{name} : Name Of Student.</p>
                    		<p>{batch} : Batch Of Student.</p>
                    	</td>
                    	<td ng-show="att.selectDashbord=='default'">
                    		<p>{absent} : No of absent according to filter set.</p>
                    		<p>{duration} : Duration of Days (Overall, today, last 7days, last 30days)</p>
                    	</td>
                    	<td ng-show="att.selectDashbord=='topic'">
                    		<p>{name} : Name Of Student.</p>
                    		<p>{batch} : Batch Of Student.</p>
                    	</td>
                    	<td ng-show="att.selectDashbord=='topic'">
                    		<p>{subjectList} : All subject-list what you selected.</p>
                    		<p>{topicList} : All topic-list what you selected.</p>
                    	</td>
                    </tr>
                  </table>
                  </div>  
  				</div>
	  		</div>
  </div>
  
  <div ng-show="addNewTopic" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="addNewTopic=false">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Add New Topic ( </span>{{att.attendance_subject}}<span> )</span></p>
  				</div>
  				<div class="mymodal-body">        	
                          <table class="show-in-table">
                          	<tr>
                            	<td colspan="2"><p style="color: red;font-weight: 900; font-size: 9px;text-align: center;">{{AddNewTopic_errorMsg}}</p></td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Topic Name</td>
                                <td>
                                     <input ng-model="att.att_topicAddTopicName" class="form-control" type="text" style="height: 34px!important;">
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Approx Days</td>
                                <td>
                                     <input ng-model="att.att_topicAddTopicAppDay" class="form-control" type="number" style="height: 34px!important;">
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Document Resource</td>
                                <td>
                                     <input ng-model="att.att_topicAddTopicDocRes" class="form-control" type="text" style="height: 34px!important;">
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Video Resource</td>
                                <td>
                                     <input ng-model="att.att_topicAddTopicVideoRes" class="form-control" type="text" style="height: 34px!important;">
                                </td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input ng-click="addNewTopicClick()" type="button" value="Add" style="float: right;text-align:center; width: 100px;height: 40px; border-radius: 5px;font-weight: 600;border: 0px;font-size: 14px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                            </tr>
                        </table>
  				</div>
	  		</div>
		</div>
		
  
	
</div>
		
<!-- Take attendamce Page end-->
	
<!-- student details form begin-->
		
<div id="regForm" style="display:none;padding-top: 20px;">
	<div class="container-fluid" style="padding:0px !important;margin-bottom:5%;">
	<form id='registration' onsubmit="return false" class="form-horizontal">
		<div class="row" style="margin: -4px -3px 0px -6px !important;">
			<div class="col-md-2" style="background-color:#2F3D4D;height:370px;margin:0px !important;">
				<div class="nav nav-tabs scrollmenuForReg" id="menu-centerForReg">
	             <a data-toggle="tab" class="active regFomLinkClass" href="#personalForm">Personal</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#eduactionForm">Education</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#feeForm">Fee</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#placementForm">Placement</a><br>
	             <a data-toggle="tab" class="regFomLinkClass" href="#otherForm">Social Links</a>
	       		 </div>
       		 <div class="form-group" style="margin-top:50%;"> 
				<div class="col-sm-12">
					<input type="submit" onclick="sendData('registerStudent?','','',0); return false;" value="Register" class="btn btn-default regBtnNewStyleInOtherPlace">
				</div>
			</div>
			</div>
			<div class="col-md-10" style="margin: 0% !important;">
					<div class="tab-content" style="margin-left: -1.4% !important;margin-top: -1.8% !important;margin-right: -1.6% !important;">
						<div id="personalForm" class="tab-pane fade in active formTabsClassBack">
			                <h3 class="addFormHeadClass" style="margin-left: -2px;">Personal Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="fullname" class="labelClassRegStd">Full Name</label>
		                                <input type="text" name="fullName" class="form-control formInputClassReg" id="fullName" placeholder="Enter Full Name" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Email</label>
		                                <input type="email" name="email" class="form-control formInputClassReg" id="email" placeholder="Enter email" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="dob" class="labelClassRegStd">DateOfBirth</label>
		                                <input type="date" name="dob" class="form-control formInputClassReg" id="dob" placeholder="Enter Date of Birth" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Gender</label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="male" checked name="gender">Male
		                                </label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="female" name="gender">Female
		                                </label>
		                            </div>
		                      
		                            <div class="form-group formGroupClassReg">
		                                <label for="mobile" class="labelClassRegStd">Student Mobile</label>
		                                <input type="text" name="mobile" class="form-control formInputClassReg" id="mobile" placeholder="Enter mobile number" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="mobile_Parent" class="labelClassRegStd">Parent Mobile</label>
		                                <input type="text" name="mobile_Parent" class="form-control formInputClassReg" id="mobile_Parent" placeholder="Enter Emergency mobile number" required>
		                            </div>
		                       </div>
		                       <div class="col-md-6">
		                            
		                            <div class="form-group formGroupClassReg">
		                                <label for="parentName" class="labelClassRegStd">Emergency Contact Person</label>
		                                <input type="text" name="parentName" class="form-control formInputClassReg" id="parentName" placeholder="Enter Emergency Contact Person" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="locality" class="labelClassRegStd">Address</label>
		                                <textarea name="locality" style="height:54px !important;padding: 3px 4px !important;" placeholder="Enter your address" class="form-control formInputClassReg" rows="5"  id="locality" required></textarea>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="city" class="labelClassRegStd">City</label>
		                                <input type="text" name="city" class="form-control formInputClassReg" id="city" placeholder="Enter city" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">State</label>
		                                <select name="state" class="form-control formInputClassReg" style="height:32px !important;padding: 3px 4px !important;" id="state">
										  <option value="" selected disabled>Select state</option>
										  <option value="AndhraPradesh">Andhra Pradesh</option>
										  <option value="Telangana">Telangana</option>
										  <option value="Others">Others</option>
										</select>
		                            </div>
		                        </div>
				            </div>
						</div>
						
						<div id="eduactionForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass" style="margin-left: -2px;">Education Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="sscPercentage" class="labelClassRegStd">SSC Percentage</label>
		                                <input type="number" name="sscPercentage" class="form-control formInputClassReg" id="sscPercentage" placeholder="Enter SSC Percentage" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="interPercentage" class="labelClassRegStd">Inter Percentage</label>
		                                <input type="number" name="interPercentage" class="form-control formInputClassReg" id="interPercentage" placeholder="Enter Inter Percentage " required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationPercentage" class="labelClassRegStd">Graduation Percentage</label>
		                                <input type="number" name="graduationPercentage" class="form-control formInputClassReg" id="graduationPercentage" placeholder="Enter graduation percentage" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="math10th" class="labelClassRegStd">10Th Math Marks</label>
		                                <input type="number" name="math10th" class="form-control formInputClassReg" id="math10th" placeholder="Enter 10th marks in maths" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="math12th" class="labelClassRegStd">Inter Math marks</label>
		                                <input type="number" name="math12th" class="form-control formInputClassReg" id="math12th" placeholder="Enter inter marks in maths" required>
		                            </div>
		             
		                            
		                       </div>
		                       <div class="col-md-6">
		                       		<div class="form-group formGroupClassReg">
		                                <label for="graduationCollege" class="labelClassRegStd">Graduation College Name</label>
		                                <input type="text" name="graduationCollege" class="form-control formInputClassReg" id="graduationCollege" placeholder="Enter Graduation College" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationCity" class="labelClassRegStd">College Location</label>
		                                <input type="text" name="graduationCity" class="form-control formInputClassReg" id="graduationCity" placeholder="Enter city" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationYOP" class="labelClassRegStd">Graduation YOP</label>
		                                <input type="number" name="graduationYOP" class="form-control formInputClassReg" placeholder="Enter Graduation YOP" id="graduationYOP">
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationType" class="labelClassRegStd">Graduation Type</label>
		                                <select name="graduationType" class="form-control formInputClassReg" style="height:32px !important;padding: 3px 4px !important;" id="graduationType">
										 <option value="BTech">BTech</option>
										 <option value="MTech">MTech</option>
										 <option value="MBA">MBA</option>
										 <option value="MCA">MCA</option>
										 <option value="Degree">Degree</option>
										  <option value="Others">Others</option>
										 </select>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="graduationBranch" class="labelClassRegStd">Garduation Branch</label>
		                                <select name="graduationBranch" style="height:32px !important;padding: 3px 4px !important;" class="form-control formInputClassReg" id="graduationBranch">
										  <optgroup label="B Tech or M Tech Branches">
										  <option value="CSE">CSE</option>
										  <option value="IT">IT</option>
										  <option value="ECE">ECE</option>
										  <option value="EEE">EEE</option>
										  <option value="MECH">MECH</option>
										  <option value="CIVIL">CIVIL</option>
										  <option value="Aeronautical">Aeronautical</option>
										  <option value="EIE">Electronics & Instrumentation Engineering</option>
										  <option value="Mechatronics Engineering">Mechatronics Engineering</option>
										  <option value="other">Any other</option>
										  </optgroup>
										  
										  <optgroup label="Any other">
										   <option value="Other">Any Other</option>
										  </optgroup>
										  
										  <optgroup label="Degree groups">
										  <option value="BSC Computers">BSC Computers</option>
										  <option value="BSC General">BSC General</option>
										  <option value="BCom">BCom</option>
										   <option value="BA">BA</option>
										   <option value="Other">Any Other</option>
										  </optgroup>
										  </select>
		                            </div>
		                        </div>
				            </div>
				         </div>
						
						<div id="feeForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass" style="margin-left: -2px;">Fee Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="batchNumber" class="labelClassRegStd">Batch Number</label>
		                                <select name="batchNumber" style="height:32px !important;padding: 3px 4px !important;" class="form-control formInputClassReg">
											<c:forEach items="${batches }" var="b">
											<option value="${b.getBatchNumber() }" selected>${b.getBatchNumber() }</option>
											</c:forEach>
										</select>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="feePaid" class="labelClassRegStd">FeePaid</label>
		                                <input type="number" name="feePaid" class="form-control formInputClassReg" id="feePaid" placeholder="Enter Fee Paid" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="feeTotal" class="labelClassRegStd">TotalFee</label>
		                                <input type="number" name="feeTotal" class="form-control formInputClassReg" id="feeTotal" placeholder="Enter Fee Total" required>
		                            </div>
		             				<div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Free</label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="feeFreeyes" name="feefree">Yes
		                                </label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="feeFreeno" checked name="feeFree">No
		                                </label>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="joinDate" class="labelClassRegStd">Join Date</label>
		                                <input type="date" name="joinDate" class="form-control formInputClassReg" id="joinDate" placeholder="YYYY/MM/DD" required>
		                            </div>
		                       </div>
		                       <div class="col-md-6"></div>
		             		</div>
						</div>
						
						<div id="placementForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass" style="margin-left: -2px;">Placement Details</h3>
			                <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group formGroupClassReg">
		                                <label for="placed" class="labelClassRegStd">Placed</label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="placedyes" name="placed">Yes
		                                </label>
		                                <label class="radio-inline labelClassRegStd">
		                                <input type="radio" value="placedno" name="placed">No
		                                </label>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="companyname" class="labelClassRegStd">Company Name</label>
		                                <input type="text" name="companyname" class="form-control formInputClassReg" id="companyname" placeholder="Enter Company Name" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="companyurl" class="labelClassRegStd">Company URL</label>
		                                <input type="text" name="companyurl" class="form-control formInputClassReg" id="companyurl" placeholder="Enter Company URL" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="salary" class="labelClassRegStd">Salary</label>
		                                <input type="text" name="salary" class="form-control formInputClassReg" id="salary" placeholder="Enter salary in lakhs" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="designation" class="labelClassRegStd">Designation</label>
		                                <input type="text" name="designation" class="form-control formInputClassReg" id="designation" placeholder="Enter designation" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="email" class="labelClassRegStd">Technology</label>
		                                <select name="state" class="form-control formInputClassReg" style="height:32px !important;padding: 3px 4px !important;" id="state">
										  <option value="" selected disabled>JAVA</option>
										  <option value="AndhraPradesh">Testing</option>
										  <option value="Telangana">UI-Dev</option>
										  <option value="Others">Others</option>
										</select>
		                            </div>
		                            
		                        </div>
		                        <div class="col-md-6">
		                        	<div class="form-group formGroupClassReg">
		                                <label for="contactperson" class="labelClassRegStd">Contact Person</label>
		                                <input type="text" name="contactperson" class="form-control formInputClassReg" id="contactperson" placeholder="Enter Contact Person Name" required>
		                            </div>
		                             <div class="form-group formGroupClassReg">
		                                <label for="companyurl" class="labelClassRegStd">Contact Person Email</label>
		                                <input type="email" name="personemail" class="form-control formInputClassReg" id="personemail" placeholder="Enter Company Person Email" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="personmobile" class="labelClassRegStd">Contact Person Mobile</label>
		                                <input type="number" name="personmobile" class="form-control formInputClassReg" id="personmobile" placeholder="Enter Contact Person Number" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="bond" class="labelClassRegStd">Bond</label>
		                                <label class="radio-inline forradiocheckclass">
		                                <input type="radio" value="bondyes" name="bond">Yes
		                                </label>
		                                <label class="radio-inline forradiocheckclass">
		                                <input type="radio" value="bondno" checked name="bond">No
		                                </label>
		                            </div>
		                            <div class="form-group formGroupClassReg">
			                            <label class="checkbox-inline forradiocheckclass">
									      <input type="checkbox" value="certiyes" name="certificatesyes">Certificates
									    </label>
									    <label class="checkbox-inline forradiocheckclass">
									      <input  type="checkbox" value="onlybond" name="onlybond">Only Bond
									    </label>
								    </div>
								    <div class="form-group formGroupClassReg">
		                                <label for="dateofwalkin" class="labelClassRegStd">Date of walkin</label>
		                                <input type="date" name="dateofwalkin" class="form-control formInputClassReg" id="dateofwalkin" placeholder="yyyy/mm/dd" required>
		                            </div>
		                            <div class="form-group formGroupClassReg">
		                                <label for="dateofjoin" class="labelClassRegStd">Date of join</label>
		                                <input type="date" name="dateofjoin" class="form-control formInputClassReg" id="dateofjoin" placeholder="yyyy/mm/dd" required>
		                            </div>
		                       </div>
		             		</div>
						</div>
						
						<div id="otherForm"  class="tab-pane fade formTabsClassBack">
							<h3 class="addFormHeadClass" style="margin-left: -2px;">Social Links</h3>
			                <div class="row">
	                       <div class="col-md-6">
	                            <div class="form-group formGroupClassReg">
	                                <label for="fblink" class="labelClassRegStd">Facebook Link</label>
	                                <input type="text" name="fblink" class="form-control formInputClassReg" id="fblink" placeholder="Enter Facebook Link" required>
	                            </div>
	                            <div class="form-group formGroupClassReg">
	                                <label for="linkedinlink" class="labelClassRegStd">Linkedin Link</label>
	                                <input type="text" name="linkedinlink" class="form-control formInputClassReg" id="linkedinlink" placeholder="Enter Linkedin Link" required>
	                            </div>
	                        </div>
	                        <div class="col-md-6"></div>
						</div>
						<!-- <div class="form-group" style="margin-top:10%;"> 
							<div class="col-sm-12">
							<input type="submit" onclick="sendData('registerStudent?','','',0); return false;" value="Register" class="btn btn-default regBtnNewStyle">
							</div>
						</div> -->
					</div>
				
			</div>
		</div>
		</div>
		</form>
	</div>
</div>

<!-- students details end-->
<!-- Trigger the modal with a button -->
<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Save To Excel</button> -->

<!-- Modal for save to excel-->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Select fields to save to Excel</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="0" checked>FullName</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="2" checked>BatchNo</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="3" checked>Email</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="4">Parent Name</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="6" checked>Student Mobile Number</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="7">Gender</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="8" checked>Date Of Birth</label>
					</div>
					
				</div>
				<div class="col-md-4">
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="9">Graduation City</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="11">Locality</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="14">Parent Mobile Number</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="15">Fee Paid</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="16">Fee Total</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="17" checked>SSC Percentage</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="18" checked>INTER Percentage</label>
					</div>
					
					
				</div>
				<div class="col-md-4">
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="19" checked>Degree Percentage</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="20">Graduation College</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="21">Graduation YOP</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="22">Graduation Type</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="23">Graduation Branch</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" value="26" checked>Aggregation Percentage</label>
					</div>
					<div class="checkbox">
					  <label><input type="checkbox" name="fieldToSelect" value="28">Join Date</label>
					</div>
					<button type="button" ng-click="view.JSONToCSVConvertor()" class="btn btn-default viewStdBtns" style="float:right;width:20% !important;">Save</button>
				</div>
			</div>
		</div>
      </div>
</div>

  </div>
</div>

<!-- Modal for save to excel-->
<div id="myModalMail" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" id="closeMailModal" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Send mail to selected students</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
        	<form id="mailDataFormInSDB" class="formClass">
		<div class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">To :</label>
                <div class="col-sm-7" id="mailToStudentTo">
                   <div style="padding:3%; text-align:justify;overflow:auto; border:1px solid black">
                   <span style="background-color:#e7e7e7;margin:3%;" ng-repeat="st in view.filteredData">{{st.email}}</span>
                   
                   </div>
                 
                </div>
                
                <div class="col-sm-2">
                    <input type="button" ng-click="isCCVisibile=true" class="btn btn-default" style="margin:2px 0px 2px 0px;" name="cc" value="CC"/>
                    <input type="button" ng-click="isBCCVisibile=true" class="btn btn-default" name="bcc" value="Bcc"/>
                </div>
                </div>
                
        </div>
        
      

        <div ng-show="isCCVisibile" class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Cc :</label>
                <div class="col-sm-7" id="mailToStudentCC">
                    <input type="text"class="form-control" ng-keyup="prepareCC()"  ng-model="ccrecipient" placeholder="Add Cc"/>
                   <div class="row">
                     <label class="control-label col-sm-3">CC:</label>
                      <span style="padding-left:2%;padding-right:2%;background-color:#e7e7e7;cursor:pointer;" ng-click="ccrecipients.splice($index,1)" ng-repeat="r in ccrecipients track by $index">{{r}}<i style="color:red" class="fas fa-times-circle"></i></span>
                        </div>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>

        <div ng-show="isBCCVisibile" class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Bcc :</label>
                <div class="col-sm-7" id="mailToStudentbCC">
                    <input type="text"class="form-control" ng-keyup="prepareBCC()"  ng-model="bccrecipient" placeholder="Add Bcc"/>
                   
                     <div class="row">
                     <label class="control-label col-sm-3">BCC:</label>
                      <span style="padding-left:2%;padding-right:2%;background-color:#e7e7e7;cursor:pointer;" ng-click="bccrecipients.splice($index,1)" ng-repeat="r in bccrecipients track by $index">{{r}}<i style="color:red" class="fas fa-window-close"></i></span>
                        </div>
                   
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>
        
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Subject :</label>
                <div class="col-sm-7">
                    <textarea ng-model="subject" class="form-control" style="height: 40px !important;" placeholder="Enter the subject" rows="3" required></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>


        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Message :</label>
                <div class="col-sm-7">
                    <textarea ng-model="message" class="form-control" style="height: 250px !important;" placeholder="Enter your message" rows="30"></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        <div class="row" style="margin:1% 0% 1% 0% !important;">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <input type="submit" ng-click="sendMail()" class="btn btn-default viewTableBtn" style="width:50% !important;margin:auto !important;display:block !important;" value="send"/>
            </div>
            <div class="col-md-2"></div>
        </div>
            </form>

		</div>
	  </div>
  	</div>
</div>
</div>
	
<!------------------------------------------------- student view div begin ---------------------------------------------------------------->    

<div id="stArea" style="display:none;border-radius:5px; margin-top: 15px;">
<div class="container-fluid">
	<div style="padding:0% 5% 0% 3.3%;">
		<div class="row">
			<div class="col-md-3"><h1 class="stdHeadhOneForMainHead">Student Details</h1></div>
			<div class="col-md-9"><p class="resultNumClass">{{fstudentsList.length}} / {{view.studentsList.length}}</p></div>
		</div>
        <div style="border-bottom: 1px solid #dbdbdb !important;height: 12px;margin-left:2%;"></div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="row" style="padding:1% 0% 0% 2.5%;">
				<div class="col-md-3">
	                <div class="input-group">
	                    <input type="text" ng-model="studentSearchStr" class="form-control inputFirstBox" name="allfields" placeholder="Search Student">
	                    <span class="input-group-addon search-btn"><i class="fa fa-search" aria-hidden="true"></i></span>
	                    <!--<span class="input-group-addon search-btn"><i class="fa fa-question" aria-hidden="true"></i></span>-->
	                </div>
	            </div>
	            <div class="col-md-3"><button class="advancedSearchBtn" data-toggle="modal" data-target="#myModalAdv">Advanced Search <i class="fa fa-search-plus" style="margin-left: 5% !important;" aria-hidden="true"></i></button></div>
                <div class="col-md-2 theadTextDataClass" style="text-align:right;">
					<button onclick="displayDiv('stArea')" ng-click="view.requestAllStudents()" class="dropbtn">Reload Data</button>	
                </div>
                <div class="col-md-2"><button class="dropbtn" style="width:100%;float:right;" ng-click="view.resetFilters()"><i class="fa fa-tag" style="" aria-hidden="true"></i> Reset Fltrs</button></div>
                <div class="col-md-2 dropdown dropdownClass">
				 	<button class="dropbtn" style="width:99%;"><i class="fa fa-bars" style="" aria-hidden="true"></i> Actions</button>
				<div class="dropdown-content">
				    <a data-toggle="modal" data-target="#myModalMail">Send Mail</a>
				    <a data-toggle="modal" data-target="#myModal">Save To Excel</a>
				</div>
            	</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
		<div class="col-md-9">
			<div class="row" style="padding:1% 0% 0% 2.5%;">
               <div class="col-md-12">
                   <div class="searchFieldsClass" style="height: 38px;">
                   		<div class="row">
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1">YOP</p></div> -->
                   			<div class="col-md-2">
                   				<!-- <div ng-dropdown-multiselect="" options="example14data" selected-model="example14model" checkboxes="true" extra-settings="example14settings"></div> -->
                   				<!-- <select ng-model="yearOfPass" id="multi-select-demoyop" multiple="multiple" style="width:15%;float:left;">
									<option value='2019'>2019</option>
									<option value='2018'>2018</option>
									<option value='2017'>2017</option><option value='2016'>2016</option>
									<option value='2015'>2015</option><option value='2014'>2014</option>
									<option value='2013'>2013</option><option value='2012'>2012</option>
		                        </select>  -->
		                        <div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select YOP
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;height:200px;overflow-y:scroll;" ng-model="yearOfPass">
								    
								      <li ng-repeat="yV in yearValues"><a tabindex="-1" href="#"><input type="checkbox" ng-model="checkedYears[$index]" ng-true-value="{{yV}}" ng-false-value="-1"/> {{yV}}</a></li> 
								    </ul>
								  </div>
                   			</div>
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1">Batches</p></div> -->
                   			<div class="col-md-2">
                   				<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Batch
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;height:200px;overflow-y:scroll;" ng-model="batchNumber">
	
								      	<li ng-repeat="b in batches"><a tabindex="-1" href="#"><input ng-model="checkedBatches[$index]" ng-true-value="'{{b}}'" ng-false-value="-1" type="checkbox"/>{{b}}</a></li>
								     
								    </ul>
								  </div>
	                   			<!-- <select ng-model="batchNumber" id="multi-select-demobatch" multiple="multiple" style="width:15%;float:left;">
									<c:forEach items="${batches }" var="b">
									<option value='${b.getBatchNumber() }'>${b.getBatchNumber() }</option>
									</c:forEach>
		                         </select> -->	
	                   		</div>
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1">Branch</p></div> -->
                   			<div class="col-md-2">
                   				<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select Branch
								    <span class="caret"></span></button>
								    <ul ng-model="branchName" class="dropdown-menu" style="font-size:12px;font-family: Segoe UI Semibold;height: 200px;overflow-y: scroll;">
								     
								      <li ng-repeat="bV in branchValues"><a tabindex="-1" href="#"><input type="checkbox" ng-model="checkedBranches[$index]" ng-true-value="'{{bV}}'" ng-false-value="'NA'"/>{{bV}}</a></li>
								      
								    </ul>
								  </div>
	                           </div>
                   			<!-- <div class="col-md-1"><p class="selectBoxClass1" style="padding-left:1px !important;">GradType</p></div> -->
                   			<div class="col-md-2">
                   				<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select FeeType
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;">
								      <li><a tabindex="-1" href="#"><input ng-model="Paid" type="checkbox" value="paid"/> Paid</a></li>
								      <li><a tabindex="-1" href="#"><input ng-model="pPaid" type="checkbox" value="partiallypaid"/> Partially Paid</a></li>
									  <li><a tabindex="-1" href="#"><input ng-model="free" type="checkbox" value="freefees"/> Free</a></li>
								      <li><a tabindex="-1" href="#"><input ng-model="nPaid" type="checkbox" value="notpaid"/> Not Paid</a></li>
								    </ul>
								  </div>
			                </div>
			                <div class="col-md-2">
			                	<div class="dropdown" style="margin-top:-2% !important;">
								    <button class="btn btn-default dropdown-toggle dropMultiSelectBtns" type="button" data-toggle="dropdown">Select ST Status
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu" style="font-size:12px;">
								      <li><a tabindex="-1" href="#"><input type="checkbox" ng-model="activeStatus" value="active"/> Active</a></li>
								      <li><a tabindex="-1" href="#"><input type="checkbox" ng-model="doneStatus" value="done"/> InActive</a></li>
								      <li><a tabindex="-1" href="#"><input type="checkbox" ng-model="placedStatus" value="placed"/> Placed</a></li>
								    </ul>
								</div>
			                </div>
			                <div class="col-md-2">
			                   
                   			</div>
                   		</div>
                   </div>
               </div>
           </div>
           	<!-- Modal -->
		  	<div class="modal fade" id="myModalAdv" role="dialog" style="top:2% !important;">
		        <div class="modal-dialog modal-lg">
		        
		          <!-- Modal content-->
		          <div class="modal-content"  style="margin-top:7%;margin-left:-10%;border-radius:0px !important;border:5px solid #000;">
		            <div class="modal-header">
		              <button type="button" class="close" data-dismiss="modal">&times;</button>
		              <h4 class="modal-title" style="font-size: 20px !important;font-family: Segoe UI Semibold;font-weight: normal;">Advanced Search</h4>
		            </div>
		            <div class="modal-body">
		              <p>Select Search Criteria</p>
		            </div>
		            <div class="modal-footer" style="margin-top:-2% !important;background-color: #f3f4f9;">
		              <div class="row" style="border:1px solid #e5e5e5 !important;">
                   			<div class="col-md-6 modelTableClass" style="pading:1%;">
                   				<table style="width:100%">
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">SSC :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='SSC Percentage' ng-model="SSC" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Inter :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='Inter Percentage' ng-model="inter" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Degree :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='Degree Percentage' ng-model="degree" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Maths(10Th) :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='10Th Math Marks' ng-model="sscMaths" class='form-control inputFieldClass'></td>
                   					</tr>
                   					<tr>
                   						<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Maths(12Th)  :</p></td>
                   						<td><input type='text' style="margin-left: 3.5%;" placeholder='12Th Math Marks' ng-model="interMaths" class='form-control inputFieldClass'></td>
                   					</tr>
                   				</table>
                   			</div>
                   			<div class="col-md-6 modelTableClass" style="pading:1%;">
                   			<table style="width:100%">
                   				
                   				
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">Parent Name :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='Parent Name' ng-model="parentName" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">City :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='City Name' ng-model="city" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">DOB :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='yyyy-mm-dd' ng-model="dob" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">GraduationCity :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='GraduationCity Name' ng-model="graduationCity" class='form-control inputFieldClass'></td>
                   				</tr>
                   				<tr>
                   					<td><p class="selectBoxClass1" style="padding-left:1px !important;padding-top: 6% !important;">College Name :</p></td>
                   					<td><input type='text' style="margin-left: 3.5%;" placeholder='College Name' ng-model="graduationCollege" class='form-control inputFieldClass'></td>
                   				</tr>
                   			</table>
                    	</div>
		              </div>
		              <div class="row" style="margin-top:1%;">
		              	<!-- <div class="col-md-4"></div> -->
		              	<div class="col-md-12">
		              		<button data-dismiss="modal" class="modelSearchBtn close">Search</button>
		              	</div>
		              	<!-- <div class="col-md-2">
		               		<button class="modelCancleBtn">Cancle</button>
		              	</div>
		              	<div class="col-md-4"></div> -->
		              </div>
		            </div>
		          </div>
		         </div>
		      </div>
		      
		      <!-- Modal -->
		  	<div class="modal fade" id="myModalProfile" role="dialog" style="top:2% !important;">
		        <div class="modal-dialog modal-lg">
		        
		          <!-- Modal content-->
		          <div class="modal-content"  style="margin-top:7%;margin-left:-10%;border-radius:0px !important;border:5px solid #000;">
		            <div class="modal-header">
		              <button type="button" class="close" data-dismiss="modal">&times;</button>
		              <h4 class="modal-title" style="font-size: 20px !important;font-family: Segoe UI Semibold;font-weight: normal;">{{view.student.fullName}}</h4>
		            </div>
		            <div class="modal-body">
		              <p>Complete Details of student</p>
		            </div>
		            <div class="modal-footer" style="margin-top:-2% !important;padding:0px 0px 0px -5px !important">
		              <div class="row" style="height:360px;">
		                  <div class="col-md-4"></div>
		                  <div class="col-md-8"></div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
           <div class="row" style="padding:0% 0.4% 0% 3.2%;">
            <!--<div class="col-md-12 scrollbar" style="width:100.6%;border-bottom:1px solid gray" id="style-7">
               <div class="force-overflow"></div>
                   <table class="table table-bordered tableNewClass" id="table1">
                       <thead class="theadBackClass">
                           <tr>
                               <th rowspan="2"class="theadTextDataClass" style="width:2%;">
                               <input ng-model="checkAll" type='checkbox' ng-click='selectAll()' type="checkbox"/></th>
                               <th rowspan="2"class="theadTextDataClass" style="width:15%;cursor:pointer" ng-click="sort('fullName')">Name
                               <span class="glyphicon sort-icon" ng-show="sortKey=='fullName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('batchNumber')" style="cursor:pointer">Batch
								<span class="glyphicon sort-icon" ng-show="sortKey=='batchNumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>                              	
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('graduationYOP')" style="cursor:pointer">YOP
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationYOP'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> 
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('graduationBranch')" style="cursor:pointer">Branch
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationBranch'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th colspan="3" class="theadTextDataClass">Percentages</th>
                               <th colspan="2" class="theadTextDataClass">Math Scores</th>
                               <th colspan="3" class="theadTextDataClass">Progress</th>
                               <th colspan="2" class="theadTextDataClass">Performance</th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer">Duration</th>
                           </tr>
                           <tr class="theadBackClass">
                               <th class="theadTextDataClass" style="border-right: 1px solid #ddd !important;cursor:pointer" >10th
                               </th>
                               <th class="theadTextDataClass" ng-click="sort('interMaths')" style="cursor:pointer">12th
                               <span class="glyphicon sort-icon" ng-show="sortKey=='interMaths'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>  
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer">G
                               </th>
                               <th class="theadTextDataClass">10th</th>
                               <th class="theadTextDataClass">12th</th>
                               <th class="theadTextDataClass">Apti</th>
                               <th class="theadTextDataClass">Java</th>
                               <th class="theadTextDataClass">Com</th>
                               <th class="theadTextDataClass">Att</th>
                               <th class="theadTextDataClass">Rank</th>
                           </tr>
                       </thead>
                       <div class="a">
                       <tbody style="height:400px;overflow-y:scroll">
                       
                           <tr ng-repeat="t in ( fstudentsList= (view.studentsList | filter:studentSearchStr | orderBy:sortKey:reverse | filter: { graduationCity: graduationCity, city: city, graduationCollege: graduationCollege, parentName: parentName, graduationType: graduationType, gender: genderI} | filter: sscFilter | filter: interFilter | filter: aggregateFilter | filter: degreeFilter | filter: feeFilter | filter: yearOfPassFilter  | filter: sscMathsFilter | filter: interMathsFilter | filter: branchFilter | filter: batchFilter | filter: statusFilter ) )"  ng-click='view.studentDetails(t,$event)'>
                               <td ng-style="t.status=='active'?{'border-left':'3px solid green'}: t.status=='placed' ? { 'border-left':'3px solid blue'} : {'border-left':'3px solid red'}" class="theadTextDataClass">
                             
                               <input ng-click="view.checkStudent(t,$event)" type="checkbox"/></td>
                               <td class="theadTextDataClass">
                 					<p style="text-align:left !important;cursor:pointer;">{{butifytheName(t.fullName)}}</p>
                 				</td>
                               <td class="theadTextDataClass"><span>{{t.batchNumber}}</span></td>
                               <td class="theadTextDataClass">{{t.graduationYOP}}</td>
                               <td class="theadTextDataClass">{{t.graduationBranch}}</td>
                               <td class="theadTextDataClass">{{t.sscPercentage}}</td>
                               <td class="theadTextDataClass">{{t.interPercentage}}</td>
                               <td class="theadTextDataClass">{{t.graduationPercentage}}</td>
                               <td class="theadTextDataClass">{{t.sscMaths}}</td>
                               <td class="theadTextDataClass">{{t.interMaths}}</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">
                               <p style="float:left;" ng-if="findDuration(t.joinDate) == 'NA'" class="feeNotificationDefault"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 100 " class="feeNotificationRed"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 70 && findDuration(t.joinDate) <100" class="feeNotificationYellow"></p><p style="float:left;" ng-if="findDuration(t.joinDate) < 70" class="feeNotificationGreen"></p>
                               {{findDuration(t.joinDate)}}</td>
                           </tr>
                       </tbody> 
                   </table>
               </div>-->
               
               
               
               
               <!-- Traing to fix table heading -->
               
               <section class="">
               <div class="col-md-12 scrollbar" style="width:100.6%;border-bottom:1px solid gray" id="style-7">
               
                   <table class="table table-bordered tableNewClass">
                       <thead class="theadBackClass">
                           <tr>
                               <th rowspan="2"class="theadTextDataClass" style="width:2%;">
                               <input ng-model="checkAll" type='checkbox' ng-click='selectAll()' type="checkbox"/></th>
                               <th rowspan="2"class="theadTextDataClass" style="width:15%;cursor:pointer" ng-click="sort('fullName')">Name
                               <span class="glyphicon sort-icon" ng-show="sortKey=='fullName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('batchNumber')" style="cursor:pointer">Batch
								<span class="glyphicon sort-icon" ng-show="sortKey=='batchNumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>                              	
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('graduationYOP')" style="cursor:pointer">YOP
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationYOP'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> 
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('graduationBranch')" style="cursor:pointer">Branch
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationBranch'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th colspan="3" class="theadTextDataClass">Percentages</th>
                               <th colspan="2" class="theadTextDataClass">Math Scores</th>
                               <th colspan="3" class="theadTextDataClass">Progress</th>
                               <th colspan="2" class="theadTextDataClass">Performance</th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer">Duration</th>
                           </tr>
                           <tr class="theadBackClass">
                               <th class="theadTextDataClass" style="border-right: 1px solid #ddd !important;cursor:pointer" >10th
                               </th>
                               <th class="theadTextDataClass" ng-click="sort('interMaths')" style="cursor:pointer">12th
                               <span class="glyphicon sort-icon" ng-show="sortKey=='interMaths'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>  
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer">G
                               </th>
                               <th class="theadTextDataClass">10th</th>
                               <th class="theadTextDataClass">12th</th>
                               <th class="theadTextDataClass">AVG-Marks</th>
                                      <th class="theadTextDataClass">Att</th>
                               <th class="theadTextDataClass">Rank</th>
                               <th class="theadTextDataClass">Att</th>
                               <th class="theadTextDataClass">Rank</th>
                           </tr>
                       </thead>
                       <tbody style="height:400px;overflow-y:scroll">
                       
                           <tr ng-repeat="t in ( fstudentsList= (view.studentsList | filter:studentSearchStr | orderBy:sortKey:reverse | filter: { graduationCity: graduationCity, city: city, graduationCollege: graduationCollege, parentName: parentName, graduationType: graduationType, gender: genderI} | filter: sscFilter | filter: interFilter | filter: aggregateFilter | filter: degreeFilter | filter: feeFilter | filter: yearOfPassFilter  | filter: sscMathsFilter | filter: interMathsFilter | filter: branchFilter | filter: batchFilter | filter: statusFilter ) )"  ng-click='view.studentDetails(t,$event)'>
                               <td ng-style="t.status=='active'?{'border-left':'3px solid green'}: t.status=='placed' ? { 'border-left':'3px solid blue'} : {'border-left':'3px solid red'}" class="theadTextDataClass">
                             
                               <input ng-click="view.checkStudent(t,$event)" type="checkbox"/></td>
                               <td class="theadTextDataClass">
                 					<p style="text-align:left !important;cursor:pointer;">{{butifytheName(t.fullName)}}</p>
                 				</td>
                               <td class="theadTextDataClass"><span>{{t.batchNumber}}</span></td>
                               <td class="theadTextDataClass">{{t.graduationYOP}}</td>
                               <td class="theadTextDataClass">{{t.graduationBranch}}</td>
                               <td class="theadTextDataClass">{{t.sscPercentage}}</td>
                               <td class="theadTextDataClass">{{t.interPercentage}}</td>
                               <td class="theadTextDataClass">{{t.graduationPercentage}}</td>
                               <td class="theadTextDataClass">{{t.sscMaths}}</td>
                               <td class="theadTextDataClass">{{t.interMaths}}</td>
                               <td class="theadTextDataClass" ng-style="getIndcolor(t.avgMarks)">{{view.convertToInt(t.avgMarks)}}<small>({{t.examsTaken}})</small></td>
                                <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">{{getAttOfStudent(t)}}</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">
                               <p style="float:left;" ng-if="findDuration(t.joinDate) == 'NA'" class="feeNotificationDefault"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 100 " class="feeNotificationRed"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 70 && findDuration(t.joinDate) <100" class="feeNotificationYellow"></p><p style="float:left;" ng-if="findDuration(t.joinDate) < 70" class="feeNotificationGreen"></p>
                               {{findDuration(t.joinDate)}}</td>
                           </tr>
                       </tbody> 
                   </table>
               </div>
               </section>
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               <!-- <div class="col-md-12" style="width:100.6%;border-bottom:1px solid gray">
               		<table class="table table-bordered tableNewClass">
                       <thead class="theadBackClass">
                           <tr>
                               <th rowspan="2"class="theadTextDataClass" style="width:2%;">
                               <input ng-model="checkAll" type='checkbox' ng-click='selectAll()' type="checkbox"/></th>
                               <th rowspan="2"class="theadTextDataClass" style="width:15%;cursor:pointer" ng-click="sort('fullName')">Name
                               <span class="glyphicon sort-icon" ng-show="sortKey=='fullName'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('batchNumber')" style="cursor:pointer">Batch
								<span class="glyphicon sort-icon" ng-show="sortKey=='batchNumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>                              	
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('graduationYOP')" style="cursor:pointer">YOP
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationYOP'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> 
                               </th>
                               <th rowspan="2" class="theadTextDataClass" ng-click="sort('graduationBranch')" style="cursor:pointer">Branch
                               	<span class="glyphicon sort-icon" ng-show="sortKey=='graduationBranch'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                               </th>
                               <th colspan="3" class="theadTextDataClass">Percentages</th>
                               <th colspan="2" class="theadTextDataClass">Math Scores</th>
                               <th colspan="3" class="theadTextDataClass">Progress</th>
                               <th colspan="2" class="theadTextDataClass">Performance</th>
                               <th rowspan="2" class="theadTextDataClass" style="cursor:pointer">Duration</th>
                           </tr>
                           <tr class="theadBackClass">
                               <th class="theadTextDataClass" style="border-right: 1px solid #ddd !important;cursor:pointer" >10th
                               </th>
                               <th class="theadTextDataClass" ng-click="sort('interMaths')" style="cursor:pointer">12th
                               <span class="glyphicon sort-icon" ng-show="sortKey=='interMaths'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>  
                               </th>
                               <th class="theadTextDataClass" style="cursor:pointer">G
                               </th>
                               <th class="theadTextDataClass">10th</th>
                               <th class="theadTextDataClass">12th</th>
                               <th class="theadTextDataClass">Apti</th>
                               <th class="theadTextDataClass">Java</th>
                               <th class="theadTextDataClass">Com</th>
                               <th class="theadTextDataClass">Att</th>
                               <th class="theadTextDataClass">Rank</th>
                           </tr>
                       </thead>
                   </table>
                   <div class="scrollbar" style="height:400px;overflow-y:scroll" id="style-7">
                   <div class="force-overflow"></div>
                   <table class="table table-bordered tableNewClass">
                   <tbody style="">
                       
                           <tr ng-repeat="t in ( fstudentsList= (view.studentsList | filter:studentSearchStr | orderBy:sortKey:reverse | filter: { graduationCity: graduationCity, city: city, graduationCollege: graduationCollege, parentName: parentName, graduationType: graduationType, gender: genderI} | filter: sscFilter | filter: interFilter | filter: aggregateFilter | filter: degreeFilter | filter: feeFilter | filter: yearOfPassFilter  | filter: sscMathsFilter | filter: interMathsFilter | filter: branchFilter | filter: batchFilter | filter: statusFilter ) )"  ng-click='view.studentDetails(t,$event)'>
                               <td ng-style="t.status=='active'?{'border-left':'3px solid green'}: t.status=='placed' ? { 'border-left':'3px solid blue'} : {'border-left':'3px solid red'}" class="theadTextDataClass">
                             
                               <input ng-click="view.checkStudent(t,$event)" type="checkbox"/></td>
                               <td class="theadTextDataClass">
                 					<p style="text-align:left !important;cursor:pointer;">{{butifytheName(t.fullName)}}</p>
                 				</td>
                               <td class="theadTextDataClass"><span>{{t.batchNumber}}</span></td>
                               <td class="theadTextDataClass">{{t.graduationYOP}}</td>
                               <td class="theadTextDataClass">{{t.graduationBranch}}</td>
                               <td class="theadTextDataClass">{{t.sscPercentage}}</td>
                               <td class="theadTextDataClass">{{t.interPercentage}}</td>
                               <td class="theadTextDataClass">{{t.graduationPercentage}}</td>
                               <td class="theadTextDataClass">{{t.sscMaths}}</td>
                               <td class="theadTextDataClass">{{t.interMaths}}</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">$80</td>
                               <td class="theadTextDataClass">
                               <p style="float:left;" ng-if="findDuration(t.joinDate) == 'NA'" class="feeNotificationDefault"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 100 " class="feeNotificationRed"></p><p style="float:left;" ng-if="findDuration(t.joinDate) > 70 && findDuration(t.joinDate) <100" class="feeNotificationYellow"></p><p style="float:left;" ng-if="findDuration(t.joinDate) < 70" class="feeNotificationGreen"></p>
                               {{findDuration(t.joinDate)}}</td>
                           </tr>
                   
                   </table>
                   
                   </div>
               </div>-->
           </div>
		</div>
		<div class="col-md-3" style="position:sticky !important;top:0;">
			<div class="row">
				<div class="col-md-12">
					<p class="stdHeadhOne">{{butifytheName(view.student.fullName)}}
					<span ng-click="editableForm.$show()" ng-show="!editableForm.$visible" title="Edit Student"><i class="fas fa-edit"></i></span>
                     <span title="Student Details"><a style="text-decoration:none;color:#000" href="studentProfile/{{view.student.student_id}}" target="_blanck"><i class="fas fa-info-circle"></i></a></span>
                     <span title="Download Resume"><a style="text-decoration:none;color:#000" href="downloadResume/{{view.student.email}}/any" target="_blanck"><i class="fas fa-download"></i></a></span> 
					<small><p class="feeNotificationGreen"></p>{{view.student.lastlogin}}</small></p>
					
				</div>
			</div>
			<!-- <div style="border-bottom: 1px solid #dbdbdb !important;height: 5px;margin-top:-1%;"></div> -->
			<div class="nav nav-tabs scrollmenu" id="menu-center">
             <a data-toggle="tab" href="#personal">Personal</a>
             <a data-toggle="tab" href="#eduaction">Education</a>
             <a data-toggle="tab" href="#fee">Fee</a>
             <a data-toggle="tab" href="#address">Address</a>
             <a data-toggle="tab" href="#Status">Status</a>
             
           </div>
           <form editable-form name="editableForm" onaftersave="saveStudent()">
			<div class="tab-content">
			
			<div style="padding-top:20%;padding-bottom:20%;text-align:center;font-family:monoscope;color:#77021d" id="welcome" class="tab-pane fade in active">
			     WELCOME - STUDENT INFORMATION
			</div>
			
			
			
	        <div id="personal" class="tab-pane fade">
	          <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> FullName</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.fullName" e-name="fullName"> {{view.student.fullName}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> ParentName</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.parentName" e-name="parentName"> {{view.student.parentName}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Gender</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-select="view.student.gender" e-name="gender" e-ng-options="s.value as s.text for s in genders"> {{view.student.gender}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> DOB</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-bsdate="view.student.dob" e-is-open="opened.$data" e-name="dob" e-datepicker-popup="dd-MMMM-yyyy"> {{view.student.dob}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.email" e-name="email"> {{view.student.email}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-mobile" aria-hidden="true"></i> Mobile</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.mobile" e-name="mobile"> {{view.student.mobile}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-mobile" aria-hidden="true"></i> Parent Mobile</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.mobile_Parent" e-name="mobile_Parent"> {{view.student.mobile_Parent}}</td>
       				</tr>
       			</thead>
       		</table>
	        </div>
	        <div id="eduaction" class="tab-pane fade">
	        
	          	<table class="table" style="border:0px solid #fff !important;">
                   			<thead>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-users" aria-hidden="true"></i> Batch</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.batchNumber" e-name="batchNumber"> {{view.student.batchNumber}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> YOP</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails"  editable-text="view.student.graduationYOP" e-name="graduationYOP"> {{view.student.graduationYOP}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Graduation Type</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-select="view.student.graduationType" e-name="graduationType" e-ng-options="s.value as s.text for s in graduationTypes"> {{view.student.graduationType}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-calendar" aria-hidden="true"></i> Branch</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-select="view.student.graduationBranch" e-name="graduationBranch" e-ng-options="s.value as s.text for s in graduationBranches"> {{view.student.graduationBranch}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-university" aria-hidden="true"></i> College</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.graduationCollege" e-name="graduationCollege"> {{view.student.graduationCollege}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> Grad City</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.graduationCity" e-name="graduationCity"> {{view.student.graduationCity}}</td>
                   				</tr>
                   				<tr>
                   					<th colspan="3" class="theadTextDataClassForDetails subTableHeadingOfEd" style="text-align:center !important;font-weight:600 !important;">% Percentages</th>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> 10Th</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.sscPercentage" e-name="sscPercentage"> {{view.student.sscPercentage}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> Inter</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.interPercentage" e-name="interPercentage"> {{view.student.interPercentage}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> Graduation</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.graduationPercentage" e-name="graduationPercentage"> {{view.student.graduationPercentage}}</td>
                   				</tr>
            					<tr>
              						<th colspan="3" class="theadTextDataClassForDetails subTableHeadingOfEd" style="text-align:center !important;font-weight:600 !important;">% MathScores</th>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> 10Th</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.sscMaths" e-name="sscMaths"> {{view.student.sscMaths}}</td>
                   				</tr>
                   				<tr>
                   					<td class="theadTextDataClassForDetails"><i class="fa fa-bar-chart" aria-hidden="true"></i> Inter</td>
                   					<td style="color:#444444 !important">:</td>
                   					<td class="theadTextDataClassForDetails" editable-text="view.student.interMaths" e-name="interMaths"> {{view.student.interMaths}}</td>
                   				</tr>
                   			</thead>
                   		</table>
	        </div>
	        <div id="fee" class="tab-pane fade">
	          <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-inr" aria-hidden="true"></i> TotalFee</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.feeTotal" e-name="feeTotal"> {{view.student.feeTotal}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-inr" aria-hidden="true"></i> FeePaid</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.feePaid" e-name="feePaid"> {{view.student.feePaid}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-inr" aria-hidden="true"></i> FeeDue</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails"> {{(view.student.feeTotal-view.student.feePaid)}}</td>
       				</tr>
       			</thead>
       		</table>
	        </div>
	        <div id="address" class="tab-pane fade">
	            <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails" style="width:18%;"><i class="fa fa-map-marker" aria-hidden="true"></i> H.No</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.locality" e-name="locality"> {{view.student.locality}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> City</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.city" e-name="city"> {{view.student.city}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> State</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-select="view.student.state" e-name="state" e-ng-options="s.value as s.text for s in states"> {{view.student.state}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> FaceBook Link</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.fbLink" e-name="fbLink"><a target="_blank" ng-href="{{view.student.fbLink}}"> {{view.student.fbLink}}</a></td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-globe" aria-hidden="true"></i> LinkedIn Link</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-text="view.student.lnLink" e-name="lnLink"><a target="_blank" ng-href="{{view.student.lnLink}}"> {{view.student.lnLink}}</a></td>
       				</tr>
       			</thead>
       		</table>
	        </div>
	        
	        <div id="Status" class="tab-pane fade">
	          <table class="table">
       			<thead>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Student Status</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-select="view.student.status" e-name="status" e-ng-options="s.value as s.text for s in statuses"> {{view.student.status}}</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i> Status Report</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails" editable-textarea="view.student.inactivereport" e-name="inactivereport"> {{view.student.inactivereport}}</td>
       				</tr>
       				<tr>
       				
       				<td style="text-align:center" colspan="3">
       				<span style="background-color:#77021d;padding: 2%;color:  white;font-weight: 550;cursor:  pointer;" ng-show="!showCompanyEdits" ng-click="showCompanyEdits=true">Update Drive Data</span>
       				
       				</td>
       				
       				</tr>
       				
       				<tbody ng-show="showCompanyEdits" id="companyEdits">
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Company Name</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       					<input ng-change="fetchCompanies()" list="companyNames" ng-model="companyName">
                        <datalist id="companyNames">
                        <option ng-repeat="c in companies" value="{{c.name}}" />
                       </datalist>
                  
       					</td>
       				</tr>
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Select Rounds You have Cleared</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       					
       					     <label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="WrittenRound_Status" type="checkbox"  name="levewritten" id="levewritten"> Written Test</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="ComsRound_Status" type="checkbox"  name="f2ftexhlevel1" id="f2ftexhlevel1">GD/JAM/Communication</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="TechnicalRound1_Status" type="checkbox" name="gdround" id="gdround"> Technical Level 1</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="TechnicalRound2_Status" type="checkbox"  name="jamround" id="jamround">Technical Level 2</label>
								<label class="checkbox"><input ng-true-value="'A'" ng-false-value="'NA'" ng-model="HRRound_Status" type="checkbox"  name="jamround" id="jamround" >HR/Final Level</label>
       					
       					</td>
       				</tr>
       				
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Any Bond ?</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       				        <label class="radio-inline"><input type="radio" ng-model="bond" value="YES"/> Yes</label>
			      			<label class="radio-inline"><input type="radio" checked ng-model="bond" value="NO" /> No</label>
                  
       					</td>
       				</tr>
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Bond Duration(In Months)</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       				      <input ng-model="bondduration" type="number" style="color:#000;" placeholder="Bond Duration in months"/>
       					</td>
       				</tr>
       				
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Any Submission of Original Certificates ?</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       				       <label class="radio-inline"><input type="radio" ng-model="certificates" value="YES" /> Yes</label>
					       <label class="radio-inline"><input type="radio" ng-model="certificates" value="NO" /> No</label>
       					</td>
       				</tr>
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Initial Salary</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       				      <input ng-model="initialSalary" type="text" placeholder="Initial Salary in Lacks Ex 3.4" name="initialsal"/>
       					</td>
       				</tr>
       				
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Later Salary</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       				      <input ng-model="laterSalary" type="text" placeholder="Enter Later Salary (if Any)" name="latersal"/>
       					</td>
       				</tr>
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Designation</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       				     <input ng-model="designation" type="text" placeholder="Enter Your designation" name="designation"  id="designation"/>
       					</td>
       				</tr>
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"><i class="fa fa-user" aria-hidden="true"></i>Technical Stack / Roles</td>
       					<td style="color:#444444 !important">:</td>
       					<td class="theadTextDataClassForDetails">
       				    <input ng-model="technicalstack" type="text" placeholder="Technical Stack or Role" name="technicalstack"/>
       					</td>
       				</tr>
       				
       				<tr>
       					<td class="theadTextDataClassForDetails"></td>
       					<td style="color:#444444 !important">
       					<button ng-click="saveDriveData()" id="saveDriveButton" class="btn btn-default" style="color:#00a69c;padding: 3% 10% !important;">SAVE</button>
       					
       					<span id="cancelDriveButton" class="btn btn-default" ng-click="showCompanyEdits=false;this.style.display='none'" style="color:red;border:1px solid red;padding: 3% 10% !important;">Cancel</span>
       					
       					</td>
       					<td class="theadTextDataClassForDetails">
       				   
       					</td>
       				</tr>
       				</tbody>
       			
       				
       			</thead>
       		</table>
	        </div>
		        
	        
	        <div class="row" ng-show="editableForm.$visible" >
              	<div class="col-md-1"></div>
              	<div class="col-md-5">
              		<button type="submit" class="modelSaveBtn" ng-disabled="editableForm.$waiting">Save</button>
              	</div>
              	<div class="col-md-5">
               		<button type="button" class="modelCancleBtn" ng-disabled="editableForm.$waiting" ng-click="editableForm.$cancel()">Cancel</button>
              	</div>
              	<div class="col-md-1"></div>
              </div>
	        </div>
	      	
	        </form>
	    </div>
	</div>
</div>
</div>
</div>

<!-- <div class='container-fluid' style='width:30%;position:fixed;right:0;bottom:0 !important;z-index:10;'><div class='row'>
<div class='col-md-6'><button class='btn btn-default saveBtnsInSearch' style='float:left !important;' data-toggle="modal" data-target="#myModalMail">Send Mail</button></div>
<div class='col-md-6'><button class='btn btn-default saveBtnsInSearch'  data-toggle="modal" data-target="#myModal" style='float:right !important;'>Save To Excel</button></div>
</div></div><br> -->

</div>

<!-- students view end-->
	
	
	
<!-- push a question div start-->

<div id="pushQuestion" style="display: none;border-radius:5px;">
	<p class="push">Push a Question To DB</p>
		<form id="pushQuestionForm" class="form-horizontal formClass" action="pushQuestion" method="get">
		  <h4 style="text-align:center;">Add Question</h4>
		<div class="form-group">
			<label class="control-label col-sm-4" for="question">Enter your Question:</label>
			<div class="col-sm-6 col-xs-12">
			  <textarea name="question" style="height:50px !important" class="form-control" rows="5"  id="questionM" required></textarea>
			</div>
			<div class="col-sm-2"></div>
	  	</div>
	  	
		<!--options starts-->
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionA">Enter option A:</label>
					<div class="col-md-2">
					<input type="text" name="optionA" class="form-control" id="optionAM" placeholder="Enter option A" required>
					</div>
					<label class="control-label col-md-2" for="optionB">Enter option B:</label>
					<div class="col-md-2">
					<input type="text" name="optionB" class="form-control" id="optionBM" placeholder="Enter option B" required>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionA">Enter option C:</label>
					<div class="col-md-2">
					<input type="text" name="optionC" class="form-control" id="optionCM" placeholder="Enter option C" required>
					</div>
					<label class="control-label col-md-2" for="optionB">Enter option D:</label>
					<div class="col-md-2">
					<input type="text" name="optionD" class="form-control" id="optionDM" placeholder="Enter option D" required>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	
				<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionE">Enter option E:</label>
					<div class="col-sm-2">
					  <input type="text" name="optionE" class="form-control" id="optionEM" placeholder="Enter option E" required>
					</div>
					<div class="col-smd-6"></div>
				</div>
				</div>
		<!-- options end here-->
	     
		<!-- select key and select difficulty level starts here-->
		
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					<label class="control-label col-md-2" for="optionA">select key:</label>
					<div class="col-md-2">
						<select class="form-control" style="height:32px !important;" name="qkey" id="qkey">
						<option value="A" selected>A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
						</select>
					</div>
					<label class="control-label col-md-2" for="optionB">select difficulty level:</label>
					<div class="col-md-2">
						<select class="form-control" style="height:32px !important;" name="difficulty" id="difficulty">
						<option value="Basic" selected>Basic</option>
						<option value="Easy one">Easy one</option>
						<option value="Moderate">Moderate</option>
						<option value="Advance">Not Easy</option>
						<option value="Expertise one">Expertise</option>
						</select>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		
		<!--select key and difficulty ends here--> 
		
	
		<!--enter topic and subject start  here -->
		
		<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2"></div>
					
					<label class="control-label col-md-2" for="subject">Enter subject:</label>
					<div class="col-md-2">
					<select name="subject" id="questionSubject" style="height:32px !important;" class="form-control">
					<option value="Java">Java</option>
					<option value="Math">Math</option>
					<option value="Linux">Linux And SQL</option>
					<option value="Comms">Comms</option>
					<option value="Misc">Misc</option>
					</select>
					
					</div>
					<label class="control-label col-md-2" for="topic">Enter topic:</label>
					<div class="col-md-2">
					<input type="text" list="topicSuggetions" name="topic" onkeyup="getTopicsList(this.value)" class="form-control" id="topicM" placeholder="Enter topic" required>
					<datalist id="topicSuggetions"></datalist>
					</div>
					
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		
		<!--enter topic and subject end here -->
		
		<div class="form-group">
			<label class="control-label col-sm-4" for="description">Enter Description:</label>
			<div class="col-sm-6">
			  <input type="text" name="description" class="form-control" id="descriptionM" placeholder="Enter Description" required>
			</div>
			<div class="col-sm-2"></div>
	  	</div>
	  
	  	<div class="form-group">
			<label class="control-label col-sm-4" for="explanation">Give Explanation :</label>
			<div class="col-sm-6">
			  <textarea name="explanation" style="height:50px !important"class="form-control" rows="5"  id="explanationM" required></textarea>
			</div>
			<div class="col-sm-2"></div>
		</div>	  
		
		<div class="form-group"> 
			<div class="col-sm-12 ">
			  <input type="submit" onclick="sendData('pushQuestion?','','',1); return false;" value="Push" class="btn btn-default sub"/>
			</div>
		</div>
	</form>
</div>
			
<!-- push a question end-->	
	
	
	
<!-- create your customized question paper-->

<div id="createQuestion" style="display:none;border-radius:5px;padding-top: 20px;">
	<div class="row">
		
			<div class="col-md-4 col-sm-4 col-xs-12" style="border-right:1px solid #4e4e4e;">
			<form id="createQuestionPaperForm">
			<p class="push">Create your Customized Question Paper<p>
			
			<div class="form-group">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-12"><small id='qcount'></small></div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="col-md-6">
									<label class="control-label">selected Questions:</label>
								</div>
								<div class="col-md-6">
									<input class="form-control" style="height:30px !important;" type="text" name="questions" id="qts" readonly>
								</div>
							</div>
						</div>
					</div>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-5 col-sm-6 col-xs-12">
						<label class="control-label testname">Enter Test Name:</label>
					</div>
					<div class="col-md-7 col-sm-6 col-xs-12">
						<input class="form-control" type="text" name="testName" id="testNameM">
					</div>
				</div>
				</div><br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
					  <small>Note : Do not select batch if you don't want to push now</small>
						<label class="control-label testfor">Test for:</label>
					</div>	
					<div class="col-md-6 col-sm-6 col-xs-12">
					<c:forEach items="${JspServices.getActiveBatch(batches)}" var="b">
						<label class="checkbox"><input type="checkbox" name="BatchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
					</c:forEach>
					</div>
				</div>
				</div><br>
				
				<div style="display:none">
				<input type="text" name="qp_type" value="Multiple">
				</div>
				
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Test Duration in Minutes:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control" type="number" id="durationM" name="duration">
					</div>
				</div>
				</div>
				<br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Paper Type:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="radio"><input type="radio" value="Y" name="isPractice" checked>Practice</label>
						<label class="radio"><input type="radio" value="N" name="isPractice">Test to Examine Students</label>
					</div>
				</div>
				</div><br>
				<input type="submit" onclick="sendData('createQuestionPaper?','','',2); return false;"  value="Create" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;"><br>
			</form>
			</div>
			<div class="col-md-8 col-sm-8 col-xs-12">
				<!-- searchquestion here-->
				
				<p class="searchQPClass">SearchQuestion from DB</p>
				<div class="row">
					
					<br>
					<div class="row">
					<div class="form-group">
					
					<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="row" style="border:1px solid #ded4d4">
					<div class="col-md-6 col-sm-6 col-xs-12">
					<label class="control-label col-md-2" for="subject">Subject:</label>
					   <select onchange="setTopicsList(this.value)" name="subject" id="subjectInSearch" style="height:32px !important;" class="form-control">
					<option selected>select</option>
					<option value="Java">Java</option>
					<option value="Math">Math</option>
					<option value="Linux">Linux And SQL</option>
					<option value="Comms">Comms</option>
					<option value="Misc">Misc</option>
					</select>
					 </div>
					 <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">Search by topic :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQuestionsByTopic/',this.value,'qArea',-1)" id="topicsInSearch">
							
							</select>
							</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search By Admin :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQuestionsByAdmin/',this.value,'qArea',-1)" class="select">
							<option value="cv" style="font-size:14px;">CV</option>
							<option value="shivakumar" style="font-size:14px;">Shivakumar</option>
							<option value="sandeep" style="font-size:14px;">Sandeep</option>
							<option value="Akanksha" style="font-size:14px;">Akanksha</option>
							<option value="rajkiran" style="font-size:14px;">Rajkiran</option>
							<option value="karunakar" style="font-size:14px;">Karunakar</option>
							<option value="lalitha" style="font-size:14px;">Lalitha</option>
							</select>
						</div>
						</div>
						
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search by question :</label><br>
							<input class="form-control" type="text" style="height:30px !important;" onkeyup="sendData('getQuestionsByQuestion/',this.value,'qArea',-1)" id="topic">
						</div>
						</div>
						
					</div>
					
					</div>
				<br>
						
				<div class="container-fluid" style="width:100%;border:1px solid #4e4e4e;height:330px;overflow:scroll;" id='qArea'></div>
			</div>
			</div>

	</div>
</div>

<!-- question paper ends here-->



	
<!--List Question papers begin -->

<div id="qpapers" style="display:none;border-radius:5px;padding-top: 20px;">
	 <div class="row">
	 	<div class="col-sm-3 scrollClass"  style="border:1px solid black">
	 		<div id="listQPapers"></div>
	 	</div>
	 	
	 <!-- Question paper begin -->
	 
	 	<div class="col-sm-9"  style="border:1px solid black">
			 <div id="viewQPaper">
			Questions Here
			 </div>
	 	</div>
	 
	 <!-- Question paper end -->
	 
	 </div>
</div>
	
<!-- List Question papers end -->
	


<!-- QAPush Question to begin -->

<div id="QApushQuestion" style="display:none;border-radius:5px;">
	<p class="push">Push a Question To DB</p>
		<form id="QApushQuestionForm" class="form-horizontal formClass">
			  <div class="form-group">
				<h4 style="text-align:center;">Add Question</h4>
				<label class="control-label col-sm-4" for="question">Enter your Question:</label>
				<div class="col-sm-6 col-xs-12">
				  <textarea name="question" style="height:50px !important" class="form-control" rows="5"  id="questionQA" required></textarea>
				</div>
				<div class="col-sm-2"></div>
			  </div>
	  
			  
			  
			  <div class="form-group">
				<label class="control-label col-sm-4" for="subject">Select Subject :</label>
				<div class="col-sm-6">
				  <select name="subject" style="height:32px !important;" id="subjectInQA" class="form-control">
					
					<option value="Java">Java</option>
					<option value="Math">Math</option>
					<option value="Linux">Linux And SQL</option>
					<option value="Comms">Comms</option>
					<option value="Misc">Misc</option>
					</select>
				</div>
				<div class="col-sm-2"></div>
			  </div>
			  
			  <div class="form-group">
				<label class="control-label col-sm-4" for="topic">Enter Topic :</label>
				<div class="col-sm-6">
				  <input list="topicsListinQA" type="text" name="topic" onkeyup="getTopicsListQA(this.value)" class="form-control" id="topicQA" placeholder="Enter Topic" required>
				  <datalist id="topicsListinQA">
				  
				  </datalist>
				</div>
				<div class="col-sm-2"></div>
			  </div>
	     
	 <!-- select key and select difficulty level starts here-->
	 
	 	<div class="container-fluid">
			<div class="row">
				<div class="form-group">
					<label class="control-label col-md-4" for="optionB">Select difficulty level:</label>
					<div class="col-md-6">
					<select class="form-control" name="difficulty" id="difficulty" style="height:32px !important;">
						<option value="Basic" selected>Basic</option>
						<option value="Easy one">Easy one</option>
						<option value="Moderate">Moderate</option>
						<option value="Advance">Not Easy</option>
						<option value="Expertise one">Expertise</option>
					</select>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		
	<!--select key and difficulty ends here--> 
	
		  <div class="form-group">
			<label class="control-label col-sm-4" for="description">Enter Description:</label>
			<div class="col-sm-6">
			  <input type="text" name="description" class="form-control" id="descriptionQA" placeholder="Enter Description" required>
			</div>
			<div class="col-sm-2"></div>
		  </div>
		  
		  <div class="form-group"> 
			<div class="col-sm-offset-2 col-sm-10 ">
			  <input type="submit" value="Push" onclick="sendData('pushQAQuestion?','','',3); return false;" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;">
			</div>
		  </div>
	</form>	
</div>
	
<!-- QAPush Question to end -->
	


<!--  customized QA question paper-->
	
<div id="QAcreateQuestion" style="display:none;border-radius:5px;padding-top: 20px;">
	<div class="row">
		<form id="QAcreateQuestionPaperForm">
			<div class="col-md-4 col-sm-4 col-xs-12" style="border-right:1px solid #4e4e4e;">
			<p class="push">Create your Customized Question Paper<p>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-5 col-sm-6 col-xs-12">
						<label class="control-label testname">Enter Test Name:</label>
					</div>
					<div class="col-md-7 col-sm-6 col-xs-12">
						<input class="form-control" type="text" name="testName" id="testNameQA" required>
					</div>
				</div>
				</div><br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Test for:</label>
					</div>	
					<div class="col-md-6 col-sm-6 col-xs-12">
						<c:forEach items="${batches }" var="b">
						<label class="checkbox"><input type="checkbox" name="BatchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
						
					</c:forEach>
					</div>
				</div>
				</div><br>
				
				<div style="display:none">
				<input type="text" name="qp_type" value="QA">
				</div>
				
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Test Duration in Minutes:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control" type="number" id="durationQA" name="duration" required>
					</div>
				</div>
				</div>
				<br>
				<div class="row">
				<div class="form-group"> 
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="control-label testfor">Paper Type:</label>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<label class="radio"><input type="radio" value="Y" name="isPractice" checked>Practice</label>
						<label class="radio"><input type="radio" value="N" name="isPractice">Test to Examine Students</label>
					</div>
				</div>
				</div><br>
				<input type="submit" onclick="sendData('createQuestionPaper?','','QA',4); return false;"  value="Create" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;"><br>
			</div>
			<div class="col-md-8 col-sm-8 col-xs-12">
				<!-- searchquestion here-->
				<small id='QAqcount'></small>
				<p class="searchQPClass">SearchQuestion from DB</p>
				<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-md-5 col-sm-6 col-xs-12"></div>
							<div class="col-md-7 col-sm-6 col-xs-12">
								<div class="col-md-6">
									<label class="control-label">Your Selected Questions IDs:</label>
								</div>
								<div class="col-md-6">
									<input class="form-control" style="height:30px !important;" type="text" name="questions" id="QAqts" readonly>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="row" style="border:1px solid #ded4d4">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">Subject :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQAQuestionsBySubject/',this.value,'QAqArea',-1);setTopicsQA(this.value)">
							<option selected>select</option>
							<option value="Java">Java</option>
							<option value="Math">Math</option>
							<option value="Linux">Linux and SQL</option>
							
							<option value="Comms">Comms</option>
							
					 		<option value="Misc">Misc</option>
						   
							</select>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">Topic :</label><br>
							<select id="topicsListQA" onchange="getQuestionsByTopicQA(this.value)">
							
							</select>
							
							</div>
						</div>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search By Admin :</label><br>
							<select class="form-control" style="height:30px !important;" onchange="sendData('getQAQuestionsByAdmin/',this.value,'QAqArea',-1)" class="select">
							<option value="cv" style="font-size:14px;">CV</option>
							<option value="shivakumar" style="font-size:14px;">Shivakumar</option>
							<option value="sandeep" style="font-size:14px;">Sandeep</option>
							<option value="rajkiran" style="font-size:14px;">Rajkiran</option>
							<option value="rajkiran" style="font-size:14px;">Karunakar</option>
							</select>
						</div>
						</div>
						
						<div class="col-md-3 col-sm-3 col-xs-12" style="border:1px solid #ded4d4">
						<div class="form-group">
							<label class="control-label">Search by question :</label><br>
							<input class="form-control" type="text" style="height:30px !important;" onkeyup="sendData('getQAQuestionsByQuestion/',this.value,'QAqArea',-1)" id="topic">
						</div>
						</div>
					</div>
					</div>
				<br>
				<div class='row' style="pading:0 !important;"><div class='col-sm-5'></div><div class="col-sm-2" id="spinloader" class="spinLoader" style="display:none;"><i class="fa fa-spinner fa-spin" style="font-size:40px"></i><div class='col-sm-5'></div></div></div>
				<div class="container-fluid" style="width:100%;border:1px solid #4e4e4e;height:330px;overflow:scroll;" id='QAqArea'></div>
			</div>
			</div>
		</form>
	</div>
</div>

<!-- QAquestion paper ends here-->
	
	
	
<!--View QA begin -->

<div id="QAqpapers" style="display:none;border-radius:5px;padding-top: 20px;">
	<div class="row">
		<div class="col-sm-3"  style="border:1px solid black">
	 		<div id="listQAQPapers"></div>
	 	</div>
	 
	 <!-- Question paper begin -->
	 
	 	<div class="col-sm-9"  style="border:1px solid black">
	 		<div id="viewQAQPaper">Questions Here</div>
	 	</div>
	</div>
</div>

<!-- View QA end -->
	 


<!-- mail to batch start -->
	 
<div id="mailToBatch" style="display:none;border-radius:5px;">
    <div class="container-fluid">
        <p class="push">Mail to Batch</p>
        <form id="mailToBatchForm" class="formClass">
        <div class="row"><br>
           <div class="form-group">
               <label class="control-label col-sm-3" for="email">Select your batch :</label>
           <div class="col-sm-7">
           <c:forEach items="${batches }" var="b">
               <label class="checkbox-inline"><input type="checkbox" name="batch" onchange="setBatchMails(this)" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
           </c:forEach>
           <span id="errEmail" style="color:red;"></span>
           </div>
               <div class="col-sm-2"></div>
           </div>
        </div>
       
        <div id="multipleMails" style="display:none">
                
        </div>
        
        
         <div class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">To :</label>
                <div class="col-sm-7" id="batchMailButtons" style="border:1px solid black">
                   
                </div>
                <div class="col-sm-2">
                    <input type="button" onclick="displayD('ccrecipients')" class="btn btn-default" style="margin:2px 0px 2px 0px;" name="cc" id="cc" value="CC"/>
                    <input type="button" onclick="displayD('bccrecipients')" class="btn btn-default" name="bcc" id="bcc" value="Bcc"/>
                </div>
                </div>
        </div>

        <div class="row" style="margin-top:1% !important;display:none;" id="ccrecipients">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Cc :</label>
                <div class="col-sm-7" id="mailToBatchCC">
                    <input type="text"class="form-control"  name="ccrecipients" placeholder="Add Cc"/>
                     <i class="fa fa-plus-square" onclick="addCC('mailToBatchCC','ccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>

        <div class="row" style="margin-top:1% !important;display:none;" id="bccrecipients">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Bcc :</label>
                <div class="col-sm-7" id="mailToBatchbCC">
                    <input type="text"class="form-control"  name="bccrecipients" placeholder="Add Bcc"/>
                     <i class="fa fa-plus-square" onclick="addCC('mailToBatchbCC','bccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Subject :</label>
                <div class="col-sm-7">
                    <textarea name="subject" class="form-control" style="height: 40px !important;" id="subject" placeholder="Enter your subject" rows="3"></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Message :</label>
                <div class="col-sm-7">
                    <textarea name="message" class="form-control" style="height: 250px !important;" id="message" placeholder="Enter your message" rows="30" id="comment"></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        <div class="row" style="margin:1% 0% 1% 0% !important;">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <input type="submit" onclick="sendMail('sendMail','mailToBatchForm'); return false;" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;" value="send" id="send"/>
            </div>
            <div class="col-md-2"></div>
        </div>
      </form>
	</div>
</div>

<!-- mail to batch end -->
	 


<!-- mail to student start -->

<div id="mailToStudent" style="display:none;border-radius:5px;">
	<p class="push">Mail to Student or Other</p>
	<div class="container-fluid">
	<form id="mailToStudentForm" class="formClass">
		<div class="row" style="margin-top:1% !important;">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">To :</label>
                <div class="col-sm-7" id="mailToStudentTo">
                    <input list="singleStudentMailsList" type="text"class="form-control" onkeyup="getStudentsMails(this.value)"  name="recipients" id="recipientsSt" placeholder="Add recipients" required/>
                     <datalist id="singleStudentMailsList">
                     </datalist>
                     <i class="fa fa-plus-square" onclick="addCC('mailToStudentTo','recipients')" style="cursor:pointer" aria-hidden="true"></i>
                    
                     
                       <div id="mailToStudentTo"></div>
                </div>
                
                <div class="col-sm-2">
                    <input type="button" onclick="displayD('ccrecipientsSt')" class="btn btn-default" style="margin:2px 0px 2px 0px;" name="cc" id="cc" value="CC"/>
                    <input type="button" onclick="displayD('bccrecipientsSt')" class="btn btn-default" name="bcc" id="bcc" value="Bcc"/>
                </div>
                </div>
                
        </div>
       

        <div class="row" style="margin-top:1% !important;display:none;" id="ccrecipientsSt">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Cc :</label>
                <div class="col-sm-7" id="mailToStudentCC">
                    <input type="text"class="form-control"  name="ccrecipients" placeholder="Add Cc"/>
                   <i class="fa fa-plus-square" onclick="addCC('mailToStudentCC','ccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>

        <div class="row" style="margin-top:1% !important;display:none;" id="bccrecipientsSt">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="to">Bcc :</label>
                <div class="col-sm-7" id="mailToStudentbCC">
                    <input type="text"class="form-control"  name="bccrecipients" placeholder="Add Bcc"/>
                    <i class="fa fa-plus-square" onclick="addCC('mailToStudentbCC','bccrecipients')" style="cursor:pointer" aria-hidden="true"></i>
                </div>
                <div class="col-sm-2"></div>
                </div>
        </div>
        
        
        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Subject :</label>
                <div class="col-sm-7">
                    <textarea name="subject" class="form-control" style="height: 40px !important;" id="subject" placeholder="Enter the subject" rows="3" required></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>


        <div class="row" style="margin-top:1% !important;">
            <div class="form-group">
                    <label class="control-label col-sm-3" for="email">Message :</label>
                <div class="col-sm-7">
                    <textarea name="message" class="form-control" style="height: 250px !important;" id="message" placeholder="Enter your message" rows="30" id="comment" required></textarea>
                </div>
                <div class="col-sm-2">
                    
                </div>
            </div>
        </div>
        <div class="row" style="margin:1% 0% 1% 0% !important;">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <input type="submit" onclick="sendMail('sendMail','mailToStudentForm'); return false;" class="btn btn-primary" style="font-size:16px !important;color:#fff;background-color:#000 !important;border-color:#000 !important;margin:auto !important;display:block !important;" value="send" id="send"/>
            </div>
            <div class="col-md-2"></div>
        </div>
            </form>
        </div>
</div>

<!-- mail to student end -->

<!-- update syllabus strat -->


<!-- aptitude syllabus start -->

<div id="aptiSyllabus" style="display:none;border-radius:5px;">
	 <div class="row">
            <p class="push" style="text-align: center;font-weight:600 !important;">Aptitude syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12">
            <table class="table table-responsive table-hover table-bordered table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${math }" var="m">
            <tr><td class="tdText">${m.getFlowNumber() }</td><td class="tdText">${m.getTopicName() }</td><td class="tdText">${m.getDurationDays() }</td><td class="tdText"><a href="${m.getResource() }" target="_blank">${m.getResource() }</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
 </div>
	 
<!-- aptitude syllabus end -->
<div ng-controller="studentSlyCon as sly" class="container-fluid" style="display:none;" id="upateSyllabus">
        <div class="col-lg-12 container-fluid" ng-show="showsyllabus">
            <div class="col-lg-3 not-to-mobile"></div>
            <div class="col-lg-6 col-xs-12 col-md-12 float-in-center myblock" style="margin: 10px">
                <div class="col-lg-12" style="padding-top: 10px!important;">
                    <center>
                        <h4>Syllabus Report Board</h4>
                        <p id="syl_error" style="color: red;font-weight: 900; font-size: 9px;">{{sly_error}}</p>
                        <table class="show-in-table">
                            <tr>
                                <td class="sub-heading">Subject</td>
                                <td>
                                    <select ng-model="sly.sly_subject" class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <option>Java</option>
                                        <option>Aptitude</option>
                                        <option>Communication</option>
                                        <option>Linux</option>
                                        <option>DataBase</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Batch</td>
                                <td>
                                    <select ng-model="sly.sly_batch"class="form-control" style="height: 34px!important">
                                        <option value="select">select</option>
                                        <c:forEach items="${JspServices.getActiveBatch(batches)}" var="b">
											<option value="${b.getBatchNumber()}">${b.getBatchNumber() }</option>
										</c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </center>
                    <div class="col-lg-12"><input type="submit" ng-click="slyValid()" value="submit" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></div>
                </div>
            </div>
            <div class="col-lg-3 not-to-mobile"></div>
        </div>
        <div class="col-lg-12" ng-show="!(showsyllabus)">
            <div class="col-lg-12">
                <div class="col-lg-6"><h3 style="margin: 0px!important;font-weight: 800"><span ng-click="slyBlockShow(0)" style="color: deepskyblue;font-size: 15px;text-align: left;font-weight: 200">Back</span>&nbsp;&nbsp;&nbsp;&nbsp;Syllabus Report Board</h3></div>
                <div class="col-lg-6">
                    <p style="text-align: center"><span class="sub-heading">Subject :</span> <span id=list_date>{{sly.sly_subject}}</span>   <span class="sub-heading">Batch :</span> <span id=list_batch>{{sly.sly_batch}}</span></p>
                </div>
                
            </div>
            <div class="col-lg-12 col-xs-12 col-md-12 float-in-center myblock" style="margin: 5px 10px 10px ">
                <table class="myatttable">
                    <tr>
                        <th rowspan="2">Sl no.</th>
                        <th rowspan="2">Topic</th>
                        <th colspan="2"">Duration</th>
                        <th rowspan="2" style="width:100px!important">Date</th>
                        <th rowspan="2">Edit</th>
                    </tr>
                    <tr>
                        <th>Approx</th>
                        <th>Taken</th>
                    </tr>
                    <tr ng-repeat="topicObj in topicComListByBatch" >
                        <td>{{$index+1}}</td>
                        <td>{{topicObj.topicName}}</td>
                        <td><span>{{topicObj.durationDays}}<span> Day</span></td>
                        <td><span>{{topicObj.dayList.length}}<span> Day</td>
                        <td>{{getDaylistinHtmlFormat(topicObj.dayList)}}</td>
                        <td><i class="fa fa-pencil" aria-hidden="true" ng-click="clickEditTopic(topicObj)"></i></td>
                    </tr>
                </table>
            </div>
            <div class="col-lg-12"><input id="todayTopicUpdate" ng-click="clickTodayUpdate()" type="submit" value="New Updates" style="float: right; width: 200px;height: 40px; border-radius: 5px;font-weight: 700;border: 0px;font-size: 16px; margin: 9px; color: white;background-color: darkslateblue"/></div>
        </div>
		<div ng-show="showTodayUdate" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="clickTodayUpdateClose()">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size=16px!important">Today Updates ( </span>{{sly.sly_subject}}<span> )</span></p>
  				</div>
  				<div class="mymodal-body">
    				 <table class="show-in-table">
    				 		<tr>
                            	<td ng-show="!showTopicUpdateToday" style="color:#33ccff;weight:600px; float:left;font-size:13px"><sapn ng-click="clickTodayAddTopic()">Back</span></td>
                            	<td ><p style="color: red;font-weight: 900; font-size: 9px;">{{Add_newTopic_error}}</p></td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Date</td>
                                <td>
                                    <div id="datepicker22" class="input-group date" data-date-format="yyyy-mm-dd">
                                        <input ng-model="sly.sly_dateAddToday" id="att_date22" class="form-control" type="text" name="" style="height: 34px!important;">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    </div>
                                </td>
                            </tr>
                            <tr ng-show="showTopicUpdateToday">
                                <td class="sub-heading"><span style="margin-top: 20px">Topic</span></td>
                                <td>
                                     <input list="topicList" ng-model="sly.sly_topicAddToday"  class="form-control" style="height: 34px!important;margin-top: 10px">
                                     <datalist id="topicList">
    									<option data-ng-repeat="topicList in topicListBySub" value="{{topicList.topicName}}">
  									 </datalist>
                                </td>
                            </tr>
                            <tr ng-show="showTopicUpdateToday">
                            	<td></td>
                            	<td style="color:#33ccff;weight:600px; float:right;font-size:13px"><sapn ng-click="clickTodayAddTopic()">Add New Topic</span></td>
                            </tr>
                            
                            <tr ng-show="!showTopicUpdateToday">
                            <td colspan="2">
                            	
                          <table class="show-in-table">
                            <tr>
                                <td class="sub-heading">Topic Name</td>
                                <td>
                                     <input ng-model="sly.sly_topicAddTopicName" class="form-control" type="text" style="height: 34px!important;">
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Approx Days</td>
                                <td>
                                     <input ng-model="sly.sly_topicAddTopicAppDay" class="form-control" type="number" style="height: 34px!important;">
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Document Resource</td>
                                <td>
                                     <input ng-model="sly.sly_topicAddTopicDocRes" class="form-control" type="text" style="height: 34px!important;">
                                </td>
                            </tr>
                            <tr>
                                <td class="sub-heading">Video Resource</td>
                                <td>
                                     <input ng-model="sly.sly_topicAddTopicVideoRes" class="form-control" type="text" style="height: 34px!important;">
                                </td>
                            </tr>
                        </table>
                            	
                            	</td>
                            </tr>
                            <tr>
                            	<td></td>
                            	<td><input id="todayTopicUpdate" ng-click="setTodayUpdateClick()" type="button" value="Update" style="float: right;text-align:center; width: 100px;height: 40px; border-radius: 5px;font-weight: 600;border: 0px;font-size: 14px; margin: 9px; color: white;background-color: darkslateblue"/></td>
                            </tr>
                        </table>
  				</div>
	  		</div>
		</div>
		<div ng-show="showsSylEdit" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="clickEdit()">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size=16px!important">Edit </span></p>
  				</div>
  				<div class="mymodal-body">
    				 <table class="show-in-table">
    				 	 <tr>
                            <td class="sub-heading" style="width:150px!important">Topic</td>
                            <td colspan="3">
                                <select ng-model="sly.sly_editTopicName"  class="form-control" style="height: 34px!important;margin-top: 10px">
    								<option ng-repeat="topicList in editTopicList" >{{topicList}}</option>
    							</select>
                            </td>
                         </tr>
                         <tr>
                            <td class="sub-heading" style="width:150px!important">DateList</td>
                            <td colspan="2" style="width:200px">
                         		<p>
                         		  <p ng-repeat="editDateList in editValue.dayList">
                         			<span style="text-align:center;height: 30px; border-radius: 5px;font-weight: 600;border: 0px;font-size: 12px;padding:5px 10px; color: black;background-color: #ffe680">
                         				{{editDateList}} &nbsp;&nbsp;&nbsp;<span ng-click="removeDateEditList(editDateList)" class="my-close" style="font-size: 15px!important;">&times;</span>
                         			</span>
                         		  </p>
                         			
                         		</p>
                         	</td>
                            <td >
                                <div id="datepickerAdd" class="input-group date" data-date-format="yyyy-mm-dd">
                                    <input ng-model="editValue.addDateEditbox" id="addNewDate"class="form-control" ng-change="addDateEditList(editValue.addDateEditbox)"type="text" name="" style="height: 34px!important; display:none;">
                                    <span class="input-group-addon" style="float: left;padding-top:5px;text-align:center; width: 100px;height: 30px; border-radius: 5px;font-weight: 600;border: 0px;font-size: 14px; margin: 9px; color: black;background-color: #cdcdcd">ADD</span>
                                </div>
                            </td>
                            
                         </tr>
    				 	 <tr>
                           	<td colspan="2"><!--<p ng-click=""  value="Delete" style="float: left;padding-top:10px;text-align:center; width: 100px;height: 40px; border-radius: 5px;font-weight: 600;border: 0px;font-size: 14px; margin: 9px; color: white;background-color: #b82e2e">Delete</p>--></td>
                           	<td colspan="2"><p ng-click="editMyTopic()"  style="float: right;text-align:center;padding-top:10px; width: 100px;height: 40px; border-radius: 5px;font-weight: 600;border: 0px;font-size: 14px; margin: 9px; color: white;background-color: #2eb82e">Save</p></td>
                         </tr>
    				 </table>
    			</div>
    		</div>
    	</div>
</div>

<!-- update syllabus end -->




<!-- java syllabus start -->

<div id="javaSyllabus" style="display:none;border-radius:5px;">
		<div class="row">
			<p class="push" style="text-align: center;font-weight:600 !important;">Technical syllabus</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12">
            
            <table class="table table-responsive table-hover table-bordered table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${java }" var="j">
            <tr><td class="tdText">${j.getFlowNumber() }</td><td class="tdText">${j.getTopicName() }</td><td class="tdText">${j.getDurationDays() }</td><td class="tdText"><a href="${j.getResource() }" target="_blank">${j.getResource() }</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- java syllabus end -->
	
	
	
<!-- comm syllabus start -->
	
<div id="commSyllabus" style="display:none;border-radius:5px;">
		<div class="row">
            <p class="push" style="text-align: center;font-weight:600 !important;">English syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12">
            <table class="table table-responsive table-hover table-bordered table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${comms }" var="c">
            <tr><td class="tdText">${c.getFlowNumber() }</td><td class="tdText">${c.getTopicName() }</td><td class="tdText">${c.getDurationDays() }</td><td class="tdText"><a href="${c.getResource() }" target="_blank">${c.getResource() }</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            </div>
               <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
</div>	
	
<!-- comm syllabus end -->
	

<!-- Linux syllabus start  -->

<div id="linuxSyllabus" style="display:none;border-radius:5px;">
	<div class="row">
			<p class="push" style="text-align: center;font-weight:600 !important;">Linux syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12">
           <table class="table table-responsive table-hover table-bordered table-striped">
           <thead>
            <tr class="theadText"><th class="thText">Flow number of topic</th><th class="thText">Topic Name</th><th class="thText">Duration in Days (approximation)</th><th class="thText">Best internet resource</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${linux }" var="l">
            <tr><td class="tdText">${l.getFlowNumber() }</td><td class="tdText">${l.getTopicName() }</td><td class="tdText">${l.getDurationDays() }</td><td class="tdText"><a href="${l.getResource() }" target="_blank">${l.getResource() }</a></td></tr>
            </c:forEach>
           </tbody>
            </table>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
</div>	 

<!-- Linux syllabus end  -->



<!-- Add Batch begin -->

<div id="addBatch" style="display:none;border-radius:5px;height:450px;">
	<p class="push">Enroll a New Batch</p><br>
	<div class="row">
		<div class="col-md-2 col-sm-2 col-xs-0"></div>
		<div class="col-md-7 col-sm-7 col-xs-12">
			<form id='addBatchForm' class="formClass" style="padding:1%;">
				<div class="row" style="margin-top:1% !important;">
			         <div class="form-group">
            	        <label class="control-label col-sm-4">Enter the new Batch Number :</label>
                		<div class="col-sm-6">
                    		<input class="form-control" type="number" name="batchNumber" id="batchNumberAdd" placeholder="Enter batch Number" required />
                		</div>
                		<div class="col-sm-2"></div>
         			</div>
				</div><br>
				<div class="row">
			         <div class="form-group">
						<label class="control-label col-sm-4">Enter batch begin Date (Approx) :</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" name="beginDate" id="batchBeginDate" placeholder="YYYY-MM-DD"/>
			            </div>
			          	<div class="col-sm-2"></div>
			         </div>
				</div>
				<br>
				<div class="row">
			         <div class="form-group">
						<label class="control-label col-sm-4">Enter batch end Date (Approx) :</label>
			            <div class="col-sm-6">
							<input class="form-control" type="text" name="endDate" id="batchEndDate" placeholder="YYYY-MM-DD"/>
			            </div>
			            <div class="col-sm-2S"></div>
			         </div>
				</div>
				<br>
				<div class="row" style="margin-top:1% !important;">
            		<div class="col-md-4"></div>
            		<div class="col-md-4">
                		<button id="addBatchButton" class="btn btn-default enroll" style="width:35% !important" onclick="addBatch();return false">Enroll</button>
            		</div>
            		<div class="col-md-4"></div>
     			</div>
     		</form>
     	</div>
     	<div class="col-md-3 col-sm-3 col-xs-0"></div>
	</div>
</div>

<!-- Add Batch begin -->


<!-- View all Batches -->

<div id="viewBatches" style="display:none;border-radius:5px;">
	<p class="push" style="text-align:center !important;font-weight:600 !important;">All batches</p><br>
	<div class="row">
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
		<div class="col-sm-10 col-md-10 col-xs-12">
			<table class="table table-responsive table-hover table-bordered table-striped">
				<thead>
					<tr class="theadText"><th class="thText">Batch Number</th><th class="thText">Begin Date(Approx)</th><th class="thText">End Date(Approx)</th><th class="thText">Number of Students Enrolled</th></tr>
				</thead>
				<tbody>
					<c:forEach items="${batches }" var="b">
					<tr><td class="tdText">${b.getBatchNumber() }</td><td class="tdText">${b.getBeginDate() }</td><td class="tdText">${b.getEndDate() }</td><td class="tdText">${b.getTotalStudents() }</td></tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
	</div>
</div>


<!-- View all Batches -->

<!-- Change password start -->

<div id="changePassword" style="display:none;border-radius:5px;">
	<p class="push">Change your password</p><br>
	<form method="post" id="changeAdminPassword" class="formClassForPassChange">
		<div class="row">
	         <div class="form-group marginFormCLass">
	                    <label class="control-label col-sm-5" for="to">Enter old password :</label>
	                <div class="col-sm-4">
	                    <input class="form-control"type="password" name="oldPassword" id="oldPassword" placeholder="Enter old password"/>
	                </div>
	                <div class="col-sm-3"></div>
	         </div>
		</div>
		<div class="row" style="margin-top:1% !important;">
	         <div class="form-group">
	                    <label class="control-label col-sm-5" for="to">Enter New Password :</label>
	                <div class="col-sm-4">
	                    <input class="form-control" type="password" name="newPassword"id="newPassword" placeholder="Enter New Password"/>
	                </div>
	                <div class="col-sm-3"></div>
	         </div>
		</div>
		<div class="row" style="margin-top:1% !important;">
	         <div class="form-group">
	                    <label class="control-label col-sm-5" for="to">Confirm new Password :</label>
	                <div class="col-sm-4">
	                    <input type="password" class="form-control"  name="confirmpsw" id="confirmpsw" placeholder="Confirm new Password"/>
	                	<br>
	                </div>
	                <div class="col-sm-3"></div>
	         </div>
		</div>
		<div class="row" style="margin-top:1% !important;">
	            <div class="col-md-5"></div>
	            <div class="col-md-4">
	                <button id="changeAdminPasswordButton" class="btn btn-default" style="border:1px solid #00a69c !important;border-radius:5px !important;color:#00a69c !important;" onclick="changePassword();return false">Change</button>
	            </div>
	            <div class="col-md-3"></div>
	     </div>
	</form>
</div>


<!-- Change password end -->



<!-- Add notification begin -->


<div id="addNotification" style="display:none;border-radius:5px;height:430px;">
	<p class="push" style="text-align:center !important;font-weight:600 !important;">Add a new Notification to Students</p><br>
	<form method="post" id="addNotificationForm" style="padding:1%;" class="formClass">
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Enter What to notify :</label>
	                <div class="col-sm-4">
	                    <input class="form-control" type="text" name="notification" placeholder="Enter the message"/>
	                </div>
	                <div class="col-sm-4"></div>
	         </div>
		</div><br>
		
		<div class="row">
             <div class="form-group">
                 <label class="control-label col-sm-4" for="email">Select batches to push:</label>
             <div class="col-sm-8">
             <c:forEach items="${batches }" var="b">
                 <label class="checkbox-inline"><input type="checkbox" name="batchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
                </c:forEach>    
             </div>
                 
             </div>
        </div>
		<br>
		<div class="row" style="margin-top:1% !important;">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <input name="btn" type="submit" value="Post"  class="btn btn-default enroll" onclick="addNotification();return false;">
            </div>
            <div class="col-md-4"></div>
	     </div>
	</form>
</div>


<!-- Add notification end -->

<!-- Uploading file start -->


<div id="uploadFile" style="display:none;height:430px;" class="">

<p class="push" style="text-align:center !important;font-weight:600 !important;">Add a New File</p><br>
	<form action="uploadFile" method="post" style="padding:1%;" id="sendFileForm" class="formClass" enctype="multipart/form-data">
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Enter File Name:</label>
	                <div class="col-sm-4">
	                    <input class="form-control" type="text" name="fileName" placeholder="Enter fileName"/>
	                </div>
	                <div class="col-sm-4"></div>
	         </div>
		</div>
		<br>
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Select File:</label>
	                <div class="col-sm-4">
	                    <input type="file" name="file" placeholder="select File"/>
	                </div>
	                <!-- <div class="fileinput fileinput-new col-sm-4" data-provides="fileinput">
					    <span class="btn btn-default btn-file"><span>Choose file</span><input type="file" name="file" /></span>
					    <span class="fileinput-filename"></span><span class="fileinput-new">No file chosen</span>
					</div> -->
	                <div class="col-sm-4"></div>
	                
	         </div>
		</div>
		
		<br>
		<div class="row">
	         <div class="form-group">
	                    <label class="control-label col-sm-4" for="to">Select Subject:</label>
	                <div class="col-sm-4">
	                   <select class="form-control" name="subject" style="height:30px !important;">
	                   <option selected value="Java">Java</option>
	                   <option value="Math">Math</option>
	                   <option value="Linux">Linux</option>
	                   <option value="SQL">SQL</option>
	                   <option value="Comms">Communication</option>
	                   <option value="Others">Others</option>
	                   </select>
	                </div>
	                <div class="col-sm-4"></div>
	         </div>
		</div>
		<br>
		<div class="row">
	           
	                <div class="form-group">
	                    <label class="control-label col-sm-4" for="email">Select batches to push:</label>
	                <div class="col-sm-8">
	                <c:forEach items="${batches }" var="b">
	                    <label class="checkbox-inline"><input type="checkbox" name="batchNos" value="${b.getBatchNumber() }">Batch ${b.getBatchNumber() }</label>
	                   </c:forEach>
	                    
	                        
	                </div>
	                   
	                </div>
	        </div>
		<br>
		<div class="row" style="margin-top:1% !important;">
	            <div class="col-md-4"></div>
	            <div class="col-md-4">
	                <button class="btn btn-default enroll" style="width:50% !important;" onclick="sendFile(); return false;">Upload Data and File</button>
	            </div>
	            <div class="col-md-4"></div>
	     </div>
	</form>

</div>


<!-- Uploading file end -->

<!--view all notification begin -->


<div id='viewNotifications' style="display:none">
	<p class="push" style="text-align:center !important;font-weight:600 !important;">All Notifications</p><br>
	<div class="row">
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
		<div class="col-sm-10 col-md-10 col-xs-12">
			<table class="table table-responsive table-hover table-bordered table-striped">
				<thead>
					<tr class="theadText"><th class="thText">Posted On</th><th class="thText">Posted By</th><th class="thText">Notification</th><th class="thText">Posted For Batches</th></tr>
				</thead>
				<tbody>
					<c:forEach items="${notifications }" var="n">
					<tr><td class="tdText">${n.getPostDate() }</td><td class="tdText">${n.getName() }</td><td class="tdText">${n.getNotification() }</td><td class="tdText">${n.getBatchNos()[0] }</td></tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-1 col-md-1 col-xs-0"></div>
	</div>
</div>


<!-- view notifications end -->

	</div>
</div>




<!-- <div class="assistant" style="position:fixed;right:0;bottom:10%;background-color:#7b6e2d;color:white;padding:10px;border-radius:15%"><span onclick="displayD('assistantWork')">How Can I Help You?</span>
  <span id="assistantWork" style="width:200px;">
 <br> Hi <%=name %><br>
  I am Your Assistant ""<br>
  <span id="assistantCreateQP">
  </span>
   <span id="assistantCreateQPOptions">
    <br>
   Can I Create a New QuestionPaper?<br>
   <small>By the way, I can create a new question paper with the random
    questions and random topics.</small>
   <br>
   <button style="color:black" onclick="assistantCreateQuestionPaper('Y')">YES</button><button onclick="displayD('assistantWork')" style="color:black" >NO</button>
   
   </span>
   
  </span> 
</div> -->

<!--footer strat-->
<div class="container-fluid footerDiv">
    <div class="row">
        <div class="col-md-12">
            <p class="footers" style="color:#000;float:left;">@CVCORPCopyRightsReserved</p>
            <img class="logo" style="float:right;margin-top:1%;" src="<c:url value="/resources/images/cvcorpLogo.png"/>">
        </div>
    </div>
</div>



<!-- footer end-->

</div>
<script type="text/javascript">
if (annyang) {
	  // Add our commands to annyang
	  annyang.addCommands({
	    'hello *name': function(name) { responsiveVoice.speak("Hello <%=name%>"); },
	    'create a question paper': function() { assistantCreateQuestionPaper("Y"); },
	    'java': function() { assistantCreateQuestionPaper("Java"); },
	    'maths': function() { assistantCreateQuestionPaper("Math"); },
	    'aptitude': function() { assistantCreateQuestionPaper("Math"); },
	    'multiple choice':function() { assistantCreateQuestionPaper("Multiple"); },
	    'Theory':function() { assistantCreateQuestionPaper("QA"); },
	     'view multiple choice Papers': function(){ sendData("getQuestionPapers/","Multiple","listQPapers",-1); displayDiv("qpapers"); 
	     responsiveVoice.speak("Listed all papers you can check nonw");},
	     'view theory type question Papers': function(){ sendData("getQuestionPapers/","QA","listQAQPapers",-1); displayDiv("QAqpapers"); },
	      'view all students': function(){sendData("viewAll","","stArea",-1); displayDiv("stArea");
	      responsiveVoice.speak("done"); },
	      'send a mail to student *name': function(name){
	    	  responsiveVoice.speak("I dont have permision to send");
	      },
	      'send a mail to batch *num': function(num){
	    	  responsiveVoice.speak("I can send a mail but not now"); 
	      },
	      ' view progress of *name':function(name){
	    	  responsiveVoice.speak("I can view progress but not now");  
	      },
	      
	      'view students from batch *num': function(num){
	    	  console.log(batchNos[batchNos.length-1]);
	    	 
	    	  if(!isNaN(num) && batchNos[batchNos.length-1]>=parseInt(num)){
	    	  sendData("viewBatch/",num,"stArea",-1); displayDiv("stArea");
	    	  
	    	  }
	    	  else{
	      responsiveVoice.speak("Please mention the correct batch Number");} },
	       'search *text':function(text){
	    	   window.open('http://google.com?search'+text, '_blank');
	       },
	       'can you *something': function(){
	    	   responsiveVoice.speak("Yes I can do that but not now");
	       },
	       '*anything': function(anything){
	    	   responsiveVoice.speak("please check what you are asking, If you have'nt said it properly say again, otherwise sorry I cannot help");
	       }, 
	  });

	  // Tell KITT to use annyang
	  SpeechKITT.annyang();

	  annyang.debug();
	  // Define a stylesheet for KITT to use
	  SpeechKITT.setStylesheet('http://cdnjs.cloudflare.com/ajax/libs/SpeechKITT/0.3.0/themes/flat.css');

	  // Render KITT's interface
	  SpeechKITT.vroom();
	}
	</script>
</body>
<script>
		var selector = '.nav li';

			$(selector).on('click', function(){
				$(selector).removeClass('active');
				$(this).addClass('active');
			});
			
			
</script>
<script type="text/javascript">
$(function () { 
    $('#lstStates').multiselect({ 
        buttonText: function(options, select) {
            console.log(select[0].length);
            if (options.length === 0) {
                return 'None selected';
            }
            if (options.length === select[0].length) {
                return 'All selected ('+select[0].length+')';
            }
            else if (options.length >= 4) {
                return options.length + ' selected';
            }
            else {
                var labels = [];
                console.log(options);
                options.each(function() {
                    labels.push($(this).val());
                });
                return labels.join(', ') + '';
            }
        }
    
    });
});
</script>
<script>
	// DOM Ready
$(function() {
 var el, newPoint, newPlace, offset;
 
 // Select all range inputs, watch for change
 $("input[type='range']").change(function() {
 
   // Cache this for efficiency
   el = $(this);
   
   // Measure width of range input
   width = el.width();
   
   // Figure out placement percentage between left and right of input
   newPoint = (el.val() - el.attr("min")) / (el.attr("max") - el.attr("min"));
   
   // Janky value to get pointer to line up better
   offset = -1.3;
   
   // Prevent bubble from going beyond left or right (unsupported browsers)
   if (newPoint < 0) { newPlace = 0; }
   else if (newPoint > 1) { newPlace = width; }
   else { newPlace = width * newPoint + offset; offset -= newPoint; }
   
   // Move bubble
   el
     .next("output")//.next("output")
     .css({
       //left: newPlace,
       //marginLeft: offset + "%"
     })
     .text(el.val());
 })
 // Fake a change to position bubble at page load
 .trigger('change');
});
</script>

<script>
$(document).ready(function(){
  $('.dropdown-submenu a.test').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});
</script>
<script>
$('#scrollableid').slimScroll();
</script>

<script>
    $(document).ready(function() {
        //$(document).on("scroll", onScroll);

        //smoothscroll
        $('.menu-centerForReg a[href^="#"]').on('click', function(e) {
            e.preventDefault();
            //$(document).off("scroll");

            $('a').each(function() {
                $(this).removeClass('active');
            })
            $(this).addClass('active');
        });

    });

</script>
<script>
    $(document).ready(function() {
        $('.menu-centerForReg1 a[href^="#"]').on('click', function(ee) {
            ee.preventDefault();
            //$(document).off("scroll");

            $('a').each(function() {
                $(this).removeClass('active');
            })
            $(this).addClass('active');
        });
    });

</script>






</html>