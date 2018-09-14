package cv.dao;


import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.RowMapper;

import cv.dto.Company;
import cv.dto.DriveStatus;
import cv.dto.TempData;
import cv.models.CVStudent;
import cv.models.CVStudentAtt;
import cv.models.CustomFile;
import cv.models.Present;
import cv.models.TimeTable;

public class StudentDao {

	private JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public void updateAttendance(CVStudent st)
	{
		String sql="update cv_students set attendance='"+st.getAttendance()+"' where email='"+st.getEmail()+"'";
		template.update(sql);
	}
	
	public int save(CVStudent st)throws Exception
	{
		String sql="insert into cv_students(batchNumber,fullName,email,parentName,mobile,mobile_Parent,feePaid,feeTotal,sscPercentage,"
				+ "interPercentage,graduationPercentage,graduationCollege,graduationYOP,graduationType"
				+ ",graduationBranch,password_hash,isRegistered,gender,dob,locality,city,state,joinDate,graduationCity) values("+st.getBatchNumber()+",'"+st.getFullName()+"','"+st.getEmail()+"',"
				+ "'"+st.getParentName()+"','"+st.getMobile()+"','"+st.getMobile_Parent()+"',"+st.getFeePaid()+","+st.getfeeTotal()+","+st.getSscPercentage()+","
				+ st.getInterPercentage()+","+st.getGraduationPercentage()+",'"+st.getGraduationCollege()+"',"+st.getGraduationYOP()+",'"+st.getGraduationType()+"','"+st.getGraduationBranch()+"',"
				+ "'"+st.getPassword_hash()+"','N','"+st.getGender()+"','"+st.getDob()+"','"+st.getLocality()+"','"+st.getCity()+"','"+st.getState()+"','"+st.getJoinDate()+"','"+st.getGraduationCity()+"')";
		template.update(sql);
		return 0;
	}
	public int saveTemp(CVStudent st)throws Exception
	{
		String sql="insert into cv_students(batchNumber,fullName,email,parentName,mobile,mobile_Parent,feePaid,feeTotal,sscPercentage,"
				+ "interPercentage,graduationPercentage,graduationCollege,graduationYOP,graduationType"
				+ ",graduationBranch,password_hash,isRegistered,gender,dob,locality,city,state,graduationCity) values("+st.getBatchNumber()+",'"+st.getFullName()+"','"+st.getEmail()+"',"
				+ "'"+st.getParentName()+"','"+st.getMobile()+"','"+st.getMobile_Parent()+"',"+st.getFeePaid()+","+st.getfeeTotal()+","+st.getSscPercentage()+","
				+ st.getInterPercentage()+","+st.getGraduationPercentage()+",'"+st.getGraduationCollege()+"',"+st.getGraduationYOP()+",'"+st.getGraduationType()+"','"+st.getGraduationBranch()+"',"
				+ "'"+st.getPassword_hash()+"','N','"+st.getGender()+"','"+st.getDob()+"','"+st.getLocality()+"','"+st.getCity()+"','"+st.getState()+"','"+st.getGraduationCity()+"')";
		template.update(sql);
		return 0;
	}

	public List<CVStudentAtt> getStudentsAttByBatch(int batchNumber,String date) {
		List<CVStudentAtt> ls=new ArrayList<CVStudentAtt>();
		
		String sql="select fullName,email,graduationCollege,gender,attendance from cv_students where batchNumber="+batchNumber+" and status='active'";
		
		List<CVStudentAtt> students=template.query(sql,new RowMapper<CVStudentAtt>(){
			public CVStudentAtt mapRow(ResultSet rs,int row) throws SQLException{
			CVStudentAtt s=new CVStudentAtt();
			s.setName(rs.getString("fullName"));
			s.setEmail(rs.getString("email"));
			s.setCollegeName(rs.getString("graduationCollege"));
			s.setGender(rs.getString("gender"));
			s.setAtt(rs.getString("attendance"));
			s.setAttendance((rs.getString("attendance")!=null)?rs.getString("attendance").toString().contains(date)?true:false:false);
			return s;
			}	
		});
		if(students.size()!=0) {
			return students;
		}
		else
			return null;
	}
	
	public List<CVStudent> getStudentsByBatch(int batchNumber) {
		// TODO Auto-generated method stub
		
		String sql="select * from cv_students where batchNumber="+batchNumber;
		List<CVStudent> students=template.query(sql,new RowMapper<CVStudent>(){
			public CVStudent mapRow(ResultSet rs,int row) throws SQLException{
			CVStudent s=new CVStudent();
			//s.setStudent_id(rs.getString(1));
			
			s.setFbLink(rs.getString("fblink"));
			s.setLnLink(rs.getString("lnlink"));
			s.setInactivereport(rs.getString("inactivereport"));
			s.setStatus(rs.getString("status"));
			s.setSscBoard(rs.getString("SSCBoard"));
			s.setInterBoard(rs.getString("InterBoard"));
			s.setSscMaths(rs.getDouble("SSCMaths"));
			s.setLastlogin(""+rs.getDate("lastlogin"));
			s.setBatchNumber(rs.getInt(1));
			s.setFullName(rs.getString(2));
			s.setEmail(rs.getString(3));
			s.setParentName(rs.getString(4));
			s.setMobile(rs.getString(5));
			s.setMobile_Parent(rs.getString(6));
			s.setFeePaid(rs.getInt(7));
			s.setfeeTotal(rs.getInt(8));
			s.setSscPercentage(rs.getInt(9));
			s.setInterPercentage(rs.getInt(10));
			s.setGraduationPercentage(rs.getInt(11));
			s.setGraduationCollege(rs.getString(12));
			s.setGraduationYOP(rs.getInt(13));
			s.setGraduationType(rs.getString(14));
			s.setGraduationBranch(rs.getString(15));
			s.setPassword_hash(rs.getString(16));
			s.setIsRegistered(rs.getString(17));
			s.setAggregate();
			s.setDob(""+rs.getDate("dob"));
			s.setGraduationCity(rs.getString("graduationCity"));
			s.setGender(rs.getString("gender"));
			s.setLocality(rs.getString("locality"));
			s.setCity(rs.getString("city"));
			s.setState(rs.getString("state"));
			s.setJoinDate(""+rs.getDate("joinDate"));
			s.setAttendancePerc(rs.getInt("attendancePerc"));
			s.setAttendance(rs.getString("Attendance"));
			return s;
			}	
		});
	
		if(students.size()!=0)
		return students;
		else
			return null;
	}
	
// List All students
	public List<CVStudent> getStudents() {
		// TODO Auto-generated method stub
		/*
		 select avg(scorePer100) as avgMarks,count(scorePer100) as examsTaken,batchNumber,fullName,email,parentName,\r\n" + 
				"mobile,mobile_Parent,feePaid,feeTotal,sscPercentage,\r\n" + 
				"interPercentage,graduationPercentage,graduationCollege,graduationYOP,graduationType,graduationBranch,\r\n" + 
				"password_hash,isRegistered,gender,locality,city,state,attendance,joinDate,attendancePerc,dob,graduationCity,\r\n" + 
				"resume,cv_students.student_id,status,inactivereport,lastlogin,fblink,lnlink,SSCBoard,InterBoard,SSCMaths,interMaths from cv_students join reports\r\n" + 
				" on cv_students.email=reports.student_id where scorePer100!=-1 group by cv_students.email"
		*/
		
		String sql="select W.workingDate,avg(R.scorePer100) as avgMarks, count(R.scorePer100) as examsTaken, C.batchNumber, C.fullName, C.email," + 
				"C.parentName, C.mobile, C.mobile_Parent, C.feePaid, C.feeTotal, C.sscPercentage, C.interPercentage," + 
				"C.graduationPercentage, C.graduationCollege, C.graduationYOP, C.graduationType, C.graduationBranch," + 
				"C.password_hash, C.isRegistered, C.gender, C.locality, C.city, C.state, C.attendance, C.joinDate," + 
				"C.attendancePerc, C.dob, C.graduationCity, C.resume, C.student_id, C.status, C.inactivereport, C.lastlogin," + 
				"C.fblink, C.lnlink, C.SSCBoard, C.InterBoard, C.SSCMaths, C.interMaths from cv_students AS C left join " + 
				"reports R on C.email = R.student_id left Join StudentWorkingDay W on C.batchNumber=W.batch group by C.email";
		List<CVStudent> students=template.query(sql,new RowMapper<CVStudent>(){
			public CVStudent mapRow(ResultSet rs,int row) throws SQLException{
			CVStudent s=new CVStudent();
			//s.setStudent_id(rs.getString(1));
			s.setFbLink(rs.getString("fblink"));
			s.setLnLink(rs.getString("lnlink"));
			s.setInactivereport(rs.getString("inactivereport"));
			s.setStatus(rs.getString("status"));
			s.setSscBoard(rs.getString("SSCBoard"));
			s.setInterBoard(rs.getString("InterBoard"));
			s.setSscMaths(rs.getDouble("SSCMaths"));
			s.setLastlogin(""+rs.getTimestamp("lastlogin"));
			s.setInterMaths(rs.getDouble("InterMaths"));
			s.setBatchNumber(rs.getInt("batchNumber"));
			s.setFullName(rs.getString("fullName"));
			s.setAttendance(rs.getString("attendance"));
			s.setWorkingDate(rs.getString("workingDate"));
			s.setEmail(rs.getString("email"));
			s.setParentName(rs.getString("parentName"));
			s.setMobile(rs.getString("mobile"));
			s.setMobile_Parent(rs.getString("mobile_Parent"));
			s.setFeePaid(rs.getInt("feePaid"));
			s.setfeeTotal(rs.getInt("feeTotal"));
			s.setSscPercentage(rs.getInt("sscPercentage"));
			s.setInterPercentage(rs.getInt("interPercentage"));
			s.setGraduationPercentage(rs.getInt("graduationPercentage"));
			s.setGraduationCollege(rs.getString("graduationCollege"));
			s.setGraduationYOP(rs.getInt("graduationYOP"));
			s.setGraduationType(rs.getString("graduationType"));
			s.setGraduationBranch(rs.getString("graduationBranch"));
			s.setPassword_hash(rs.getString("password_hash"));
			s.setIsRegistered(rs.getString("isRegistered"));
			//s.setAggregate();
			s.setDob(""+rs.getDate("dob"));
			s.setGraduationCity(rs.getString("graduationCity"));
			s.setGender(rs.getString("gender"));
			s.setLocality(rs.getString("locality"));
			s.setCity(rs.getString("city"));
			s.setState(rs.getString("state"));
			s.setJoinDate(""+rs.getDate("joinDate"));
			s.setAttendancePerc(rs.getInt("attendancePerc"));
			s.setStudent_id(rs.getInt("student_id"));
			s.setAvgMarks(rs.getDouble("avgMarks"));
			s.setExamsTaken(rs.getInt("examsTaken"));
			return s;
			}	
		});
	
		if(students.size()!=0)
		return students;
		else
			return null;
	}
	public CVStudent getStudentByEmail(String email)throws Exception {
		// TODO Auto-generated method stub
		CVStudent student=null;
		String sql="select * from cv_students where email=?";  
		
	   student=template.queryForObject(sql, new Object[]{email},new BeanPropertyRowMapper<CVStudent>(CVStudent.class));  
		student.setAggregate();
		
	   return student;
		
	}
	
	
	public CVStudent getStudentById(Integer student_id)throws Exception {
		// TODO Auto-generated method stub
		CVStudent student=null;
		String sql="select * from cv_students where student_id=?";  
		
	   student=template.queryForObject(sql, new Object[]{student_id},new BeanPropertyRowMapper<CVStudent>(CVStudent.class));  
		student.setAggregate();
		
	   return student;
		
	}



	public void updateFee(String email, int feePaid)throws Exception {
		// TODO Auto-generated method stub
		String sql="update cv_students set feePaid="+feePaid+" where email='"+email+"'";
		template.update(sql);
	}

	public int getAttendancePerc(String email)throws Exception {
		// TODO Auto-generated method stub
		String sql="select attendancePerc from cv_students where email=?";
		return template.queryForObject(sql, new Object[]{email},Integer.class);
		
	}

	public List<CVStudent> getStudentsMails(String text) {
		// TODO Auto-generated method stub
		String sql="select * from cv_students where email like'%"+text+"%' or fullName like '%"+text+"%'";
	   
		List<CVStudent> students=template.query(sql,new RowMapper<CVStudent>(){
			public CVStudent mapRow(ResultSet rs,int row) throws SQLException{
			CVStudent s=new CVStudent();
			//s.setStudent_id(rs.getString(1));
			s.setBatchNumber(rs.getInt(1));
			s.setFullName(rs.getString(2));
			s.setEmail(rs.getString(3));
			s.setParentName(rs.getString(4));
			s.setMobile(rs.getString(5));
			s.setMobile_Parent(rs.getString(6));
			s.setFeePaid(rs.getInt(7));
			s.setfeeTotal(rs.getInt(8));
			s.setSscPercentage(rs.getInt(9));
			s.setInterPercentage(rs.getInt(10));
			s.setGraduationPercentage(rs.getInt(11));
			s.setGraduationCollege(rs.getString(12));
			s.setGraduationYOP(rs.getInt(13));
			s.setGraduationType(rs.getString(14));
			s.setGraduationBranch(rs.getString(15));
			s.setPassword_hash(rs.getString(16));
			s.setIsRegistered(rs.getString(17));
			s.setAggregate();
			s.setDob(""+rs.getDate("dob"));
			s.setGraduationCity(rs.getString("graduationCity"));
			
			s.setGender(rs.getString("gender"));
			s.setLocality(rs.getString("locality"));
			s.setCity(rs.getString("city"));
			s.setState(rs.getString("state"));
			s.setJoinDate(""+rs.getDate("joinDate"));
			s.setAttendancePerc(rs.getInt("attendancePerc"));
			return s;
			}	
		});
		return students;
	}

	public void setPassword(String password_hash,String email)throws Exception {
		// TODO Auto-generated method stub
		String sql="update cv_students set password_hash='"+password_hash+"' where email='"+email+"'";
		template.update(sql);
		
	}

	public void present(String email,String name,int batchNumber)throws Exception {
		// TODO Auto-generated method stub
		
		String sql="insert into present(email,presentDate,name,batchNumber) values('"+email+"',curdate(),'"+name+"',"+batchNumber+")";
		template.update(sql);
	}

	public List<Present> getAllPresents() {
		// TODO Auto-generated method stub
		String sql="select * from present order by presentDate desc";
		List<Present> pl=template.query(sql, new RowMapper<Present>(){
			public Present mapRow(ResultSet rs,int row)throws SQLException{
				Present p=new Present();
				p.setEmail(rs.getString("email"));
				p.setPresentDate(""+rs.getDate("presentDate"));
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setBatchNumber(rs.getInt("batchNumber"));
				return p;
			}
			
		});
		
		return pl;
		
	}

	public void deletePresents(String email, String presentDate)throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from present where email='"+email+"' and presentDate='"+presentDate+"'";
         template.update(sql);		
	}
	
	public List<CustomFile> getFilesBySubject(String subject,int batchNumber)
	{
		System.out.println("test bbb");
		String sql="select id,batches,email,fileBy,fileName,subject,uploadDate from files where subject='"+subject+"' and batches like '%,"+batchNumber+",%'";
		List<CustomFile> files=template.query(sql, new RowMapper<CustomFile>(){
			public CustomFile mapRow(ResultSet rs,int row)throws SQLException 
			{
				CustomFile f=new CustomFile();
				f.setBatches(rs.getString("batches"));
				f.setId(rs.getInt("id"));
				f.setEmail(rs.getString("email"));
				f.setFileBy(rs.getString("fileBy"));
				f.setFileName(rs.getString("fileName"));
				f.setSubject(rs.getString("subject"));
				f.setUploadDate(""+rs.getDate("uploadDate"));
			
				System.out.println(f.getEmail());
			
				
				return f;
			}
		});
		return files;
	}

	public ArrayList getFileById(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select fileData from files where id="+id;
		String sqlFileType="select fileType from files where id="+id;
		java.sql.Blob b=template.queryForObject(sql, java.sql.Blob.class);
		String fileType=template.queryForObject(sqlFileType, String.class);
		ArrayList al=new ArrayList();
		al.add(fileType);
		al.add(b);
		return al;
	}
	
	public void setIsRegistered(String email)
	{
		String sql="update cv_students set isRegistered='Y' where email='"+email+"'";
		template.update(sql);
	}

	public void uploadResume(InputStream stream, String email)throws Exception {
		// TODO Auto-generated method stub
		String sql="update cv_students set resume=? where email=?";
		
		template.execute(sql,new PreparedStatementCallback<Boolean>(){  
		    @Override  
		    public Boolean doInPreparedStatement(PreparedStatement ps)  
		            throws SQLException, DataAccessException {  
		              
		       ps.setBlob(1, stream);
		     ps.setString(2, email);
		     
		              
		        return ps.execute();  
		              
		    }  
		    });  
	}

	public java.sql.Blob getResume(String email)throws Exception {
		// TODO Auto-generated method stub
		String sql="select resume from cv_students where email='"+email+"'";
		java.sql.Blob b=template.queryForObject(sql, java.sql.Blob.class);
		return b;
	}

	public void updateTotalFee(String email, int totalFee)throws Exception {
		// TODO Auto-generated method stub
		String sql="update cv_students set feeTotal="+totalFee+" where email='"+email+"'";
		template.update(sql);
	}

	public void updateTempData(TempData data) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(data.toString());
		String sql="update cv_students set fblink='"+data.getFbLink()+"',"
				+ "lnlink='"+data.getLnLink()+"',SSCBoard='"+data.getSscBoard()+"',"
				+ "InterBoard='"+data.getInterBoard()+"', SSCMaths="+data.getSscMaths()+",InterMaths="+data.getInterMaths()
				+" where email='"+data.getEmail()+"'";
		template.update(sql);
		
	}
	public int setStudentsAtt(int batchNumber, List<CVStudentAtt> addAtt,String date) {
		String att="";
		int k=0;
		try {
		for(CVStudentAtt stud:addAtt) {
			att="";
			if(stud.getAtt()!=null) att=stud.getAtt()+","+date;
			else att=date;
			String sql="update cv_students set attendance='"+att+"' where email='"+stud.getEmail()+"'";
			k+=template.update(sql);
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return k==addAtt.size()?1:0;
	}
	public int resetStudentsAtt(int batchNumber, List<CVStudentAtt> remAtt, String date) {
		String att="";
		int k=0;
		try {
		for(CVStudentAtt stud:remAtt) {
			att="";
			if(stud.getAtt()!=null) {
				if(stud.getAtt().contains(","+date+",")) {
					String ss[]=stud.getAtt().split(","+date+",");
					att=ss[0]+","+ss[1];
				}
				else if(stud.getAtt().contains(date+",")) {
					String ss[]=stud.getAtt().split(date+",");
					att=ss[1];
				}
				else if(stud.getAtt().contains(","+date)) {
					String ss[]=stud.getAtt().split(","+date);
					att=ss[0];
				}
				else att=null;
			}
			att=(att!=null)?"'"+att+"'":"NULL";
			String sql="update cv_students set attendance="+att+" where email='"+stud.getEmail()+"'";
			k+=template.update(sql);
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return k==remAtt.size()?1:0;
	}

	
	public void updateDriveData(DriveStatus data) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(data.toString());
		Integer company_id=null;
		String sql;
		String sqlGetID="select company_id from companies where name like '%"+data.getName()+"' limit 1";
		try{
		company_id=template.queryForObject(sqlGetID, Integer.class);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		//String sql="";
		if(company_id==null){
		sql="insert into companies (name)"
				+ " values('"+data.getName()+"')";		
		template.update(sql);
		company_id=template.queryForObject(sqlGetID, Integer.class);
		}
		
		sql="insert into student_interview_status(student_id,company_id,description,"
				+ "WrittenRound_Status,TechnicalRound1_Status,TechnicalRound2_Status,ComsRound_Status,"
				+ "HRRound_Status,FinalReport,designation,technicalstack,bond,bondduration,certificates,initialSalary,laterSalary)"
				+ "values ("+data.getStudent_id()+","+company_id+",'"+data.getDescription()+"','"+data.getWrittenRound_Status()+"',"
				+ "'"+data.getTechnicalRound1_Status()+"','"+data.getTechnicalRound2_Status()+"','"+data.getComsRound_Status()+"',"
				+ "'"+data.getHRRound_Status()+"','"+data.getFinalReport()+"','"+data.getDesignation()+"','"+data.getTechnicalstack()+"',"
				+ "'"+data.getBond()+"',"+data.getBondduration()+",'"+data.getCertificates()+"',"+data.getInitialSalary()+","
				+ ""+data.getLaterSalary()+")";
		
		template.update(sql);
		
		
	}
	
	//List Companies
	public List<Company> getCompanies(String str) throws Exception
	{
		String sql="select * from companies where name like '%"+str+"%'";
		List<Company> companies=template.query(sql, new RowMapper<Company>(){
			public Company mapRow(ResultSet rs,int row)throws SQLException 
			{
				Company f=new Company();
				f.setName(rs.getString("name"));
				f.setCompany_id(rs.getInt("company_id"));
				f.setLocation(rs.getString("location"));
				f.setURL(rs.getString("URL"));
				f.setLogo(rs.getString("logo"));
								
				return f;
			}
		});
		return companies;
	}

	public void updateStudent(CVStudent st)throws Exception {
		// TODO Auto-generated method stub
       String jd="";
		if(st.getJoinDate()!=null && st.getJoinDate().equals("null"))
			jd="joinDate="+st.getJoinDate()+",";
		else if(st.getJoinDate()!=null && !st.getJoinDate().equals("null"))
			jd="joinDate='"+st.getJoinDate()+"',";
		if( st.getInterMaths()!=null && st.getInterMaths().equals("null"))
			st.setInterMaths(null);
		if(st.getSscMaths()!=null && st.getSscMaths().equals("null"))
			st.setSscMaths(null);
		
		String sql="update cv_students set batchNumber="+st.getBatchNumber()+","
				+ "fullName='"+st.getFullName()+"',"
				+ "email='"+st.getEmail()+"',"
				+ "parentName='"+st.getParentName()+"',"
				+ "mobile='"+st.getMobile()+"',"
				+ "mobile_Parent='"+st.getMobile_Parent()+"',"
				+ "feePaid="+st.getFeePaid()+","
				+ "feeTotal="+st.getfeeTotal()+","
				+ "sscPercentage="+st.getSscPercentage()+","
				+ "interPercentage="+st.getInterPercentage()+","
				+ "graduationPercentage="+st.getGraduationPercentage()+","
				+ "graduationCollege='"+st.getGraduationCollege()+"',"
				+ "graduationYOP="+st.getGraduationYOP()+","
				+ "graduationType='"+st.getGraduationType()+"'"
				+ ",graduationBranch='"+st.getGraduationBranch()+"',"
				+ "gender='"+st.getGender()+"',"
				+ "dob='"+st.getDob()+"',"
				+ "locality='"+st.getCity()+"',"
				+ "city='"+st.getCity()+"',"
				+ "state='"+st.getState()+"',"
				+ jd
				+ "graduationCity='"+st.getGraduationCity()+"',"
				+ "SSCMaths="+st.getSscMaths()+","
				+ "InterMaths="+st.getInterMaths()
				+ ",SSCBoard='"+st.getSscBoard()+"',"
				+ "InterBoard='"+st.getInterBoard()+"',"
				+ "fblink='"+st.getFbLink()+"',"
				+ "lnlink='"+st.getLnLink()+"',"
				+ "status='"+st.getStatus()+"'"
				+ ",inactivereport='"+st.getInactivereport()+"'"
				+ " where student_id="+st.getStudent_id();
		template.update(sql);
	}

	public void setLoginTime(Integer student_id) {
		// TODO Auto-generated method stub
		try{
			String sql="update cv_students set lastlogin=now() where student_id="+student_id;
			template.update(sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	public List<TimeTable> getTimeTable() {
		String sql="SELECT * FROM TimeTable where indicate=0 OR indicate=2";
		List<TimeTable> obj=template.query(sql, new RowMapper<TimeTable>(){
			public TimeTable mapRow(ResultSet rs,int row)throws SQLException 
			{
				TimeTable f=new TimeTable();
				f.setId(rs.getInt("id"));
				f.setIndicate(rs.getInt("indicate"));
				f.setHeader(rs.getString("header"));
				f.setInfo(rs.getString("info"));
				return f;
			}
		});
		return obj;
	}

	
	
	
}
