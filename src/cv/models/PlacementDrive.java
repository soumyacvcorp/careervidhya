package cv.models;

import java.util.List;

import cv.dto.CompaniesList;
import cv.dto.Company;
import cv.dto.DriveStatus;

public class PlacementDrive {
	Integer id;
    Integer companyId;
    String driveDate;
    String roundList;
    Boolean bondIsAvl;
    Integer bondDuration;
    String driveLocation;
    String jobLocation;
    Double initalSalary;
    Double laterSalary;
    String designation;
    Boolean submissionCertificates;
    List<DriveStatus> studentReportList;
    Company company;
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public List<DriveStatus> getStudentReportList() {
		return studentReportList;
	}
	public void setStudentReportList(List<DriveStatus> studentReportList) {
		this.studentReportList = studentReportList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getDriveDate() {
		return driveDate;
	}
	public void setDriveDate(String driveDate) {
		this.driveDate = driveDate;
	}
	public String getRoundList() {
		return roundList;
	}
	public void setRoundList(String roundList) {
		this.roundList = roundList;
	}
	public Boolean getBondIsAvl() {
		return bondIsAvl;
	}
	public void setBondIsAvl(Boolean bondIsAvl) {
		this.bondIsAvl = bondIsAvl;
	}
	public Integer getBondDuration() {
		return bondDuration;
	}
	public void setBondDuration(Integer bondDuration) {
		this.bondDuration = bondDuration;
	}
	public String getDriveLocation() {
		return driveLocation;
	}
	public void setDriveLocation(String driveLocation) {
		this.driveLocation = driveLocation;
	}
	public String getJobLocation() {
		return jobLocation;
	}
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	public Double getInitalSalary() {
		return initalSalary;
	}
	public void setInitalSalary(Double initalSalary) {
		this.initalSalary = initalSalary;
	}
	public Double getLaterSalary() {
		return laterSalary;
	}
	public void setLaterSalary(Double laterSalary) {
		this.laterSalary = laterSalary;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Boolean getSubmissionCertificates() {
		return submissionCertificates;
	}
	public void setSubmissionCertificates(Boolean submissionCertificates) {
		this.submissionCertificates = submissionCertificates;
	}
    
}
