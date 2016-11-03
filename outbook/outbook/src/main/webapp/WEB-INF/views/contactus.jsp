<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    

<html lang="en">
<head>

<c:import url="/head-meta"/>
  
</head>
<body>

<c:import url="/head"/>

<br>
<br>
<br>


    <div class="container-wrapper">
    <div class="container">
    
    <br>
    <br>
    <h2>Contact Us</h2>
    
    <br>
    <br>
        
       
            
        <div class="form-group">
                    <label for="your email">Your Email: </label>
                    <input placeholder="Your Email" type="text" id="your email" name="your email" class="form-control" />
                    
                    </div>
                    
                    
                    
                    <div class="form-group">
                    <label for="your message">Your Message</label>
                    <textarea placeholder="Your Message" type="text"  class="form-control"></textarea>
                    </div>

              
                    
                 <input type="submit" value="submit" class="btn btn-default">    
              
              
        
        
        </div>
    </div>
</div>   
              
           </body>
 