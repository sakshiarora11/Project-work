package com.outbook;

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

import com.outbook.cart.Cart;
import com.outbook.cart.CartService;
import com.outbook.category.CategoryService;
import com.outbook.product.Product;
import com.outbook.product.ProductService;
import com.outbook.user.UserService;
import com.outbook.userrole.UserRoleService;

import antlr.collections.List;

@RestController
@CrossOrigin(origins = "http://localhost:9002", maxAge = 3600)
public class OutbookRESTController {

	
	@Autowired
	CartService cs;
	
	@Autowired
	ProductService ps;

	@Autowired
	UserService us;
	
	@Autowired
	UserRoleService urs;
	
	@Autowired
    ServletContext context;
	
	@CrossOrigin
    @RequestMapping(value = "/flows/fetchitems/", method = RequestMethod.POST)
    public ResponseEntity<String> fetchAllItems(HttpServletResponse response,    UriComponentsBuilder ucBuilder) {
        
		java.util.List<Cart> l = cs.getAllItems();
		
		JSONArray ja = new JSONArray();
		
		System.out.println(ja);
		
		String username = null;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	username = auth.getName();
	    }
		
		for( Cart cart: l )
		{
			if( cart.getUserID().equals(username) )
			{
				JSONObject json = new JSONObject();
		      
				Product p = ps.getProduct(Integer.parseInt( cart.getProductID() ));
				
				json.put("CartID", cart.getCartID());
				json.put("ProductID", cart.getProductID());
		        json.put("Name", cart.getName());
		        json.put("Address", cart.getAddress());
		        json.put("BillingAddress", cart.getBillingAddress());
		        json.put("UserName", cart.getUserID());
		        json.put("Qty", cart.getQty());
		        json.put("Price", cart.getPrice());
		        json.put("Image", p.getProductImagePath());
		        json.put("Description", p.getProductDescription());
		        json.put("Category", p.getProductCategory());
		        
		        ja.add(json);
		        
		        System.out.println(json.toString());
			}
			
		}
		
		System.out.println(ja.toJSONString());
        
        return new ResponseEntity<String>(ja.toJSONString(), HttpStatus.CREATED);
    }
	
	
	@CrossOrigin
    @RequestMapping(value = "/flows/deleteItem/{id}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteItem(HttpServletResponse response, @PathVariable("id") int i,   UriComponentsBuilder ucBuilder) {
        
		System.out.println(i);
		
		cs.delete(i);
		
		java.util.List<Cart> l = cs.getAllItems();
		
		JSONArray ja = new JSONArray();
		
		String username = null;
		
		System.out.println(ja);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	username = auth.getName();
	    }
		
		for( Cart cart: l )
		{
			if( cart.getUserID().equals(username) )
			{
				JSONObject json = new JSONObject();
		      
				Product p = ps.getProduct(Integer.parseInt( cart.getProductID() ));
				
				json.put("CartID", cart.getCartID());
				json.put("ProductID", cart.getProductID());
		        json.put("Name", cart.getName());
		        json.put("Address", cart.getAddress());
		        json.put("BillingAddress", cart.getBillingAddress());
		        json.put("UserName", cart.getUserID());
		        json.put("Qty", cart.getQty());
		        json.put("Price", cart.getPrice());
		        json.put("Image", p.getProductImagePath());
		        json.put("Description", p.getProductDescription());
		        json.put("Category", p.getProductCategory());
		        
		        ja.add(json);
		        
		        System.out.println(json.toString());
			}
			
		}
		
		System.out.println(ja.toJSONString());
        
        return new ResponseEntity<String>(ja.toJSONString(), HttpStatus.CREATED);
    }
	
	@CrossOrigin
    @RequestMapping(value = "/flows/updateAddresses/", method = RequestMethod.POST)
    public ResponseEntity<String> updateAddresses(HttpServletResponse response,@RequestBody String inpaddress,    UriComponentsBuilder ucBuilder) {
        
		JSONObject address = new JSONObject();
		
		try
		{
			JSONParser jpar = new JSONParser();
			
			address = (JSONObject)jpar.parse(inpaddress);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		java.util.List<Cart> l = cs.getAllItems();	        
		
		String username = null;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	username = auth.getName();
	    }
		
		for( Cart cart: l )
		{
			if( cart.getUserID().equals(username) )
			{
				cart.setAddress(address.get("shippingAddress").toString());
				cart.setBillingAddress(address.get("billingAddress").toString());
				
				cs.update(cart);
			}
			
		}
		
		JSONObject json = new JSONObject();
        	        
        json.put("status", "Updated");
        
        System.out.println(json.toString());
        
        return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);
    }
	
	@CrossOrigin
    @RequestMapping(value = "/flows/clearCart/", method = RequestMethod.POST)
    public ResponseEntity<String> clearCart(HttpServletResponse response , UriComponentsBuilder ucBuilder) {
        
		String username = null;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	username = auth.getName();
	    }
		
		
	    	for( Cart cart: cs.getAllItems())
		    {
	    		if( cart.getUserID().equals(username) )
	    		{
	    			cs.delete(((Cart)cart).getCartID());
	    		}
		    }	
		
		JSONObject json = new JSONObject();
		
		json.put("status", "Updated");
		
        return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);
    }
}