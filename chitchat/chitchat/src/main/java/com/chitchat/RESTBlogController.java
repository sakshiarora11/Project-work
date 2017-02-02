package com.chitchat;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chitchat.dao.BlogDAO;
import com.chitchat.dao.UserDAO;
import com.chitchat.model.Blog;
import com.chitchat.model.User;

@RestController

public class RESTBlogController {
	
	@Autowired
	UserDAO userdao;

	@Autowired
	BlogDAO blogdao;


	@RequestMapping("/postblog")
	public ResponseEntity<String> postBlog(@RequestBody JSONObject data, Principal p) {
		System.out.println(data);

		User user = userdao.getUserByEmail(p.getName());

		/*
		 * DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		 */
		Date date = new Date();
		System.out.println(date);

		Blog blog = new Blog();

		blog.setTitle(data.get("BlogTitle").toString());
		blog.setDescription(data.get("BlogDesc").toString());
		blog.setBlogdate(date);

		blog.setUserId(user);

		blogdao.addBlog(blog);

		JSONObject json = new JSONObject();

		json.put("status", "BLOG SEND FOR APPROVAL");
		System.out.println(json.toString());

		return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);
	}

	@RequestMapping("admin/allblogs")
	public ResponseEntity<List<Blog>> allBlogs() {

		List<Blog> list = blogdao.listAllBlogs();

		return new ResponseEntity<List<Blog>>(list, HttpStatus.OK);

	}

	@RequestMapping("/publishblog")
	public ResponseEntity<String> publishBlog(@RequestBody String inputdata) {
		System.out.println(inputdata);

		int blogid = Integer.parseInt(inputdata);

		System.out.println(blogid);

		Blog blog = blogdao.getBlogById(blogid);

		blog.setPosted(true);

		// update blog
		blogdao.addBlog(blog);

		JSONObject json = new JSONObject();

		json.put("status", "BLOG PUBLISHED");
		System.out.println(json.toString());

		return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);

	}
	
	@RequestMapping("/unpublishblog")
	public ResponseEntity<String> unPublishBlog(@RequestBody String inputdata) {
		System.out.println(inputdata);

		int blogid = Integer.parseInt(inputdata);

		System.out.println(blogid);

		Blog blog = blogdao.getBlogById(blogid);

		blog.setPosted(false);

		// update blog
		blogdao.addBlog(blog);

		JSONObject json = new JSONObject();

		json.put("status", "BLOG UNPUBLISHED");
		System.out.println(json.toString());

		return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);

	}

	@RequestMapping("/blogs")
	public ResponseEntity<List<Blog>> blogs() {

		List<Blog> list = blogdao.listBlogs();

		return new ResponseEntity<List<Blog>>(list, HttpStatus.OK);

	}

}


