package edu.osu.cse5234.model;

public class ShippingInfo {
	private String Name;
	private String AddressLine1;
	private String AddressLine2;
	private String City;
	private String State;
	private String Zip;
	
	public String getName() {
		return Name;
	}
	
	public void setName(String Name) {
		this.Name = Name;
	}
	
	public String getAddressLine1() {
		return AddressLine1;
	}
	
	public void setAddressLine1(String AddressLine1) {
		this.AddressLine1 = AddressLine1;
	}
	
	public String getAddressLine2() {
		return AddressLine2;
	}
	
	public void setAddressLine2(String AddressLine2) {
		this.AddressLine2 = AddressLine2;
	}
	
	public String getCity() {
		return City;
	}
	
	public void setCity(String City) {
		this.City = City;
	}
	
	public String getState() {
		return State;
	}
	
	public void setState(String State) {
		this.State = State;
	}
	
	public String getZip() {
		return Zip;
	}
	
	public void setZip(String Zip) {
		this.Zip = Zip;
	}
}
