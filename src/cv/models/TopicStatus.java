package cv.models;

import java.util.List;

public class TopicStatus {

	Integer topicId;
	String name;
	int approxDay;
	String status;
	List<String> dateWise;
	public int getApproxDay() {
		return approxDay;
	}
	public void setApproxDay(int approxDay) {
		this.approxDay = approxDay;
	}
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<String> getDateWise() {
		return dateWise;
	}
	public void setDateWise(List<String> dateWise) {
		this.dateWise = dateWise;
	}
	
}
