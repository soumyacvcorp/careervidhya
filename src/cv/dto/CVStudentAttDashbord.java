package cv.dto;

public class CVStudentAttDashbord {
private String name;
private String email;
private String joinDate;
private Integer batch;
private String attance;
private String workingDateList;
public String getJoinDate() {
	return joinDate;
}
public void setJoinDate(String joinDate) {
	this.joinDate = joinDate;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public Integer getBatch() {
	return batch;
}
public void setBatch(Integer batch) {
	this.batch = batch;
}
public String getAttance() {
	return attance;
}
public void setAttance(String attance) {
	this.attance = attance;
}
public String getWorkingDateList() {
	return workingDateList;
}
public void setWorkingDateList(String workingDateList) {
	this.workingDateList = workingDateList;
}
}
