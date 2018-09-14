package cv.dto;

import java.util.List;

public class DriveStatuses {

	private List<DriveStatus> driveData;
	
	public DriveStatuses(){
		
	}

	public List<DriveStatus> getDriveData() {
		return driveData;
	}

	public void setDriveData(List<DriveStatus> driveData) {
		this.driveData = driveData;
	}
	
}
