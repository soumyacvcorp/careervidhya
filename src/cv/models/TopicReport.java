package cv.models;

public class TopicReport {
	String topicName;
	Integer topicId;
	Integer ApproxDayToComplite; 
	Integer DayTakenToComplite;
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public Integer getApproxDayToComplite() {
		return ApproxDayToComplite;
	}
	public void setApproxDayToComplite(Integer approxDayToComplite) {
		ApproxDayToComplite = approxDayToComplite;
	}
	public Integer getDayTakenToComplite() {
		return DayTakenToComplite;
	}
	public void setDayTakenToComplite(Integer dayTakenToComplite) {
		DayTakenToComplite = dayTakenToComplite;
	} 
}
