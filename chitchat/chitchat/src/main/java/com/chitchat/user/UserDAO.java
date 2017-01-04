package com.chitchat.user;
import java.util.List;

public interface UserDAO {
	
	public void addUser(User user);
	public void deleteUser(int id);
	public void updateUser(int id);
	public User getUserById(int id);
	public List<User> listUser();
}