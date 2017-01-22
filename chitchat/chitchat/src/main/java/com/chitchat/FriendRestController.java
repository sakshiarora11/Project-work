package com.chitchat;


import java.security.Principal;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chitchat.dao.FriendDAO;
import com.chitchat.dao.UserDAO;
import com.chitchat.model.Friend;
import com.chitchat.model.User;

@RestController
public class FriendRestController {
	
	@Autowired
	UserDAO userdao;
	
	@Autowired
	FriendDAO frienddao;

	
	@RequestMapping("/getusers")
	public ResponseEntity<List<User>> getAllUsers(Principal p){
		
		List<User> list = userdao.getAllUserExceptMe(p.getName());
		
		return new ResponseEntity<List<User>>(list,HttpStatus.OK);
	}
	
	
	@RequestMapping("/friendrequest")
	public ResponseEntity<String> friendRequest(Principal p,@RequestBody String friendId){
		
		System.out.println(friendId);
		
		User user = userdao.getUserByEmail(p.getName());
		User friend = userdao.getUserById(Integer.parseInt(friendId));
		
		Friend friendobj = new Friend();
		
		friendobj.setUserId(user);
		friendobj.setFriendId(friend);
		friendobj.setStatus("NEW");
		
		frienddao.addFriend(friendobj);
		
		friendobj.setUserId(friend);
		friendobj.setFriendId(user);
		friendobj.setStatus("NEW");
		
		frienddao.addFriend(friendobj);
		
		JSONObject json = new JSONObject();

		json.put("status", "FRIEND REQUEST SEND");
		System.out.println(json.toString());
		
		
		return new ResponseEntity<String>(json.toString(),HttpStatus.CREATED);
	}
	
	
	@RequestMapping("/friendrequests")
	public ResponseEntity<List<Friend>> friendRequest(Principal p){
		
		User user = userdao.getUserByEmail(p.getName());
		
		long id = user.getUserId();
		
		
		List<Friend> list  = frienddao.getFriendRequsts(id);
		
		return new ResponseEntity<List<Friend>>(list,HttpStatus.OK);
	}
	
	
	@RequestMapping("/acceptfriendrequest/{friendId}")
	public ResponseEntity<List<Friend>> acceptFriendRequest(@PathVariable("friendId") long friendId, Principal p ){
		
		System.out.println(friendId);
		User user = userdao.getUserByEmail(p.getName());
		
		long loggedInUserId = user.getUserId();
		
		//friend x-->y
		Friend friend1 = frienddao.getFriend(loggedInUserId, friendId);
		friend1.setStatus("ACCEPTED");
		frienddao.updateFriend(friend1);
		
		//friend y-->x
		Friend friend2 = frienddao.getFriend(friendId, loggedInUserId);
		friend2.setStatus("ACCEPTED");
		frienddao.updateFriend(friend2);
		


		List<Friend> list = frienddao.getFriendRequsts(loggedInUserId);
	
		
		
		return new ResponseEntity<List<Friend>>(list,HttpStatus.CREATED);
	}
	
	
	
	
	@RequestMapping("/rejectfriendrequest/{friendId}")
	public ResponseEntity<List<Friend>> rejectFriendRequest(@PathVariable("friendId") long friendId, Principal p ){
		
		System.out.println(friendId);
		User user = userdao.getUserByEmail(p.getName());
		
		long loggedInUserId = user.getUserId();
		
		//friend x-->y
		Friend friend1 = frienddao.getFriend(loggedInUserId, friendId);
		friend1.setStatus("REJECTED");
		frienddao.updateFriend(friend1);
		
		//friend y-->x
		Friend friend2 = frienddao.getFriend(friendId, loggedInUserId);
		friend2.setStatus("REJECTED");
		frienddao.updateFriend(friend2);
		
		List<Friend> list = frienddao.getFriendRequsts(loggedInUserId);
	
		
		
		return new ResponseEntity<List<Friend>>(list,HttpStatus.CREATED);
	}
	
	@RequestMapping("getfriends")
	public ResponseEntity<List<Friend>> getFriends(Principal p){
		
		User user = userdao.getUserByEmail(p.getName());
		long userId = user.getUserId();
		
		
		List<Friend> list = frienddao.listFriends(userId);
		
		
		return new ResponseEntity<List<Friend>>(list,HttpStatus.OK);
	}
	
	@RequestMapping("countfriendrequests")
	public ResponseEntity<String> countFriendRequests(Principal p){
	
		User user = userdao.getUserByEmail(p.getName());
		long userId = user.getUserId();
		
		int count = frienddao.countFriendRequset(userId);
		
		System.out.println(count);
		
		JSONObject json = new JSONObject();

		json.put("count", count);
		System.out.println(json.toString());
		
		
		return new ResponseEntity<String>(json.toString(),HttpStatus.CREATED);
		
	}
	
	
	

}