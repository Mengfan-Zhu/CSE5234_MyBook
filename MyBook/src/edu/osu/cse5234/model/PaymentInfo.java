package edu.osu.cse5234.model;

public class PaymentInfo {
	private String CreditCardNumber;
	private String ExpirationDate;
	private String CvvCode;
	private String CardHolderName;
	
	public String getCreditCardNumber() {
		return CreditCardNumber;
	}
	public void setCreditCardNumber(String CreditCardNumber) {
		this.CreditCardNumber = CreditCardNumber;
	}
	
	public String GetExpirationDate() {
		return ExpirationDate;
	}
	
	public void setExpirationDate(String ExpirationDate) {
		this.ExpirationDate = ExpirationDate;
	}
	
	public String getCvvCode() {
		return CvvCode;
	}
	
	public void setCvvCode(String CvvCode) {
		this.CvvCode = CvvCode;
	}

	public String getCardHolderName() {
		return CardHolderName;
	}
	
	public void setCardHolderName(String CardHolderName) {
		this.CardHolderName = CardHolderName;
	}
}
