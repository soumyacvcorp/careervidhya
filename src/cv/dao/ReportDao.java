package cv.dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cv.dto.DetailedReport;
import cv.dto.DriveStatus;
import cv.models.CVStudent;
import cv.models.Notification;
import cv.models.QAAnswer;
import cv.models.Report;

public class ReportDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template)
	{
		this.template=template;
	}
	public JdbcTemplate getTemplate()
	{
		return template;
	}
	
	public void save(Report report) throws Exception
	{
		String sql="insert into reports(student_id,scorePer100,qp_id,dateDone) values('"
				+report.getStudent_id()+"',"+report.getScorePer100()+","+report.getQp_id()+",curdate())";

		template.update(sql);
	}
	public void updateRemarks(String remarks,int student_id,int qp_id)
	{
		String sql="update reports set remarks='"+remarks+"'"+" where student_id="+student_id+" and qp_id="+qp_id;
	    
		template.update(sql);
	}
	
	public int totalStudentsTookExam(int qp_id)
	{
      String sql="select count(*) from reports where qp_id=?";	
      return template.queryForObject(sql, new Object[]{qp_id}, Integer.class);
	}
	
	
	public int[] getScorePerc(String email)throws Exception {
		// TODO Auto-generated method stub
		String sqlAvg="select avg(scorePer100) from reports where student_id=?";
		
		
		int avg=template.queryForObject(sqlAvg, new Object[]{email}, Integer.class);
		
        String sqlCount="select count(*) from reports where student_id=? and scorePer100!=-1";
		
		
		int testCount=template.queryForObject(sqlCount, new Object[]{email}, Integer.class);
		if(testCount==0)
			throw new Exception();
		int[] rs={avg,testCount};
       return rs;
	}
	public Notification getNotification(String batchNumber) {
		// TODO Auto-generated method stub
		String sql="select * from notifications where batchNos like '%"+batchNumber+"%' order by id desc limit ?";
		Notification notification=template.queryForObject(sql, new Object[]{1},new BeanPropertyRowMapper<Notification>(Notification.class));
		return notification;
	}
	public void saveQAAnswers(String question_id, String answer, String email, int qp_id)throws Exception  {
		// TODO Auto-generated method stub
		
		String sql="insert into qaanswers(question_id,answer,email,qp_id) values("+question_id+",'"+answer+"','"+email+"',"+qp_id+")";
		template.update(sql);
	}
	public int getStudentScoreForPaper(String email, int qp_id) {
		// TODO Auto-generated method stub
		
		String sql="select scorePer100 from reports where student_id='"+email+"' and qp_id="+qp_id;
		int scorePer100=template.queryForObject(sql, Integer.class);
		return scorePer100;
	}
	public List<CVStudent> getStudentsListByPaper(int qp_id) {
		// TODO Auto-generated method stub
		String sql="select fullName,email from cv_students,reports where cv_students.email=reports.student_id and qp_id="+qp_id;
	    List<CVStudent> list=template.query(sql, new RowMapper<CVStudent>(){
	    	public CVStudent mapRow(ResultSet rs,int rwo)throws SQLException{
	    		CVStudent st=new CVStudent();
	    		st.setFullName(rs.getString("fullName"));
	    		st.setEmail(rs.getString("email"));
	    		return st;
	    	}
	    });
	    return list;
	}
	public List<QAAnswer> getStudentQAAnswerPaper(int qp_id, String email)throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from qaanswers where email='"+email+"' and qp_id="+qp_id;
		
		List<QAAnswer> ans=template.query(sql, new RowMapper<QAAnswer>(){
			public QAAnswer mapRow(ResultSet rs,int row)throws SQLException
			{
				QAAnswer qa=new QAAnswer();
				
				qa.setAnswer(rs.getString("answer"));
				qa.setEmail(rs.getString("email"));
				qa.setQp_id(rs.getInt("qp_id"));
				qa.setQuestion_id(rs.getInt("question_id"));
				qa.setId(rs.getInt("id"));
				qa.setMarksPercent(rs.getInt("SecuredMarksPercent"));
				return qa;
			}
			
		});
			for(QAAnswer q:ans)
			{
				sql="select question from qabank where question_id="+q.getQuestion_id();
				q.setQuestion(template.queryForObject(sql, String.class));
			}
		
return ans;
	}
	public void updateAnswerScore(int id, int scoreInInt)throws Exception {
		// TODO Auto-generated method stub
		String sql="update qaanswers set securedMarksPercent="+scoreInInt+" where id="+id;
		template.update(sql);
	}
	public void saveUserAnswers(int qp_id, String email, String manswers)throws Exception {
		// TODO Auto-generated method stub
		
		String sql="insert into manswers(qp_id,email,studentoptions) values("+qp_id+",'"+email+"','"+manswers+"')";
		template.update(sql);
	}
	public String getUserOptions(String email, int qp_id)throws Exception {
		// TODO Auto-generated method stub
		
		String sql="select studentoptions from manswers where email='"+email+"' and qp_id="+qp_id;
		
		return template.queryForObject(sql, String.class);
	}
	public void upDateInReports(int id)throws Exception {
		// TODO Auto-generated method stub
		
		template.update("call updateQATotalScore(?)", id);
	}
	public List<String> getTopicsList(String subject, String topic) {
		// TODO Auto-generated method stub
		String sql="select distinct topic from questionbank where subject='"+subject+"' and topic like '%"+topic+"%'";
		return template.queryForList(sql, String.class);
	}
	public List<String> getTopicsListQA(String subject, String topic) {
		// TODO Auto-generated method stub
		String sql="select distinct topic from qabank where subject='"+subject+"' and topic like '%"+topic+"%'";
		return template.queryForList(sql, String.class);
	}
	
	public List<DetailedReport> getStudentDetailedReport(String email)throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from reports join questionpaper on reports.qp_id=questionpaper.qp_id where reports.student_id='"+email+"' and scorePer100 >=0";
		
		List<DetailedReport> report=template.query(sql, new RowMapper<DetailedReport>(){
			public DetailedReport mapRow(ResultSet rs,int row)throws SQLException
			{
				DetailedReport r=new DetailedReport();
				
				r.setCreationDate(""+rs.getDate("creationDate"));
				r.setAdmin_email(rs.getString("email"));
				r.setDateDone(""+rs.getDate("dateDone"));
				r.setStudent_email(rs.getString("student_id"));
				r.setScorePer100(rs.getDouble("scorePer100"));
				r.setBatchNos(rs.getString("BatchNos"));
				r.setDuration(rs.getInt("duration"));
				r.setIsPractice(rs.getString("isPractice"));
				r.setQp_id(rs.getInt("qp_id"));
				r.setQp_type(rs.getString("qp_type"));
				r.setExamDate(""+rs.getDate("examDate"));
				r.setTestName(rs.getString("testName"));
				r.setRemarks(rs.getString("remarks"));
				r.setQuestions(rs.getString("questions"));
				return r;
			}
			
		});
			
		
     return report;
	}
	
	public int getTotalExamsForBatch(int batchNumber)throws Exception{
		String sql="select count(*) from questionpaper where BatchNos like '%,"+batchNumber+",%'";
	 return	template.queryForObject(sql, Integer.class);
	}
	
	public List<DriveStatus> getStudentDriveData(int student_id)throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from student_interview_status join companies on companies.company_id=student_interview_status.company_id where student_id="+student_id+" order by FinalReport desc";
		
		List<DriveStatus> report=template.query(sql, new RowMapper<DriveStatus>(){
			public DriveStatus mapRow(ResultSet rs,int row)throws SQLException
			{
				DriveStatus d=new DriveStatus();
				
				  d.setBond(rs.getString("bond"));
				  d.setBondduration(rs.getString("bondduration"));
				  d.setCertificates(rs.getString("certificates"));
				  d.setComsRound_Status(rs.getString("ComsRound_Status"));
				  d.setDescription(rs.getString("description"));
				  d.setDesignation(rs.getString("designation"));
				  d.setFinalReport(rs.getString("FinalReport"));
				  d.setHRRound_Status(rs.getString("HRRound_Status"));
				  d.setInitialSalary(rs.getDouble("initialSalary"));
				  d.setJoinDate(""+rs.getDate("joinDate"));
				  d.setLaterSalary(rs.getDouble("laterSalary"));
				  d.setName(rs.getString("name"));
				  d.setStudent_id(rs.getInt("student_id"));
				  d.setTechnicalRound1_Status(rs.getString("TechnicalRound1_Status"));
				  d.setTechnicalRound2_Status(rs.getString("TechnicalRound2_Status"));
				  d.setTechnicalstack(rs.getString("technicalstack"));
				  d.setWrittenRound_Status(rs.getString("WrittenRound_Status"));
				  
				
				return d;
			}
			
		});
			
		
     return report;
	}
	
	
}
