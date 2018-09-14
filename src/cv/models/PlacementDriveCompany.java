package cv.models;

import java.util.List;

public class PlacementDriveCompany {
	 private Integer company_id;
		private String name;
		private String location;
		private String URL;
		private String logo;
		private String companyType;
		private List<PlacementDrive> placementDriveList;
		
		public String getCompanyType() {
			return companyType;
		}
		public void setCompanyType(String companyType) {
			this.companyType = companyType;
		}
		public List<PlacementDrive> getPlacementDriveList() {
			return placementDriveList;
		}
		public void setPlacementDriveList(List<PlacementDrive> placementDriveList) {
			this.placementDriveList = placementDriveList;
		}
		public String getLogo() {
			return logo;
		}
		public void setLogo(String logo) {
			this.logo = logo;
		}
		public Integer getCompany_id() {
			return company_id;
		}
		public void setCompany_id(Integer company_id) {
			this.company_id = company_id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getURL() {
			return URL;
		}
		public void setURL(String uRL) {
			URL = uRL;
		}
}
