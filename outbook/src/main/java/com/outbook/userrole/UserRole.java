package com.outbook.userrole;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserRole {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long ID;
	private String RoleName;
	private int Role;
	public Long getID() {
		return ID;
	}
	public void setID(Long iD) {
		ID = iD;
	}
	public String getRoleName() {
		return RoleName;
	}
	public void setRoleName(String roleName) {
		RoleName = roleName;
	}
	public int getRole() {
		return Role;
	}
	public void setRole(int role) {
		Role = role;
	}
	
	public UserRole(String roleName, int role) {
		super();
		RoleName = roleName;
		Role = role;
	}
	
	public UserRole()
	{
		
	}
	
	
}
