package cv.dto;

public class DriveStatus {

	private Integer id; 
   public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

private Integer student_id;
   
   private String WrittenRound_Status;
   private String TechnicalRound1_Status;
   private String TechnicalRound2_Status;
   private String ComsRound_Status;
   private String description;
   private String joinDate;
   private String HRRound_Status;
   private String FinalReport;
   private String designation;
   private String technicalstack;
   private String bond;
   private String bondduration;
   private String certificates;
   private Double initialSalary;
   private Double laterSalary;
   private Integer driveId;
   private Integer company_id;
   
   public Integer getCompany_id() {
	return company_id;
}
public void setCompany_id(Integer company_id) {
	this.company_id = company_id;
}
public Integer getDriveId() {
	return driveId;
}
public void setDriveId(Integer driveId) {
	this.driveId = driveId;
}

private String name;
   private Integer batchNumber;

public Integer getBatchNumber() {
	return batchNumber;
}
public void setBatchNumber(Integer batchNumber) {
	this.batchNumber = batchNumber;
}
public Integer getStudent_id() {
	return student_id;
}
public void setStudent_id(Integer student_id) {
	this.student_id = student_id;
}
public String getWrittenRound_Status() {
	return WrittenRound_Status;
}
public void setWrittenRound_Status(String writtenRound_Status) {
	WrittenRound_Status = writtenRound_Status;
}
public String getTechnicalRound1_Status() {
	return TechnicalRound1_Status;
}
public void setTechnicalRound1_Status(String technicalRound1_Status) {
	TechnicalRound1_Status = technicalRound1_Status;
}
public String getTechnicalRound2_Status() {
	return TechnicalRound2_Status;
}
public void setTechnicalRound2_Status(String technicalRound2_Status) {
	TechnicalRound2_Status = technicalRound2_Status;
}
public String getComsRound_Status() {
	return ComsRound_Status;
}
public void setComsRound_Status(String comsRound_Status) {
	ComsRound_Status = comsRound_Status;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getJoinDate() {
	return joinDate;
}
public void setJoinDate(String joinDate) {
	this.joinDate = joinDate;
}
public String getHRRound_Status() {
	return HRRound_Status;
}
public void setHRRound_Status(String hRRound_Status) {
	HRRound_Status = hRRound_Status;
}
public String getFinalReport() {
	return FinalReport;
}
public void setFinalReport(String finalReport) {
	FinalReport = finalReport;
}
public String getDesignation() {
	return designation;
}
public void setDesignation(String designation) {
	this.designation = designation;
}
public String getTechnicalstack() {
	return technicalstack;
}
public void setTechnicalstack(String technicalstack) {
	this.technicalstack = technicalstack;
}
public String getBond() {
	return bond;
}
public void setBond(String bond) {
	this.bond = bond;
}
public String getBondduration() {
	return bondduration;
}
public void setBondduration(String bondduration) {
	this.bondduration = bondduration;
}
public String getCertificates() {
	return certificates;
}
public void setCertificates(String certificates) {
	this.certificates = certificates;
}
public Double getInitialSalary() {
	return initialSalary;
}
public void setInitialSalary(Double initialSalary) {
	this.initialSalary = initialSalary;
}
public Double getLaterSalary() {
	return laterSalary;
}
public void setLaterSalary(Double laterSalary) {
	this.laterSalary = laterSalary;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

@Override
public String toString() {
	return "DriveStatus [student_id=" + student_id + ", WrittenRound_Status=" + WrittenRound_Status
			+ ", TechnicalRound1_Status=" + TechnicalRound1_Status + ", TechnicalRound2_Status="
			+ TechnicalRound2_Status + ", ComsRound_Status=" + ComsRound_Status + ", description=" + description
			+ ", joinDate=" + joinDate + ", HRRound_Status=" + HRRound_Status + ", FinalReport=" + FinalReport
			+ ", designation=" + designation + ", technicalstack=" + technicalstack + ", bond=" + bond
			+ ", bondduration=" + bondduration + ", certificates=" + certificates + ", initialSalary=" + initialSalary
			+ ", laterSalary=" + laterSalary + ", name=" + name + "]";
}
   
   
   
   
   
   
}