package cv.models;

import java.util.List;

public class StudentSubjectExamList {
	List<StudentExamScore> java; 
	List<StudentExamScore> aptitude;
	List<StudentExamScore> communication;
	List<StudentExamScore> linux;
	public List<StudentExamScore> getJava() {
		return java;
	}
	public void setJava(List<StudentExamScore> java) {
		this.java = java;
	}
	public List<StudentExamScore> getAptitude() {
		return aptitude;
	}
	public void setAptitude(List<StudentExamScore> aptitude) {
		this.aptitude = aptitude;
	}
	public List<StudentExamScore> getCommunication() {
		return communication;
	}
	public void setCommunication(List<StudentExamScore> communication) {
		this.communication = communication;
	}
	public List<StudentExamScore> getLinux() {
		return linux;
	}
	public void setLinux(List<StudentExamScore> linux) {
		this.linux = linux;
	}
	
}
