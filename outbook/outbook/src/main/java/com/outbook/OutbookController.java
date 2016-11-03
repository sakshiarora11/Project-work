package com.outbook;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

import com.outbook.cart.Cart;
import com.outbook.cart.CartService;
import com.outbook.category.Category;
import com.outbook.category.CategoryService;
import com.outbook.product.Product;
import com.outbook.product.ProductService;
import com.outbook.user.User;
import com.outbook.user.UserService;
import com.outbook.userrole.UserRoleService;






@Controller
public class OutbookController {

	@Autowired
	CategoryService cs;
	
	@Autowired
	CartService crs;
	
	
	@Autowired
	ProductService ps;
	
	@Autowired
	UserService us;
	
	@Autowired
	UserRoleService urs;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="/")
	public String home()
	{
		urs.generateUserRoles();
		return "index";
	}
	
	@RequestMapping(value="/loginpage")
	public String loginpage()
	{
		
		
		return "loginpage";
	}
	
	public String test()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	return "false";
	    }
	    else
	    {
	    	System.out.println("User not present");
	    	return "true";
	    }
	}
	
	
	@RequestMapping(value="/head-meta")
	public String head_meta()
	{
		return "head-meta";
	}
	
	@RequestMapping(value="/head")
	public String head()
	{
		return "head";
	}
	
	@RequestMapping(value="/index")
	public String index()
	{
		return "index";
	}
	
	@RequestMapping(value="/contactus")
	public String contactus()
	{
		return "contactus";
	}
	
	@RequestMapping(value="/aboutus")
	public String aboutus()
	{
		return "aboutus";
	}
	
	@RequestMapping(value="/signup")
	public ModelAndView signup()
	{
		ModelAndView mav = new ModelAndView("signup");
		
		mav.addObject("User", new User());
		
		return mav;
	}
	
	@RequestMapping(value="/AddUserToDB",method=RequestMethod.POST)
	public ModelAndView AddUserToDB( @Valid @ModelAttribute("User")User i , BindingResult bind)
	{
		ModelAndView mav = new ModelAndView("signup");
		
		if( bind.hasErrors() )
		{
			mav.addObject("User", i);
		}
		else
		{
			if( i.getPassword().equals(i.getCPassword()) == false )
			{
				mav.addObject("PasswordMismatch", "Password(s) Do Not Match");
				mav.addObject("User", i);
			}
			else
			{
				List<User> list = us.getAllUsers();
				
				for( User u:list )
				{
					if( u.getUsername().equals(i.getUsername()) )
					{
						mav.addObject("UserExists", "Username already Exists");
						mav.addObject("User", i);
						
						return mav;
					}
				}
				
				us.insertUser(i);
				
				mav.addObject("Success", "User Added Successfully");
				mav.addObject("User", new User());
			}
			
		}
		
		return mav;
	}
	
	@RequestMapping(value="/allcategories")
	public ModelAndView allcategories()
	{
		ModelAndView mav = new ModelAndView("allcategories");
		
		List<Category> list = cs.getAlCategories();
		
		JSONArray jarr = new JSONArray();
		
		for( Category c: list )
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("CategoryId", c.getCategoryId());
			jobj.put("CategoryName", c.getCategoryName() );
			
			jarr.add(jobj);
		}
		
		System.out.println(jarr.toJSONString());
		
		mav.addObject("CategoryJSON", jarr.toJSONString());
		
		return mav;
	}
	
	@RequestMapping(value="/addcategories")
	public ModelAndView addcategories()
	{
		ModelAndView mav = new ModelAndView("addcategories");
		
		mav.addObject("Category", new Category());
		
		return mav;
	}
	
	@RequestMapping(value="/AddCategoryToDB",method=RequestMethod.POST)
	public String AddCategoryToDB( @ModelAttribute("Category")Category c )
	{
		
		cs.insert(c);
		
		return "redirect:/allcategories";
	}
	
	@RequestMapping(value="/DeleteCategoryFromDB/{cid}",method=RequestMethod.GET)
	public String DeleteCategoryFromDB( @PathVariable("cid") int cid )
	{
		
		Category c = cs.getCategory(cid);
		
		cs.delete(cid);
		
		List<Product> list = ps.getAllProducts();
		
		for( Product p:list )
		{
			if( p.getProductCategory().equals(c.getCategoryName()) )
			{
				p.setProductCategory("-");
				ps.update(p);
			}
		}
		
		return "redirect:/allcategories";
	}
	
	@RequestMapping(value="/updatecategories/{cid}",method=RequestMethod.GET)
	public ModelAndView updatecategories( @PathVariable("cid") int cid )
	{
		ModelAndView mav = new ModelAndView("updatecategories");
		
		Category c = cs.getCategory(cid);
		
		mav.addObject("Category", c);
		
		return mav;
	}
	
	@RequestMapping(value="/UpdateCategoryToDB",method=RequestMethod.POST)
	public String UpdateCategoryToDB( @ModelAttribute("Category")Category c )
	{
		
		Category c1 = cs.getCategory(c.getCategoryId());
		
		cs.update(c);;
		
		List<Product> list = ps.getAllProducts();
		
		for( Product p:list )
		{
			if( p.getProductCategory().equals(c1.getCategoryName()) )
			{
				p.setProductCategory(c.getCategoryName());
				ps.update(p);
			}
		}
		
		return "redirect:/allcategories";
	}
	
	@RequestMapping(value="/allproducts")
	public ModelAndView allproducts()
	{
		ModelAndView mav = new ModelAndView("allproducts");
		
		List<Product> list = ps.getAllProducts();
		
		JSONArray jarr = new JSONArray();
		
		for( Product p: list )
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("ProductId", p.getProductId());
			jobj.put("ProductName", p.getProductName() );
			jobj.put("ProductCategory", p.getProductCategory() );
			jobj.put("ProductImagePath", p.getProductImagePath() );
			
			jarr.add(jobj);
		}
		
		System.out.println(jarr.toJSONString());
		
		mav.addObject("ProductJSON", jarr.toJSONString());
		
		return mav;
	}
	
	@RequestMapping(value="/addproducts")
	public ModelAndView addproducts()
	{
		ModelAndView mav = new ModelAndView("addproducts");
		
		mav.addObject("Product", new Product());
		
		List<Category> list = cs.getAlCategories();
		mav.addObject("AllCategories", list);
		
		return mav;
	}
	
	@RequestMapping(value="/AddProductToDB",method=RequestMethod.POST)
	public String AddProductToDB( @ModelAttribute("Product")Product p )
	{
		
		ps.insert(p);
		Product p1=ps.getProductWithMaxId();
		try{

			String path = context.getRealPath("/");
	        
	        System.out.println(path);
	        System.out.println(p.getProductImage());
	        File directory = null;
	        
	        if (p.getProductImage().getContentType().contains("image"))
	        {
	        	  directory = new File(path + "\\resources\\images");
	        	  if (!directory.exists()) directory.mkdirs();
	        	  
	        	  byte[] bytes = null;
		            File file = null;
		            bytes = p.getProductImage().getBytes();
		            
		            file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_" + p1.getProductId() + ".jpg");
		            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
		            stream.write(bytes);
		            stream.close();
		            p1.setProductImagePath("resources/images/image_"+ p1.getProductId() + ".jpg");
		            ps.update(p1);
 
	        }
	        
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "redirect:/allproducts";
	}
	
	@RequestMapping(value="/DeleteProductFromDB/{pid}",method=RequestMethod.GET)
	public String DeleteProductFromDB( @PathVariable("pid") int pid )
	{
		
		ps.delete(pid);
		
		return "redirect:/allproducts";
	}
	
	@RequestMapping(value="/AddItemToCart",method=RequestMethod.POST)
	public String AddItemToCart( HttpServletRequest request )
	{
		if( this.test().equals("false") )
		{
			int pid = Integer.parseInt(request.getParameter("prodid"));
			int userqty = Integer.parseInt(request.getParameter("userqty"));
			
			System.out.println(pid);
    		System.out.println(userqty);
    		
			String username = null;
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {   
		    	username = auth.getName();
		    
		    	System.out.println(username);
	    		
		    	
		    	List<Cart> list = crs.getAllItems();
		    	
		    	boolean found = false;
		    	
		    	for( Cart c1 : list )
		    	{
		    		System.out.println(c1.getProductID());
		    		System.out.println(c1.getUserID());
		    		
		    		if( c1.getProductID().equals(pid+"") && c1.getUserID().equals(username) )
		    		{
		    			c1.setQty(userqty + "");
		    			
		    			crs.update(c1);
		    			
		    			found = true;
		    			
		    			break;
		    		}
		    	}
		    
		    	if( !found )
		    	{
		    		Cart c = new Cart();
			    	
			    	c.setUserID(username);
			    	c.setQty(""+userqty);
			    	
			    	c.setProductID(""+pid);
			    	
			    	Product p = ps.getProduct(pid);
			    	
			    	c.setName(p.getProductName());
			    	c.setPrice(p.getProductPrice());
			    	
			    	User u = us.getUser(username);
			    	
			    	c.setAddress(u.getAddress());
			    	c.setBillingAddress(u.getAddress());
			    	
			    	crs.add(c);;
		    	}
		    	
		    	
		    }
		    
		    
		}
		
		return "redirect:/cart";
	}
	
	@RequestMapping(value="/viewproduct/{pid}",method=RequestMethod.GET)
	public ModelAndView viewproduct( @PathVariable("pid") int pid )
	{
		ModelAndView mav = new ModelAndView("viewproduct");
		
		Product p = ps.getProduct(pid);
		
		mav.addObject("ProductImage", p.getProductImagePath());
		mav.addObject("ProductName", p.getProductName());
		mav.addObject("ProductDescription", p.getProductDescription());
		mav.addObject("ProductCategory", p.getProductCategory());
		mav.addObject("ProductPrice", p.getProductPrice());
		mav.addObject("ProductId", p.getProductId());
		
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping(value="/updateproducts/{pid}",method=RequestMethod.GET)
	public ModelAndView updateproducts( @PathVariable("pid") int pid )
	{
		ModelAndView mav = new ModelAndView("updateproducts");
		
		Product p = ps.getProduct(pid);
		
		mav.addObject("Product", p);
		
		List<Category> list = cs.getAlCategories();
		mav.addObject("AllCategories", list);
		
		return mav;
	}
	@RequestMapping(value="/UpdateProductToDB",method=RequestMethod.POST)
	public String UpdateProductToDB( @ModelAttribute("Product")Product p )
	{
		
		
		try
		{
			String path = context.getRealPath("/");
	        
	        System.out.println(path);
	        
	        System.out.println(p.getProductImage());
	        
	        File directory = null;
	        
	        if (p.getProductImage().getContentType().contains("image"))
	        {
	        	directory = new File(path + "\\resources\\images");
	        	
	        	if (!directory.exists()) directory.mkdirs();
	        	
	        	byte[] bytes = null;
	            File file = null;
	            bytes = p.getProductImage().getBytes();
	            
	            file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_" + p.getProductId() + ".jpg");
	            
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
	            stream.write(bytes);
	            stream.close();
	            
	            p.setProductImagePath("resources/images/image_" + p.getProductId() + ".jpg");
	            ps.update(p);
	        }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		ps.update(p);
		
		return "redirect:/allproducts";
	}
	
	
	
	
}
