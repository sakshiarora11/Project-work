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
///////////////////////////////////////
	
	myApp.factory('UserService', ['$http', '$q', function($http, $q){
	 
    return {
         
            fetchAllItems: function() {
                    return $http.post('http://localhost:9002/Outbook/flows/fetchitems/')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching items');
                                        return $q.reject(errResponse);
                                    }
                            );
            }
         
    };
 
}]);
//////////////////////////////////////////////////
	myApp.controller("myCtrl",["$scope","UserService",function($scope,$UserService)
	{
		$scope.data = [];
		
		$UserService.fetchAllItems().then(
			    function(result) {
			    	$scope.data = result;
			        console.log(result);
			        console.log($scope.data);
			        
			        
			        $scope.shippingaddress = $scope.data[0].Address;
			        $scope.billingaddress = $scope.data[0].BillingAddress;
			        
			        $scope.totalprice = 0;
			        
			        for( i = 0 ; i < $scope.data.length ; i++ )
			        {
			        	$scope.totalprice += $scope.data[i].Price * $scope.data[i].Qty;
			        }
			     }
			 );
		
		
	}]);
</script>

<body ng-app="myApp" ng-controller="myCtrl">

<c:import url="/head"/>

<br><br><br>

<form action="${flowExecutionUrl}&_eventId=BackToConfirmDetails" method="post">
	<input type="submit" value="Back To Shipping Details" class="btn btn-danger"/>
</form>

<form action="${flowExecutionUrl}&_eventId=ConfirmOrder" method="post">
	<input type="submit" value="Confirm Order" class="btn btn-success"/>
</form>

<!--  -->

<div class="container-wrapper">
    <div class="container">
        <div id="signup-box">
            
            
          
            
            <h2>Your Details</h2>
            
        <div class="form-group">
                   
                    
                    
                    
                    <div class="form-group">
                    <label for="username">Shipping Address: </label>
                    <textarea class="form-control" ng-model="shippingaddress" ng-disabled="true"></textarea>
                    
                    
                    
                </div>
                <div class="form-group">
                    <label for="password">Billing Address:</label>
                    <textarea class="form-control" ng-model="billingaddress" ng-disabled="true"></textarea>
                    
                </div>
                
                <div class="form-group">
                    <label for="password">Total Price:</label>
                    <textarea class="form-control" ng-model="totalprice" ng-disabled="true"></textarea>
                    
                </div>
                
                <div class="form-group">
                    <label for="password">Total Items:</label>
                    <textarea class="form-control" ng-model="data.length" ng-disabled="true"></textarea>
                    
                </div>
                
       
                      
        
        </form> 
        </div>
    </div>
</div>   

<div class="container" ng-repeat="x in data">
		
		

			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<img src="${pageContext.request.contextPath}/{{x.Image}}" class="img img-responsive"></img>
				</div>
				
			</div>
		
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Name:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Name}}</label>
				</div>
				
			</div>
			
			
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Price:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Price}}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Qty:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Qty}}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Total Price:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Qty * x.Price}}</label>
				</div>
				
			</div>
			
		
		<br><br><br>
		
	</div>

<!--  -->

</body>
</html>