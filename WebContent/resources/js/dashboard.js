/**
 * 
 */
app.controller("dashBoardController",dashBoardController);


function dashBoardController($http,appUrl,$scope,$window,studentsService)
{
  var dScope=this;

  
   
// By Batch Analysis
   dScope.selectedBatchNo="All";
   dScope.getBatchStudentAnalysis=function(){
	   
	   console.log("TEst Function call");
	   
	   var url;
	   var batchNumber;
	   if(dScope.selectedBatchNo=="All")
		   url="viewAll";
	   else
	      url="viewBatch/"+parseInt(dScope.selectedBatchNo);
	  
	   console.log(url);
	   
   $http.get(url).then(function(response){
	   dScope.studentsList=response.data.studentsList;  
	   console.log(dScope.studentsList);
	   dScope.CSECount=0;
	   dScope.ECECount=0;
	   dScope.EEECount=0;
	   dScope.MECHCount=0;
	   dScope.CIVILCount=0;
	   dScope.othersCount=0;
	   
	   //Placements Wise Data
	   dScope.active=0;
	   dScope.placed=0;
	   dScope.done=0;
	   
	   //Percentage Wise Data
	   dScope.in0_60=0
	   dScope.in60_70=0;
	   dScope.in70_80=0;
	   dScope.in80_90=0;
	   dScope.in90_100=0;
	  
	   //Gender Wise data 
	    dScope.male=0;
	    dScope.female=0;
	   
	   
	  for(i=0;i<dScope.studentsList.length;i++)
		  {
		    switch(dScope.studentsList[i].graduationBranch)
		    {
		      case "CSE": dScope.CSECount++; break;
		      case "IT": dScope.CSECount++; break;
		      case "ECE": dScope.ECECount++; break;
		      case "EEE": dScope.EEECount++; break;
		      case "MECH": dScope.MECHCount++; break;
		      case "CIVIL": dScope.CIVILCount++; break;
		      default: dScope.othersCount++; break;
		    }
		    
		    switch(dScope.studentsList[i].status)
		    {
		     case "active":dScope.active++; break;
		     case "done":dScope.done++; break;
		     case "placed":dScope.placed++; break;
		    }
		    
		    switch(dScope.studentsList[i].gender)
		    {
		     case "male":dScope.male++; break;
		     case "female":dScope.female++; break;
		    }
		    
		    if(dScope.studentsList[i].aggregate<60)
		    	dScope.in0_60++;
		    else if(dScope.studentsList[i].aggregate<70)
		    	dScope.in60_70++;
		    else if(dScope.studentsList[i].aggregate<80)
		    	dScope.in70_80++;
		    else if(dScope.studentsList[i].aggregate<90)
		    	dScope.in80_90++;
		    else
		    	dScope.in90_100++;
		    
		    
		    
		  }
	  

	   
	   dScope.branchesData={
			           head: "Branch Wise",
			   
			          dataPoints:[
	      	              { y: dScope.CSECount, indexLabel: "CSE & IT :"+dScope.CSECount },
	  					{ y: dScope.ECECount, indexLabel: "ECE :"+dScope.ECECount },
	  					{ y: dScope.EEECount, indexLabel: "EEE :"+dScope.EEECount },
	  					{ y: dScope.MECHCount, indexLabel: "MECH :"+dScope.MECHCount},
	  					{ y: dScope.CIVILCount, indexLabel: "CIVIL :"+dScope.CIVILCount },
	  					{ y: dScope.othersCount, indexLabel: "Others :"+dScope.othersCount}
	  					
	  				]};
	   
	   dScope.statusData={
	                      
	                   head: "Status Wise",
	                  dataPoints: [
	   	              { y: dScope.active, indexLabel: "ACTIVE :"+dScope.active },
						{ y: dScope.placed, indexLabel: "Placed :"+dScope.placed },
						{ y: dScope.done, indexLabel: "Inactive :"+dScope.done }					
					]};
	   
	   dScope.genderData={
	           
	           head: "Gender Wise",
	          dataPoints: [
	             { y: dScope.male, indexLabel: "MALE :"+dScope.male  },
				{ y: dScope.female, indexLabel: "FEMALE :"+dScope.female }
				
			]};
	   
	   dScope.aggregateData={
	           
	           head: "Aggregate % Wise",
	          dataPoints: [
	             { y: dScope.in0_60, indexLabel: "< 60% :"+dScope.in0_60 },
				{ y: dScope.in60_70, indexLabel: "60 % - 70 % :"+dScope.in60_70 },
				{ y: dScope.in70_80, indexLabel: "70% - 80 % :"+dScope.in70_80 },
				{ y: dScope.in80_90, indexLabel: "80% - 90 % :"+dScope.in80_90 },
				{ y: dScope.in90_100, indexLabel: ">90% :"+dScope.in90_100 }
			]};
	   
	   dScope.studentAnalysisChart(dScope.branchesData);
   });

  
   };
   
   
   
   //Calling for all batches
   
   
   
   $http.get("getBatches").then(function(response){
	   console.log(response);
	   dScope.allBatches=response.data.batches;
	   
	   dScope.batchesList=[];
	   dScope.batchesNos=[];
	   dScope.batchesNos.push("All");
	   for(i=response.data.batches.length-1;i>=0;i--){
		   dScope.batchesList.push(response.data.batches[i]);
		   dScope.batchesNos.push(response.data.batches[i].batchNumber);
		   if(dScope.batchesList.length==5)
			   break;
	   }
	   dScope.allBatches.reverse();
	   dScope.getBatchProgress(dScope.batchesList[1]);
	   
   });
   
  //Load Batch Info Chart
   
  
   
  dScope.studentAnalysisChart=function (data) {
	  
	  console.log(data);
		var chart = new CanvasJS.Chart("studentAnalysis",
		{
			title:{
				text: data.head
			},
			legend: {
				maxWidth: 200,
				itemWidth: 120
			},
			data: [
			{
				type: "pie",
				showInLegend: false,
				legendText: "{indexLabel}",
				dataPoints:data.dataPoints
			}
			]
		});
		chart.render();
	};
	
	
	
	
	dScope.studentBatchProgress=function (batchNumber) {
	    var chart = new CanvasJS.Chart("batchProgressChart",
	    {
	      title:{
	        text: "Batch-"+batchNumber+" Progress"
	      },
	      axisY: {
	        title: "Progress of Time & Portion",
	        maximum: 100
	      },
	      data: [
	      {
	        type: "bar",
	        showInLegend: true,
	        legendText: "Portion",
	        dataPoints: [
	        { y: dScope.javaPerc, label: "Java"},
	        { y: dScope.mathPerc, label: "Apti"},
	        { y: dScope.commsPerc, label: "Comms"},
	        { y: dScope.MySql, label: "MySQL"},
	        ]
	      },
	      {
	        type: "bar",
	        showInLegend: true,
	        legendText: "Time In Days",
	        color: "silver",
	        dataPoints: [
	        { y: dScope.batchDuration, label: "Java"},
	        { y: dScope.batchDuration, label: "Apti"},
	        { y: dScope.batchDuration, label: "Comms"},
	        { y: dScope.batchDuration, label: "MySQL"},

	        ]
	      },
	     
	      ]
	    });

	chart.render();
	};
	
	 
  

      
      dScope.getBatchProgress=function(batch){
	   
    	  var batchNumber=batch.batchNumber;
	    var pJava=$http.get("getProgress/"+batchNumber+"/Java").then(
	    function(response){
	    	console.log(response);
	    	dScope.javaPerc=parseInt((response.data.done*100)/response.data.total);
	    	console.log(dScope.javaPerc);
	    	
	    }		
	    );
	    
	   var pComms= $http.get("getProgress/"+batchNumber+"/Comms").then(
	    	    function(response){
	    	    	console.log(response);
	    	    	dScope.commsPerc=parseInt((response.data.done*100)/response.data.total);
	    	    }		
	    	    );
	    var pMath=$http.get("getProgress/"+batchNumber+"/Math").then(
	    	    function(response){
	    	    	console.log(response);
	    	    	dScope.mathPerc=parseInt((response.data.done*100)/response.data.total);
	    	    }		
	    	    );
	    var pMySql=$http.get("getProgress/"+batchNumber+"/MySql").then(
	    	    function(response){
	    	    	console.log(response);
	    	    	dScope.mySqlPerc=parseInt((response.data.done*100)/response.data.total);
	    	    }		
	    	    );
	    
	    Promise.all([pJava,pMath,pComms,pMySql]).then(function(){
	    	
	    	dScope.batchDuration=dScope.findDuration(batch.beginDate);
	    	dScope.studentBatchProgress(batchNumber);
	    });
	    
       }
      
      
  	dScope.findDuration=function(joinDate){
		//console.log(joinDate);
		
		if(joinDate!=null && joinDate!="null"){
		var one_day=1000*60*60*24;    // Convert both dates to milliseconds
		var date1_ms = new Date(joinDate).getTime();   
		var date2_ms = new Date().getTime();    // Calculate the difference in milliseconds  
		
		var difference_ms = date2_ms - date1_ms; 
		
		 //console.log(Math.round(difference_ms/obene_day));
		 // Convert back to days and return   
		 
		return Math.round(difference_ms/one_day);
		}
		else{
			//console.log("Test");
			return 'NA';
		}
	};
	
  
	
	
	
	//First Call to load all batches info
	dScope.getBatchStudentAnalysis();
}



