package com.chitchat;


import java.security.Principal;
import java.util.List;


import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.chitchat.dao.UserDAO;
import com.chitchat.model.User;

@Controller
public class ChitchatController {

	@Autowired
	UserDAO userdao;

	@RequestMapping("/")
	public ModelAndView def() {
		ModelAndView model = login();
		return model;
	}
	
	
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		
		String username = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			System.out.println(auth.getName());
			// System.out.println("User present");
			username = auth.getName();
			ModelAndView m = new ModelAndView("userprofile");
			return m;
		} 
		
		ModelAndView model = new ModelAndView("login");
		model.addObject("user", new User());
		return model;
	}

	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public ModelAndView addUser(@Valid @ModelAttribute("user") User user, BindingResult result) {

		ModelAndView model = new ModelAndView("login");

		if (result.hasErrors()) {
			return model;
		} else {
			if (user.getPassword().equals(user.getCpassword())) {

				List<User> listuser = userdao.listUser();

				boolean usermatch = false;

				for (User u : listuser) {
					if (u.getEmail().equals(user.getEmail())) {
						usermatch = true;
						break;
					}
				}
				if (usermatch == false) {
					userdao.addUser(user);
					model.addObject("user", new User());
					model.addObject("success", "success");
				} else {
					model.addObject("useralreadyexists", "useralreadyexists");
				}
			} else {
				model.addObject("passwordmismatch", "passwordmismatch");
			}
		}
		return model;

	}
	@RequestMapping(value="/head-meta")
	public String head_meta()
	{
		return "head-meta";
	}
	@RequestMapping("/userprofile")
	public ModelAndView User(Principal p){
		
		if(p!=null){
			ModelAndView model = new ModelAndView("userprofile");
			return model;
		}
		
		
		ModelAndView model = new ModelAndView("login");
		model.addObject("user", new User());
		return model;
		
	}
	@RequestMapping("/viewblogs")
	public String Blogs(){
		
		return "blogs";
		
	}
	
	@RequestMapping("/allusers")
	public String Users(){
		
		return "people";
		
	}
	
	@RequestMapping("/friends")
	public String Freinds(){
		
		return "friend";
		
	}

}
	

	