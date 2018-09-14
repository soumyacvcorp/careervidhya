package cv.models;

public class Admin {

	String name;
	String email;
	String adminType;
	String password_hash;
	String mobile;
	Boolean isFaculty;
	String subjectToTeach;
	Integer exp;
	String urlPic;
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Boolean getIsFaculty() {
		return isFaculty;
	}
	public void setIsFaculty(Boolean isFaculty) {
		this.isFaculty = isFaculty;
	}
	public String getSubjectToTeach() {
		return subjectToTeach;
	}
	public void setSubjectToTeach(String subjectToTeach) {
		this.subjectToTeach = subjectToTeach;
	}
	public Integer getExp() {
		return exp;
	}
	public void setExp(Integer exp) {
		this.exp = exp;
	}
	public String getUrlPic() {
		return urlPic;
	}
	public void setUrlPic(String urlPic) {
		this.urlPic = urlPic;
	}
	public String getAdmin_status() {
		return admin_status;
	}
	public void setAdmin_status(String admin_status) {
		this.admin_status = admin_status;
	}
	String admin_status;
	
	
	
	public String getPassword_hash() {
		return password_hash;
	}
	public void setPassword_hash(String password_hash) {
		this.password_hash = password_hash;
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
	public String getAdminType() {
		return adminType;
	}
	public void setAdminType(String adminType) {
		this.adminType = adminType;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
