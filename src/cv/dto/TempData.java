package cv.dto;



public class TempData {

	private String fbLink;
	private String lnLink;
	private String sscBoard;
   private String interBoard;
	private Integer sscMaths;
	private Integer interMaths;
	
	private String email;
	private Integer student_id;
   //private List<Company> companies;

public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStudent_id() {
		return student_id;
	}

	public void setStudent_id(Integer student_id) {
		this.student_id = student_id;
	}

public String getFbLink() {
	return fbLink;
}

public void setFbLink(String fbLink) {
	this.fbLink = fbLink;
}

public String getLnLink() {
	return lnLink;
}

public void setLnLink(String lnLink) {
	this.lnLink = lnLink;
}

public String getSscBoard() {
	return sscBoard;
}

public void setSscBoard(String sscBoard) {
	this.sscBoard = sscBoard;
}

public String getInterBoard() {
	return interBoard;
}

public void setInterBoard(String interBoard) {
	this.interBoard = interBoard;
}

public Integer getSscMaths() {
	return sscMaths;
}

public void setSscMaths(Integer sscMaths) {
	this.sscMaths = sscMaths;
}

public Integer getInterMaths() {
	return interMaths;
}

public void setInterMaths(Integer interMaths) {
	this.interMaths = interMaths;
}


   
public TempData()
 {
	   super();
 }

@Override
public String toString() {
	return "TempData [fbLink=" + fbLink + ", lnLink=" + lnLink + ", sscBoard=" + sscBoard + ", interBoard=" + interBoard
			+ ", sscMaths=" + sscMaths + ", interMaths=" + interMaths + ", email=" + email + ", student_id="
			+ student_id + "]";
}
	
}
