<%@page import="cv.dto.Faculty"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="cv.models.CVStudent" %>
    <%@ page import="cv.services.JspServices" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%CVStudent st=(CVStudent)request.getSession().getAttribute("student");%>
<script type="text/javascript">
var emailGlobal='<%=st.getEmail()%>';
var batchGlobal='<%=st.getBatchNumber()%>';
var attGlobal='<%=st.getAttendance()%>';
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student DashBoard</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
<script src="<c:url value="/resources/js/gameScript.js"/>"></script>
<script src="<c:url value="/resources/js/game.js"/>"></script>
<script src='https://code.responsivevoice.org/responsivevoice.js'></script>
<script src="<c:url value="/resources/js/studentprofile.js"/>"></script>
<script src="<c:url value="/resources/js/studentProfileCon.js"/>"></script>
<script src='https://code.responsivevoice.org/responsivevoice.js'></script>
<script src="<c:url value="/resources/js/ajaxOpStudent.js"/>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/adminDashBoard.css"/>"/>
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/profile.css"/>"/>
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/cvcorpCss.css"/>"/>
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/gameStyle.css"/>"/>
 <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/popup.css"/>"/>
	
 <script type="text/javascript">
 //For Home
 
 $(document).ready(function(){
	 
	fetchReport('<%=st.getEmail()%>');
	
	
	<%
	if(st.getIsRegistered().equals("N"))
	{
		%>
		displayDiv('changePassword');
		<%
	}%>
 });
 
 </script> 
  <style>
  /*.navbar-default .navbar-nav>.active> a, 
			.navbar-default .navbar-nav>.active> a:focus, 
			.navbar-default .navbar-nav>.active> a:hover
        {
            color:white !important;
            text-transform:uppercase !important;
            font-size:12px !important;
            background-color:#ff6666 !important;
        }*/
        a{
        color:blue !important;
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
				width:10%;
				height:30px !important;
				position:fixed;
				top:10;
				right:0 !important;
				margin-top:0.5%;
				margin-right:2%;
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
</head>

<body ng-app="App" ng-controller="studentProfileCon as stud">

<!--section start-->
<!-- <div class="container-fluid">
		<!-- navbar start
		<div class="row firdiv">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<i class="fa fa-refresh fa-spin fa-3x fa-fw" style="float:left;display:none;" id="ajaxPageLoader"></i><br>
				<span class="welocmeName">Welcome <span class="welcomeNameDisplay"><i><%=st.getFullName() %></i></span>
				<br id="showHideInMob">
				<i style="margin-left:1%;" class="fa fa-calendar" aria-hidden="true"></i> <span class="welcomeDate" id="welDate"></span>
				</span><br>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6 passChange" style="margin-top:20px;margin-left:0px;">
				<a onclick="displayDiv('changePassword')" style="float:right;color:#000 !important;cursor:pointer">&nbsp<i style="color:#000;" class="fa fa-wrench" aria-hidden="true"></i> Change Password</a>
				<a href="Logout" style="color:#000 !important;float:right;"><i style="color:#000;marggin-right:1%;" class="fa fa-power-off" aria-hidden="true"></i> Logout</a>
				
			</div>
		</div>
</div> -->

<div class="container-fliud menuDiv">
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
    <div class="collapse navbar-collapse" id="myNavbar">
	    <ul style="float:left;">
	     	<li style="list-style-type: none;"><i class="fa fa-refresh fa-spin fa-3x fa-fw" style="float:left;display:none;color:#4e4e4e;" id="ajaxPageLoader"></i></li>
	     </ul>
      <ul class="nav navbar-nav" style="float:right;">
        <li class="active"><a href="#" onclick="displayDiv('home');"> Home</a></li>
        <li><a href="#" onclick="displayDiv('profile');">Profile</a></li>
		<li><a href="#" onclick="displayDiv('statistics');"> Results-Statistics</a></li>
		
		<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown"> Take Test <span class="notificationClassMain"> ${fn:length(qpAvail)+fn:length(qaqpAvail) }</span><span class="caret"></span></a>
		<ul class="dropdown-menu">
		<li><a class="sylabusLinks" href="#" onclick="displayDiv('multipleChoice');"> MultiChoice QP <span class="notificationClassSub">${fn:length(qpAvail) }</span></a></li>
		<li><a class="sylabusLinks" href="#" onclick="displayDiv('theoreticQp');"> Theory Type QP <span class="notificationClassSub">${fn:length(qaqpAvail) }</span></a></li>
		</ul>
		</li>
		
		<li><a href="https://cvcorp.herokuapp.com/"><i class="fa fa-commenting-o" aria-hidden="true"></i> CVCORP Chart Room</a></li>
        <li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown"> View Syllabus and Resources<span class="caret"></span></a>
		<ul class="dropdown-menu">
		<li><a class="sylabusLinks" onclick="displayDiv('aptiSyllabus')">Aptitude & Reasoning</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('javaSyllabus')">Technical</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('commSyllabus')">Communication</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('linuxSyllabus')">Linux & Database</a></li>
		</ul>
		</li>
		 <li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown"> View Files<span class="caret"></span></a>
		<ul class="dropdown-menu">
		<li><a class="sylabusLinks" onclick="displayDiv('JavaFiles')">Java Files</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('MathFiles')">MathFiles</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('CommsFiles')">CommsFiles</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('MySQLFiles')">MySQLFiles</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('LinuxFiles')">LinuxFiles</a></li>
		<li><a class="sylabusLinks" onclick="displayDiv('OtherFiles')">OtherFiles</a></li>

		</ul>
		</li>
		<li><a onclick="displayDiv('sumHunter')">
		Game</a></li>
		<!--  <li><a onclick="displayDiv('jobs')"><i class="fa fa-trophy" aria-hidden="true"></i>
		Jobs</a></li>-->
		<li><a onclick="displayDiv('uploadResume')">
		Upload Resume</a></li>
		<li style="border-left: 1px solid #dbdbdb;border-right: 1px solid #dbdbdb;font-size: 12px !important;" class="dropdown"><a class="dropdown-toggle" style="cursor:pointer; height: 50px;" data-toggle="dropdown"><i style="padding:14%;float:left;border:1px solid #4e4e4e;border-radius: 50%;" class="fa fa-user" aria-hidden="true"></i><span style="float:right;margin-top: 3%;" class="caret"></span></a>
		   <ul class="dropdown-menu" style="left:-104px !important;">
		   		<li><p style="color:#444 !important;padding-left: 4%;font-size: 12px !important;text-align:left;">Welcome <span style="letter-spacing:1px;font-family: Segoe UI Semibold !important;font-weight:600;font-size:12px;"><i><%=st.getFullName() %></i></p></li>
				<li><p class="welcomeDate" id="welDate"></p></li>
		   		<li><p style="margin-left:4%"><a onclick="displayDiv('changePassword')" style="text-align:left;color:#444;cursor:pointer;font-size: 12px !important;"><i style="color:#444;" class="fa fa-wrench" aria-hidden="true"></i> Change Password</a></p></li>
		   		<li><p style="margin-left:4%"><a href="Logout" style="color:#444;text-decoration:none;"><i style="color:#444;text-align:left;font-size: 12px !important;" class="fa fa-power-off" aria-hidden="true"></i> Logout</a></p></li>
			</ul>
		</li>
      </ul>
    </div>
  </div>
</nav>
		<!-- navbar end-->
		
		
		<div id="success" style="position:fixed;text-align:center !important;z-index:1;color:#fff;right:0%;top:0%;border:1px solid #00a69c !important;background-color:green !important;display:none;opacity:1 !important;">
  	<strong>Success!</strong><p id="reportT"> </p>
  </div>
  
  <div id="fail" style="position:fixed;text-align:center !important;z-index:1;color:#fff;background-color:red !important;right:0%;top:0%;border:1px solid #ff6666 !important;display:none;opacity:1 !important;">
  	<strong>Not success!</strong><p id="reportF"> </p>
  </div>
		
		
</div>

<marquee><span style="color:red;"> ${notification.getPostDate() } &nbsp &nbsp ${notification.getNotification() } </span></marquee>
<!-- Chat box code start  -->
			<div id="chat" class="animated-chat tada" onclick="loadChatbox()">How Can I Help?</div>
			<div class="chatbox" id="chatbox">
			<span class="chat-text">Hello <%=st.getFullName() %></span>
			<script>
			document.write('<div id="smartchatbox_img901621879" style="width: 280px; height: 260px;background-color:#fff; overflow: hidden; margin: auto; padding: 0;">');
			document.write('<div id="smartchatbox901621879" style="width: 280px; height: 260px;background-color:#fff; overflow: hidden; margin: auto; padding: 0; border:0; ">');
			document.write('Hello <%=st.getFullName()%>, I am your new Assistant. I am currently programmed to do nothing except introducing myself.  Lets see weather I have any further works to do in future</div></div>');
			//]]>
			</script>
			<div id="close-chat" onclick="closeChatbox()">&times;</div>
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
				responsiveVoice.speak("Hello <%=st.getFullName()%>, I am your new Assistant. I am currently programmed to do nothing expect introducing myself.  Lets see weather I have any further works to do in future.");
				
			}
			function closeChatbox()
			{
				var e=document.getElementById("chatbox");
				e.style.margin="0 0 -450px 0";
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
		<!-- Chat box code end  -->


<div class="container-fluid rowClass">
	<div class="row">
			<div id="home" class="container-fluid homeClass">
				<p class="subHeadText">Overall Performance</p>
						<div class="row">
							<!-- <p class="subHeadText">Attendance & Examinations Performance</p> -->
							<div class="col-md-5 col-sm-5 col-xs-12">
								<canvas id="overAttendanceChart" class="sampleCharts"></canvas>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-0">
								<div class="lineClass"></div>
								<hr class="hrLineForMob">
							</div>
							<div class="col-md-5 col-sm-5 col-xs-12">
								<canvas id="scoreChart" class="sampleCharts"></canvas>
							</div>
						</div>
			</div>
			<!-- student home end-->






			<!-- student profile start-->
			
			<div id="profile" style="display: none;" >
			
			<div ng-show="myAttReport" class="my-modal">
  			<div class="mymodal-content" >
    			<div class="mymodal-header">
    				<p class="sub-heading" style="color:#fff!important;margin:0px!important;padding:0px!important">&nbsp;&nbsp;&nbsp;<span class="my-close" ng-click="myAttReport=false">&times;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px!important">Attendance Report</span></p>
  				</div>
  				<div class="mymodal-body" style="margin:0px 0px 20px 0px">        	
                    <table class="myatttable table-hover table-striped">
               			<tr>
               				<th>Sl no</th>
               				<th>Date</th>
               				<th>Report</th>
               			</tr>
               			<tr ng-repeat="list in myAttListStatusList">
                            <td>{{$index + 1}}</td>
               				<td>{{list.date}}</td>
               				<td><p style="margin:0px" ng-repeat="report in list.report"><span>{{report.subject}}</span>  :  <span>{{report.status?'Present':'Absent'}}</span></p></td>
               			</tr>          	
                    </table>
  				</div>
	  		</div>
		</div>
			<!-- soumya profile -->
			<div class="myholder">
				<div class="myholder30 mycontainer" style="margin: 10px 3px;">
            <div  style="border-top: 3px solid #1fae66;">
                <div class="">
                        <div class="col-lg-12">
                                <div class="col-lg-6  padding_zero">
                                    <p class="left margin_zero"><%=st.getJoinDate() %></p>
                                </div>
                                <div class="col-lg-6  padding_zero">
                                    <p class="right margin_zero" style="text-transform: uppercase;"><%=st.getStatus() %></p>
                                </div>
                            </div>        
                    <div class="col-lg-12 ">
                        <div class="col-lg-3 padding_zero flot_center prof_align">
                          <p class="number-stat bottm_margin5" style="color: #337ab7;"><%=st.getBatchNumber() %></p>
                          <p class="desc-stat ">Batch</p>
                        </div>
                        <div class="col-lg-6 padding_zero flot_center">
                            <img class="photo" src="http://www.glimray.com/image/no_images/no_profile_img.png"/>
                        </div>
                        <div class="col-lg-3 padding_zero flot_center prof_align">
                          <p class="number-stat bottm_margin5" style="color: #337ab7;"><%=JspServices.getNumberOfDays(st.getJoinDate()) %></p>
                          <p class="desc-stat">Days</p>
                        </div>
                    </div>
                    
                    <h4 class="name"><%=st.getFullName() %></h4>
                    <p class="info margin_zero"><%=st.getLocality() %> , <%=st.getCity() %></p>
                    <p class="info"><%=st.getState() %></p>
                    <div class="col-lg-12 flot_center">
                        <div class="col-lg-6 padding_zero">
                            <p class="info"><span><i class="fas fa-envelope"></i></span><%=st.getEmail() %></p>
                        </div>
                        <div class="col-lg-6 padding_zero">
                            <p class="info"><i class="fas fa-phone"></i><%=st.getMobile() %></p>
                        </div>
                    </div>
            
                    <!-- fee -->
                    <div class="col-lg-12 padding_zero">
                        <div class="col-lg-6  padding_zero">
                            <h3 class="sub-heading margin_zero">Fee :</h3>
                        </div>
                        <div class="col-lg-6  padding_zero">
                            <h3 class="sub-heading-right margin_zero">( <span><%=st.getfeeTotal()-st.getFeePaid() %></span> remaining )</h3>
                        </div>
                    </div>
                    
                    <div class="col-lg-12 padding_zero">
                    <div class="progress myprogress-bar">
                        <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:<%=JspServices.getFeePersentage(st.getfeeTotal(),st.getFeePaid()) %>%">
                          <span class="sr-only"><%=JspServices.getFeePersentage(st.getfeeTotal(),st.getFeePaid()) %>% Complete</span>
                        </div>
                    </div>
                    </div>

                    <!-- fee end-->

                     <!-- spersentage-->
                     <div class="col-lg-12 padding_zero">
                            <div class="col-lg-6  padding_zero" style="margin-top: 10px">
                                <h3 class="sub-heading margin_zero">Attendance :</h3>
                            </div>
                            <div class="col-lg-6  padding_zero" style="margin-top: 10px">
                                <p><h3 ng-click="myAttReport=true;" class="sub-heading-right margin_zero" style="color: #03a9f4">Show me</h3></p>
                            </div>
                        </div>
                        <div class="col-lg-12 stats">       
                              <p class="number-stat" style="color: #4caf50!important;"><Span>{{getPercentge(getCount(attScope),getCount(workingListdayList))}}</Span>%</p>
                              <p class="desc-stat">{{getCount(attScope)}} {{getCount(attScope)<2?'class':'classes'}} / {{getCount(workingListdayList)}} {{getCount(workingListdayList)<2?'class':'classes'}}</p>
                        </div>
                    <!-- persentage end-->
            
                   
            
                    <!-- math-->
                    <div class="col-lg-12 padding_zero margin_zero">
                        <div class="col-lg-6  padding_zero" style="margin-top: 10px">
                            <h3 class="sub-heading margin_zero">Math Mark :</h3>
                        </div>
                        <div class="col-lg-6  padding_zero">
                           <!--<h3 class="sub-heading-right margin_zero">( <span>5000</span> remaining )</h3>-->
                        </div>
                        </div>
                        <div class="stats col-lg-12">
                            <div class="stat col-xs-6" >
                              <p class="number-stat" style="color: #03a9f4!important;"><Span><%= JspServices.round(st.getSscMaths()==null?0.0:st.getSscMaths(), 2) %></Span> / <Span>100</Span></p>
                              <p class="desc-stat margin_zero">SSC </p>
                              <p class="desc-stat">( <span><%= st.getSscBoard() %></span> )</p>
                            </div>
                            <div class="stat col-xs-6">
                            <% System.out.println("out mu"+st.getInterMaths());%>
                              <p class="number-stat" style="color: #4caf50!important;"><Span><%= JspServices.round(st.getInterMaths()==null?0.0:st.getInterMaths(),2) %></Span> / <Span>100</Span></p>
                              <p class="desc-stat margin_zero">Intermediate </p>
                              <p class="desc-stat">( <span><%= st.getInterBoard() %></span> )</p>
                            </div>
                        </div>
                    <!-- math end-->

                     <!-- persentage-->
                     <div class="col-lg-12 padding_zero">
                            <div class="col-lg-6  padding_zero" style="margin-top: 10px">
                                <h3 class="sub-heading margin_zero">Percentage :</h3>
                            </div>
                            <div class="col-lg-6  padding_zero">
                               <!--<h3 class="sub-heading-right margin_zero">( <span>5000</span> remaining )</h3>-->
                            </div>
                        </div>
                        <div class="col-lg-12 stats">
                                <div class="stat col-xs-4" >
                                  <p class="number-stat" style="color: #673ab7!important;"><Span><%= JspServices.round(st.getSscPercentage(),2) %></Span>%</p>
                                  <p class="desc-stat">SSC</p>
                                </div>
                                <div class="stat col-xs-4">
                                  <p class="number-stat" style="color: #4caf50!important;"><Span><%= JspServices.round(st.getInterPercentage(),2)%></Span>%</p>
                                  <p class="desc-stat">Intermediate</p>
                                </div>
                                <div class="stat col-xs-4">
                                  <p class="number-stat" style="color: #03a9f4!important"><Span><%= JspServices.round(st.getGraduationPercentage(),2) %></Span>%</p>
                                  <p class="desc-stat">Graduation</p>
                                </div>
                        </div>
                    <!-- persentage end-->

                    <!--social link-->
                    <div class="col-lg-12" style="margin-top: 20px;margin-bottom: 30px">
                            <div class="col-lg-6  padding_zero">
                                <a href="<%= st.getFbLink() %>" target="_blank" style="float: right!important;padding-right: 10px;"><img class="sub-heading margin_zero padding_zero" style="width: 30px; height: 30px" src="<c:url value="/resources/images/fb.png"/>"></a>
                            </div>
                            <div class="col-lg-6  padding_zero">
                                <a href="<%= st.getLnLink() %>" target="_blank" style="float: left!important; padding-left: 10px;"><img class="sub-heading-right margin_zero padding_zero" style="width: 30px; height: 30px" src="<c:url value="/resources/images/in.png"/>"></a>
                            </div>
                        </div>
                    <!-- end social link-->
                    
                    
                  </div>
    </div>
    </div>

    <div class="myholder70" >
        <div class="col-lg-12 padding_zero mycontainer">
            <div class="col-lg-6 " style="padding : 0px 1px 0px 0px!important;">
                    <div class="" >
                            <div class="col-lg-12 padding_zero" style="background-color: #673ab7;">
                                <div class="col-lg-6 padding_zero"><p class="sub-heading margin_zero" style="padding: 5px 20px;color: white!important">&#9679;&nbsp;&nbsp;&nbsp;Personal Details</p></div>
                                <div class="col-lg-6 padding_zero"><a href="#" class="desc-stat margin_zero right" style="padding: 5px 20px;color: white!important;"><img src="<c:url value="/resources/images/edit.png"/>" style="width: 20px;height: 20px;" alt="Edit"></a></div>
                                
                            </div>
                            <div class="left"style="width: 50%;padding: 10px ;">
                                <table>
                                            <tr>
                                                <td class="sub-heading padding_zero">Name</td>
                                                <td class="desc-stat margin_zero"><%=st.getFullName() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Mail Id</td>
                                                <td class="desc-stat margin_zero"><%= st.getEmail() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Father Name</td>
                                                <td class="desc-stat margin_zero"><%=st.getParentName() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Gender</td>
                                                <td class="desc-stat margin_zero"><%=st.getGender() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">City</td>
                                                <td class="desc-stat margin_zero"><%=st.getCity() %></td>
                                            </tr>
                                </table>
                            </div>
                            <div class="right"style="width: 50%;padding: 10px;">
                                <table>
                                    <tr>
                                            <td class="sub-heading padding_zero">DOB</td>
                                                <td class="desc-stat margin_zero"><%=st.getDob() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Personal No.</td>
                                                <td class="desc-stat margin_zero"><%=st.getMobile() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Parent No.</td>
                                                <td class="desc-stat margin_zero"><%=st.getMobile_Parent() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Locality</td>
                                                <td class="desc-stat margin_zero"><%= st.getLocality() %></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">State</td>
                                                <td class="desc-stat margin_zero"><%= st.getState() %></td>
                                            </tr>
                                        </table> 
                            </div>
                        </div>
            </div>
            
           
            <div class="col-lg-6" style="padding : 0px 0px 0px 1px!important">
                    <div class="" >
                            <div class="col-lg-12 padding_zero" style="background-color: #07a9f4;">
                                <div class="col-lg-9 padding_zero"><p class="sub-heading margin_zero" style="padding: 5px 20px;color: white!important">&#9679;&nbsp;&nbsp;&nbsp;Education Details</p></div>
                                <div class="col-lg-3 padding_zero"><a href="#" class="desc-stat margin_zero right" style="padding: 5px 20px;color: white!important;"><img src="<c:url value="/resources/images/edit.png"/>" style="width: 20px;height: 20px;" alt="Edit"></a></div>
                                
                            </div>
                            <div class="col-lg-12 padding_zero">
                            
                            <div class="left"style="width: 70%;padding: 10px ;">
                                <table>
                                            <tr>
                                                <td class="sub-heading padding_zero" style="width:auto!important;">College</td>
                                                <td class="desc-stat margin_zero" colspan="2"> <%=st.getGraduationCollege()%> </td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Stream</td>
                                                <td></td>
                                                <td class="desc-stat margin_zero"><%=st.getGraduationType()%></td>
                                            </tr>
                                                      
                                </table>
                            </div>
                            <div class="right"style="width: 30%;padding: 10px;">
                                <table>
                                    <tr>
                                            <td class="sub-heading padding_zero">YOP</td>
                                                <td class="desc-stat margin_zero"><%=st.getGraduationYOP()%></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Branch</td>
                                                <td class="desc-stat margin_zero"><%=st.getGraduationBranch()%></td>
                                            </tr>
                                                    
                                        </table> 
                            </div>
                  			
                            </div>
                            <div class="col-lg-12 padding_zero">
                            	 <div class="left"style="width: 50%;padding: 0px 10px 10px ;">
                                <table>
                                            
                                            <tr>
                                                <td class="sub-heading padding_zero" colspan="2" style="text-align: center;color: #03a9f4">SSC</td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Board</td>
                                                <td class="desc-stat margin_zero"><%=st.getSscBoard()%></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Math Mark</td>
                                                <td class="desc-stat margin_zero"><%=st.getSscMaths()%></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Percentage</td>
                                                <td class="desc-stat margin_zero"><span><%=JspServices.round(st.getSscPercentage(), 2)%></span>%</td>
                                            </tr>
                                            
                                </table>
                            </div>
                            	<div class="right"style="width: 50%;padding: 0px 10px 10px;">
                                <table>
                                    <tr>
                                           <tr>
                                                <td class="sub-heading padding_zero" colspan="2" style="text-align: center;color: #03a9f4">Intermediate</td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Board</td>
                                                <td class="desc-stat margin_zero"><%=st.getInterBoard()%></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Math Mark</td>
                                                <td class="desc-stat margin_zero"><%=st.getInterMaths()%></td>
                                            </tr>
                                            <tr>
                                                <td class="sub-heading padding_zero">Percentage</td>
                                                <td class="desc-stat margin_zero"><span><%=JspServices.round(st.getInterPercentage(), 2)%></span>%</td>
                                            </tr>
                                           
                                        </table> 
                            </div>
                              
                            </div>
                           
                        </div>
            </div>
        </div>
        <div class="col-lg-12 padding_zero mycontainer" style="margin-top: 6px">
            <div class="col-lg-12 padding_zero" style="background-color: #fc9712;">
                <div class="col-lg-6 padding_zero"><p class="sub-heading margin_zero" style="padding: 5px 20px;color: white!important">&#9679;&nbsp;&nbsp;&nbsp;Course Details</p></div>
                <div class="col-lg-6 padding_zero"></div>
            </div>
            <button class="tablink" onclick="openPage('Home', this)" style="background-color:#fff;color: #000;">Overall</button>
            <button class="tablink" onclick="openPage('java', this)">Java</button>
            <button class="tablink" onclick="openPage('apti', this)">Aptitude</button>
            <button class="tablink" onclick="openPage('com', this)">Communication</button>
            <button class="tablink" onclick="openPage('linux', this)">Linux &amp; DB</button>
            
            <div id="Home" class="tabcontent" style="display: block;" >
              <div class="col-lg-12 padding_zero" style="margin-top: 60px">
                <div class="col-lg-7">
                        <div class="col-lg-12 padding_zero">
                                <div class="col-lg-6 padding_zero">
                                        <h3 style="text-align: left;font-weight: 900;font-size: 13px;color: #000;margin: 10px 0px 5px 0px;">Java</h3>
                                        <div class="col-lg-12 padding_zero" style="text-align: center">
                                        
                                                <p style="display:none;">{{stud.fJava=getFaculty("java")}}</p>
                                                <div class="col-lg-4 padding_zero">
                                                    <img class="photo teacherimage" ng-src="{{stud.fJava.urlPic}}"/>
                                                </div>
                                                <div class="col-lg-8 padding_zero" style="margin-top: 10px">
                                                       
                                                       <h4 class="name" style="font-size: 14px">{{stud.fJava.name}}</h4>
                                                        <p class="info margin_zero">{{stud.fJava.exp}} year Exp.</p>
                                                        <p class="info margin_zero"><span><i class="fas fa-envelope"></i></span>{{stud.fJava.email}}</p>
                                                        <p class="info"><i class="fas fa-phone"></i>{{stud.fJava.mobile}}</p>
                                                
                                                </div>
                                            
                                        </div>
                                </div>
                                <div class="col-lg-6 padding_zero">
                                        <h3 style="text-align: left;font-weight: 900;font-size: 13px;color: #000; margin: 10px 0px 5px 0px;">Aptitude</h3>
                                        <div class="col-lg-12 padding_zero" style="text-align: center">
                                        <p style="display:none;">{{stud.fApti=getFaculty("aptitude")}}</p>
                                                <div class="col-lg-4 padding_zero">
                                                    <img class="photo teacherimage" ng-src="{{stud.fApti.urlPic}}"/>
                                                </div>
                                                <div class="col-lg-8 padding_zero" style="margin-top: 10px">
                                                        <h4 class="name" style="font-size: 14px">{{stud.fApti.name}}</h4>
                                                        <p class="info margin_zero">{{stud.fApti.exp}} year Exp.</p>
                                                        <p class="info margin_zero"><span><i class="fas fa-envelope"></i></span>{{stud.fApti.email}}</p>
                                                        <p class="info"><i class="fas fa-phone"></i>{{stud.fApti.mobile}}</p>
                                                </div>
                                            
                                        </div>
                                </div>
                        </div>
                        <div class="col-lg-12 padding_zero" style="margin-bottom: 20px">
                                <div class="col-lg-6 padding_zero">
                                        <h3 style="text-align: left;font-weight: 900;font-size: 13px;color: #000;margin: 10px 0px 5px 0px;">Communication</h3>
                                        <div class="col-lg-12 padding_zero" style="text-align: center">
                                        <p style="display:none;">{{stud.fCom=getFaculty("communication")}}</p>
                                                 <div class="col-lg-4 padding_zero">
                                                
                                                    <img class="photo teacherimage" ng-src="{{stud.fCom.urlPic}}"/>
                                                </div>
                                                <div class="col-lg-8 padding_zero" style="margin-top: 10px">
                                                        <h4 class="name" style="font-size: 14px">{{stud.fCom.name}}</h4>
                                                        <p class="info margin_zero">{{stud.fCom.exp}} year Exp.</p>
                                                        <p class="info margin_zero"><span><i class="fas fa-envelope"></i></span>{{stud.fCom.email}}</p>
                                                        <p class="info"><i class="fas fa-phone"></i>{{stud.fCom.mobile}}</p>
                                                </div>
                                            
                                        </div>
                                </div>
                                <div class="col-lg-6 padding_zero">
                                        <h3 style="text-align: left;font-weight: 900;font-size: 13px;color: #000; margin: 10px 0px 5px 0px;">Linux &amp; DB</h3>
                                        <div class="col-lg-12 padding_zero" style="text-align: center">
                                        <p style="display:none;">{{stud.fLinux=getFaculty("linux")}}</p>
                                               <div class="col-lg-4 padding_zero">
                                                
                                                    <img class="photo teacherimage" src="{{stud.fLinux.urlPic}}"/>
                                                </div>
                                                <div class="col-lg-8 padding_zero" style="margin-top: 10px">
                                                        <h4 class="name" style="font-size: 14px">{{stud.fLinux.name}}</h4>
                                                        <p class="info margin_zero">{{stud.fLinux.exp}} year Exp.</p>
                                                        <p class="info margin_zero"><span><i class="fas fa-envelope"></i></span>{{stud.fLinux.email}}</p>
                                                        <p class="info"><i class="fas fa-phone"></i>{{stud.fLinux.mobile}}</p>
                                                </div>
                                        </div>
                                </div>
                        </div>

                  </div>
                  <div class="col-lg-5">
                      <div class="col-lg-12">
                              <div class="col-lg-6">
                                    <h3 class="sub-heading-right margin_zero" style="text-align: right"><span style="color: green">&#9724;</span>&nbsp;Completed</h3>
                              </div>
                              <div class="col-lg-6">
                                    <h3 class="sub-heading-right margin_zero" style="text-align: left"><span style="color: red">&#9724;</span>&nbsp;Missed</h3>
                          </div>
                      </div>
                    <div>

                            <div class="col-lg-12 padding_zero" style="margin:5px ">
                                    <div class="col-lg-6  padding_zero">
                                        <h3 class="sub-heading margin_zero padding_zero">Java :</h3>
                                    </div>
                                    <div class="col-lg-6  padding_zero">
                                        <!--<h3 class="sub-heading-right margin_zero">( <span>5000</span> remaining )</h3>-->
                                    </div>
                                    
                                </div>
                                
                                <div class="col-lg-12 padding_zero">
                                        <div class="progress" style="height: 15px;">
                                                <div class="progress-bar progress-bar-success" role="progressbar" ng-style="javaCompletedPer">
                                                </div>
                                                
                                                <div class="progress-bar progress-bar-danger" role="progressbar" ng-style="javaMissedPer">
                                                </div>
                                              </div>
                                		</div>
                    </div>

                    <div>
                                        <div class="col-lg-12 padding_zero" style="margin:5px ">
                                                <div class="col-lg-6  padding_zero">
                                                    <h3 class="sub-heading margin_zero padding_zero">Aptitude :</h3>
                                                </div>
                                                <div class="col-lg-6  padding_zero">
                                                    <!--<h3 class="sub-heading-right margin_zero">( <span>5000</span> remaining )</h3>-->
                                                </div>
                                                
                                            </div>
                                            
                                            <div class="col-lg-12 padding_zero">
                                                    <div class="progress" style="height: 15px;">
                                                            <div class="progress-bar progress-bar-success" role="progressbar" ng-style="aptiCompletedPer">
                                                            </div>
                                                            
                                                            <div class="progress-bar progress-bar-danger" role="progressbar" ng-style="aptiMissedPer">
                                                            </div>
                                                          </div>
                                            </div>
                    </div>

                    <div>
                                                <div class="col-lg-12 padding_zero" style="margin:5px ">
                                                        <div class="col-lg-6  padding_zero">
                                                            <h3 class="sub-heading margin_zero padding_zero">Communication :</h3>
                                                        </div>
                                                        <div class="col-lg-6  padding_zero">
                                                            <!--<h3 class="sub-heading-right margin_zero">( <span>5000</span> remaining )</h3>-->
                                                        </div>
                                                        
                                                    </div>
                                                    
                                                    <div class="col-lg-12 padding_zero">
                                                            <div class="progress" style="height: 15px;">
                                                                    <div class="progress-bar progress-bar-success" role="progressbar" ng-style="commCompletedPer">
                                                                    </div>
                                                                    
                                                                    <div class="progress-bar progress-bar-danger" role="progressbar" ng-style="commMissedPer">
                                                                    </div>
                                                                  </div>
                                                    </div>
                    </div>

                    <div>
                                                            <div class="col-lg-12 padding_zero" style="margin:5px ">
                                                                    <div class="col-lg-6  padding_zero">
                                                                        <h3 class="sub-heading margin_zero padding_zero">Linux &amp; DB :</h3>
                                                                    </div>
                                                                    <div class="col-lg-6  padding_zero">
                                                                        <!--<h3 class="sub-heading-right margin_zero">( <span>5000</span> remaining )</h3>-->
                                                                    </div>
                                                                    
                                                                </div>
                                                                
                                                                <div class="col-lg-12 padding_zero">
                                                                        <div class="progress" style="height: 15px;">
                                                                                <div class="progress-bar progress-bar-success" role="progressbar" ng-style="linuxCompletedPer">
                                                                                </div>
                                                                                
                                                                                <div class="progress-bar progress-bar-danger" role="progressbar" ng-style="linuxMissedPer">
                                                                                </div>
                                                                              </div>
                                                                </div>
                    </div>
                    </div>

                  </div>

            </div>

            <div id="java" class="tabcontent">
                <div class="col-lg-12 padding_zero">
                        <div id="java1" class="tabcontentjava" style="display: block;">
                                <table class="mytable table-hover table-striped">
                                    <tr>
                                      	<th>SL No.</th>
                                      	<th>Topic Name</th>
                                      	<th>DayList</th>
                                      	<th>Status</th>
                                    </tr>
                                    <tr ng-repeat="list in topicStatusList.java">
                                  		<td>{{$index + 1}}</td>
                                  		<td>{{list.name}}</td>
                                  		<td><p style="margin:0px;font-size:14px;" ng-repeat="date in list.dateWise">{{date.replace('@', ' : ')}}</p></td>
                                  		<td>{{list.status}}</td>
                              		</tr>
                                </table>
                        </div>
                        <div id="java2" class="tabcontentjava">
                                <table class="mytable table-hover table-striped">
                                        <tr>
                                          <th style="font-size:10px;width:40px;padding:0px;">SL No.</th>
                                          <th>Exam Date</th>
                                          <th>Exam Type</th>
                                          <th style="width:200px">Topic</th>
                                          <th>Total Mark</th>
                                          <th>Score</th>
                                          <th>Percentage</th>
                                          <th style="width:150px">remark</th>
                                        </tr>
                                        <tr ng-repeat="list in sudentScoreList.java">
                        				  <td>{{$index + 1}}</td>
                                          <td>{{list.examDate}}</td>
                                          <td>{{list.examType}}</td>
                                          <td style="font-size:12px;">{{list.topic}}</td>
                                          <td>{{myRound(list.fullmark)}}</td>
                                          <td>{{myRound(list.score)}}</td>
                                          <td>{{myRound((list.score*100)/list.fullmark)}}%</td>
                                          <td style="font-size:12px;" >{{list.remark}}</td>
                                        </tr>
                                    </table>
                        </div>
                        <div id="java3" class="tabcontentjava">
                                <table class="mytable table-hover table-striped">
                                        <tr>
                                          <th>SL No.</th>
                                          <th>Duration</th>
                                          <th>Chapter Name</th>
                                          <th>Resource</th>
                                        </tr>
                                        <tr ng-repeat="list in javaTopic">
                                          <td>{{$index + 1}}</td>
                                          <td><span>{{list.durationDays}}</span> Days</td>
                                          <td>{{list.topicName}}</td>
                                          <td><a target="_blank" href="{{list.resource}}">Read</a></td>
                                        </tr>        
                                    </table>
                        </div>
                        <div id="java4" class="tabcontentjava">
                                <table class="mytable table-hover table-striped">
                                        <tr>
                                          <th>Upload Date</th>
                                          <th>Chapter Name</th>
                                          <th>Upload By</th>
                                          <th>Resource</th>
                                        </tr>
                                        <c:forEach items="${JavaFiles }" var="j">
            							  <tr>
            								<td>${j.getUploadDate() }</td>
            								<td>${j.getFileName() }</td>
            								<td>${j.getFileBy() }</td>
            								<td><a href="getFile/${j.getId() }" target="_blank">Download it</a></td>
            							  </tr>
            							</c:forEach>
            
                                </table>
                        </div>
                        <button class="tablinkjava" onclick="openPageJava('java1', this)" style="background-color:#fff;color: #000;">Chapter wise</button>
                        <button class="tablinkjava" onclick="openPageJava('java2', this)">Exam Score</button>
                        <button class="tablinkjava" onclick="openPageJava('java3', this)">Syllabus</button>
                        <button class="tablinkjava" onclick="openPageJava('java4', this)">Material</button>
                </div>
                
            </div>
            
            <div id="apti" class="tabcontent">
                    <div class="col-lg-12 padding_zero">
                            <div id="apti1" class="tabcontentapti" style="display: block;">
                                    <table class="mytable table-hover table-striped">
                                    <tr>
                                      	<th>SL No.</th>
                                      	<th>Topic Name</th>
                                      	<th>DayList</th>
                                      	<th>Status</th>
                                    </tr>
                                    <tr ng-repeat="list in topicStatusList.aptitude">
                                  		<td>{{$index + 1}}</td>
                                  		<td>{{list.name}}</td>
                                  		<td><p style="margin:0px;font-size:14px;" ng-repeat="date in list.dateWise">{{date.replace('@', ' : ')}}</p></td>
                                  		<td>{{list.status}}</td>
                              		</tr>
                                </table>
                            </div>
                            <div id="apti2" class="tabcontentapti">
                                    <table class="mytable table-hover table-striped">
                                        <tr>
                                          <th style="font-size:10px;width:40px;padding:0px;">SL No.</th>
                                          <th>Exam Date</th>
                                          <th>Exam Type</th>
                                          <th style="width:200px">Topic</th>
                                          <th>Total Mark</th>
                                          <th>Score</th>
                                          <th>Percentage</th>
                                          <th style="width:150px">remark</th>
                                        </tr>
                                        <tr ng-repeat="list in sudentScoreList.aptitude">
                        				  <td>{{$index + 1}}</td>
                                          <td>{{list.examDate}}</td>
                                          <td>{{list.examType}}</td>
                                          <td style="font-size:12px;">{{list.topic}}</td>
                                          <td>{{myRound(list.fullmark)}}</td>
                                          <td>{{myRound(list.score)}}</td>
                                          <td>{{myRound((list.score*100)/list.fullmark)}}%</td>
                                          <td style="font-size:12px;" >{{list.remark}}</td>
                                        </tr>
                                    </table>
                            </div>
                            <div id="apti3" class="tabcontentapti">
                                    <table class="mytable">
                                            <tr>
                                              <th>SL No.</th>
                                              <th>Duration</th>
                                              <th>Chapter Name</th>
                                              <th>Resource</th>
                                            </tr>
                                            <tr ng-repeat="list in aptiTopic">
                                        	  	<td>{{$index + 1}}</td>
                                          		<td><span>{{list.durationDays}}</span> Days</td>
                                          		<td>{{list.topicName}}</td>
                                          		<td><a target="_blank" href="{{list.resource}}">Read</a></td>
                                        	</tr>        
                                        </table>
                            </div>
                            <div id="apti4" class="tabcontentapti">
                                    <table class="mytable">
                                        <tr>
                                          <th>Upload Date</th>
                                          <th>Chapter Name</th>
                                          <th>Upload By</th>
                                          <th>Resource</th>
                                        </tr>
                                        <c:forEach items="${MathFiles}" var="j">
            							  <tr>
            								<td>${j.getUploadDate() }</td>
            								<td>${j.getFileName() }</td>
            								<td>${j.getFileBy() }</td>
            								<td><a href="getFile/${j.getId() }" target="_blank">Download it</a></td>
            							  </tr>
            							</c:forEach>        
                                        </table>
                            </div>
                            <button class="tablinkapti" onclick="openPageapti('apti1', this)" style="background-color:#fff;color: #000;">Chapter wise</button>
                            <button class="tablinkapti" onclick="openPageapti('apti2', this)">Exam Score</button>
                            <button class="tablinkapti" onclick="openPageapti('apti3', this)">Syllabus</button>
                            <button class="tablinkapti" onclick="openPageapti('apti4', this)">Material</button>
                    </div>
            </div>
            
            <div id="com" class="tabcontent">
                    <div class="col-lg-12 padding_zero">
                            <div id="com1" class="tabcontentcom" style="display: block;">
                                   <table class="mytable table-hover table-striped">
                                    <tr>
                                      	<th>SL No.</th>
                                      	<th>Topic Name</th>
                                      	<th>DayList</th>
                                      	<th>Status</th>
                                    </tr>
                                    <tr ng-repeat="list in topicStatusList.communication">
                                  		<td>{{$index + 1}}</td>
                                  		<td>{{list.name}}</td>
                                  		<td><p style="margin:0px;font-size:14px;" ng-repeat="date in list.dateWise">{{date.replace('@', ' : ')}}</p></td>
                                  		<td>{{list.status}}</td>
                              		</tr>
                                </table> 
                            </div>
                            <div id="com2" class="tabcontentcom">
                                     <table class="mytable table-hover table-striped">
                                        <tr>
                                          <th style="font-size:10px;width:40px;padding:0px;">SL No.</th>
                                          <th>Exam Date</th>
                                          <th>Exam Type</th>
                                          <th style="width:200px">Topic</th>
                                          <th>Total Mark</th>
                                          <th>Score</th>
                                          <th>Percentage</th>
                                          <th style="width:150px">remark</th>
                                        </tr>
                                        <tr ng-repeat="list in sudentScoreList.communication">
                        				  <td>{{$index + 1}}</td>
                                          <td>{{list.examDate}}</td>
                                          <td>{{list.examType}}</td>
                                          <td style="font-size:12px;">{{list.topic}}</td>
                                          <td>{{myRound(list.fullmark)}}</td>
                                          <td>{{myRound(list.score)}}</td>
                                          <td>{{myRound((list.score*100)/list.fullmark)}}%</td>
                                          <td style="font-size:12px;" >{{list.remark}}</td>
                                        </tr>
                                    </table>
                            </div>
                            <div id="com3" class="tabcontentcom">
                                    <table class="mytable">
                                            <tr>
                                              <th>SL No.</th>
                                              <th>Duration</th>
                                              <th>Chapter Name</th>
                                              <th>Resource</th>
                                            </tr>
                                           <tr ng-repeat="list in commTopic">
                                         	 <td>{{$index + 1}}</td>
                                          	 <td><span>{{list.durationDays}}</span> Days</td>
                                         	 <td>{{list.topicName}}</td>
                                         	 <td><a target="_blank" href="{{list.resource}}">Read</a></td>
                                       	 </tr>        
                                        </table>
                            </div>
                            <div id="com4" class="tabcontentcom">
                                    <table class="mytable">
                                            <tr>
                                              <th>Upload Date</th>
                                              <th>Chapter Name</th>
                                              <th>Upload By</th>
                                              <th>Resource</th>
                                            </tr>
                                            <c:forEach items="${CommsFiles}" var="j">
            							  	<tr>
            									<td>${j.getUploadDate() }</td>
            									<td>${j.getFileName() }</td>
            									<td>${j.getFileBy() }</td>
            									<td><a href="getFile/${j.getId() }" target="_blank">Download it</a></td>
            							    </tr>
            								</c:forEach>       
                                        </table>
                            </div>
                            <button class="tablinkcom" onclick="openPagecom('com1', this)" style="background-color:#fff;color: #000;">Chapter wise</button>
                            <button class="tablinkcom" onclick="openPagecom('com2', this)">Exam Score</button>
                            <button class="tablinkcom" onclick="openPagecom('com3', this)">Syllabus</button>
                            <button class="tablinkcom" onclick="openPagecom('com4', this)">Matterial</button>
                    </div>
            </div>
            <div id="linux" class="tabcontent" >
                    <div class="col-lg-12 padding_zero">
                            <div id="lin1" class="tabcontentlinux" style="display: block;">
                                   <table class="mytable table-hover table-striped">
                                    <tr>
                                      	<th>SL No.</th>
                                      	<th>Topic Name</th>
                                      	<th>DayList</th>
                                      	<th>Status</th>
                                    </tr>
                                    <tr ng-repeat="list in topicStatusList.linux.concat(topicStatusList.mysql)">
                                  		<td>{{$index + 1}}</td>
                                  		<td>{{list.name}}</td>
                                  		<td><p style="margin:0px;font-size:14px;" ng-repeat="date in list.dateWise">{{date.replace('@', ' : ')}}</p></td>
                                  		<td>{{list.status}}</td>
                              		</tr>
                                </table> 
                            </div>
                            <div id="lin2" class="tabcontentlinux">
                                    <table class="mytable table-hover table-striped">
                                        <tr>
                                          <th style="font-size:10px;width:40px;padding:0px;">SL No.</th>
                                          <th>Exam Date</th>
                                          <th>Exam Type</th>
                                          <th style="width:200px">Topic</th>
                                          <th>Total Mark</th>
                                          <th>Score</th>
                                          <th>Percentage</th>
                                          <th style="width:150px">remark</th>
                                        </tr>
                                        <tr ng-repeat="list in sudentScoreList.linux">
                        				  <td>{{$index + 1}}</td>
                                          <td>{{list.examDate}}</td>
                                          <td>{{list.examType}}</td>
                                          <td style="font-size:12px;">{{list.topic}}</td>
                                          <td>{{myRound(list.fullmark)}}</td>
                                          <td>{{myRound(list.score)}}</td>
                                          <td>{{myRound((list.score*100)/list.fullmark)}}%</td>
                                          <td style="font-size:12px;">{{list.remark}}</td>
                                        </tr>
                                    </table>
                            </div>
                            <div id="lin3" class="tabcontentlinux">
                                    <table class="mytable">
                                            <tr>
                                              <th>SL No.</th>
                                              <th>Duration</th>
                                              <th>Chapter Name</th>
                                              <th>Resource</th>
                                            </tr>
                                            <tr ng-repeat="list in linuxTopic">
                                         		<td>{{$index + 1}}</td>
                                          		<td><span>{{list.durationDays}}</span> Days</td>
                                          		<td>{{list.topicName}}</td>
                                          		<td><a target="_blank" href="{{list.resource}}">Read</a></td>
                                        	</tr>
                                    </table>
                            </div>
                            <div id="lin4" class="tabcontentlinux">
                                    <table class="mytable">
                                            <tr>
                                              <th>Upload Date</th>
                                              <th>Chapter Name</th>
                                              <th>Upload By</th>
                                              <th>Resource</th>
                                            </tr>
                                            <c:forEach items="${LinuxFiles}" var="j">
            							  	<tr>
            									<td>${j.getUploadDate() }</td>
            									<td>${j.getFileName() }</td>
            									<td>${j.getFileBy() }</td>
            									<td><a href="getFile/${j.getId() }" target="_blank">Download it</a></td>
            							    </tr>
            								</c:forEach>        
                                        </table>
                            </div>
                            <button class="tablinklinux" onclick="openPagelin('lin1', this)" style="background-color:#fff;color: #000;">Chapter wise</button>
                            <button class="tablinklinux" onclick="openPagelin('lin2', this)">Exam Score</button>
                            <button class="tablinklinux" onclick="openPagelin('lin3', this)">Syllabus</button>
                            <button class="tablinklinux" onclick="openPagelin('lin4', this)">Matterial</button>
                    </div>
            </div>
        </div>
    </div>

    <div class="col-xs-12 padding_zero" style="margin-bottom: 50px">
        
        <div class="timetable">
            <div class="mycon col-lg-12 padding_zero">
                <div class="col-lg-12 padding_zero" style="background-color: #673ab7;">
                    <div class="col-lg-6 padding_zero"><p class="sub-heading margin_zero" style="padding: 5px 20px;color: white!important">&#9679;&nbsp;&nbsp;&nbsp;Time Table</p></div>
                    <div class="col-lg-6 padding_zero"></div>
                </div>
                <div class="col-lg-12"  style="padding: 20px!important">
                        <table class="mytimetable">
                            <tr >
                                <th>{{timeTable.head.header}}</th>
                                <th ng-repeat="list in timeTable.head.info">{{list.split(':00').join('')}}</th>
                            </tr>
                            <tr ng-repeat="list in timeTable.body track by $index">
                                <td ng-style="getBackGroundColor(list.header)">{{list.header}}</td>
                                <td ng-style="getBackGroundColor(list.header)" ng-repeat="xyz in list.info"><p ng-style="getActiveBackGroundColor($index,list.header)">{{getOriginalData(xyz)}}</p></td>
                            </tr>
                       </table>
                </div>
            </div>    
        </div>
        <div class="notice">
            <div class="mycon"  style="height: 245px;">
                    <div class=" col-lg-12 padding_zero" >
                            <div class="col-lg-12 padding_zero" style="background-color: #3ab7b7;">
                                <div class="col-lg-6 padding_zero"><p class="sub-heading margin_zero" style="padding: 5px 20px;color: white!important">&#9679;&nbsp;&nbsp;&nbsp;Notice</p></div>
                                <div class="col-lg-6 padding_zero"></div>
                            </div>
                            <div class="col-lg-12" style="overflow-y: scroll;height: 210px;" >    
                                <div class="col-lg-12" style="padding:  10px 10px 0px" ng-repeat="list in notificationList">
                                        <div class="col-lg-6 padding_zero">
                                                <h3 style="text-align: left;font-weight: 900;font-size: 13px;color: #000;margin: 10px 0px 5px 0px;">{{$index+1}} .</h3>
                                        </div>
                                        <div class="col-lg-6 padding_zero">
                                                <h3 style="text-align: right;font-weight: 900;font-size: 13px;color: #000;margin: 10px 0px 5px 0px;"><span>{{list.postDate}}</span> ( <span>{{list.name}}</span> )</h3>
                                        </div>
                                       
                                       <h3 style="text-align:center;font-size: 16px;color: rgb(110, 110, 110);margin: 5px">{{list.notification}}</h3>
                                </div>
                           </div>
                    </div>
            </div>
            
        </div>
    </div>
</div>
</div>
			<!-- 				
			<div >
                <div class="row profileRow">
					<p class="subHeadText">Student Profile</p>
                    <div class="col-md-2 col-sm-2 col-xs-12" style="">
                        <div class="card">
                        
                            <img src="<c:url value="/resources/images/img_avatar2.png"/>" class="cardPhoto" alt="Avatar" style="width:100%">
                            <div class="container-fluid" style="text-align:center;">
                                <h4><strong><%=st.getFullName() %></strong></h4> 
                                 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-6 personalDetails">
                        <div class="container-fluid">
                                <p class="profilePara">Student ID <span style="float: right;">:</span></p>
                                <p class="profilePara">Full Name <span style="float: right;">:</span></p>
                                <p class="profilePara">Father Name <span style="float: right;">:</span></p>
                                <p class="profilePara">Mobile <span style="float: right;">:</span></p>
                                <p class="profilePara">Parent Mobile <span style="float: right;">:</span></p>
                                <p class="profilePara">Email <span style="float: right;">:</span></p>
                                <p class="profilePara">Gender <span style="float: right;">:</span></p>
                        </div>
                    </div>
					<div class="col-md-3 col-sm-3 col-xs-6 personalDetails">
						<div class="container-fluid">
							<p class="proParaText" id="stdIdEmail"><%=st.getEmail() %></p>
							<p class="proParaText" id="stdName"><%=st.getFullName() %></p>
							<p class="proParaText" id="stdFname"><%=st.getParentName() %></p>
							<p class="proParaText" id="stdMob"><%=st.getMobile() %></p>
							<p class="proParaText" id="stdParentMob"><%=st.getMobile_Parent() %></p>
							<p class="proParaText" id="stdMail"><%=st.getEmail() %></p>
							<p class="proParaText" id="stdGender"><%=st.getGender() %></p>
						</div>
					</div>
                    <div class="col-md-2 col-sm-2 col-xs-6 personalDetails">
                        <div class="container-fluid">
                            <p class="profilePara">Batch no <span style="float: right;">:</span></p>
                            <p class="profilePara">Fee Paid <span style="float: right;">:</span></p>
                            <p class="profilePara">Fee Due <span style="float: right;">:</span></p>
							<p class="profilePara">City <span style="float: right;">:</span></p>
							<p class="profilePara">State <span style="float: right;">:</span></p>
                        </div>
                    </div>
					<div class="col-md-3 col-sm-3 col-xs-6 personalDetails">
						<div class="container-fluid">
							<p class="proParaText" id="stdBatch"><%=st.getBatchNumber() %></p>
							<p class="proParaText" id="stdFeePaid"><%=st.getFeePaid() %></p>
							<p class="proParaText" id="stdFeeDue"><%=st.getfeeTotal()-st.getFeePaid() %></p>
							<p class="proParaText" id="stdFeeDue"><%=st.getCity() %></p>
							<p class="proParaText" id="stdFeeDue"><%=st.getState() %></p>
						</div>
					</div>
                </div>
            </div>
			</div>
			<!-- student profile end-->

			<!-- Statistics start-->
			<div id="statistics" style="display: none;height:380px;">
			<br>
                <div class="row statisticsRow">
                    <div class="col-md-5 col-sm-5 col-xs-12 scrollClass statsInnerCLass">
                        <div class="row">
							<!-- <i class="fa fa-refresh fa-spin fa-3x fa-fw" style="float:left;"></i> -->
							<p class="subHeadText">Student statistics</p>
							
							
							<c:forEach items="${qpDone }" var="qp">
							<div class="col-md-5 col-sm-5 col-xs-12 testResultBox">
							<c:if test="${qp.getQp_type() == 'Multiple' }">
							<!-- <p>
								<input type="checkbox" id="test1" />
         						<label for="test1"></label>
        					</p> -->
							<input class="checkAllQps" type="checkbox" onclick="prepareForSummary(this,${qp.getQp_id() },'${qp.getQuestions() }','<%=st.getEmail()%>')">
							</c:if>
								<p class="testClass" style="padding-top:2%;"><i class="fa fa-book" style="margin-right:1.5%;" aria-hidden="true"></i>Test name : <span style="font-weight: 500" id="tname">${qp.getTestName() }</span></p>
								<p class="testClass"><i class="fa fa-calendar-o" style="margin-right:1.5%;" aria-hidden="true"></i>Written on : <span style="font-weight: 500" id="tdate">${qp.getCreationDate() }</span></p>
								<p class="testClass"><i class="fa fa-male" style="margin-right:1.5%;" aria-hidden="true"></i>Conducted by : <span style="font-weight: 500" id="tCunduncted">${qp.getPublishedBy() }</span></p>
								<p class="testClass"><i class="fa fa-clock-o" style="margin-right:1.5%;" aria-hidden="true"></i> Duration :<span style="font-weight: 500" id="tduration">${qp.getDuration() } m</span></p>
								<button onclick="getScore('<%=st.getEmail()%>',${qp.getQp_id() })" class="viewResBtn">View result</button>
								
							  <c:if test="${qp.getQp_type() == 'Multiple' }">
								<br>
								<button class="btn btn-default resBtns" onclick="checkPaperAnswers('<%=st.getEmail()%>',${qp.getQp_id() },'${qp.getQuestions() }','${qp.getTestName() }')" >Check Answers</button>
							    <button class="btn btn-default resBtns" style="float:right !important;" onclick="analysisOfExam('<%=st.getEmail()%>',${qp.getQp_id() },'${qp.getQuestions() }','${qp.getTestName() }')" >Analysis</button>
							  	<br>
							  </c:if>
							  <c:if test="${qp.getQp_type() == 'QA' }">
								<br>
								<button class="btn btn-default resBtns" onclick="checkQAAnswers('<%=st.getEmail()%>',${qp.getQp_id() },'${qp.getTestName() }')" >Check Answers</button>
							  </c:if>
							</div>
							</c:forEach>
						</div>
						
                    </div>
                    <div id="resultStats" style="height:400px !important;overflow:auto;" class="col-md-7 col-sm-7 col-xs-12">
                     	<h2 id="examResultStat" class="viewMsgH">Your examination result</h2>
                        <br>
                    </div>
                </div><br>
            </div>
			<!--  statistics end-->




            <!-- Multiple choice test start-->
			<div id="multipleChoice" style="display: none;">
				<div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12"  style="border:1px solid #4e4e4e;border-radius:5px;">
                  
						
						<div class="row">
						
							<p class="subHeadText">Available Test Papers</p>
							<c:forEach items="${qpAvail }" var="qp" varStatus="theCount">
							<div class="col-md-3 col-sm-3 col-xs-12 takeTestBox">
								
								<c:if test="${theCount.index < 2}"><sapn style="float:right;">New</sapn></c:if>
								<p class="testClass" style="padding-top:2%;"><i class="fa fa-book" style="margin-right:1.5%;" aria-hidden="true"></i>Test name : <span style="font-weight: 500" id="tname">${qp.getTestName() }</span></p>
								<p class="testClass"><i class="fa fa-calendar-o" style="margin-right:1.5%;" aria-hidden="true"></i>Published on : <span style="font-weight: 500" id="tdate">${qp.getCreationDate() }</span></p>
								<p class="testClass"><i class="fa fa-male" style="margin-right:1.5%;" aria-hidden="true"></i>Published by : <span style="font-weight: 500" id="tCunduncted">${qp.getPublishedBy() }</span></p>
								<p class="testClass"><i class="fa fa-clock-o" style="margin-right:1.5%;" aria-hidden="true"></i> Duration :<span style="font-weight: 500" id="tduration">${qp.getDuration() } m</span></p>
								
								<button onclick="viewQPaper('${qp.questions}',${qp.getQp_id() },${qp.getDuration() })" class="viewResBtn">Take test</button>
							
							</div>
							</c:forEach>
						</div><br><br>
                    </div>
						<div class="row" id="overlayForM"   style="border:1px solid #4e4e4e;border-radius:5px;">
							<div class="col-md-12" id="multipleQPaper" style="background-color:#fff;border:2px solid #4e4e4e;border-radius:10px;color:#4e4e4e;">
								
							</div>
						</div>
                </div>
			</div>
			<!-- Multiple choice test end-->

			<div id="changePassword" style="display:none;border-radius:5px;">
			<div class="row">
				<p class="push">Change your password</p><br>
				<div class="col-md-12">
				<form method="post" id="changeStudentPassword" class="formClassForPassChange">
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
				                <button id="changestudentPasswordButton" class="btn btn-default" style="border:1px solid #00a69c !important;border-radius:5px !important;color:#00a69c !important;" onclick="changePassword();return false">Change</button>
				            </div>
				            <div class="col-md-3"></div>
				     </div>
				</form>
			</div>
		</div>
		</div>



<!-- theoretic test start-->
<div id="theoreticQp" style="display: none;height:500px;">
<br><br>
	<p class="subHeadText">Available Test Papers</p>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			
			
			<div class="row">
			
			<c:forEach items="${qaqpAvail }" var="qp" varStatus="theCount">
				<div class="col-md-3 col-sm-3 col-xs-12 takeTestBox">
				<c:if test="${theCount.index < 2}"><sapn style="float:right;">New</sapn></c:if>
					<p class="testClass" style="padding-top:2%;"><i class="fa fa-book" style="margin-right:1.5%;" aria-hidden="true"></i>Test name : <span style="font-weight: 500" id="tname">${qp.getTestName() }</span></p>
					<p class="testClass"><i class="fa fa-calendar-o" style="margin-right:1.5%;" aria-hidden="true"></i>Published on : <span style="font-weight: 500" id="tdate">${qp.getCreationDate() }</span></p>
					<p class="testClass"><i class="fa fa-male" style="margin-right:1.5%;" aria-hidden="true"></i>Published by : <span style="font-weight: 500" id="tCunduncted">${qp.getPublishedBy() }</span></p>
					<p class="testClass"><i class="fa fa-clock-o" style="margin-right:1.5%;" aria-hidden="true"></i> Duration :<span style="font-weight: 500" id="tduration">${qp.getDuration() } m</span></p>
					<p class="testClass"><i class="fa fa-clock-o" style="margin-right:1.5%;" aria-hidden="true"></i>is it Practice ?:<span style="font-weight: 500" id="tduration">${qp.getIsPractice() } </span></p>
					<button onclick="viewQAPaper('${qp.questions}',${qp.getDuration() },${qp.getQp_id() },'<%=st.getEmail()%>')" class="viewResBtn">Take test</button>
				</div>
			</c:forEach>
			</div>
			
		</div>
		<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12" id="overlayForQA" style="border:1px solid #4e4e4e;border-radius:5px;">
					<div id="qaQPaper">
						
					</div>
				</div>
		</div>
	</div>
</div>
<!-- theoretic test end-->
			
			
			
<!-- aptitude syllabus start -->

<div id="aptiSyllabus" style="display:none;border-radius:5px;">
	 <div class="row">
            <p class="push" style="text-align: center;">Aptitude syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12 scrollClass statsInnerCLass">
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
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




<!-- java syllabus start -->

<div id="javaSyllabus" style="display:none;border-radius:5px;">
<div class="row">
			<p class="push" style="text-align: center;">Technical syllabus</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12 scrollClass statsInnerCLass">
            
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
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
            <p class="push" style="text-align: center;">English syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12 scrollClass statsInnerCLass">
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
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
			<p class="push" style="text-align: center;">Linux syllabus</p>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12 scrollClass statsInnerCLass">
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



<!-- java Files start -->

<div id="JavaFiles" style="display:none;border-radius:5px;">
<div class="row">
			<p class="push" style="text-align: center;">Java Files</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12 scrollClass statsInnerCLass">
            
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">upload Date</th><th class="thText">File Name</th><th class="thText">Uploaded by</th><th class="thText">Link</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${JavaFiles }" var="j">
            <tr><td class="tdText">${j.getUploadDate() }</td><td class="tdText">${j.getFileName() }</td><td class="tdText">${j.getFileBy() }</td><td class="tdText"><a href="getFile/${j.getId() }" target="_blank">click For File</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- java Files end -->



<!-- Math Files start -->

<div id="MathFiles" style="display:none;border-radius:5px;">
<div class="row">
			<p class="push" style="text-align: center;">Math Files</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12 scrollClass statsInnerCLass">
            
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">upload Date</th><th class="thText">File Name</th><th class="thText">Uploaded by</th><th class="thText">Link</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${MathFiles }" var="j">
            <tr><td class="tdText">${j.getUploadDate() }</td><td class="tdText">${j.getFileName() }</td><td class="tdText">${j.getFileBy() }</td><td class="tdText"><a href="" target="_blank">click For File</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- Math Files end -->



<!-- Comms Files start -->

<div id="CommsFiles" style="display:none;border-radius:5px;">
<div class="row">
			<p class="push" style="text-align: center;">Communication Files</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12 scrollClass statsInnerCLass">
            
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">upload Date</th><th class="thText">File Name</th><th class="thText">Uploaded by</th><th class="thText">Link</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${CommsFiles }" var="j">
            <tr><td class="tdText">${j.getUploadDate() }</td><td class="tdText">${j.getFileName() }</td><td class="tdText">${j.getFileBy() }</td><td class="tdText"><a href="" target="_blank">click For File</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- Comms Files end -->


<!-- Linux Files start -->

<div id="LinuxFiles" style="display:none;border-radius:5px;">
<div class="row">
			<p class="push" style="text-align: center;">Linux Files</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12 scrollClass statsInnerCLass">
            
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">upload Date</th><th class="thText">File Name</th><th class="thText">Uploaded by</th><th class="thText">Link</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${LinuxFiles }" var="j">
            <tr><td class="tdText">${j.getUploadDate() }</td><td class="tdText">${j.getFileName() }</td><td class="tdText">${j.getFileBy() }</td><td class="tdText"><a href="" target="_blank">click For File</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- Linux Files end -->



<!-- Other Files start -->

<div id="OtherFiles" style="display:none;border-radius:5px;">
<div class="row">
			<p class="push" style="text-align: center;">Other Files</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12 scrollClass statsInnerCLass">
            
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">upload Date</th><th class="thText">File Name</th><th class="thText">Uploaded by</th><th class="thText">Link</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${OtherFiles }" var="j">
            <tr><td class="tdText">${j.getUploadDate() }</td><td class="tdText">${j.getFileName() }</td><td class="tdText">${j.getFileBy() }</td><td class="tdText"><a href="" target="_blank">click For File</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- Other Files end -->



<!-- MySQLFiles start -->

<div id="MySQLFiles" style="display:none;border-radius:5px;">
<div class="row">
			<p class="push" style="text-align: center;">MySQL Files</p>
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
            <div class="col-sm-10 col-md-10 col-xs-12 scrollClass statsInnerCLass">
            
            <table class="table table-responsive table-hover table-bordered table-condensed table-striped">
           	<thead>
            <tr class="theadText"><th class="thText">upload Date</th><th class="thText">File Name</th><th class="thText">Uploaded by</th><th class="thText">Link</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${MySQLFiles }" var="j">
            <tr><td class="tdText">${j.getUploadDate() }</td><td class="tdText">${j.getFileName() }</td><td class="tdText">${j.getFileBy() }</td><td class="tdText"><a href="" target="_blank">click For File</a></td></tr>
            </c:forEach>
           	</tbody>
            </table>
            
            </div>
            
            <div class="col-sm-1 col-md-1 col-xs-0"></div>
        </div>
</div>

<!-- MySQL Files end -->





<!-- Game begin -->


<div class="row" id="games">
	<div class="gameHead row" style="border:1px solid red;">
		<div class="leftGameHead col-sm-4 col-md-4 col-xs-0">
			<h3>Analysis on Numbers</h3>
			<span id="gameTimer">03:15</span>
			<img alt="Game running" class="gameLoader" src="<c:url value="/resources/images/Flickr.gif"/>">
		</div>
		
		<div class="rightGameHead col-sm-4 col-md-4 col-xs-0">
			<button type="button" class="btn-success gameBtn" id="startbtn">
				<i class="fa fa-stop" aria-hidden="true"></i>
			</button>
		 	<button type="button" class="btn-success gameBtn" style="background-color:red !important" id="abortbtn">
		 		<i class="fa fa-play" aria-hidden="true"></i>
			</button>
		</div>
		
		<div class="leftGameHead col-sm-4 col-md-4 col-xs-0">
		<small>Game Design & Development By:</small><span style="color:red;">Siddarth & Sreeman</span>
		</div>
	</div>
<div class='row'>
<div class="col-sm-8 col-md-8 col-xs-0 gameBody">

<div class="row" style=" text-align:center">
<span class="numberGame" id="numberGame">23</span>
</div>
<br>
<div class="row" style="text-align:center">
<span class="hintGame" id="hintGame"></span>
</div>
<br>
<div class="row" style="text-align:center">
<div class="col-sm-4 col-md-4 col-xs-0"></div>
<div class="col-sm-4 col-md-4 col-xs-0">
<i class="fa fa-hand-o-right" aria-hidden="true"></i>
<input type="number" class="form-control" id="userAnswer">
</div>
<div class="col-sm-4 col-md-4 col-xs-0"></div>
</div>
</div>
<div class="col-sm-4 col-md-4 col-xs-0">
<h4>Leader Board</h4>
<table>
<tr>
<th>Rank</th><th>Name</th><th>Batch</th><th>Score</th><th>Time</th>
</tr>

</table>
</div>
</div>


</div>




<!-- Game End -->


<!-- Game Begin-->

<div id="sumHunter" style="display:none" class="container-fluid">
	
	<div class="row" style="margin:0 !important;">
		<div class="col-sm-3 col-md-3 col-xs-0"></div>
		<div class="col-sm-5 col-md-5 col-xs-0">
			<button class="btn-info" onclick="flipInst()">Instructions</button>
		    <ul id="instructionsList" style="display:none">
		      <li>Welcome to Sum - Hunter Game</li>
		      <li>You can use Arrow keys (on keyboard and page) and Number pad for Navigations</li>
		      <li>Game is Similar to snake Game</li>
		      <li>The Hunter Square box (without number on top) hunts for a Number</li>
		      <li>To Find correct number a clue will be displayed(herer on top) to hunter</li>
		      <li>Don't cross the edges and hit the wrong sum</li>
		      <li>Level will be increased as the game progresses</li>
		    </ul>
		</div>
		<div class="col-sm-3 col-md-3 col-xs-0"></div>
	</div>
<br><br>
	<div class="row" style="text-align:center;margin:0 !important">
		<div class="col-sm-4 col-md-4 col-xs-0" style="text-align:center;margin:0 !important">
	  		<p>Clue to Hunt:<span id="clue">3+0</span></p>
	    	<p style="display:none" id="gameOverOnWrongSum">Oops You hit wrong sum</p>
	    	<p style="display:none" id="gameOverOnEdgeHit">Oops You Reached End</p>
	    	<button class="btn-success" id="beginMyGame" onclick="beginMyGame()">Play</button>
	    	<button class="btn-primary" style="display:none;" id="restratGame" onclick="restratGame()">PlayAgain</button>
			<p>Your Game Points:<span id="gamePoints" style="color:green;font-size:25px"></span></p>
		</div>
  		<div class="col-sm-4 col-md-4 col-xs-0" style="text-align:center;margin:0 !important;">
  			<canvas style="border:1px solid red;" id="gameArea" width="400" height="400"></canvas>
		</div>
		<div class="col-sm-4 col-md-4 col-xs-0" style="text-align:center;margin:0 !important">
    		<table class="leaderBoard" align="center">
      			<tr>
	        		<td></td>
	        		<td>
	        			<button onclick="divert(8)"><i class="fa fa-chevron-circle-up" aria-hidden="true"></i></button>
	    			</td>
	    			<td></td>
      			</tr>
      			<tr>
        			<td>
        				<button onclick="divert(4)"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></button>
        			</td>
        			<td></td>
        			<td>
        				<button onclick="divert(6)"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></button>
        			</td>
      			</tr>
      			<tr>
        			<td></td>
        			<td>
        				<button onclick="divert(2)"><i class="fa fa-chevron-circle-down" aria-hidden="true"></i></button>
        			</td>
        			<td></td>
      			</tr>
    	</table>
    <br><br><br><br>
    Leader Board:<br>
    <table>
      <tr>
        <th>Rank</th>  <th>Name</th>  <th>Points</th>
      </tr>
    </table>
  </div>

</div>

  </div>
  <!-- Game end -->




<!-- Game Begin-->
<!-- 
<div id="jobs" style="display:none" class="container-fluid">
	Jobs


  </div>
  --> 
  
  
<div id="uploadResume" style="display:none;height:420px;" class="container-fluid">
	<p class="push">Upload New Resume</p><br>
	<div class="uploadResClass">
	<form action="uploadResume" method="POST" id="sendResumeForm" enctype="multipart/form-data" style="margin-top:8%;">
		<div class="row">
			<div class="form-group">
				<label class="control-label col-md-4 col-sm-4 col-xs-12" for="to"><span class="resSelect">Select File</span></label>
				<div class="col-md-4 col-sm-4 col-xs-12">
					<input id="resumeFile" type="file" name="file" placeholder="select File"/>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-0"></div>
			</div>
		</div>
		
		<div class="row" style="margin-top:5% !important;">
			<div class="col-md-4 col-sm-4 col-xs-0"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<button class="btn btn-default uploadResBtn">Upload Resume</button>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-0"></div>
		</div>
	</form>
	</div>
</div>

</div>
	<!--  <div class="assistant" style="position:fixed;right:0;bottom:30%;background-color:#7b6e2d;color:white;padding:10px;border-radius:15%"><span>Assistant</span>
   
</div> -->
<!--footer strat-->
<div id=""class="container-fluid footerDiv" style="display:none">
    <div class="row">
        <div class="col-md-12">
            <p class="footers" style="color:#fff;float:left;">@CVCORPCopyRightsReserved</p>
            <img class="logo" style="float:right;margin-top:1%;" src="<c:url value="/resources/images/cvcorpLogo.png"/>">
        </div>
    </div>
</div>

<!-- footer end-->
	
</div>


</body>
<script>
		var selector = '.nav li';

			$(selector).on('click', function(){
				$(selector).removeClass('active');
				$(this).addClass('active');
			});
</script>
<script>
	$('#BSbtninfo').filestyle({
		 
		buttonName : 'btn-info',
		 
		buttonText : ' Select a File'
		 
		});
	</script>

</html>