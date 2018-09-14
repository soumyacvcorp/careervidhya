package cv.dto;

public class DetailedReport {

	private Integer qp_id;
	private String student_email;
	private String admin_email;
	private String remarks;
	private Double scorePer100;
	private String testName;
	private String examDate;
	private String dateDone;
	private String creationDate;
	private Integer duration;
	private String isPractice;
	private String qp_type;
	private String batchNos;
	private String questions;
	
	
	public DetailedReport(){
		
	}

	public Integer getQp_id() {
		return qp_id;
	}

	public void setQp_id(Integer qp_id) {
		this.qp_id = qp_id;
	}

	public String getStudent_email() {
		return student_email;
	}

	public void setStudent_email(String student_email) {
		this.student_email = student_email;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Double getScorePer100() {
		return scorePer100;
	}

	public void setScorePer100(Double scorePer100) {
		this.scorePer100 = scorePer100;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}

	public String getDateDone() {
		return dateDone;
	}

	public void setDateDone(String dateDone) {
		this.dateDone = dateDone;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getIsPractice() {
		return isPractice;
	}

	public void setIsPractice(String isPractice) {
		this.isPractice = isPractice;
	}

	public String getQp_type() {
		return qp_type;
	}

	public void setQp_type(String qp_type) {
		this.qp_type = qp_type;
	}

	public String getBatchNos() {
		return batchNos;
	}

	public void setBatchNos(String batchNos) {
		this.batchNos = batchNos;
	}

	/**
	 * @return the questions
	 */
	public String getQuestions() {
		return questions;
	}

	/**
	 * @param questions the questions to set
	 */
	public void setQuestions(String questions) {
		this.questions = questions;
	}
	
}
