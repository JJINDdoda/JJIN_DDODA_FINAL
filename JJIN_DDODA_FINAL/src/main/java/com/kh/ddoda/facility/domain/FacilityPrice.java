package com.kh.ddoda.facility.domain;

public class FacilityPrice {
	
	private int months;
	private int price;
	private String options;
	private String benefits;
	private int facilityNo;
	
	public FacilityPrice() {
		
	}

	public FacilityPrice(int months, int price, String options, String benefits, int facilityNo) {
		super();
		this.months = months;
		this.price = price;
		this.options = options;
		this.benefits = benefits;
		this.facilityNo = facilityNo;
	}

	public int getMonths() {
		return months;
	}

	public void setMonths(int months) {
		this.months = months;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getBenefits() {
		return benefits;
	}

	public void setBenefits(String benefits) {
		this.benefits = benefits;
	}

	public int getFacilityNo() {
		return facilityNo;
	}

	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}

	@Override
	public String toString() {
		return "FacilityPrice [months=" + months + ", price=" + price + ", options=" + options + ", benefits=" + benefits
				+ ", facilityNo=" + facilityNo + "]";
	}
	
}
