<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    

<html lang="en">
<head>

<c:import url="/head-meta"/>

  
  
</head>
<body>

<c:import url="/head"/>


 <form:form method="post" action="${pageContext.request.contextPath}/AddUserToDB" modelAttribute="User">

    <div class="container-wrapper">
    <div class="container">
        <div id="signup-box">
        
        	<c:if test="${not empty Success}">
        		<h2 class="alert alert-success">${Success}</h2>
        	</c:if>
        
        	<c:if test="${not empty PasswordMismatch}">
        		<h2 class="alert alert-danger">${PasswordMismatch}</h2>
        	</c:if>
        	
        	<c:if test="${not empty UserExists}">
        		<h2 class="alert alert-danger">${UserExists}</h2>
        	</c:if>
        	
            <h2>SignUp</h2>
          
        <div class="form-group">
                    <label for="username">Email address: </label>
                    <form:input path="email" type="text" id="email" name="email" class="form-control" />
                    <form:errors path="email" class="text text-danger"/>
                    </div>
                    
                    
                    
                    <div class="form-group">
                    <label for="username">Username: </label>
                    <form:input path="username" type="text" id="username" name="username" class="form-control" />
                    <form:errors path="username" class="text text-danger"/>
                    
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <form:input path="password" type="password" id="password" name="password" class="form-control" />
                    <form:errors path="password" class="text text-danger"/>
                </div>
                
                <div class="form-group">
                    <label for="password">Confirm Password:</label>
                    <form:input path="cPassword" type="password" id="cpassword" name="cpassword" class="form-control" />
                </div>
         
         <div class="form-group">
                    <label for="phone">Phone: </label>
                    <form:input path="phone" type="number" id="phone" name="phone" class="form-control" />
                    <form:errors path="phone" class="text text-danger"/>
                    
                </div>
                
                 <div class="form-group">
                    <label for="username">Address: </label>
                    <form:textarea path="address" class="form-control"></form:textarea>
                    <form:errors path="address" class="text text-danger"/>
                    </div>
                    <input type="submit" value="submit" class="btn btn-default">    
               </form:form> 
        </div>
    </div>
</div>   
              
           </body>   