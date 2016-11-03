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
				<label style="font-size: 40px;" class="alert alert-info">Add Products</label>
			</div>
			
		</div>

		<form:form method="post" action="${pageContext.request.contextPath}/AddProductToDB" modelAttribute="Product" enctype="multipart/form-data">
		
			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<form:input path="productName"  type="text" placeholder="Enter Product Name" class="form-control" />
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<form:textarea path="productDescription" placeholder="Enter Product Description" class="form-control"></form:textarea>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<form:input path="productQty"  type="number" min="1" max="10" value="1" placeholder="Enter Product Qty" class="form-control" />
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<form:select path="productCategory" class="form-control">
					
						<c:if test="${not empty AllCategories}">
							
							<c:forEach var="catName" items="${AllCategories}">
								<form:option value="${catName}"/>
							</c:forEach>
							
						</c:if>
					
						<c:if test="${empty AllCategories}">
							<form:option value="None"/>
						</c:if>
					
					</form:select>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<form:input path="productPrice"  type="number" min="1" placeholder="Enter Product Price" class="form-control" />
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<form:input path="productImage"  type="file" class="form-control" />
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