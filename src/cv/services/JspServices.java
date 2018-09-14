package cv.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import cv.dao.AdminDao;
import cv.dto.Faculty;
import cv.models.Batch;
import cv.models.StudentWorking;

@Service
public class JspServices {
	
	private AdminDao admin;
	
	public AdminDao getAdmin() {
		return admin;
	}
	public void setAdmin(AdminDao admin) {
		this.admin = admin;
	}
	public static String getNumberOfDays(String joinDate) {
		try {
			if(joinDate!=null && joinDate!="null"){
				
				long one_day=1000*60*60*24;
				SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");
				Date date1=formatter1.parse(joinDate);  
				long date1_ms = date1.getTime();   
				long date2_ms = new Date().getTime();  
				long difference_ms = date2_ms - date1_ms;  
				System.out.println(date1_ms+" - "+date2_ms);
				System.out.println(difference_ms/one_day);
			return ""+Math.round(difference_ms/one_day);
			}
			else{
				return "NA";
			}
		}
		catch (Exception e) {
			System.out.println("Error on jsp number day");
			e.printStackTrace();
			return "NA";
		}
		
	}
	public static String getFeePersentage(int total,int paid) {
		try {
			if(total!=0)
			{
				if(paid<=total)
				return round((paid*100)/total,2);
				else return "100";
			}
			else return "0";
		}
		catch(Exception e) {
			System.out.println("Error in fee persentage");
			e.printStackTrace();
			return "0";
		}
	}
	public int getTotalWorkingDay(int batch) {
		try {
			System.out.println(" hi  "+batch);
			if(batch>0)
			{
				StudentWorking workingDayList=admin.getStudnetWorkingDaybyBatch(batch);
				System.out.println(" hi  "+workingDayList.getWorkingDate());
				return workingDayList.getWorkingDate().toString().trim().split(",").length;
			}
			else return 0;
		}
		catch(Exception e) {
			System.out.println("Error in jspServices/getTotalWorkingDay");
			e.printStackTrace();
			return 0;
		}
	}
	
	public static String round(double value, int places) {
		
		System.out.println("yo yo oaa"+value);
		String out="0";
		try {
	    if (places < 0) throw new IllegalArgumentException();

	    long factor = (long) Math.pow(10,places);
	    value = value * factor;
	    long tmp = Math.round(value);
	    double d= (double) tmp / factor;
	    String s=""+d;
	    String arr[]=s.split("\\.");
	    out=arr[0];
	    if(Integer.parseInt(arr[1])!=0) out=out+"."+arr[1];
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("yo yo oa");
			out="0";
		}
	    return out;
	}
	
	public Faculty getFacultyDetailsBySubject(String sub) {
		Faculty f=new Faculty();
		try {
			List<Faculty> list=admin.getFaculty();
			for(Faculty obj:list) {
				if(obj.getSubjectToTeach().toUpperCase().equals(sub.toUpperCase())) {
					f=obj;
					break;
				}
			}	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public static ArrayList<Batch> getActiveBatch(ArrayList<Batch> batches) {
		ArrayList<Batch> list=new ArrayList<Batch>();
		Collections.sort(batches);
		for(int i=batches.size()-1;i>batches.size()-6;i--) {
			list.add(batches.get(i));
		}
		return list;
	}
}
