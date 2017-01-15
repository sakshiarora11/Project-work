package com.chitchat;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.chitchat.dao.UserDAO;
import com.chitchat.model.User;

@RestController
public class RESTController {

	@Autowired
	UserDAO userdao;
	
	
	@RequestMapping(value="/userprofile",  method=RequestMethod.GET)
	public ResponseEntity<User> getUsers(Principal principal){
		
		System.out.println(principal.getName());
		
		if(principal.getName()==null){
			return new ResponseEntity<User>(HttpStatus.NOT_FOUND);		
		}
		
		User user = userdao.getUserByEmail(principal.getName());
		
		return new ResponseEntity<User>(user,HttpStatus.OK);	
		
	}
}
