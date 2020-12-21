package com.kh.ddoda.facility.domain;

public class InstructorInfo {
	
	private String instructorName;
	private String carrer;
	private String promise;
	private String instructorPicture;
	private String instructorRename;
	private int facilityNo;
	
	public InstructorInfo() {
		
	}

	public InstructorInfo(String instructorName, String carrer, String promise, String instructorPicture,
			int facilityNo) {
		super();
		this.instructorName = instructorName;
		this.carrer = carrer;
		this.promise = promise;
		this.instructorPicture = instructorPicture;
		this.facilityNo = facilityNo;
	}

	public String getInstructorName() {
		return instructorName;
	}

	public void setInstructorName(String instructorName) {
		this.instructorName = instructorName;
	}

	public String getCarrer() {
		return carrer;
	}

	public void setCarrer(String carrer) {
		this.carrer = carrer;
	}

	public String getPromise() {
		return promise;
	}

	public void setPromise(String promise) {
		this.promise = promise;
	}

	public String getInstructorPicture() {
		return instructorPicture;
	}

	public void setInstructorPicture(String instructorPicture) {
		this.instructorPicture = instructorPicture;
	}

	public int getFacilityNo() {
		return facilityNo;
	}

	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}
	
	public String getInstructorRename() {
		return instructorRename;
	}

	public void setInstructorRename(String instructorRename) {
		this.instructorRename = instructorRename;
	}

	@Override
	public String toString() {
		return "InstructorInfo [instructorName=" + instructorName + ", carrer=" + carrer + ", promise=" + promise
				+ ", instructorPicture=" + instructorPicture + ", instructorRename=" + instructorRename
				+ ", facilityNo=" + facilityNo + "]";
	}

}
