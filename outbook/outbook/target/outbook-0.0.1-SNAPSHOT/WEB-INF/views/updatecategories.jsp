<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:import url="/head-meta"/>

</head>
<body>
<c:import url="/head"/>


<div class="container">
		
		<div class="row">
		
			<div class="col-lg-12">
				<label style="font-size: 40px;" class="alert alert-info">Update Categories</label>
			</div>
			
		</div>

		<form:form method="post" action="${pageContext.request.contextPath}/UpdateCategoryToDB" modelAttribute="Category">
		
			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<form:input path="categoryId"  type="hidden" />
					<form:input path="categoryName"  type="text" placeholder="Enter Category Name" class="form-control" />
				</div>
				
			</div>
			
			<div class="row">
			
				<div class="col-lg-12">
					<br>
					<input type="submit" value="Submit" class="btn btn-success" />
				</div>
			
			</div>
		
		</form:form>
	</div>

</body>
</html>