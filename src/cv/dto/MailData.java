package cv.dto;

import java.util.List;

public class MailData {

	private String message;
	private String subject;
	private String[] recipients;
	private String[] ccrecipients;
	private String[] bccrecipients;
	
	public MailData()
	{
		
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String[] getRecipients() {
		return recipients;
	}

	public void setRecipients(String[] recipients) {
		this.recipients = recipients;
	}

	public String[] getCcrecipients() {
		return ccrecipients;
	}

	public void setCcrecipients(String[] ccrecipients) {
		this.ccrecipients = ccrecipients;
	}

	public String[] getBccrecipients() {
		return bccrecipients;
	}

	public void setBccrecipients(String[] bccrecipients) {
		this.bccrecipients = bccrecipients;
	}
	
}
