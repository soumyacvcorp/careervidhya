package cv.models;

import java.util.List;

public class SubjectReport {
	Integer numberOfClass;
	List<TopicReport> topicReport;
	Integer totalNumberStudent;
	Integer presentNumberStudent;
	String attanceStatus;
	String topicStatus;
	Float attancePercentage;
	List<CVStudentAtt> absentList;
	
	
	public Integer getNumberOfClass() {
		return numberOfClass;
	}
	public void setNumberOfClass(Integer numberOfClass) {
		this.numberOfClass = numberOfClass;
	}
	public Integer getTotalNumberStudent() {
		return totalNumberStudent;
	}
	public void setTotalNumberStudent(Integer totalNumberStudent) {
		this.totalNumberStudent = totalNumberStudent;
	}
	public Integer getPresentNumberStudent() {
		return presentNumberStudent;
	}
	public void setPresentNumberStudent(Integer presentNumberStudent) {
		this.presentNumberStudent = presentNumberStudent;
	}
	public String getAttanceStatus() {
		return attanceStatus;
	}
	public void setAttanceStatus(String attanceStatus) {
		this.attanceStatus = attanceStatus;
	}
	public Float getAttancePercentage() {
		return attancePercentage;
	}
	public void setAttancePercentage(Float attancePercentage) {
		this.attancePercentage = attancePercentage;
	}
	public List<CVStudentAtt> getAbsentList() {
		return absentList;
	}
	public void setAbsentList(List<CVStudentAtt> absentList) {
		this.absentList = absentList;
	}
	public List<TopicReport> getTopicReport() {
		return topicReport;
	}
	public void setTopicReport(List<TopicReport> topicReport) {
		this.topicReport = topicReport;
	}
	public String getTopicStatus() {
		return topicStatus;
	}
	public void setTopicStatus(String topicStatus) {
		this.topicStatus = topicStatus;
	}
}
