package cv.services;

import cv.dao.AdminDao;
import cv.dao.BatchDao;
import cv.dao.QuestionPaperDao;
import cv.dao.ReportDao;
import cv.dao.StudentDao;
import cv.dao.StudentInGameDao;
import cv.dto.CompaniesList;
import cv.dto.Company;
import cv.dto.DriveStatus;
import cv.dto.TempData;
import cv.models.Admin;
import cv.models.CVStudent;
import cv.models.CustomFile;
import cv.models.Notification;
import cv.models.OfflineExam;
import cv.models.OfflineExamScore;
import cv.models.QAAnswer;
import cv.models.QAAnswersList;
import cv.models.QuestionPaper;
import cv.models.Report;
import cv.models.StudentExamScore;
import cv.models.StudentExamScoreContainer;
import cv.models.StudentInGame;
import cv.models.StudentSubjectExamList;
import cv.models.StudentTopicStatusList;
import cv.models.StudentWorking;
import cv.models.TimeTable;
import cv.models.Topic;
import cv.models.TopicComp;
import cv.models.TopicStatus;

import java.io.InputStream;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import java.util.Random;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

public class StudentService {

	private StudentDao studentDao;
	private AdminDao adminDao;
	private QuestionPaperDao questionPaperDao;
	private ReportDao reportDao;
	private BatchDao batchDao;
	
	private StudentInGameDao studentInGameDao;
	private MailSender mailSender;
	
	public BatchDao getBatchDao() {
		return batchDao;
	}


	public void setBatchDao(BatchDao batchDao) {
		this.batchDao = batchDao;
	}


	public AdminDao getAdminDao() {
		return adminDao;
	}


	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}


	public MailSender getMailSender() {
		return mailSender;
	}


	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}


	public ReportDao getReportDao() {
		return reportDao;
	}


	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}


	public boolean login(String email,String password, HttpServletRequest request)
	{
		boolean lg=false;
		//System.out.println("before");
		CVStudent student=null;
		try{
		student=studentDao.getStudentByEmail(email);
		}
		catch(Exception e)
		{
			lg=false;
			e.printStackTrace();
		}
		//System.out.println("after");
		if(student!=null)
		{
				try{
				
					lg=BCrypt.checkpw(password, student.getPassword_hash());
					if(lg)
					{
					request.getSession().setAttribute("student", student);
					request.getSession().setMaxInactiveInterval(-1);
					
					studentDao.setLoginTime(student.getStudent_id());
					
					if(student.getIsRegistered().equals("N"))
						studentDao.setIsRegistered(student.getEmail());
				
					/*
				if(!isTaken(student))
				{
					try{
					studentDao.present(student.getEmail(),student.getFullName(),student.getBatchNumber());
					}catch(Exception e)
					{
						e.printStackTrace();
					}
					//String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
					
					//if(student.getAttendance()!=null)
					//student.setAttendance(student.getAttendance()+","+today);
					//else
						//student.setAttendance(today);
				//studentDao.updateAttendance(student);
				}
				*/
				
					
					
					
					}
				 System.out.println(lg+"kjh");
				}
				catch(Exception e)
				{
					e.printStackTrace();
					lg=false;
				}

		}
		return lg;
	}
	
	
	

	
	public StudentDao getStudentDao() {
		return studentDao;
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public boolean isTaken(CVStudent st)
	{
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String atd=st.getAttendance();
		//System.out.println(atd==null);
		boolean r=false;
		if(atd!=null)
		{
		String[] ar=atd.split(",");
		
		for(int i=0;i<ar.length;i++)
		{
			if(ar[i].equalsIgnoreCase(today))
			{
				r=true;
				break;
			}
		}
		}
	
		
		return r;
	}


	public List<QuestionPaper> getQuestionPapersByBatch(String batchNo) {
		// TODO Auto-generated method stub
		
		return questionPaperDao.getPapersByBatch(batchNo);
		
	}

	public List<QuestionPaper> getQuestionPapersForExam(String batchNo,String email,String qp_type) {
		// TODO Auto-generated method stub
		
		return questionPaperDao.getPapersForExam(batchNo,email,qp_type);
		
	}

	public QuestionPaperDao getQuestionPaperDao() {
		return questionPaperDao;
	}


	public void setQuestionPaperDao(QuestionPaperDao questionPaperDao) {
		this.questionPaperDao = questionPaperDao;
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


	public boolean evaluateExam(int qp_id,double marks,String student_id, String manswers) {
		// TODO Auto-generated method stub
		Report report=new Report();
		report.setScorePer10(marks);
		report.setQp_id(qp_id);
		report.setStudent_id(student_id);
		try{
		reportDao.save(report);
		reportDao.saveUserAnswers(qp_id,student_id,manswers);
		return true;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}


	public List<QuestionPaper> getQuestionPapersDone(String email) {
		// TODO Auto-generated method stub
		return questionPaperDao.getQuestionPapersDone(email);
	}



	
	public boolean changePassword(String oldPassword, String newPassword,HttpServletRequest request) {
		// TODO Auto-generated method stub
		CVStudent st=(CVStudent)request.getSession().getAttribute("student");
		if(BCrypt.checkpw(oldPassword, st.getPassword_hash()))
		{
		
		try{
			BCryptPasswordEncoder e=new BCryptPasswordEncoder();
			String password_hash=e.encode(newPassword);
		studentDao.setPassword(password_hash,st.getEmail());
		st.setPassword_hash(password_hash);
		
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


	public Notification getNotification(String batchNumber) {
		// TODO Auto-generated method stub
		return reportDao.getNotification(batchNumber);
		
	}


	public boolean submitQAExam(String[] question_ids, String[] qaAnswers, int qp_id, String email) {
		// TODO Auto-generated method stub
		
		boolean b=true;
		
		for(int i=0;i<question_ids.length;i++)
		{
			try{
				qaAnswers[i]=qaAnswers[i].replace('\'', '"');
			reportDao.saveQAAnswers(question_ids[i],qaAnswers[i],email,qp_id);
			}catch(Exception e)
			{
				b=false;
				e.printStackTrace();
				break;
				
			}
		}
		Report report=new Report();
		report.setQp_id(qp_id);
		report.setStudent_id(email);
		report.setScorePer10(-1);
	
		try{
			
		reportDao.save(report);
		
		}catch(Exception e)
		{
			b=false;
			e.printStackTrace();
		}
		return b;
		
	}


	public String getStudentScore(String email, int qp_id) {
		// TODO Auto-generated method stub
		int scorePer100=0;
		boolean status=true;
		try{
		scorePer100=reportDao.getStudentScoreForPaper(email,qp_id);
		}
		catch(Exception e)
		{
			status=false;
			e.printStackTrace();
		}
		return "{\"status\":"+status+",\"scorePer100\":"+scorePer100+"}";
	}
	
	public List<CustomFile> getFilesBySubject(String subject,int batchNumber)
	{
		return studentDao.getFilesBySubject(subject,batchNumber);
	}


	public ArrayList getFileById(int id) {
		// TODO Auto-generated method stub
		ArrayList al=null;
		String fileType=null;
		byte[] data=null;
		try {
			
					al=studentDao.getFileById(id);
					InputStream str=((java.sql.Blob) al.get(1)).getBinaryStream();
					fileType=(String)al.get(0);
			data=new byte[str.available()];
			str.read(data);
			str.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		al.clear();
		al.add(fileType);
		al.add(data);
		return al;
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
	
	public String forgotPassword(String email) {
		// TODO Auto-generated method stub
		String notification="Oops! Looks like you are not a registered user to the portal";
		boolean status=false;
		CVStudent student;
		try{
		    student=studentDao.getStudentByEmail(email);
			String[] pwds=generateRandomPassword();
			studentDao.setPassword(pwds[1], email);
			sendForgotPasswordMail(email,student.getFullName(),pwds[0]);
			notification="Your new Password has been sent to your mail "+email;
		    status=true;
 		}
		catch(Exception e)
		{
			
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


	public Object getLeadBoard() {
		// TODO Auto-generated method stub
		
		StudentInGame st;
		return null;
	}


	public StudentInGameDao getStudentInGameDao() {
		return studentInGameDao;
	}


	public void setStudentInGameDao(StudentInGameDao studentInGameDao) {
		this.studentInGameDao = studentInGameDao;
	}


	public String getUserOptions(String email, int qp_id) {
		// TODO Auto-generated method stub
        String options=null;
		try{
		options=reportDao.getUserOptions(email,qp_id);
		} 
		catch(Exception e)
		{
		}
		return options;
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


	public String uploadResume(MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		// TODO Auto-generated method stub
				String notification="File Uploaded successfully";
				
				boolean status=true;
				
				CVStudent student=(CVStudent)request.getSession().getAttribute("student");
			     
				try {
					InputStream stream=file.getInputStream();
					
					
					
					studentDao.uploadResume(stream,student.getEmail());
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					status=false;
					notification="There is a problem in uploading file, check size of file";
				}
				
				return "{\"status\":"+status+",\"notification\":\""+notification+"\"}";
				
	}


	public String updateData(String reqBody) {
		// TODO Auto-generated method stub
		 Gson g=new Gson();
		 boolean status=false;
		 TempData td=g.fromJson(reqBody, TempData.class);
		 try{
		 studentDao.updateTempData(td);
		 status=true;
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return "{\"status\":"+status+"}";
	}
	
	public String updateDrive(String reqBody) {
		// TODO Auto-generated method stub
		 Gson g=new Gson();
		 boolean status=false;
		 DriveStatus td=g.fromJson(reqBody, DriveStatus.class);
		 try{
		 studentDao.updateDriveData(td);
		 status=true;
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return "{\"status\":"+status+"}";
	}


	public CVStudent getStudent(String email) {
		CVStudent cv=null;
		try{
		cv=studentDao.getStudentByEmail(email);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cv;
	}


	public CompaniesList getCompanies(String str) {
		CompaniesList l=new CompaniesList();
		try{
		 l.setCompanies(studentDao.getCompanies(str));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return l;
	}


	public List<StudentExamScore> getMyExamScore(String email, String subject, int batch) {
		List<OfflineExam> eaxmlist=adminDao.getOfflineExamList(batch,subject);
		List<StudentExamScore> scoreList= new ArrayList<StudentExamScore>();
		if(eaxmlist !=null) {
			for(int i=0;i<eaxmlist.size();i++) {
				OfflineExamScore scoreObj=adminDao.getExamScoreByEmailId(email,eaxmlist.get(i).getId());
				if(scoreObj!=null) {
					StudentExamScore obj=new StudentExamScore();
					obj.setExamDate(eaxmlist.get(i).getExamDate());
					obj.setExamId(eaxmlist.get(i).getId());
					obj.setExamType(eaxmlist.get(i).getExamType());
					obj.setFullmark(eaxmlist.get(i).getFullmark());
					obj.setRemark(scoreObj.getRemark());
					obj.setScore(scoreObj.getScore());
					obj.setScoreId(scoreObj.getId());
					obj.setStudentEmailId(scoreObj.getStudentEmailId());
					obj.setTopic(eaxmlist.get(i).getTopic());
					scoreList.add(obj);
				}
			}
		}
		return scoreList;
	}


	public StudentSubjectExamList getMyAllExamScore(String email, int batch) {
		StudentSubjectExamList obj=new StudentSubjectExamList() ;
		try{
			obj.setJava(getMyExamScore(email,"Java",batch));
			obj.setAptitude(getMyExamScore(email,"Aptitude",batch));
			obj.setCommunication(getMyExamScore(email,"Communication",batch));
			obj.setLinux(getMyExamScore(email,"Linux & DB",batch));
		}
		catch(Exception e) {
			System.out.println("error at getMyAllExamScore");
			e.printStackTrace();
		}
		return obj;
	}


	public StudentTopicStatusList getMyTopicStatus(String email, int batch) {
		StudentTopicStatusList obj=new StudentTopicStatusList() ;
		try{
			obj.setJava(getMyTopicStatusBySub(email,"Java",'J',batch));
			obj.setAptitude(getMyTopicStatusBySub(email,"Math",'A',batch));
			obj.setCommunication(getMyTopicStatusBySub(email,"Comms",'C',batch));
			obj.setLinux(getMyTopicStatusBySub(email,"Linux",'L',batch));
			obj.setMysql(getMyTopicStatusBySub(email,"MySql",'L',batch));
		}
		catch(Exception e) {
			System.out.println("error at getMyAllExamScore");
			e.printStackTrace();
		}
		return obj;
	}


	private List<TopicStatus> getMyTopicStatusBySub(String email, String subject,char sub, int batch) {

		List<TopicStatus> list= new ArrayList<TopicStatus>();
		try {
			List<Topic> allTopiclist=batchDao.getTopicsBySubject(subject);
			StudentWorking workingDayList=adminDao.getStudnetWorkingDaybyBatch(batch);
			CVStudent studentData=studentDao.getStudentByEmail(email);
			List<TopicComp> topicComp=adminDao.getTopicCoveredByBatch(batch,subject);
			for(int i=0;i<allTopiclist.size();i++) {
				TopicStatus obj=new TopicStatus();
				obj.setApproxDay(allTopiclist.get(i).getDurationDays());
				obj.setTopicId(allTopiclist.get(i).getTopic_id());
				obj.setName(allTopiclist.get(i).getTopicName());
				obj.setDateWise(null);
				obj.setStatus("Not yet");
				
				if(topicComp!=null) {
				  for(int j=0;j<topicComp.size();j++) {
					if(topicComp.get(j).getTopic_id()==allTopiclist.get(i).getTopic_id()) {
						ArrayList<String> st=new ArrayList<String>(); 
						ArrayList dayList=topicComp.get(j).getDayList();
						for(int k=0;k<dayList.size();k++) {
							String v11=workingDayList.getWorkingDate();
							if(v11!=null) {
							  if(v11.contains(dayList.get(k)+"@"+sub)) {
								  String v12=studentData.getAttendance();
								  if(v12!=null) {
								    if(v12.contains(dayList.get(k)+"@"+sub)) {
									   st.add(dayList.get(k)+"@Present");
								    }
								    else {
									   st.add(dayList.get(k)+"@Absent");
							  	    }
								  }
								  else {
									   st.add(dayList.get(k)+"@Absent");
							  	  }
							  }
							  else {
								st.add(dayList.get(k)+"@NotUpdated");
							  }
							}
							else {
								st.add(dayList.get(k)+"@NotUpdated");
							}
						}
						obj.setDateWise(st);
						obj.setStatus(getTopicStatus(obj.getDateWise(),allTopiclist.get(i).getDurationDays()));
						list.add(obj);
						break;
				  }
			   }
			 }
				
			
		}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error at studentService/getMyTopicStatusBySub");
		}
		return list;
	}


	private String getTopicStatus(List<String> dateWise,int approxDay) {
		String s="NA";
		try{
			  String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			  SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
			  Date date1 = myFormat.parse(today);
			  int p=0,a=0,nu=0;
			  boolean bool=false;
			  if(dateWise!=null && dateWise.size()!=0) {
			   for(int i=0;i<dateWise.size();i++) {
				   if(!bool) {
					   String arr[]=dateWise.get(i).toString().split("@");
						  Date date2 = myFormat.parse(arr[0].trim());
						  long diff = date2.getTime() - date1.getTime();
						  float days = (diff / (1000*60*60*24));
						  if(days>=0 && days<=1) {
							  bool=true;
						  }
				   }
				   
				  if(dateWise.get(i).toString().trim().contains("@Present")) p++;
				  else if(dateWise.get(i).toString().trim().contains("@Absent")) a++;
				  else nu++;
			   }
			   if(bool &&  dateWise.size()<approxDay) {
				   s="Progressing";
			   }
			   else {
				   if(p==dateWise.size())  s="Completed";
				   else if(a==dateWise.size()) s="Missed";
				   else if((a+p)==dateWise.size()) s="Missed Some Part";
				   else s="Update-Soon";
			   }
			   
			  }
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("error at studentService/getTopicStatus");
		}
		return s;
	}


	public List<TimeTable> getTimeTable() {
		return studentDao.getTimeTable();
	}


	
}
