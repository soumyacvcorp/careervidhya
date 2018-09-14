package cv.models;

import java.util.List;

public class OfflineExam {
	Integer id;
    Integer batch;
    String examSubject;
    String examDate;
    String topic;
    Integer duration;
    Double fullmark;
    String examType;
    List<OfflineExamScore> scoreList;
	public List<OfflineExamScore> getScoreList() {
		return scoreList;
	}
	public void setScoreList(List<OfflineExamScore> scoreList) {
		this.scoreList = scoreList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBatch() {
		return batch;
	}
	public void setBatch(Integer batch) {
		this.batch = batch;
	}
	public String getExamSubject() {
		return examSubject;
	}
	public void setExamSubject(String examSubject) {
		this.examSubject = examSubject;
	}
	public String getExamDate() {
		return examDate;
	}
	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Double getFullmark() {
		return fullmark;
	}
	public void setFullmark(Double fullmark) {
		this.fullmark = fullmark;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
}
