package cv.services;


import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import cv.dao.AdminDao;
import cv.dao.ReportDao;
import cv.dao.StudentDao;
import cv.dto.CVStudentAttDashbord;
import cv.dto.Company;
import cv.dto.DetailedReport;
import cv.dto.DriveStatus;
import cv.dto.Faculty;
import cv.models.Admin;
import cv.models.Batch;
import cv.models.BatchReportList;
import cv.models.CVStudent;
import cv.models.CVStudentAtt;
import cv.models.DateReport;
import cv.models.EditStudentDriveRound;
import cv.models.OfflineExam;
import cv.models.OfflineExamScore;
import cv.models.PlacementDrive;
import cv.models.PlacementDriveCompany;
import cv.models.Present;
import cv.models.QAAnswer;
import cv.models.QAAnswersList;
import cv.models.StudentWorking;
import cv.models.SubjectReport;
import cv.models.TopicComp;
import cv.models.TopicReport;

@Configuration
@EnableScheduling
public class AdminService {

	private AdminDao adminDao;
	
	private StudentDao studentDao;
	private ReportDao reportDao;
	
	private MailSender mailSender;
	
	//get all working day list
	public String getTotalWorkingDayList(int batch) {
		StudentWorking workingDayList=adminDao.getStudnetWorkingDaybyBatch(batch);
		return (workingDayList!=null)?(workingDayList.getWorkingDate()!=null)?workingDayList.getWorkingDate():"":"";
	}
	
	//Validate Admin 123 edits
	public boolean validateAdmin(String email, String password, HttpServletRequest request)
	{
		System.out.println("test admin login");
		return adminDao.validateAdmin(email, password,request);
	}

	public boolean registerStudent(CVStudent st)
	{
		try{
			
			String[] p=generateRandomPassword();
			st.setPassword_hash(p[1]);
			System.out.print(p[1]);
			studentDao.save(st);
			sendWelcomeMail(st.getEmail(),st.getFullName(),p[0],st.getBatchNumber());
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public StudentDao getStudentDao() {
		return studentDao;
	}
	

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	public MailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	
	public List<CVStudent> viewStudents(int batchNumber) {
		// TODO Auto-generated method stub
		List<CVStudent> students=studentDao.getStudentsByBatch(batchNumber);
		return students;
	}
	
	public List<CVStudentAtt> viewStudentsAtt(int batchNumber,String date) {
		List<CVStudentAtt> students=studentDao.getStudentsAttByBatch(batchNumber,date);
		return students;
	}
	
	public List<CVStudent> viewAllStudents()
	{
		List<CVStudent> students=studentDao.getStudents();
		return students;
	}

	public String updateFee(String email, int feePaid) {
		// TODO Auto-generated method stub
		boolean status=true;
		String notification="Fee updated successfully Refresh the page to see changes";
		try{
		studentDao.updateFee(email,feePaid);
		}
		catch(Exception e)
		{
			status=false;
			notification="There is a problem in updating the fee";
		}
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
		
		}

	public boolean changePassword(String oldPassword, String newPassword,HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		
		if(BCrypt.checkpw(oldPassword, admin.getPassword_hash()))
		{
		
		try{
			BCryptPasswordEncoder e=new BCryptPasswordEncoder();
			String password_hash=e.encode(newPassword);
			adminDao.setPassword(password_hash,admin.getEmail());
			admin.setPassword_hash(password_hash);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
		}
		else
		{
			return false;
		}
		
	}

	public ReportDao getReportDao() {
		return reportDao;
	}

	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}

	public String getStudentReport(String email) {
		// TODO Auto-generated method stub
		String result;
		int scorePerc=0;
		int attendancePerc=0;
		int testCount=0;
		int[] rs;
		boolean b=true;
		try{
		rs=reportDao.getScorePerc(email);
		scorePerc=rs[0];
		testCount=rs[1];
		}catch(Exception e)
		{
		  b=false;
		}
		
		try{
		attendancePerc=studentDao.getAttendancePerc(email);
		if(b)
			result="{\"scorePerc\":"+scorePerc+",\"attendancePerc\":"+attendancePerc+",\"testCount\":"+testCount+"}";
		else
			result="{\"scorePerc\":"+null+",\"attendancePerc\":"+attendancePerc+",\"testCount\":"+testCount+"}";
		  
		}
		catch(Exception e)
		{
			if(b)
				result="{\"scorePerc\":"+scorePerc+",\"attendancePerc\":"+null+",\"testCount\":"+testCount+"}";
			else
				result="{\"scorePerc\":"+null+",\"attendancePerc\":"+null+",\"testCount\":"+testCount+"}";
		}
		return result; 
	}


	public boolean sendMail(String[] to,String[] cc,String subject,String text,String[] bcc,String[] names)
	{
		boolean b=true;
	try{
		SimpleMailMessage sm=new SimpleMailMessage();
		sm.setTo(to);
		if(cc!=null)
		sm.setCc(cc);
		if(bcc!=null)
			sm.setBcc(bcc);
		sm.setSubject(subject);
		
		sm.setText(text);
		mailSender.send(sm);
	}
	catch(Exception e)
	{
		e.printStackTrace();
		b=false;
	}
	
		return b;
	}

	public List<CVStudent> getStudentsMails(String text) {
		// TODO Auto-generated method stub
		
		return studentDao.getStudentsMails(text);
		
	}

	public String[] generateRandomPassword()
	{
		String[] p=new String[2];
		Random rm=new Random();
		String pwd="";
		for(int i=0;i<=8;i++){
		int n=rm.nextInt(26)+65;
		pwd=pwd+(char)n;
		}
		p[0]=pwd;
		System.out.println(pwd);
		BCryptPasswordEncoder e=new BCryptPasswordEncoder();
		String password_hash=e.encode(pwd);
		
		p[1]=password_hash;
		return p;
	}
	
	public void sendWelcomeMail(String email,String fullName,String password,int batchNumber){
	
		String message="Hello "+fullName+",\n\n"
				+ "Career Vidhya welcomes you!\n\n"
				+ "Thank you for choosing us as your career partner. We are looking forward to  "
				+ "your progress in the finishing school where you can enhance your skills and  "
				+ "explore career oppurtunities with the use of our best rendered services."
				+ "\n "
				+ "\n We wish you all the best for your career. \n\n"
				+ "To access online services of Career Vidhya- please visit:  http://onlinetest.cvcorp.in\n"
				+ "Your login Id is your email ID:  "+email+" \n"
				+ "Your primary password:  "+password+"\n"
						+ "Your enrolement is done under batch Number:  "+batchNumber
				+ "\n \n \n "
				+ "From \n"
				+ " \n"
				+ "Chaithanya Vaddi\n"
				+ "Mobile: +91 9705 1982 99"
				+ "\ncv@cvcorp.in\n"
				+ "https://in.linkedin.com/in/chaitanyavaddi";
		String subject="Registration Email - OnlineTest-CVCORP";
		
		SimpleMailMessage sm=new SimpleMailMessage();
		sm.setTo(email);
		sm.setSubject(subject);
		sm.setText(message);
		mailSender.send(sm);
		
	}
	
	
	public String presentsToVerify()
	{
		List<Present> ls=studentDao.getAllPresents();
		String result="{\"presents\":[";
		Present p;
		for(int i=0;i<ls.size();i++)
		{
			p=ls.get(i);
			if(i==ls.size()-1)
			result=result+"{\"email\":\""+p.getEmail()+"\",\"presentDate\":\""+p.getPresentDate()+"\",\"name\":\""+p.getName()+"\","
					+ "\"id\":\""+p.getId()+"\",\"batchNumber\":"+p.getBatchNumber()+"}";
			else
				result=result+"{\"email\":\""+p.getEmail()+"\",\"presentDate\":\""+p.getPresentDate()+"\",\"name\":\""+p.getName()+"\","
						+ "\"id\":\""+p.getId()+"\",\"batchNumber\":"+p.getBatchNumber()+"},";
		}
		result=result+"]}";
		return result;
	}

	public String acceptPresents(String email, String presentDate) {
		// TODO Auto-generated method stub
		boolean status=true;
		String notification="Updated successfully";
		try{
		CVStudent student=studentDao.getStudentByEmail(email);
		if(student.getAttendance()!=null)
		student.setAttendance(student.getAttendance()+","+presentDate);
		else
			student.setAttendance(presentDate);
	  studentDao.updateAttendance(student);
	  studentDao.deletePresents(email, presentDate);
		//st.setAttendance(st.getAttendance()+","+presentDate);
		}
		catch(Exception e)
		{
			status=false;
			notification="There is problem in updating attendance please contact admin";
		}
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}

	public String rejectPresents(String email, String presentDate) {
		// TODO Auto-generated method stub
		String notification="Rejected successfully";
		boolean status=true;
		
		try{
		studentDao.deletePresents(email, presentDate);
		
		}
		catch(Exception e)
		{
			status=false;
			notification="Oops! There is a technical problem occured";
		}
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}

	public String addNotification(String notif,String[] bNos,HttpServletRequest request) {
		// TODO Auto-generated method stub
		String batchNos=",";
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		notif=notif.replace("\'", "\\'");
		
		for(String no:bNos)
		{
			batchNos=batchNos+no+",";
		}
		boolean status=true;
		String notification="New Notification added successfully for batches "+batchNos;
		try{
		adminDao.saveNotification(notif,batchNos,admin.getEmail(),admin.getName());
		}
		catch(Exception e)
		{
			status=false;
			notification="There is a problem in posting the notification";
		}
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}

	public String getStudentsListByPaper(int qp_id) {
		// TODO Auto-generated method stub
		String result="";
		try{
		List<CVStudent> list=reportDao.getStudentsListByPaper(qp_id);
		result="{\"list\":[";
		CVStudent s;
		for(int i=0;i<list.size();i++)
		{
			s=list.get(i);
			if(i!=list.size()-1)
			result=result+"{\"fullName\":\""+s.getFullName()+"\",\"email\":\""+s.getEmail()+"\"},";
			else
				result=result+"{\"fullName\":\""+s.getFullName()+"\",\"email\":\""+s.getEmail()+"\"}";
		}
		  result=result+"]}";
		}
		catch(Exception e)
		{
			
		}
		return result;
	}

	public QAAnswersList getStudentQAAnswerPaper(int qp_id,String email) {
		// TODO Auto-generated method stub
		List<QAAnswer> ans=null;
		try {
			ans=reportDao.getStudentQAAnswerPaper(qp_id,email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		QAAnswersList ql=new QAAnswersList();
		ql.setList(ans);


		return ql;
	}

	public String updateAnswerScore(int id, double score) {
		// TODO Auto-generated method stub
		String notification="Score updated successfully";
		boolean status=true;
		int scoreInInt=(int)score;
		System.out.println(id);
		try{
		reportDao.updateAnswerScore(id,scoreInInt);
		reportDao.upDateInReports(id);
		}
		catch(Exception e)
		{
			status=false;
			notification="There is a problem in updating score";
			e.printStackTrace();
		}
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";

	}

	public String fileUpload(MultipartFile file, String fileName, String subject, String[] batchNos,
			HttpServletRequest request, String fileType) {
		// TODO Auto-generated method stub
		String notification="File Uploaded successfully";
		
		boolean status=true;
		
		Admin admin=(Admin)request.getSession().getAttribute("admin");
	     
		try {
			InputStream stream=file.getInputStream();
			
			byte[] fileData=file.getBytes();
			String batches=",";
			for(String t:batchNos)
			{
				batches=batches+t+",";
			}
			adminDao.uploadFile(stream,fileName,subject,admin.getName(),batches,admin.getEmail(),fileType);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status=false;
			notification="There is a problem in uploading file, check size of file";
		}
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
		
	}
	public String setStudentsAtt(int batchNumber, String date,List<CVStudentAtt> obj) {
		List<CVStudentAtt> addAtt=new ArrayList<CVStudentAtt>();
		List<CVStudentAtt> remAtt=new ArrayList<CVStudentAtt>();
		List<CVStudentAtt> students=studentDao.getStudentsAttByBatch(batchNumber,date);
		for(int i=0;i<obj.size();i++) {
			for(int j=0;j<students.size();j++) {
				if(obj.get(i).getEmail().equals(students.get(j).getEmail())) {
					if(obj.get(i).getAttendance()!=students.get(j).getAttendance()) {
						if(obj.get(i).getAttendance()) addAtt.add(obj.get(i));
						else remAtt.add(obj.get(i));
					}
					break;
				}
			}
		}
		int a=studentDao.setStudentsAtt(batchNumber,addAtt,date);
		int b=studentDao.resetStudentsAtt(batchNumber,remAtt,date);
		return (a+b==2)?"{\"status\":\"yes\"}":"{\"status\":\"no\"}";
	}
	
	public String addWorkingDay(int batch,String date) {
		StudentWorking obj=adminDao.getStudnetWorkingDaybyBatch(batch);
			if(obj==null) adminDao.addWorkingDay(batch, date);
			else {
				if(!obj.getWorkingDate().contains(date)) adminDao.udateAddWorkingDay(batch,date,obj.getWorkingDate());
			}
		return null;
	}

	public String forgotPassword(String email) {
		// TODO Auto-generated method stub
		String notification="Oops! Looks like you are not a registered user to the portal";
	    boolean status=false;
		Admin admin;
		try{
			admin=adminDao.getAdminByEmail(email);
			String[] pwds=generateRandomPassword();
			adminDao.setPassword(pwds[1], email);
			sendForgotPasswordMail(email,admin.getName(),pwds[0]);
			notification="Your new Password has been sent to your mail "+email;
		   status=true;
 		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
		
	}
	
	public void sendForgotPasswordMail(String email,String name,String password)
	{
		String subject="New Password - CareerVidhya Operations";
		
		String message="Hi "+name+"\n\n"
				+ "This mail is regarding your request to change password in Career Vidhya online portal. \n"
				+ "If you have't requested, We recommend you to change your password.\n"
				+ "\n\nYour New password to Login is: "+password
						+ "\n\n\n"
						+ "From"
						+ "CareerVidhya Operations";
		SimpleMailMessage sm=new SimpleMailMessage();
		sm.setTo(email);
		sm.setSubject(subject);
		
	
		sm.setText(message);
		mailSender.send(sm);
	}
	public void sendMail(String email,String message)
	{	
		String subject="CareerVidhya Notice";
		SimpleMailMessage sm=new SimpleMailMessage();
		sm.setTo("soumya.jena@cvcorp.in");
		sm.setSubject(subject);
		sm.setText(message);
		mailSender.send(sm);
	}

	public byte[] downloadResume(String email) {
		// TODO Auto-generated method stub
		
		
		byte[] data=null;
		try {
					InputStream str=studentDao.getResume(email).getBinaryStream();
					
			data=new byte[str.available()];
			str.read(data);
			str.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return data;
	}
	

	
	public String getTopicsList(String subject, String topic2) {
		// TODO Auto-generated method stub
		String topic="[";
		List<String> l;
		try{
		l=reportDao.getTopicsList(subject,topic2);
		for(int i=0;i<l.size();i++)
		{
			if(i!=l.size()-1)
				topic=topic+"\""+l.get(i)+"\",";
			else
				topic=topic+"\""+l.get(i)+"\"";
		}
		topic=topic+"]";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return topic;
	}

	public String getTopicsListQA(String subject, String topic2) {
		// TODO Auto-generated method stub
		String topic="[";
		List<String> l;
		try{
		l=reportDao.getTopicsListQA(subject,topic2);
		for(int i=0;i<l.size();i++)
		{
			if(i!=l.size()-1)
				topic=topic+"\""+l.get(i)+"\",";
			else
				topic=topic+"\""+l.get(i)+"\"";
		}
		topic=topic+"]";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return topic;
	}

	public String updateTotalFee(String email,int totalFee) {
		// TODO Auto-generated method stub
		String notification="Fee updated refresh the page to see change";
		boolean status=true;
		try {
		studentDao.updateTotalFee(email,totalFee);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			status=false;
			notification="problem occured";
			System.out.println("test false");
		}
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}

	public String updateStudent(String reqBody) {
		// TODO Auto-generated method stub
		Gson g=new Gson();
		Boolean status=true;
		String notification="Saved Successfully";
		try{
		CVStudent student=g.fromJson(reqBody, CVStudent.class);
		studentDao.updateStudent(student);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			status=false;
			notification="Error in Saving";
		}
		
		return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
	}

	public CVStudent getStudentById(Integer student_id) {
		// TODO Auto-generated method stub
		CVStudent st=null;
		try{
		st=studentDao.getStudentById(student_id);
		}catch(Exception e){
		
		}
		return st;
	}

	public List<DetailedReport> getStudentDetailedReport(String email) {
		// TODO Auto-generated method stub
		List<DetailedReport> report=null;
		try{
			report=reportDao.getStudentDetailedReport(email);
		}catch(Exception e){
			e.printStackTrace();
		}
		return report;
	}

	public String getTotalExamsForBatch(int batchNumber)
	{
		int totalTestsCount=-1;
		boolean status=true;
		try{
			
			totalTestsCount=reportDao.getTotalExamsForBatch(batchNumber);
		}
		catch(Exception e){
			status=false;
			
		}
		return "{\"status\":"+status+",\"totalTestsCount\":"+totalTestsCount+"}";
	}
	
	public List<DriveStatus> getStudentDriveData(int student_id){
		List<DriveStatus> l=null;
		
		try {
			l=reportDao.getStudentDriveData(student_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l;
	}
	public List<TopicComp> getTopicCoveredByBatch(int batchNumber, String subject) {
		return adminDao.getTopicCoveredByBatch(batchNumber,subject);
	}

	public boolean addTopic(String topic, int approx, String subject, int flow, String dres, String vres) {
		
		boolean b=false;
		try {
			 if(subject.toLowerCase().trim().equals("aptitude"))
				 subject="Math";
		     else if(subject.toLowerCase().trim().equals("database"))
		    	 subject="MySql";
		     else if(subject.toLowerCase().trim().equals("communication"))
		    	 subject="Comms";
			 
			int v=adminDao.addTopic(topic,approx,subject,flow,dres,vres);
			if(v==1) b=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean editTopicCover(int topic_id, int topicCover_id, String dateList) {
		boolean b=false;
		try {
			int v=adminDao.editTopicCover(topic_id,topicCover_id,dateList);
			if(v==1) b=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public List<Faculty> getFaculty() {	
		return adminDao.getFaculty();
	}

	public List<BatchReportList> getReport(String date) {
		List<BatchReportList> report=new ArrayList();
		ArrayList<Batch> list=(ArrayList<Batch>) adminDao.getActiveBatches();
		for(int i=0;i<list.size();i++) {
			BatchReportList batchReportList=new BatchReportList();
			batchReportList.setBatchNumber(list.get(i).getBatchNumber());
			batchReportList.setJava(getReportBySubject('J',date,list.get(i).getBatchNumber()));
			batchReportList.setAptitude(getReportBySubject('A',date,list.get(i).getBatchNumber()));
			batchReportList.setCommunication(getReportBySubject('C',date,list.get(i).getBatchNumber()));
			batchReportList.setLinuxDB(getReportBySubject('L',date,list.get(i).getBatchNumber()));
			report.add(batchReportList);
		}
		
		return report;
	}

	public SubjectReport getReportBySubject(char sub,String date,int batchNumber ) {
		
		SubjectReport subjectReport=new SubjectReport();
		try {
		String subjectName="";
		switch (sub) {
		case 'J':
			subjectName="java";
			break;
		case 'A':
			subjectName="math";
			break;
		case 'C':
			subjectName="comms";
			break;
		default:
			subjectName="linux";
			break;
		}
		String dateSub=""+date+"@"+sub;
		List<CVStudentAtt> studentsAllList=viewStudentsAtt(batchNumber,dateSub);
		

		ArrayList<CVStudentAtt> absentList=new ArrayList();
		
		if(studentsAllList != null) {
			subjectReport.setTotalNumberStudent(studentsAllList.size());
			for(int i=0;i<studentsAllList.size();i++) {
				if(studentsAllList.get(i).getAtt()!=null) {
					if(!studentsAllList.get(i).getAtt().contains(dateSub)) {
						absentList.add(studentsAllList.get(i));
					}
				}
			}
			
		}
		
		else subjectReport.setTotalNumberStudent(0);
		
		
		
		
		StudentWorking workingDayList=adminDao.getStudnetWorkingDaybyBatch(batchNumber);
	if(workingDayList!=null) {
		if(workingDayList.getWorkingDate().contains(dateSub)) {
			if(absentList.size()==studentsAllList.size()) {
				subjectReport.setAttanceStatus("AllAreAbsent");
			}
			else {
				subjectReport.setAttanceStatus("WorkingDay");
				subjectReport.setAbsentList(absentList);
				subjectReport.setPresentNumberStudent(studentsAllList.size()-absentList.size());
				subjectReport.setAttancePercentage((float) (((studentsAllList.size()-absentList.size())*100)/studentsAllList.size()));
			}
		}
		else subjectReport.setAttanceStatus("NotWorkingDay");
	}
	else subjectReport.setAttanceStatus("NotWorkingDay");
	
	///topic
	List<TopicComp> topicCoverList=new ArrayList<TopicComp>();
	if(!subjectName.equals("linux"))  topicCoverList = adminDao.getTopicCoveredByBatch(batchNumber,subjectName);
	else {
		topicCoverList = adminDao.getTopicCoveredByBatch(batchNumber,"linux");
		List<TopicComp> topicCoverList2 = adminDao.getTopicCoveredByBatch(batchNumber,"mysql");
		if(topicCoverList2!=null) {for(int i=0;i<topicCoverList2.size();i++) topicCoverList.add(topicCoverList2.get(i));}
	}
	
	List<TopicComp> topicCoverListByDate=new ArrayList<TopicComp>();
	if(topicCoverList!=null) {
		
	for(int i=0;i<topicCoverList.size();i++) {
		if(topicCoverList.get(i).getDayList().contains(date)) {
			topicCoverListByDate.add(topicCoverList.get(i));
		}
	}
	if(topicCoverListByDate.size()==0) subjectReport.setTopicStatus("Not Updated");
	else subjectReport.setTopicStatus("WorkingDay");
	
	if(topicCoverListByDate.size()!=0 && subjectReport.getAttanceStatus().equals("NotWorkingDay")) {
		subjectReport.setAttanceStatus("Missed Taking Attance");
	}
	if(topicCoverListByDate.size()==0 && !subjectReport.getAttanceStatus().equals("NotWorkingDay")) {
		subjectReport.setTopicStatus("Missed Updating Topic");
	}
	
	subjectReport.setNumberOfClass(topicCoverListByDate.size());
	
	List<TopicReport> topicReport=new ArrayList();
	for(int i=0;i<topicCoverListByDate.size();i++) {
		TopicReport topicRep=new TopicReport();
		topicRep.setTopicId(topicCoverListByDate.get(i).getTopic_id());
		topicRep.setTopicName(topicCoverListByDate.get(i).getTopicName());
		topicRep.setApproxDayToComplite(topicCoverListByDate.get(i).getDurationDays());
		topicRep.setDayTakenToComplite(topicCoverListByDate.get(i).getDayList().size());
		topicReport.add(topicRep);
	}
	subjectReport.setTopicReport(topicReport);
	}
		
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return subjectReport;
	}
	
	@Scheduled(cron = "0 0 17,19 * * MON-SAT", zone = "IST")
	public String sendReportToCV(){
		String s="";
		 try{
		  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		  //String today="2018-06-26";
		  String host="smtp.gmail.com";//change accordingly  
	      String to="cv@cvcorp.in";//change accordingly  
	      final String user="careervidhyaoperations@gmail.com";//change accordingly  
	      final String password="cvcorp2017";//change accordingly  
	  
	      Properties properties = System.getProperties();
	      properties.setProperty("mail.smtp.host",host);  
	      properties.put("mail.smtp.auth", "true");   
	      properties.put("mail.smtp.port", "587");
	      properties.put("mail.smtp.starttls.enable", "true");
	  
	      Session session = Session.getDefaultInstance(properties,  
	    new javax.mail.Authenticator() {  
	     protected PasswordAuthentication getPasswordAuthentication() {  
	      return new PasswordAuthentication(user,password);  
	     }  
	      });  
	      
	    	 List<BatchReportList> data= getReport(today);
	    	 String msg="<html><h2>Career Vidhya Report ( "+today+" )</h2><br><br>";
	    	 for(int i=data.size()-1;i>=0;i--) {
	    		 msg+="<h3> Batch No. : <b>"+data.get(i).getBatchNumber()+"</b></h3>";
	    		 msg+="<table style='border-collapse: collapse;border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>";
	    		 msg+="<tr style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'><th rowspan='2' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>Subject</th><th colspan='3' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>Topic</th><th colspan='6' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>Attendance</th></tr>";
	    		 msg+="<tr style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>Name</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >Approx</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>Taken</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>status</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >Persentage</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >Total</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >Present</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >Absent</th><th style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >Absent List</th></tr>";
	    		 msg+=getHtmlCode(data.get(i).getJava(),"Java");
	    		 msg+=getHtmlCode(data.get(i).getAptitude(),"Aptitude");
	    		 msg+=getHtmlCode(data.get(i).getCommunication(),"Communication");
	    		 msg+=getHtmlCode(data.get(i).getLinuxDB(),"Linux & DB");
	    		 msg+="</table><br>";
	    	 }
	    	 msg+="<br><br><br><p><b>Created by : </b>CvCorp Developer Team</p></html>";
	    	 s=msg;
	         MimeMessage message = new MimeMessage(session);  
	         message.setFrom(new InternetAddress(user));  
	         message.addRecipient(Message.RecipientType.TO,  
	                                  new InternetAddress(to)); 
	         message.setSubject("Career Vidhya Report ( "+today+" )");  
	         message.setContent(msg,"text/html" );  
	    
	         Transport.send(message);  
	         System.out.println("message sent....");  
	      }catch (Exception ex) {ex.printStackTrace();}  
		 return s;
	}

	private String getHtmlCode(SubjectReport obj,String sub) {
		String out="<tr style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>";
		if(obj!=null){
			List<TopicReport> topicList=obj.getTopicReport();
			if(topicList!=null) {
				if(obj.getTopicStatus().equals("WorkingDay")) {
					out+="<td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>"+sub+"</td>";
					String a="",b="",c="";
					for(int i=0;i<topicList.size();i++) {
						a+="<p>"+topicList.get(i).getTopicName()+"</p>";
						b+="<p>"+topicList.get(i).getApproxDayToComplite()+"</p>";
						c+="<p>"+topicList.get(i).getDayTakenToComplite()+"</p>";
					}
					out+="<td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+a+"</td><td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+b+"</td><td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+c+"</td>";
				}
				else {
					out+="<td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+sub+"</td>"+"<td colspan='3' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+obj.getTopicStatus()+"</td>";
				}
			}
			else {
				out+="<td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>"+sub+"</td>"+"<td colspan='3' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >Not Updated</td>";
			}
			if(!obj.getAttanceStatus().equals("NotWorkingDay")) {
				if(!obj.getAttanceStatus().equals("Missed Taking Attance")) {
				out+="<td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>"+obj.getAttanceStatus()+"</td><td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+obj.getAttancePercentage()+"</td><td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+obj.getTotalNumberStudent()+"</td><td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+obj.getPresentNumberStudent()+"</td><td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;' >"+(obj.getAbsentList()==null?"0":obj.getAbsentList().size())+"</td>";
				String f="";
				if(obj.getAbsentList()!=null) {
					if(obj.getAbsentList().size()!=0) {
						for(int i=0;i<obj.getAbsentList().size();i++) {
							f=f+"<p>"+obj.getAbsentList().get(i).getName()+"</p>";
						}
					}
					else {
						f="<p>All Present</p>";
					}
				}
				else {
					f="<p>All Present</p>";
				}
			out=out+"<td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>"+f+"</td>";
			}
			else {
				out+="<td colspan='6' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>"+obj.getAttanceStatus()+"</td>";
			}
			}
			else {
				out+="<td colspan='6' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>"+obj.getAttanceStatus()+"</td>";
			}
		}
		else {
			out+="<td style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>"+sub+"</td>"+"<td colspan='9' style='border: 1px solid black; text-align : center; weight:600; font-size:12px; padding:5px;'>Not Updated</td>";
		}
		out+="</tr>";
		
		return out;
	}

	public List<OfflineExam> getOfflineExamList(int batch, String subject) {
		return adminDao.getOfflineExamList(batch,subject);
	}

	public String addOfflineExam(OfflineExam exam) {
		String out="No";
		int a=adminDao.addOfflineExam(exam);
		if(a>-1) {
			out="yes";
			int examid=adminDao.getOfflineExamId(exam);
			addOfflineExamScore(exam.getScoreList(),examid);
		}
		return out;
	}
	public void addOfflineExamScore(List<OfflineExamScore> list,int id) {
		for(int i=0;i<list.size();i++) {
			list.get(i).setExamId(id);
			adminDao.addOfflineScore(list.get(i));
		}
	}

	public String editOfflineExamScore(int id, int score, String remark) {
		int a=adminDao.editOfflineExamScore(id,score,remark);
		return a>-1? "yes":"no";
	}

	public List<PlacementDriveCompany> getPlacementDriveList() {
		return adminDao.getPlacementDriveList();
	}

	public boolean deleteStudDriveDetails(int id) {
		// TODO Auto-generated method stub
		return adminDao.deleteStudDriveDetails(id);
	}

	public List<DriveStatus> getStudentDriveReportList(int id) {
		// TODO Auto-generated method stub
		return adminDao.getStudentDriveReportList(id);
	}

	public String editStudDriveDetails(int id, EditStudentDriveRound obj) {
		return adminDao.editStudDriveDetails(id, obj);
	}

	public String addNewStudentIntoDriveList(List<DriveStatus> obj) {
		// TODO Auto-generated method stub
		return adminDao.addNewStudentIntoDriveList(obj);
	}

	public String addNewCompany(Company obj) {
		// TODO Auto-generated method stub
		return adminDao.addNewCompany(obj);
	}

	public int addNewPlacementDrive(PlacementDrive obj) {
		// TODO Auto-generated method stub
		return adminDao.addNewPlacementDrive(obj);
	}

	public List<CVStudentAttDashbord> getDataAttDashbord() {
		// TODO Auto-generated method stub
		return adminDao.getDataAttDashbord();
	}

	
	
}
