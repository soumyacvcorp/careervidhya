package cv.models;

public class BatchReportList {
	Integer batchNumber;
	SubjectReport java;
	SubjectReport aptitude;
	SubjectReport communication;
	SubjectReport linuxDB;
	
	public Integer getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(Integer batchNumber) {
		this.batchNumber = batchNumber;
	}
	public SubjectReport getJava() {
		return java;
	}
	public void setJava(SubjectReport java) {
		this.java = java;
	}
	public SubjectReport getAptitude() {
		return aptitude;
	}
	public void setAptitude(SubjectReport aptitude) {
		this.aptitude = aptitude;
	}
	public SubjectReport getCommunication() {
		return communication;
	}
	public void setCommunication(SubjectReport communication) {
		this.communication = communication;
	}
	public SubjectReport getLinuxDB() {
		return linuxDB;
	}
	public void setLinuxDB(SubjectReport linuxDB) {
		this.linuxDB = linuxDB;
	} 
}
