<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="cv.models.CVStudent" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8" />
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>${ st.getFullName() }</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   
    <!-- CSS Just for demo purpose, don't include it in your project -->

    	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>
    
    
    
   <script type="text/javascript">
   
    var URL="http://35.168.121.16";
   
    var email='${st.getEmail()}';
    var student_id='${st.getStudent_id()}'
    var batchNumber='${st.batchNumber}';
   angular.module("App",[]).controller("mainController",function($scope,$http){
	   
	       
	   
	      (function(){
	    	  
	    	  $http.get(URL+"/getStudentDriveData/"+student_id).then(function(response){
	    		  
	    		  console.log(response);
	    		  $scope.driveData=response.data.driveData;
	    		  
	    	  });
	    	  
	    	  $http.get(URL+"/getTotalExamsForBatch/"+batchNumber).then(function(response){
	    		  
	    		  console.log(response);
	    		  $scope.totalExamsForBatch=response.data.totalTestsCount;
	    	  });
	    	  
	    	  $http.get(URL+"/getStudentDetailedReport/"+email+"/any").then(function(response){
	    		  
	    		  $scope.reports=response.data.reports;
	              console.log(response);
	               $scope.reportsData=[];
	               $scope.avgScore=0;
	    		   for(i=0;i<$scope.reports.length;i++)
	    			   {
	    			     $scope.reportsData.push({
	    			    	   y: $scope.reports[i].scorePer100,label:$scope.reports[i].testName, indexLabel:"Time:"+$scope.reports[i].duration+" Qns:"+($scope.reports[i].questions.split(",").length)
	    			    	   } 
	    			     );
	    			     $scope.avgScore=$scope.avgScore+$scope.reports[i].scorePer100;
	    			   }
	    		   $scope.avgScore=parseInt($scope.avgScore/$scope.reports.length);
	    		   $scope.displayReportChart();
	    	  });
	      })();
	   
	   
	   $scope.displayReportChart=function () {
			  
			  
		    var chart = new CanvasJS.Chart("lineChartMarks",
		    {      
		      title:{
		        text: "Progress in CVCORP- Exam Scores in %"
		      },
		      
		      data: [
		      {        
		        type: "spline",  
		        indexLabelFontColor: "orangered",      
		        dataPoints: $scope.reportsData
		      }
		      ]
		    });

		    chart.render();
		  };
	   
	   
	   
	   
   });
   
   
   

  </script>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    
    
    
    
    <style>
        .trow {
            font-size: 12px!important;
            font-family: Segoe UI Semibold;
            padding: 0.30rem!important;
            padding-left: 10px!important;

        }

        p {
            font-size: 12px!important;
        }

    </style>
    <style>
        .progress {
            width: 90px;
            height: 90px;
            line-height: 90px;
            background: none;
            margin: 0 auto;
            box-shadow: none;
            position: relative;
        }

        .progress:after {
            content: "";
            width: 100%;
            height: 100%;
            border-radius: 50%;
            border: 12px solid #fff;
            position: absolute;
            top: 0;
            left: 0;
        }

        .progress>span {
            width: 50%;
            height: 100%;
            overflow: hidden;
            position: absolute;
            top: 0;
            z-index: 1;
        }

        .progress .progress-left {
            left: 0;
        }

        .progress .progress-bar {
            width: 100%;
            height: 100%;
            background: none;
            border-width: 12px;
            border-style: solid;
            position: absolute;
            top: 0;
        }

        .progress .progress-left .progress-bar {
            left: 100%;
            border-top-right-radius: 80px;
            border-bottom-right-radius: 80px;
            border-left: 0;
            -webkit-transform-origin: center left;
            transform-origin: center left;
        }

        .progress .progress-right {
            right: 0;
        }

        .progress .progress-right .progress-bar {
            left: -100%;
            border-top-left-radius: 80px;
            border-bottom-left-radius: 80px;
            border-right: 0;
            -webkit-transform-origin: center right;
            transform-origin: center right;
            animation: loading-1 1.8s linear forwards;
        }

        .progress .progress-value {
            width: 94%;
            height: 94%;
            border-radius: 50%;
            background: #fff;
            font-size: 14px;
            color: #44484b;
            line-height: 80px;
            font-weight: 700;
            text-align: center;
            position: absolute;
            top: 5%;
            left: 5%;
        }

        .progress.blue .progress-bar {
            border-color: #049dff;
        }

        .progress.blue .progress-left .progress-bar {
            animation: loading-0 2s linear forwards 1.8s;
        }

        .progress.yellow .progress-bar {
            border-color: #fdba04;
        }

        .progress.yellow .progress-left .progress-bar {
            animation: loading-3 2s linear forwards 1.8s;
        }

        .progress.pink .progress-bar {
            border-color: #ed687c;
        }

        .progress.pink .progress-left .progress-bar {
            animation: loading-4 0.4s linear forwards 1.8s;
        }

         
         
          .progress.black .progress-bar {
            border-color: #000;
        }

        .progress.black .progress-left .progress-bar {
            animation: loading-3 1s linear forwards 1.8s;
        }


        .progress.green .progress-bar {
            border-color: #1abc9c;
        }

        .progress.green .progress-left .progress-bar {
            animation: loading-5 1.2s linear forwards 1.8s;
        }

        @keyframes loading-1 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(180deg);
                transform: rotate(180deg);
            }
        }

        @keyframes loading-2 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(144deg);
                transform: rotate(144deg);
            }
        }

        @keyframes loading-3 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(90deg);
                transform: rotate(90deg);
            }
        }

        @keyframes loading-4 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(36deg);
                transform: rotate(36deg);
            }
        }

        @keyframes loading-5 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(126deg);
                transform: rotate(126deg);
            }
        }

        @media only screen and (max-width: 990px) {
            .progress {
                margin-bottom: 20px;
            }
        }

    </style>
</head>

<body ng-app="App" ng-controller="mainController">
    <div class="wrapper">
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg" color-on-scroll="500">
                <div class=" container-fluid " style="background-color:#000;color:#fff">
                    <div class="row">
                    <div class="col-sm-4 col-md-4">
                    <a class="navbar-brand" href="#" style="color:#fff;font-size:30px;margin-left: 15px;"> ${st.getFullName() }</a>
                    <p style="padding-top:8%; margin: 17px 0px 0px 29px;">last active <i style="color:green" class="fas fa-dot-circle"></i>${st.getLastlogin() }</p>
                    </div>
                    <div class="col-sm-8 col-md-8">
                    <p style="padding-top:3%;">
                    <a style="color:#fff;padding:2%" href="${st.getFbLink() }" target="_blank"><i style="width:30px; height:30px; float:right;" class="fab fa-facebook-square"></i></a>
                    <a style="color:#fff;" href="${st.getLnLink() }" target="_blank"><i style="width:30px; height:30px; float:right;" class="fab fa-linkedin"></i></a></p>
                    </div>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content" style="background-color: #ddd !important;">
                <div class="container-fluid">
                    <div class="row" style="margin-bottom: 15px; margin-top: 15px; margin-left: 0px!important;">
                        <div class="col-md-2" style="">
                            <p style="text-align: center; font-size: 20px!important; color:forestgreen; margin-bottom: 0px; font-weight: 500; padding-top:10px!important; background-color: #fff;">BATCH</p>
                            <p style="text-align: center; font-size: 60px!important; color:forestgreen; font-weight:700; margin-bottom: 0px;background-color: #fff;">${st.getBatchNumber() }</p>
                            <p style="text-align: center; font-size: 30px!important; font-weight:700; margin-bottom: 0px;background-color: #fff;">${st.getGraduationYOP() }</p>
                            <p style="text-align: center; font-size: 20px!important; color:forestgreen; margin-top: 10px; font-weight: 500; margin-top: 0px; background-color: #fff; padding-bottom:7px;">Pass Out</p>
                        </div>
                        <div class="col-md-3" style="">
                            <div class="table" style="background-color: #fff!important; padding-bottom: 10px !important; margin-bottom: 0px !important; padding-top: 9px !important;">
                                <table style="width: 80%; margin:auto;">
                                <thead style= "border-bottom: 1px solid #d4d2d2;">
                                    <tr>
                                        <th colspan="3" class="trow1" style="text-align: center; text-size:16px!important;">Students Detail</th>
                                    </tr>
                                 </thead>
                                    <tbody>
                                    <tr>
                                        <td class="trow">Full Name</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getFullName() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Parent Name</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getFullName() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Gender</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getGender() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">DOB</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getDob() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">email</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getEmail() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Mob No.</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getMobile() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Parent Mob. No.</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getMobile_Parent() }</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="table" style="background-color: #fff!important; padding-bottom: 10px !important; margin-bottom: 0px !important; padding-top: 10px !important;">
                                <table style="width: 100%;">
                                <thead  style= "border-bottom: 1px solid #d4d2d2;">
                                    <tr>
                                        <th colspan="3" class="trow1" style="text-align:center!important; text-size:16px!important;">Educational Detail</th>
                                    </tr>
                                </thead>
                                    <tr>
                                        <td class="trow">Batch</td>
                                        <td class="trow">:</td>
                                        <td class="trow">12th</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Year of Passing</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getGraduationYOP() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Grad.Type</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getGraduationType() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Branch</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getGraduationBranch() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">College</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getGraduationCollege() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Grad. City</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getGraduationCity() }</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-2">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table" style="background-color: #fff!important; padding-top: 2px !important;">
                                    <table style="width: 80%; margin:auto;">
                                    <thead style= "border-bottom: 1px solid #d4d2d2;">
                                        <tr>
                                            <th colspan="3" class="trow1" style="text-align: center; text-size:16px!important;">Percentage(%)</th>

                                        </tr>
                                     </thead>
                                     <tbody>   
                                        <tr>
                                            <td class="trow">10th</td>
                                            <td class="trow">:</td>
                                            <td class="trow"><b>${st.getSscPercentage() }</b></td>
                                        </tr>
                                        <tr>
                                            <td class="trow">12th</td>
                                            <td class="trow">:</td>
                                            <td class="trow"><b>${st.getInterPercentage() }</b></td>
                                        </tr>
                                        <tr>
                                            <td class="trow">Degree</td>
                                            <td class="trow">:</td>
                                            <td class="trow"><b>${st.getGraduationPercentage() }</b></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            </div>
                            <div class="row">
                            <div class="col-md-12">
                                <div class="table" style="background-color: #fff!important; Padding-top: 2px !important;">
                                    <table style="width: 80%; margin:auto;">
                                    <thead style= "border-bottom: 1px solid #d4d2d2;">
                                        <tr>
                                            <th colspan="3" class="trow1" style="text-align: center; text-size:16px!important;">Math Marks(%)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="trow">10th</td>
                                            <td class="trow">:</td>
                                            <td class="trow"><b>${st.getSscMaths() }</b></td>
                                        </tr>
                                        <tr>
                                            <td class="trow">12th</td>
                                            <td class="trow">:</td>
                                            <td class="trow"><b>${st.getInterMaths() }</b></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                              </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-md-2">
                            <div class="table" style="background-color: #fff!important; padding-top:6px !important; padding-bottom: 6px !important;">
                                <table style="width: 80%; margin: auto;">
                                <thead style="border-bottom: 1px solid #d4d2d2;">
                                    <tr>
                                        <th colspan="3" class="trow1" style="text-align: center; text-size:16px!important;">Address</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="trow">Locality.</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getLocality() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">City</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getCity() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">State</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getState() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Facebook Link</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getFbLink() }</td>
                                    </tr>
                                    <tr>
                                        <td class="trow">Linkedin Link</td>
                                        <td class="trow">:</td>
                                        <td class="trow">${st.getLnLink() }</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row" style="margin-bottom: 15px; margin-top: 15px; margin-left: 0px!important;">
                    <div class="col-md-5" style="">
                        
                         <div id="lineChartMarks" style="height: 300px; width: 100%;">
                         </div>
                        
                        </div>
                        <div class="col-md-2" style="">
                        <div class="row">
                        <div class="col-md-12">
                        
                         <div style="background-color: #fff;">
                            <p style="text-align: center; font-size: 20px!important; color:#1e168e; padding-top: 15px; font-weight: 500;">{{reports.length}}/{{totalExamsForBatch}} Exmas</p>
                            <p style="text-align: center; font-size: 60px!important; color:#1e168e; font-weight:700; margin-bottom: 0px;">{{avgScore}}%</p>
          
                        </div>
                       
                        </div>
                        </div>
                        <br />
                        <div class="row">                        
                        <div class="col-md-12" style="">
                          <div style="background-color: #fff; padding-bottom: 3px !important;">
                            <p style="text-align: center; font-size: 20px!important; color:#f3790e; padding-top: 15px; font-weight: 500;">No of Walk-ins</p>
                            <p style="text-align: center; font-size: 60px!important; color:#f3790e; font-weight:700; margin-bottom: 0px;">{{driveData.length}}</p>
                    
                        </div>
                        </div>
                        </div>
                        </div>
                        
                        <div style="height:300px; background-color: #fff;" class="col-md-5 table-responsive">
                        
                        
                        <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr><th>Company</th><th>Written</th><th>Comms</th><th>Tech1</th><th>Tech2</th><th>HR/Final</th><th>Placed?</th><th>Details</th></tr>
                        <tr ng-repeat="d in driveData">
                        <td>{{d.name}}</td>
                        <td style="text-align: center; padding-top: 9px!important;"><i style="color:{{d.writtenRound_Status=='A'?'green':'red'}}" class="fas fa-circle"></i></td>
                        <td style="text-align: center; padding-top: 9px!important;"><i style="color:{{d.comsRound_Status=='A'?'green':'red'}}" class="fas fa-circle"></i></td>
                        <td style="text-align: center; padding-top: 9px!important;"><i style="color:{{d.technicalRound1_Status=='A'?'green':'red'}}" class="fas fa-circle"></i></td>
                        <td style="text-align: center; padding-top: 9px!important;"><i style="color:{{d.technicalRound2_Status=='A'?'green':'red'}}" class="fas fa-circle"></i></td>
                        <td style="text-align: center; padding-top: 9px!important;"><i style="color:{{d.hrround_Status=='A'?'green':'red'}}" class="fas fa-circle"></i></td>
                        <td>{{d.finalReport}}</td>
                        <td>
                        More
                        </td>
                        </tr>
                        
                        </thead>
                        
                        
                        </table>   
                        
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
        <footer class="footer">
            <div class="container">
                <nav>
                    <p class="copyright text-center">
                        ©
                        <script>
                            document.write(new Date().getFullYear())

                        </script>
                        <a href="#">CVCORP</a>, all rights reserved
                    </p>
                </nav>
            </div>
        </footer>
    </div>
</body>

</html>