package com.chitchat.dao;
import java.util.List;

import com.chitchat.model.User;

public interface UserDAO {
	
	public void addUser(User user);
	public void deleteUser(User user);
	public void updateUser(User user);
	public User getUserById(int id);
	public List<User> listUser();
	public User getUserByEmail(String email);
	public List<User> getAllUserExceptMe(String email);
}

