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


<br><br><br><br>

<div class="container">
		
		<div class="row">
		
			<div class="col-lg-12">
				<label style="font-size: 40px;" class="alert alert-info">View Product</label>
			</div>
			
		</div>


			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<img src="${pageContext.request.contextPath}/${ProductImage}" class="img img-responsive"></img>
				</div>
				
			</div>
		
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Name:</label>
				</div>
				<div class="col-lg-6">
					<label>${ProductName}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Description:</label>
				</div>
				<div class="col-lg-6">
					<label>${ProductDescription}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Category:</label>
				</div>
				<div class="col-lg-6">
					<label>${ProductCategory}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Price:</label>
				</div>
				<div class="col-lg-6">
					<label>${ProductPrice}</label>
				</div>
				
			</div>
			
			<%
			if (!request.isUserInRole("ADMIN"))
			{
			%>
			
			<form action="${pageContext.request.contextPath}/AddItemToCart" method="post">
			
			<input type="hidden" name="prodid" value="${ProductId}" />
			
			<div class="row">
			
				<div class="col-lg-12">
					<br>
					<input name="userqty" type="number" placeholder="Enter Quantity" min="1" max="10" value="1" class="form-control" />
				</div>
			
			</div>
			
			<div class="row">
			
				<div class="col-lg-12">
					<br>
					<input type="submit" value="Add To Cart" class="btn btn-success" />
				</div>
			
			</div>
			</form>
			<%
			}
			%>
		<br><br><br>
		
	</div>

</body>
</html>