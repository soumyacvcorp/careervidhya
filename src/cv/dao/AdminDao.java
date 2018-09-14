package cv.dao;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.*;

import cv.dto.CVStudentAttDashbord;
import cv.dto.Company;
import cv.dto.DriveStatus;
import cv.dto.Faculty;
import cv.models.Admin;
import cv.models.Batch;
import cv.models.CVStudent;
import cv.models.CustomFile;
import cv.models.EditStudentDriveRound;
import cv.models.MaxIdData;
import cv.models.OfflineExam;
import cv.models.OfflineExamScore;
import cv.models.PlacementDrive;
import cv.models.PlacementDriveCompany;
import cv.models.StudentWorking;
import cv.models.TopicComp;


public class AdminDao {

	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	
	
	public List<OfflineExam> getOfflineExamList(int batchNumber, String subject) {
		String sql="select id,batch, examSubject, examDate,topic,duration,fullmark,examType from OfflineExam where batch="+batchNumber+" and examSubject='"+subject+"'";
		List<OfflineExam> examList=template.query(sql,new RowMapper<OfflineExam>(){
			public OfflineExam mapRow(ResultSet rs,int row) throws SQLException{
				OfflineExam s=new OfflineExam();
				s.setId(rs.getInt("id"));
				s.setBatch(rs.getInt("batch"));
				s.setExamSubject(rs.getString("examSubject"));
				s.setExamDate(rs.getString("examDate"));
				s.setTopic(rs.getString("topic"));
				s.setDuration(rs.getInt("duration"));
				s.setFullmark(rs.getDouble("fullmark"));
				s.setExamType(rs.getString("examType"));
				s.setScoreList(getOfflineExamScoreList(rs.getInt("id")));
				return s;
			}	
		});
	
		if(examList.size()!=0)
			return examList;
		else
			return null;
	}
	public List<OfflineExamScore> getOfflineExamScoreList(int examId) {
		String sql="select id,studentEmailId, studentName, score,remark from OfflineExamScore where examId="+examId;
		List<OfflineExamScore> scoreList=template.query(sql,new RowMapper<OfflineExamScore>(){
			public OfflineExamScore mapRow(ResultSet rs,int row) throws SQLException{
				OfflineExamScore s=new OfflineExamScore();
				s.setId(rs.getInt("id"));
				s.setStudentEmailId(rs.getString("studentEmailId"));
				s.setStudentName(rs.getString("studentName"));
				s.setScore(rs.getDouble("score"));
				s.setRemark(rs.getString("remark"));
				
				return s;
			}	
		});
	
		if(scoreList.size()!=0)
			return scoreList;
		else
			return null;
	}
	
	public int addOfflineExam(OfflineExam obj){
		String sql="Insert into OfflineExam(batch, examSubject, examDate,topic,duration,fullmark,examType) values("+obj.getBatch()+","
				+ "'"+obj.getExamSubject()+"','"+obj.getExamDate()+"','"+obj.getTopic()+"',"+obj.getDuration()+","+obj.getFullmark()+",'"+obj.getExamType()+"')";
		return template.update(sql);
	}
	
	public int getOfflineExamId(OfflineExam obj){
		int out=-1; 
		try {
			if(obj!=null) {
				String sql="select * from OfflineExam where batch=? and examSubject=? and examDate=? and topic=? and duration=? and fullmark=? and examType=?; ";
				obj=template.queryForObject(sql, new Object[]{obj.getBatch(),obj.getExamSubject(),obj.getExamDate(),obj.getTopic(),obj.getDuration(),obj.getFullmark(),obj.getExamType()},new BeanPropertyRowMapper<OfflineExam>(OfflineExam.class));
				out=obj.getId();
			}
		}
		catch(Exception e) {
			System.out.println("error at getOfflineExamId");
		}
		return out;
	}
	
	public List<Faculty> getFaculty() {
		String sql="Select name,email,mobile,subjectToTeach,exp,urlPic from admin where isFaculty=true && admin_status='working';";
		System.out.println(template==null);
		List<Faculty> faculty=template.query(sql,new RowMapper<Faculty>(){
			public Faculty mapRow(ResultSet rs,int row) throws SQLException{
				System.out.println("myrow "+row);
				Faculty s=new Faculty();
				s.setName(rs.getString("name"));
				s.setEmail(rs.getString("email"));
				s.setMobile(rs.getString("mobile"));
				s.setUrlPic(rs.getString("urlPic"));
				s.setSubjectToTeach(rs.getString("subjectToTeach"));
				s.setExp(rs.getInt("exp"));
				return s;
			}	
		});
	
		if(faculty.size()!=0)
			return faculty;
		else
			return null;
	}
	
	public boolean validateAdmin(String email,String password, HttpServletRequest request)
	{
		Admin admin;
		System.out.println(email+"@");
		String sql="select * from admin where email=?";  
		try{
			admin=template.queryForObject(sql, new Object[]{email},new BeanPropertyRowMapper<Admin>(Admin.class));  
		}
		catch(EmptyResultDataAccessException e)
		{
		  admin=null;
		  e.printStackTrace();
		  System.out.println("test");
		}
		if (admin!=null)
	    {
	    	boolean t= BCrypt.checkpw(password, admin.getPassword_hash());
	        if(t)
	        {
	        	request.getSession().setAttribute("admin", admin);
	        	request.getSession().setMaxInactiveInterval(-1);
	        	System.out.println(request.getSession().getMaxInactiveInterval());
	        }
	        return t;
	        	
	    }
	    else
	    	return false;
	    		
	}

	public void setPassword(String password,String email)throws Exception {
		// TODO Auto-generated method stub
		String sql="update admin set password_hash='"+password+"' where email='"+email+"'";
		template.update(sql);
	}

	public void saveNotification(String notif, String batchNos,String email,String name)throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into notifications(notification,batchNos,postDate,postBy,name) values('"+notif+"',"
				+ "'"+batchNos+"',curdate(),'"+email+"','"+name+"')";
		template.update(sql);
	}
	
	public void addWorkingDay(int batch,String date) {
		try {
			String sql="insert into StudentWorkingDay(batch,workingDate) values(?,?)";
			
			template.execute(sql,new PreparedStatementCallback<Boolean>(){  
			    @Override  
			    public Boolean doInPreparedStatement(PreparedStatement ps)  
			            throws SQLException, DataAccessException {  
			              
			       ps.setInt(1, batch);
			       ps.setString(2, date);
			              
			        return ps.execute();  
			              
			    }  
			    }); 
		}
		catch(Exception e) {
			System.out.println("error at add workig date first time");
			e.printStackTrace();
		}
	}
	public StudentWorking getStudnetWorkingDaybyBatch(int batchNumber)
	{
		StudentWorking obj=null;
		try {
		String sql="select id,batch,workingDate from StudentWorkingDay where batch=?;";
		obj=template.queryForObject(sql, new Object[]{batchNumber},new BeanPropertyRowMapper<StudentWorking>(StudentWorking.class));
		System.out.println(obj.getWorkingDate());
		}
		catch(Exception e) {

			obj=null;
			System.out.println("get working error");
		}
		return obj;
	}
	public void udateAddWorkingDay(int batch,String date,String workingDayList) {
		try {
			String sql="update StudentWorkingDay set workingDate='"+workingDayList+","+date+"' where batch="+batch;
			template.update(sql);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void udateRemoveWorkingDay(int batch,String date,String workingDayList) {
		try {
			String att="";
			if(workingDayList!=null) {
				if(workingDayList.contains(","+date+",")) {
					String ss[]=workingDayList.split(","+date+",");
					att=ss[0]+","+ss[1];
				}
				else if(workingDayList.contains(date+",")) {
					String ss[]=workingDayList.split(date+",");
					att=ss[1];
				}
				else if(workingDayList.contains(","+date)) {
					String ss[]=workingDayList.split(","+date);
					att=ss[0];
				}
				else att=null;
			}
			att=(att!=null)?"'"+att+"'":"NULL";
			String sql="update StudentWorkingDay set workingDate="+att+" where batch="+batch;
			template.update(sql);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void uploadFile(InputStream fileData, String fileName, String subject, String name, String batches,String email, String fileType)
	throws Exception{
		// TODO Auto-generated method stub
		String sql="insert into files(fileData,fileName,subject,fileBy,batches,email,uploadDate,fileType) values(?,?,?,?,?,?,curdate(),?)";
		
		template.execute(sql,new PreparedStatementCallback<Boolean>(){  
		    @Override  
		    public Boolean doInPreparedStatement(PreparedStatement ps)  
		            throws SQLException, DataAccessException {  
		              
		       ps.setBlob(1, fileData);
		       ps.setString(2, fileName);
		       ps.setString(3, subject);
		       ps.setString(4,name);
		       ps.setString(5, batches);
		       ps.setString(6, email);
		       ps.setString(7, fileType);
		              
		        return ps.execute();  
		              
		    }  
		    });  
	}
	
	public Admin getAdminByEmail(String email)throws Exception
	{
		Admin admin=null;
		System.out.println(email);
		String sql="select * from admin where email=?";  
	
	   admin=template.queryForObject(sql, new Object[]{email},new BeanPropertyRowMapper<Admin>(Admin.class));  
		
	  return admin;
	}

	public List<TopicComp> getTopicCoveredByBatch(int batchNumber, String subject) {
		String sql="select T.topic_Id,TC.id,T.topicName,T.durationDays,TC.DayList,TC.batchNumber,T.subject,T.flowNumber from topics T inner join topicscovered TC ON T.topic_id=TC.topic_id where T.subject='"+subject+"' AND TC.batchNumber="+batchNumber;
		List<TopicComp> topicList=template.query(sql,new RowMapper<TopicComp>(){
			public TopicComp mapRow(ResultSet rs,int row) throws SQLException{
				TopicComp s=new TopicComp();
				s.setTopic_id(rs.getInt("topic_id"));
				s.setTopicCover_id(rs.getInt("id"));
				s.setBatchNumber(rs.getInt("batchNumber"));
				s.setDurationDays(rs.getInt("durationDays"));
				s.setFlowNumber(rs.getInt("flowNumber"));
				s.setSubject(rs.getString("subject"));
				s.setTopicName(rs.getString("topicName"));
				s.setDayList(new ArrayList<String>(Arrays.asList(rs.getString("DayList").trim().split(","))));
				return s;
			}	
		});
	
		if(topicList.size()!=0)
			return topicList;
		else
			return null;
	}

	public int addTopic(String topic, int approx, String subject, int flow, String dres, String vres) {
		String sql="insert into topics(topicName,durationDays,subject,flowNumber,resource,VideoResource) values(?,?,?,?,"+dres+","+vres+")";
		
		boolean v= template.execute(sql,new PreparedStatementCallback<Boolean>(){  
		    @Override  
		    public Boolean doInPreparedStatement(PreparedStatement ps)  
		            throws SQLException, DataAccessException {  
		              
		       ps.setString(1, topic);
		       ps.setInt(2, approx);
		       ps.setString(3, subject);
		       ps.setInt(4,flow);
		              
		        return ps.execute();  
		              
		    }  
		    });
		return v?0:1;
	}

	public int editTopicCover(int topic_id, int topicCover_id, String dateList) {
		
		String sql="update topicscovered set topic_id="+topic_id+",DayList="+dateList+" where id="+topicCover_id;
		return template.update(sql);
	}
	
	public List<Batch> getActiveBatches() {
		// TODO Auto-generated method stub
	
		String sql="select * from batches where status='active';";
		List<Batch> list=template.query(sql,new RowMapper<Batch>(){
			
			public Batch mapRow(ResultSet rs,int row)throws SQLException{
				Batch b=new Batch();
				b.setBatchNumber(rs.getInt("batchNumber"));
				b.setBeginDate(""+rs.getDate("beginDate"));
				b.setEndDate(""+rs.getDate("endDate"));
				return b;
			}
		});
		
		return list;
	}

	public void addOfflineScore(OfflineExamScore obj) {
		String remark="NULL";
		if(obj.getRemark()!=null && !obj.getRemark().trim().equals("")) {
			remark="'"+obj.getRemark()+"'";
		}
		
		String sql="Insert into OfflineExamScore(examId, studentEmailId,studentName,score,remark) values("+obj.getExamId()+",'"+obj.getStudentEmailId()+"','"+obj.getStudentName()+"',"+obj.getScore()+","+remark+")";
		template.update(sql);
	}

	public int editOfflineExamScore(int id, int score, String remark) {
		String sql="update OfflineExamScore set score="+score+",remark="+remark+" where id="+id;
		return template.update(sql);
	}

	public OfflineExamScore getExamScoreByEmailId(String email, int id) {
		OfflineExamScore obj=null;
		try {
			String sql="select id,studentEmailId, studentName, score,remark from OfflineExamScore where examId=? and studentEmailId=?;";
			obj=template.queryForObject(sql, new Object[]{id,email},new BeanPropertyRowMapper<OfflineExamScore>(OfflineExamScore.class));
		}
		catch(Exception e) {
			obj=null;
			System.out.println("getExamScoreByEmailId admin dao  error");
		}
		return obj;
	}

	public List<PlacementDriveCompany> getPlacementDriveList() {
		String sql="select company_id,location,name,logo,URL,companyType from companies";
		List<PlacementDriveCompany> list=template.query(sql,new RowMapper<PlacementDriveCompany>(){
			
			public PlacementDriveCompany mapRow(ResultSet rs,int row)throws SQLException{
				PlacementDriveCompany obj=new PlacementDriveCompany();
				obj.setCompany_id(rs.getInt("company_id"));
				obj.setLocation(rs.getString("location"));
				obj.setName(rs.getString("name"));
				obj.setLogo(rs.getString("logo"));
				obj.setURL(rs.getString("URL"));
				obj.setCompanyType(rs.getString("companyType"));
				obj.setPlacementDriveList(getPlacementDriveListByCompanyId(rs.getInt("company_id")));
				return obj;
			}

		});
		
		return list;

	}
	
	public List<PlacementDrive> getPlacementDriveListByCompanyId(int id) {
		String sql="select pd.id,pd.bondIsAvl,pd.bondDuration,pd.companyId, pd.driveDate,pd.initalSalary,pd.driveLocation,pd.jobLocation,pd.designation,pd.laterSalary,pd.roundList,pd.submissionCertificates from placementDrive pd where companyId="+id;//inner join  companies c ON pd.companyId=c.company_id ";
		List<PlacementDrive> list=template.query(sql,new RowMapper<PlacementDrive>(){
			
			public PlacementDrive mapRow(ResultSet rs,int row)throws SQLException{
				PlacementDrive obj=new PlacementDrive();
				obj.setId(rs.getInt("id"));
				obj.setBondIsAvl(rs.getBoolean("bondIsAvl"));
				obj.setBondDuration(rs.getInt("bondDuration"));
				obj.setCompanyId(rs.getInt("companyId"));
				obj.setDriveDate(rs.getString("driveDate"));
				obj.setInitalSalary(rs.getDouble("initalSalary"));
				obj.setDriveLocation(rs.getString("driveLocation"));
				obj.setJobLocation(rs.getString("jobLocation"));
				obj.setDesignation(rs.getString("designation"));
				obj.setLaterSalary(rs.getDouble("laterSalary"));
				obj.setRoundList(rs.getString("roundList"));
				obj.setSubmissionCertificates(rs.getBoolean("submissionCertificates"));
				obj.setStudentReportList(getStudentDriveReportList(rs.getInt("id")));
				return obj;
			}

		});
		
		return list;
	}
	protected Company getCompanyData(int id) {
		// TODO Auto-generated method stub
		Company obj=new Company();
		try {
			String sql="select * from companies where company_id=?";  
		
		   obj=template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Company>(Company.class));  
			
		}
		catch(Exception e) {
			System.out.println("error at getCompanyData");
			e.printStackTrace();
		}
		return obj;
	}

	public List<DriveStatus> getStudentDriveReportList(int id) {
		String sql="select ss.id,ss.bond,ss.bondduration,ss.WrittenRound_Status,"
				+ "ss.TechnicalRound1_Status,ss.TechnicalRound2_Status,"
				+ "ss.ComsRound_Status,ss.description,ss.joinDate,ss.HRRound_Status,"
				+ "ss.FinalReport,ss.designation,ss.technicalstack,ss.bond,"
				+ "ss.bondduration,ss.certificates,ss.initialSalary,"
				+ "ss.laterSalary,ss.student_id,stud.fullName name,stud.batchNumber batch"
				+ " from student_interview_status ss inner join  cv_students stud ON ss.student_id=stud.student_id"
				+ " where driveId="+id;
		List<DriveStatus> list=template.query(sql,new RowMapper<DriveStatus>(){
			
			public DriveStatus mapRow(ResultSet rs,int row)throws SQLException{
				DriveStatus b=new DriveStatus();
				b.setId(rs.getInt("id"));
				b.setBond(rs.getString("bond"));
				b.setBondduration(rs.getString("bondduration"));
				b.setWrittenRound_Status(rs.getString("WrittenRound_Status"));
				b.setTechnicalRound1_Status(rs.getString("TechnicalRound1_Status"));
			    b.setTechnicalRound2_Status(rs.getString("TechnicalRound2_Status"));
				b.setComsRound_Status(rs.getString("ComsRound_Status"));
				b.setDescription(rs.getString("description"));
				b.setJoinDate(rs.getString("joinDate"));
				b.setHRRound_Status(rs.getString("HRRound_Status"));
				b.setFinalReport(rs.getString("FinalReport"));
				b.setDesignation(rs.getString("designation"));
				b.setTechnicalstack(rs.getString("technicalstack"));
				b.setBond(rs.getString("bond"));
				b.setBondduration(rs.getString("bondduration"));
				b.setCertificates(rs.getString("certificates"));
				b.setInitialSalary(rs.getDouble("initialSalary"));
				b.setLaterSalary(rs.getDouble("laterSalary"));
				b.setStudent_id(rs.getInt("student_id"));
				b.setName(rs.getString("name"));
				b.setBatchNumber(rs.getInt("batch"));
				return b;
			}
		});
		return list;
	}
	

	protected CVStudent getStudentById(int id) {
		
		CVStudent obj=new CVStudent();
		try {
			String sql="select * from cv_students where student_id=?";  
		
		   obj=template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<CVStudent>(CVStudent.class));  
			
		}
		catch(Exception e) {
			System.out.println("error at getStudentById");
			e.printStackTrace();
		}
		return obj;
	}

	public boolean deleteStudDriveDetails(int id) {
		boolean b=false;
		try{ 
		int[] types = {Types.BIGINT};

		String sql="DELETE FROM student_interview_status WHERE id = ?";
		b= template.update(sql,new Object[]{id},types)>0;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public String editStudDriveDetails(int id, EditStudentDriveRound obj) {
		int s=0;
		String arr[]= getEditSQLLine(obj);
		try {
			for(int i=0;i<arr.length;i++) {
				String sql="update student_interview_status set "+arr[i]+"  where id="+id;
				s=s+template.update(sql);;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return s==arr.length?"yes":"no";
	}

	private String[] getEditSQLLine(EditStudentDriveRound obj) {
		String out="FinalReport='"+obj.getStatus()+"' -#- WrittenRound_Status='"+obj.getWritten()+"' -#- ComsRound_Status='"+obj.getCommunication()+"' -#- TechnicalRound1_Status='"+obj.getTechnical()+"' -#- TechnicalRound2_Status='"+obj.getCoding()+"' -#- HRRound_Status='"+obj.getHr()+"'";
		return out.split("-#-");
	}

	public String addNewStudentIntoDriveList(List<DriveStatus> obj) {
		int out=0;
		for(int i=0;i<obj.size();i++) {
			out+=addNewStudentIntoDrive(obj.get(i));
		}
		return out==obj.size()?"yes":"no";
	}
	public int addNewStudentIntoDrive(DriveStatus obj) {
		int out=0;
		try {
		String s=(obj.getBond()!=null)?(obj.getBond().equalsIgnoreCase("true"))?"'YES'":"'NO'":"NULL";
		String s1=(obj.getCertificates()!=null)?(obj.getCertificates().equalsIgnoreCase("true"))?"'YES'":"'NO'":"NULL";
		String sql="Insert into student_interview_status(company_id,driveId,student_id,designation,bond,bondduration,certificates,initialSalary,laterSalary,FinalReport,WrittenRound_Status,HRRound_Status,TechnicalRound1_Status,TechnicalRound2_Status,ComsRound_Status) values("+obj.getCompany_id()+","+obj.getDriveId()+","+obj.getStudent_id()+",'"+obj.getDesignation()+"',"+s+","+obj.getBondduration()+","+s1+","+obj.getInitialSalary()+","+obj.getLaterSalary()+",'"+obj.getFinalReport()+"','"+obj.getWrittenRound_Status()+"','"+obj.getHRRound_Status()+"','"+obj.getTechnicalRound1_Status()+"','"+obj.getTechnicalRound2_Status()+"','"+obj.getComsRound_Status()+"')";
		out =template.update(sql);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return out;
	}

	public String addNewCompany(Company obj) {
		String out="no";
		try {
		String name=(obj.getName()!=null)?(!obj.getName().equals(""))?"'"+obj.getName()+"'":"NULL":"NULL";
		String type=(obj.getCompanyType()!=null)?(!obj.getCompanyType().equals(""))?"'"+obj.getCompanyType()+"'":"NULL":"NULL";
		String url=(obj.getCompanyUrl()!=null)?(!obj.getCompanyUrl().equals(""))?"'"+obj.getCompanyUrl()+"'":"NULL":"NULL";
		String location=(obj.getLocation()!=null)?(!obj.getLocation().equals(""))?"'"+obj.getLocation()+"'":"NULL":"NULL";
		String logo=(obj.getLogo()!=null)?(!obj.getLogo().equals(""))?"'"+obj.getLogo()+"'":"NULL":"NULL";
		String sql="Insert into companies(name,companyType,URL,location,logo) values("+name+","+type+","+url+","+location+","+logo+")";
		int  v=template.update(sql);
		out=v>0?"yes":"no";
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return out;
	}

	public int addNewPlacementDrive(PlacementDrive obj) {
		int out=-1;
		try {
		String companyId=(obj.getCompanyId()!=null)?""+obj.getCompanyId():"NULL";
		String date=(obj.getDriveDate()!=null)?(!obj.getDriveDate().equals(""))?"'"+obj.getDriveDate()+"'":"NULL":"NULL";
		String round=(obj.getRoundList()!=null)?(!obj.getRoundList().equals(""))?"'"+obj.getRoundList()+"'":"NULL":"NULL";
		int bondDuration=(obj.getBondDuration()!=null)?obj.getBondDuration():0;
		String dLocation=(obj.getDriveLocation()!=null)?(!obj.getDriveLocation().equals(""))?"'"+obj.getDriveLocation()+"'":"NULL":"NULL";
		String jLocation=(obj.getJobLocation()!=null)?(!obj.getJobLocation().equals(""))?"'"+obj.getJobLocation()+"'":"NULL":"NULL";	
		String iSal=(obj.getInitalSalary()!=null)?""+obj.getInitalSalary():"NULL";
		String lSal=(obj.getLaterSalary()!=null)?""+obj.getLaterSalary():"NULL";	
		
		String designation=(obj.getDesignation()!=null)?(!obj.getDesignation().equals(""))?"'"+obj.getDesignation()+"'":"NULL":"NULL";	
		
		String sql="insert into placementDrive (companyId,driveDate,roundList,bondIsAvl,bondDuration,driveLocation,jobLocation,initalSalary,laterSalary,designation,submissionCertificates)" + 
				                        "values("+companyId+","+date+","+round+","+obj.getBondIsAvl()+","+bondDuration+","+dLocation+","+jLocation+","+iSal+","+lSal+","+designation+","+obj.getSubmissionCertificates()+")";
		int  v=template.update(sql);
		if(v>0) {
			out=getLastBigId("placementDrive");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return out;
	}

	private int getLastBigId(String s) {
		
		int id=-1;
		try {
			String sql="select MAX(id) as id from "+s;
			MaxIdData obj=template.queryForObject(sql, new Object[]{},new BeanPropertyRowMapper<MaxIdData>(MaxIdData.class));
			id=obj.getId();
		}
		catch(Exception e) {
			id=-1;
			e.printStackTrace();
		}
		return id;
	}

	public List<CVStudentAttDashbord> getDataAttDashbord() {
		String sql="select STUD.fullName as name,STUD.joinDate,STUD.email,STUD.batchNumber,STUD.attendance,STUDWRK.workingDate"
				+ " from cv_students STUD "
				+ " left join  StudentWorkingDay STUDWRK ON STUD.batchNumber=STUDWRK.batch"
				+ " left Join batches B on B.batchNumber=STUD.batchNumber" + 
				" where STUD.status='active' and B.status='active' order by STUD.batchNumber DESC";
		List<CVStudentAttDashbord> list=template.query(sql,new RowMapper<CVStudentAttDashbord>(){	
			public CVStudentAttDashbord mapRow(ResultSet rs,int row)throws SQLException{
				CVStudentAttDashbord obj=new CVStudentAttDashbord();
				obj.setAttance(rs.getString("attendance"));
				obj.setBatch(rs.getInt("batchNumber"));
				obj.setEmail(rs.getString("email"));
				obj.setJoinDate(rs.getString("joinDate"));
				obj.setName(rs.getString("name"));
				obj.setWorkingDateList(rs.getString("workingDate"));
				return obj;
			}

		});
		
		return list;
	}

	
}
