package cv.dto;

public class TopicListOfAttance {
	
	private Integer batch;
	private Integer topicId;
	private String topic;
	private String subject;
	private String dayList;
	public Integer getBatch() {
		return batch;
	}
	public void setBatch(Integer batch) {
		this.batch = batch;
	}
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDayList() {
		return dayList;
	}
	public void setDayList(String dayList) {
		this.dayList = dayList;
	}

}
