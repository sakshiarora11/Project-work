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


 
 <form action="${pageContext.request.contextPath}/login" method="post">

    <div class="container-wrapper">
    <div class="container">
        <div id="signup-box">
            
            
          
            
            <c:if test="${not empty param.error}">
            <h2 class="alert alert-danger">Invalid Username or Password</h2>
           </c:if>
            
            <h2>Log In</h2>
            
        <div class="form-group">
                   
                    
                    
                    
                    <div class="form-group">
                    <label for="username">Username: </label>
                    <input name="username" type="text" id="username" name="username" class="form-control" />
                    
                    
                    
                </div>
                <div class="form-group">
                    <label for="password">Passwrod:</label>
                    <input name="password" type="password" id="password" name="password" class="form-control" />
                    
                </div>
                
       
                 <input type="submit" value="submit" class="btn btn-default">    
              
              
        
        </form> 
        </div>
    </div>
</div>   
              
           </body>