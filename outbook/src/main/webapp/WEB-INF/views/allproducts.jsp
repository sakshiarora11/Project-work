<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:import url="/head-meta"/>

</head>

<script type="text/javascript">

	var myApp = angular.module("myApp",[]);

	myApp.controller("myCtrl",function($scope)
	{
		$scope.search = '';
		
		$scope.data=${ProductJSON};
	});
</script>

<body ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head"/>

	<div class="container">
	
		<div class="row">
		<br>
		<br>
		<br>
		<br>
		
			<div class="col-lg-12">
				<label style="font-size: 40px;" class="alert alert-info">All Products</label>
			</div>
			
		</div>
		
		<%
		if (request.isUserInRole("ADMIN"))
		{
		%>
		
		<div class="row">
		
		    <Br>
		    <Br>
		     <Br>
		
		
		
		
		
		
		
			<div class="col-lg-12">
				<a href="${pageContext.request.contextPath}/addproducts" class="btn btn-danger">Add Product</a>
			</div>
			
		</div>
		<%
		}
		%>
		
		<div class="row">
		<br>
		<br>
		<br>
		
			<div class="col-lg-12">
				<input type="text" placeholder="Enter Search Key" ng-model="search" class="form-control"/>
			</div>
			
		</div>
	
		<div class="row" ng-repeat="x in data| filter : search">
		
			<div class="col-lg-2">
				<br>
				{{x.ProductName}}
			</div>
			<div class="col-lg-2">
				<br>
				{{x.ProductCategory}}
			</div>
			<div class="col-lg-2">
			<br>
			<img src="${pageContext.request.contextPath}/{{x.ProductImagePath}}" class="img img-responsive img-thumbnail"></img>
			
			
			</div>
			
			<div class="col-lg-2">
				<a href="${pageContext.request.contextPath}/viewproduct/{{x.ProductId}}" class="btn btn-success">View Products</a>
				<br>
					
			</div>
			
			  <%
      
             	if(request.isUserInRole("ADMIN"))
      				{
      
      				%>
			
			<div class="col-lg-2">
				<a href="${pageContext.request.contextPath}/DeleteProductFromDB/{{x.ProductId}}" class="btn btn-info">Delete Products</a>
				<br>
					
			</div>
			
			<div class="col-lg-2">
				<a href="${pageContext.request.contextPath}/updateproducts/{{x.ProductId}}" class="btn btn-success">Update Products</a>
				<br>
				<Br>
		     <Br>
					
			</div>
			
			  <%
      
      				}
      
      				%>
			
			
		
			
		</div>
	
	</div>

</body>
</html>