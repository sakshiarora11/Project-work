
package com.outbook.user;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Embeddable
public class User implements Serializable
{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int ID;
	
	private String Email;
	
	private String Username;
	
	private String Password;
	
	@Transient
	private String CPassword;
	
	private String Phone;
	
	
	private String Address;
	
	private int Role = 1;
	private boolean Active = true;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	
	@Email
	@NotEmpty(message="Email Cannot be Empty")
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	@NotEmpty(message="Username Cannot be Empty")
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	
	@NotEmpty(message="Password Cannot be empty")
	@Size(min = 6, max = 15, message = "Your password must between 6 and 15 characters")
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
	public String getCPassword() {
		return CPassword;
	}
	public void setCPassword(String cPassword) {
		CPassword = cPassword;
	}
	
	@Length(max=10,min=10,message="Phone number is not valid. Should be of length 10.")
    @NotEmpty(message="Phone field is mandatory.") @NumberFormat(style= Style.NUMBER)
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	
	@NotEmpty(message="Address field is mandatory.")
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	
	public int getRole() {
		return Role;
	}
	public void setRole(int role) {
		Role = role;
	}
	public boolean isActive() {
		return Active;
	}
	public void setActive(boolean active) {
		Active = active;
	}
	public User() {
		
	}
	@Override
	public String toString() {
		return "User [ID=" + ID + ", Email=" + Email + ", Username=" + Username + ", Password=" + Password
				+ ", CPassword=" + CPassword + ", Phone=" + Phone + ", Address=" + Address + ", Role=" + Role
				+ ", Active=" + Active + "]";
	}
	
	
}