package com.outbook.user;

import java.util.List;

public interface UserService
{
	public void insertUser(User i);
	public void deleteUser(long i);
	public void updateUser(User i);
	public User getUser(String i);
    public List<User> getAllUsers();
}