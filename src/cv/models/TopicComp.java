package cv.models;

import java.util.ArrayList;

public class TopicComp {
	Integer topic_id;
	Integer topicCover_id;
	String topicName;
	Integer durationDays;
	ArrayList<String> dayList;
	Integer batchNumber;
	String subject;
	Integer flowNumber;
	public Integer getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(Integer topic_id) {
		this.topic_id = topic_id;
	}
	public Integer getTopicCover_id() {
		return topicCover_id;
	}
	public void setTopicCover_id(Integer topicCover_id) {
		this.topicCover_id = topicCover_id;
	}
	public ArrayList<String> getDayList() {
		return dayList;
	}
	public void setDayList(ArrayList<String> dayList) {
		this.dayList = dayList;
	}
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	public Integer getDurationDays() {
		return durationDays;
	}
	public void setDurationDays(Integer durationDays) {
		this.durationDays = durationDays;
	}
	public Integer getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(Integer batchNumber) {
		this.batchNumber = batchNumber;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Integer getFlowNumber() {
		return flowNumber;
	}
	public void setFlowNumber(Integer flowNumber) {
		this.flowNumber = flowNumber;
	}

}
