package com.chitchat.dao;
import java.util.List;

import com.chitchat.model.User;

public interface UserDAO {
	
	public void addUser(User user);
	public void deleteUser(int id);
	public void updateUser(int id);
	public User getUserById(int id);
	public List<User> listUser();
	public User getUserByEmail(String name);
	
}