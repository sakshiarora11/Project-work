package com.outbook.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class UserServiceImpl implements UserService 
{
	@Autowired
    UserDAO dao;
    
    
    public void insertUser(User i) {
		dao.insertUser(i);
	}

    
	public void deleteUser(long i) {
		dao.deleteUser(i);
	}

    
	public void updateUser(User i) {
		dao.updateUser(i);
	}

	
	public List<User> getAllUsers() {
		return dao.getAllUsers();
	}
	
	
	public User getUser(String i) {
		return dao.getUser(i);
	}
}
