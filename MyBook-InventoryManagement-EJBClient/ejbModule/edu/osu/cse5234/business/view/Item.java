package edu.osu.cse5234.business.view;
import java.io.Serializable; 

public class Item implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4385992098997286072L;
	String name;
	String price;
	String quantity;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getQuantity() {
		return quantity;
	}
	
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
}
