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
            },
            
            updateAll: function(item){
                return $http.post('http://localhost:9002/Outbook/flows/updateAddresses/', item)
                        .then(
                                function(response){
                                    return response.data;
                                }, 
                                function(errResponse){
                                    console.error('Error while updating item');
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
			     }
			 );
		
		$scope.updated = '';
		
		$scope.UpdateAddresses = function()
		{
			
			var add = {"shippingAddress" : $scope.shippingaddress , "billingAddress" : $scope.billingaddress };
			
			add = JSON.stringify(add);
			
			console.log(add);
			
			$UserService.updateAll(add).then(
				    function(result) {
				    	$scope.updated = result.status;
				       
				    	window.setTimeout(function()
			        	{
			        		$scope.$apply($scope.updated='');
			        	},3000);
				    	
				     }
				 );
		}
	}]);
</script>

<body ng-app="myApp" ng-controller="myCtrl">

<c:import url="/head"/>

<br><br><br>

<form action="${flowExecutionUrl}&_eventId=BackToCart" method="post">
	<input type="submit" value="Back To Cart" class="btn btn-danger"/>
</form>

<form action="${flowExecutionUrl}&_eventId=ViewCompleteOrder" method="post">
	<input type="submit" value="View Complete Bill" class="btn btn-success"/>
</form>


<div class="container-wrapper">
    <div class="container">
        <div id="signup-box">
            
            
          
            
            <h2>Confirm Details</h2>
            
        <div class="form-group">
                   
                    
                    
                    
                    <div class="form-group">
                    <label for="username">Shipping Address: </label>
                    <textarea class="form-control" ng-model="shippingaddress"></textarea>
                    
                    
                    
                </div>
                <div class="form-group">
                    <label for="password">Billing Address:</label>
                    <textarea class="form-control" ng-model="billingaddress"></textarea>
                    
                </div>
                
       
                 <input type="submit" value="submit" ng-click="UpdateAddresses()" ng-disabled="shippingaddress == '' || billingaddress=='' " class="btn btn-default">    
              
              	<div class="form-group" ng-if="updated == 'Updated'">
                    <br>
                    <label class="alert alert-success">Updated Successfully</label>
                    
                </div>
              
        
        </form> 
        </div>
    </div>
</div>   

</body>
</html>