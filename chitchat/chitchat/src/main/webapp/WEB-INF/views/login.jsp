<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    

 <%@include file="head-meta.jsp" %>
 <style>
 
body{
     background: url(${pageContext.request.contextPath}/resources/images/12.jpg) no-repeat center center fixed; 
}
.container{
margin-top:-120px;
}
.navbar-header{
margin-top:-57px;
}
 </style>
</head>
<body>


 <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><h1><img alt="logo" src="resources/images/10.png" width="40" hight="40">Chitchat</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">About us</a></li>
      <li><a href="#">Contact us</a></li>
      
    </ul>
	<ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>


 <div class="col-sm-4">
 <br>
 <br>
 
 <h1><em>Welcome</em></h1>
 <h3><em>to our social network</em></h3>
 <h3><em>share your memories, connect with others, make new friends.</em></h3>
 
 
  
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading"> <strong class="">Login</strong>

                </div>
				
			
                <div class="panel-body">
				<div>
				<c:if test="${param.error != null}">
					<p class="alert alert-danger">
						<span><b>TRY AGAIN!</b> Invalid Email or password.</span>
					</p>
				</c:if>
				<c:if test="${param.logout != null}">
					<p class="alert alert-success">
						<span>You have been logged out successfully.</span>
					</p>
				</c:if>
				
				<c:if test="${not empty success}">
					<p class="alert alert-success">
						<b>GREAT</b>&nbsp Account Created Successfully
					</p>
				</c:if>
				
				</div>
					<form action="login" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label"><em>Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="username" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="Password" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label class="">
                                        <input type="checkbox" class="">Remember me</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group last">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-success btn-sm">Sign in</button>
                                <button type="reset" class="btn btn-default btn-sm">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
                
       <div class="panel-footer">
				
				
				
		<button type="button" class="btn btn-default btn-sm"
			data-toggle="modal" data-target="#myModal">Register</button>
		<br />
		
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Register Details</h4>
					</div>
					<div class="modal-body">
					<div>
				<c:if test="${not empty passwordmismatch}">
					<p class="alert alert-danger">
						<b>OOPS!</b>&nbsp Password Does't Match
					</p>
				</c:if>

				<c:if test="${not empty useralreadyexists}">
					<p class="alert alert-danger">
						<b>OOPS!</b>&nbsp Username Already Exists
					</p>
				</c:if>

				
			</div>
						<form:form action="adduser" method="post" modelAttribute="user">

				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="text" path="username" class="form-control"
						placeholder="Enter your name" />
				</div>
				<span class="text text-danger"><form:errors path="username" /></span>



				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-envelope "
						aria-hidden="true"></i></span>
					<form:input type="email" class="form-control" path="email"
						placeholder="Enter your email Id" />
				</div>
				<span class="text text-danger"><form:errors path="email" /></span>


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="password" path="password" class="form-control"
						placeholder="Enter your password" />
				</div>
				<span class="text text-danger"><form:errors path="password" /></span>


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="password" path="cpassword" class="form-control"
						placeholder="re-enter your password" />
				</div>

				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i
						class="fa fa-map-marker fa-lg" aria-hidden="true"></i></span>
					<form:input type="text" class="form-control" path="city"
						placeholder="Enter your city" />
				</div>


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-phone "
						aria-hidden="true"></i></span>
					<form:input type="text" class="form-control" path="phone"
						placeholder="Enter the mobile number" />
				</div>
				<span class="text text-danger"><form:errors path="phone" /></span>

				<div class="input-group" style="margin-top: 20px">
					<label class="radio-inline"> <form:radiobutton
							path="gender" value="Male" />Male

					</label> <label class="radio-inline"> <form:radiobutton
							path="gender" value="Female" />Female
					</label>
				</div>

				<div style="margin-top: 20px">
					<input type="submit" value="Sign Up"
						class="btn btn-success btn-block" />
				</div>

			</form:form>
		</div>
                </div>
            </div>
        </div>
    </div>
</div>
		
<nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
  
  <p class="navbar-text"><b>&copy; Sakshi Arora</b></p>
    
  </div>
</nav>
	</div>
</body>
</html>


