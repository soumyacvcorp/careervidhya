package cv.models;

import java.util.List;

public class StudentTopicStatusList {
	List<TopicStatus> java; 
	List<TopicStatus> aptitude;
	List<TopicStatus> communication;
	List<TopicStatus> linux;
	List<TopicStatus> mysql;
	public List<TopicStatus> getJava() {
		return java;
	}
	public void setJava(List<TopicStatus> java) {
		this.java = java;
	}
	public List<TopicStatus> getAptitude() {
		return aptitude;
	}
	public void setAptitude(List<TopicStatus> aptitude) {
		this.aptitude = aptitude;
	}
	public List<TopicStatus> getCommunication() {
		return communication;
	}
	public void setCommunication(List<TopicStatus> communication) {
		this.communication = communication;
	}
	public List<TopicStatus> getLinux() {
		return linux;
	}
	public void setLinux(List<TopicStatus> linux) {
		this.linux = linux;
	}
	public List<TopicStatus> getMysql() {
		return mysql;
	}
	public void setMysql(List<TopicStatus> mysql) {
		this.mysql = mysql;
	}
}
