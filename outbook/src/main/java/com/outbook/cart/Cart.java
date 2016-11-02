package com.outbook.cart;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;



@Entity
public class Cart implements Serializable
{
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int ID;

	private String Name;
	private String Qty;
	private String Price;
	private String Address;
	private String BillingAddress;
	
	private String ProductID;
	private String UserName;
	
	public String getBillingAddress() {
		return BillingAddress;
	}
	public void setBillingAddress(String billingAddress) {
		BillingAddress = billingAddress;
	}
	
	public int getCartID() {
		return ID;
	}
	public void setCartID(int cartID) {
		this.ID = cartID;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getQty() {
		return Qty;
	}
	public void setQty(String qty) {
		Qty = qty;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getProductID() {
		return ProductID;
	}
	public void setProductID(String productID) {
		ProductID = productID;
	}
	public String getUserID() {
		return UserName;
	}
	public void setUserID(String userID) {
		UserName = userID;
	}
	
}