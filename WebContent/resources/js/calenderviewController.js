
app.controller("calenderViewCtrl",calenderViewCtrl);

function calenderViewCtrl($scope,$http)
{
	var clScope=this;
	
	clScope.current=new Date();
	clScope.currentDate=clScope.current.getDate();
	clScope.currentYear=clScope.current.getFullYear();
	clScope.currentDay=clScope.current.getDay();
	clScope.currentMonth=clScope.current.getMonth();
	
	clScope.DATE=clScope.currentDate;
	clScope.DAY=clScope.currentDay;
	console.log("DATE="+clScope.DATE);
	console.log("DAY="+clScope.DAY);
	
	clScope.selectedYear=clScope.currentYear;
	clScope.selectedMonth=clScope.currentMonth;

	

    
    //console.log("currentDate="+currentDate);
   
	
	//Days 
	clScope.MONTHS=[{days:31,value:0,name:"JAN"},{},{days:31,value:2,name:"MAR"},{days:30,value:3,name:"APR"},
                {days:31,value:4,name:"MAY"},{days:30,value:5,name:"JUN"},{days:31,value:6,name:"JUL"},
                {days:31,value:7,name:"AUG"},{days:30,value:8,name:"SEP"},{days:31,value:9,name:"OCT"},
                {days:30,value:10,name:"NOV"},{days:31,value:11,name:"DEC"}];
    
	
	
	
	clScope.upDateFebDaysLeapYearCheck=function(){
		// If a year is multiple of 400, 
	    // then it is a leap year
		//
		clScope.MONTHS[1].name="FEB";
	    if (clScope.selectedYear % 400 == 0)
	    	clScope.MONTHS[1].days=29;
	 
	    // Else If a year is muliplt of 100,
	    // then it is not a leap year
	    else if (clScope.selectedYear % 100 == 0)
	    	clScope.MONTHS[1].days=28;
	 
	    // Else If a year is muliplt of 4,
	    // then it is a leap year
	    else if (clScope.selectedYear % 4 == 0)
	    	clScope.MONTHS[1].days=29;
	    else
	    	clScope.MONTHS[1].days=28;   
	};
	
	
	clScope.nextMonth=function(){
		console.log("next month");
		if(clScope.selectedMonth==11)
			{
			clScope.selectedMonth=0;
			clScope.selectedYear++;
			}
		else
			{
			clScope.selectedMonth++;
			}
		clScope.loadCalender();
	};
	
	
	clScope.previousMonth=function(){
		
		if(clScope.selectedMonth==0)
		{
			clScope.selectedMonth=11;
			clScope.selectedYear--;
		}
	else
		{
		clScope.selectedMonth--;
		}
		clScope.loadCalender();
	};
	

	clScope.findDay=function()
	{
	
		var y=clScope.selectedYear;
		/*
		var t=[ 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 ];
	    y-= clScope.selectedMonth < 3;
	    clScope.selectedMonthFirstDay=( y + y/4 - y/100 + y/400 + t[clScope.selectedMonth] + 1) % 7;
	   
	    */
		var d = new Date(clScope.selectedYear,clScope.selectedMonth,1);
	  
		clScope.selectedMonthFirstDay=  d.getDay();
		 //console.log("First:"+clScope.selectedMonthFirstDay);
	}
	

	
	
	
	
	clScope.loadCalender=function()
	{
		var element=angular.element( document.querySelector( '#calenderDates' ) );
		element.empty();
		
		clScope.findDay();
		
		var days;
		if(clScope.selectedMonth!=1)
		days=clScope.MONTHS[clScope.selectedMonth].days;
		else{
			clScope.upDateFebDaysLeapYearCheck();
			days=clScope.MONTHS[1].days;
		}
		
		var initialDay;
		
		// Selecting first day
		initialDay=clScope.selectedMonthFirstDay+1;
			
		console.log("IDay"+initialDay);
		var temp=initialDay;
		var tempDays=1;
		var d;
	
		
	for(i=1;i<=6;i++)
		{
		element.append("<tr>");
		
		for(t=1;t<=7;t++)
			{     if(tempDays<=days && temp<=tempDays){
				  if(clScope.DATE==tempDays)
				  element.append("<td style='background-color:#e7e7e7' class='dates'>"+tempDays+"</td>");
				  else
					  element.append("<td class='dates'>"+tempDays+"</td>");  
				  tempDays++;
		        	}
			   else{
				     element.append("<td class='dates'></td>");
				     temp--;
		        	}
			}
		
		 element.append("</tr>");
		}
		
		
	};
	 
	clScope.loadCalender();
	
}
