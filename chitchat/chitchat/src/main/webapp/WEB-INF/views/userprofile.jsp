<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:import url="/head-meta"/>
<style type="text/css">

.navbar-header{
margin-top:-57px;
}

</style>
</head>

<script>
	var myApp = angular.module("myApp", []);
	
	//default profile picture
	myApp.directive('onErrorSrc', function() {
		  return {
			 
		    link: function(scope, element, attrs) {
		    	
		      element.bind('error', function() {
		   			       
		        if (attrs.src != attrs.onErrorSrc) {
		          attrs.$set('src', attrs.onErrorSrc);
		          //disable the delete profile picture button when there is no image
		          scope.picDeleted = true;   
		    	  scope.$apply();
		          
		        }
		      });
		    }
		  }
		});
	///////////////////////////////////////
	myApp.service('fileUpload', [ '$http', function($http) {
		this.uploadFileToUrl = function(file, paramuser, uploadUrl) {
			var fd = new FormData();
			fd.append('file', file);
			//fd.append('user','vasudev89');
			return $http.post(uploadUrl, fd, {
				transformRequest : angular.identity,
				headers : {
					'Content-Type' : undefined,
					user : paramuser
				}
			}).then(function(response) {
				return response.data;
			}, function(errResponse) {
				console.error('Error while updating User');
				return "error";
			});
		}
	} ]);
	///////////////////////////////////////
	myApp.factory("UserService", [
			"$http",
			"$q",
			function($http, $q) {
				var BASE_URL = 'http://localhost:12216/chitchat/';
				return {
					userData : function() {
						return $http.get(BASE_URL + 'userdata').then(
								function(response) {
									return response.data;
								}, function(errResponse) {
									return $q.reject(errResponse);
								});
					},
					updateUser : function(item) {
						return $http.post(BASE_URL + 'updateuser', item).then(
								function(response) {
									return response.data;
								}, function(errResponse) {
									console.error('Error while sending data');
									return $q.reject(errResponse);
								});
					},
					deleteUser : function(item) {
						return $http.post(BASE_URL + 'deleteuser', item).then(
								function(response) {
									return response.data;
								}, function(errResponse) {
									console.error('Error while sending data');
									return $q.reject(errResponse);
								});
					},
					updatePassword : function(item) {
						return $http.post(BASE_URL + 'updatepassword', item)
								.then(function(response) {
									return response.data;
								}, function(errResponse) {
									console.error('Error while sending data');
									return $q.reject(errResponse);
								});
					},
					
					deleteUserImage: function(item){
		                return $http.post(BASE_URL + 'deleteUserImage', item)
		                        .then(
		                                function(response){
		                                    return response.data;
		                                }, 
		                                function(errResponse){
		                                    console.error('Error while updating User');
		                                    return $q.reject(errResponse);
		                                }
		                        );
		        		
					}
					,
					getAllUsers : function() {
						return $http.get(BASE_URL + 'allusers').then(
								function(response) {
									return response.data;
								}, function(errResponse) {
									return $q.reject(errResponse);
								});
					}
				};
			} ]);
	myApp
			.controller(
					"myCtrl",
					[
							"$scope",
							"UserService",
							"fileUpload",
							function($scope, $UserService, $fileUpload) {
								//get user data when page loads
								
								$UserService
										.userData()
										.then(
												function(response) {
													//console.log(response);
													$scope.userdetails = response;
													//load profile picture when page loads after the userdetails get fatched
													$scope.userdetails.Image = '${pageContext.request.contextPath}/resources/images/'
															+ $scope.userdetails.email
															+ '.jpg';
												},
												function(errResponse) {
													console
															.log('Error fetching User Details');
												});
								//update user data							
								$scope.updateUser = function() {
									$scope.UserData = {
										UserId : $scope.userdetails.userId,
										Username : $scope.userdetails.username,
										Phone : $scope.userdetails.phone,
										City : $scope.userdetails.city,
									    Gender : $scope.userdetails.gender
									};
									console.log($scope.UserData);
									console.log("in the update user");
									$UserService
											.updateUser($scope.UserData)
											.then(
													function(response) {
														try {
															$scope.status = response.status;
														} catch (e) {
															$scope.data = [];
														}
													},
													function(errResponse) {
														console
																.error('Error while Sending Data.');
													});
								}
								//delete user [ADMIN]
								
								$scope.deleteUser = function(userId) {
									$UserService
											.deleteUser(userId)
											.then(
													function(response) {
														try {
															$scope.allusers = response;
														} catch (e) {
															$scope.data = [];
														}
														/* 		console.log($scope.allusers); */
													},
													function(errResponse) {
														console
																.error('Error while Sending Data.');
													});
								}
								//update password
								
								$scope.updatePassword = function() {
									console
											.log("in the update password update");
									$UserService
											.updatePassword(
													$scope.userdetails.newpassword)
											.then(
													function(response) {
														try {
															$scope.status = response.status;
														} catch (e) {
															$scope.data = [];
														}
													},
													function(errResponse) {
														console
																.error('Error while Sending Data.');
													});
								}
								//list all users [ADMIN]
								
								$scope.getAllUsers = function() {
									$UserService
											.getAllUsers()
											.then(
													function(response) {
														$scope.allusers = response;
													},
													function(errResponse) {
														console
																.log('Error fetching Users');
													});
								}
								// open File Explorer for seleting file/image
								
								$scope.openFileChooser = function() {
									$('#trigger').trigger('click');
								};
								$scope.picUpdated = false;
								$scope.picUpdatedWithError = false;
								$scope.invalidPicType = false;
								/* $scope.picDeleted = false;  */
								
								
								// delete profile image
								
								$scope.DeletePic = function()
								{
									
									
									
									var resp = $UserService.deleteUserImage($scope.userdetails.email)
						            .then(
						            		function(response)
						            		{
						            			
							    				$scope.status = response.status;
							    			
							    				if( $scope.status == "PICTURE DELETED" )
						            			{
						            				$scope.picDeleted = true;
						            				$scope.userdetails.Image=null;
						            				document.getElementById("profilepic").src = '';
						            				document.getElementById("sm_profilepic").src = '';
						            				
						            			}
						            			else
						            			{
													$scope.picUpdatedWithError = true;
						            				}
						            		}
							            , 
							                function(errResponse)
							                {
							                	console.error('Error while Updating User.');
							                } 
						        	);
								}
								
								
								
								// Upload image 
								
								$scope.setFile = function(element) {
									$scope.currentFile = element.files[0];
									var reader = new FileReader();
									reader.onload = function(event) {
										$scope.userdetails.Image = event.target.result
										$scope.$apply()
									};
									// when the file is read it triggers the onload event above.
									reader.readAsDataURL($scope.currentFile);
									
									var file = $scope.currentFile;
									console.log('file is :');
									console.dir(file);
									var uploadUrl =  "http://localhost:12216/chitchat/updateProfilePicture/";
									// calling uploadFileToUrl function of $fileUpload
									var res = $fileUpload
											.uploadFileToUrl(file,
													$scope.userdetails.email,
													uploadUrl)
											.then(
													function(response) {
														$scope.status = response.status;
														$scope.imagesrc = response.imagesrc;
														$scope.picDeleted = false;  
			
														//console.log( $scope.response );
														//console.log( $scope.imagesrc );
													
															$scope.currentImage = '${pageContext.request.contextPath}/'
																	+ $scope.imagesrc;
												
														$scope.stateDisabled = false;
													},
													function(errResponse) {
														console
																.error('Error while Updating User.');
													});
								};
							} ]);
</script>


<body ng-app="myApp" ng-controller="myCtrl">
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
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><img ng-src="{{userdetails.Image}}"  class="img-circle pull-right" on-error-src='${pageContext.request.contextPath}/resources/images/user.jpg' width="30" height="30" id="sm_profilepic" /> <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Blogs</a></li>
          <li><a href="#">forum</a></li>
          <li><a href="#">Friend List</a></li>
          <li><a href="Logout">Logout</a></li>
        </ul>
      </li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
	<br>
	<br>
	<br>
	<br>



	<div class="container">

		<div class="col-md-6">
			<div class="col-md-6">
				 <div ng-if="userdetails.gender == 'Male'">

					<img ng-src="{{userdetails.Image}}" width="150" height="150"  id="profilepic"
						onerror="this.src='${pageContext.request.contextPath}/resources/images/male_dummy.jpg'">
				</div>
				<div ng-if="userdetails.gender == 'Female'">
					<img
						ng-src="{{userdetails.Image}}" width="150" height="150" id="profilepic"
						onerror="this.src='${pageContext.request.contextPath}/resources/images/female_dummy.jpg'">
				</div> 

 				


				<div>
					<button type="button" class="btn btn-link"
						ng-click="openFileChooser();">Change Picture</button>

					<input type="file" id="trigger" ng-show="false"
						onchange="angular.element(this).scope().setFile(this)"
						accept="image/*" file-model="myFile" />
					
						
						<button ng-click="DeletePic();" class="btn btn-danger btn-sm" title="delete picture" ng-disabled="picDeleted"><i class="fa fa-trash-o fa-1x" aria-hidden="true"></i></button>
                	<div>
					<span style="font-size: xx-large;"> {{userdetails.username}}</span>
				</div>

				<div>
					<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp
					{{userdetails.email}}
				</div>
				<div>
					<i class="fa fa-phone" aria-hidden="true"></i> &nbsp
					{{userdetails.phone}}
				</div>

				<div>
					<i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp&nbsp
					{{userdetails.city}}
				</div>

				<div>
					<i class="fa fa-birthday-cake" aria-hidden="true"></i>&nbsp
					{{userdetails.dob}}
				</div>

				<div ng-if="userdetails.gender == 'Male'">
					<i class="fa fa-mars" aria-hidden="true"></i> &nbsp
					{{userdetails.gender}}
				</div>

				<div ng-if="userdetails.gender == 'Female'">
					<i class="fa fa-mars" aria-hidden="true"></i> &nbsp
					{{userdetails.gender}}
				</div>
				
				<div ng-show="status">
				<p class="alert alert-info"><b>Success!</b>&nbsp{{status}}<br /></p>
				</div>
			</div>
		</div>

		<button type="button" class="btn btn-default btn-sm"
			data-toggle="modal" data-target="#myModal">Update Info</button>
		<br />
		
		

		<!-- Modal for update user details -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Details</h4>
					</div>
					<div class="modal-body">
						<form name="form" action="#">


							<div class="form-group"
								ng-class="{ 'has-error': form.username.$dirty && form.username.$error.required }">

								<div class="input-group" style="margin-top: 20px">
									<span class="input-group-addon"><i class="fa fa-user "
										aria-hidden="true"></i></span> <input type="text"
										class="form-control" name="username" id="username"
										ng-model="userdetails.username" ng-value=userdetails.username
										required />
								</div>
								<span
									ng-show="form.username.$dirty && form.username.$error.required"
									class="help-block">Username is required</span>
							</div>

							<div class="input-group" style="margin-top: 20px">
								<span class="input-group-addon"><i class="fa fa-phone "
									aria-hidden="true"></i></span> <input type="tel" class="form-control"
									ng-value=userdetails.phone ng-model="userdetails.phone" />
							</div>
							<div class="input-group" style="margin-top: 20px">
								<span class="input-group-addon"><i
									class="fa fa-map-marker fa-lg" aria-hidden="true"></i></span> <input
									type="text" class="form-control" ng-value=userdetails.city
									ng-model="userdetails.city" />
							</div>

							

							<div class="input-group" style="margin-top: 20px">
								<input type="radio" name="gender" ng-model="userdetails.gender"
									value="Male"> Male &nbsp <input type="radio"
									ng-model="userdetails.gender" name="gender" value="Female">
								Female<br>
							</div>


							<div class="modal-footer" style="margin-top: 20px">
								<input type="submit" ng-click="updateUser()" value="Save"
									class="btn btn-primary" data-dismiss="modal"
									ng-disabled="form.username.$dirty && form.username.$error.required">
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		
		<button type="button" class="btn btn-default btn-sm"
			data-toggle="modal" data-target="#myModal2">Change Password</button>


		<!-- Modal for update password -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Update Details</h4>
					</div>
					<div class="modal-body">
						<form name="form2" action="#">


							<div class="form-group"
								ng-class="{ 'has-error': form2.current_password.$dirty && form2.current_password.$error.required }">

								<div class="input-group" style="margin-top: 20px">
									<span class="input-group-addon"><i
										class="fa fa-unlock-alt" aria-hidden="true"></i></span> <input
										type="password" class="form-control" name="current_password"
										id="current_password" placeholder="Enter current password"
										ng-model="userdetails.currentpassword" required />
								</div>
								<span
									ng-show="form2.current_password.$dirty && form2.current_password.$error.required"
									class="help-block">Current Password is required</span>
							</div>

							<div
								ng-if="(userdetails.password != userdetails.currentpassword && form2.current_password.$dirty)">
								<span class="text-danger">Password is Incorrect</span>
							</div>


							<div class="form-group"
								ng-class="{ 'has-error': form2.new_password.$dirty && form2.new_password.$error.required }">

								<div class="input-group" style="margin-top: 20px">
									<span class="input-group-addon"><i class="fa fa-lock"
										aria-hidden="true"></i></span> <input type="password"
										class="form-control" name="new_password" id="new_password"
										placeholder="Enter new password"
										ng-model="userdetails.newpassword" required />
								</div>
								<span
									ng-show="form2.new_password.$dirty && form2.new_password.$error.required"
									class="help-block">New Password is required</span>
							</div>
							<div class="form-group"
								ng-class="{ 'has-error': form2.cnfrm_new_password.$dirty && form2.cnfrm_new_password.$error.required }">

								<div class="input-group" style="margin-top: 20px">
									<span class="input-group-addon"><i class="fa fa-lock"
										aria-hidden="true"></i></span> <input type="password"
										class="form-control" name="cnfrm_new_password"
										id="cnfrm_new_password" placeholder="Re-enter new password"
										ng-model="userdetails.cnfrmnewpassword" required />
								</div>
								<span
									ng-show="form2.cnfrm_new_password.$dirty && form2.cnfrm_new_password.$error.required"
									class="help-block">New Password is required</span>
							</div>


							<div
								ng-if="(userdetails.newpassword != userdetails.cnfrmnewpassword && form2.new_password.$dirty && form2.cnfrm_new_password.$dirty)">
								<span class="text-danger">Password Not Match</span>
							</div>


							<div class="modal-footer" style="margin-top: 20px">
								<input type="submit" ng-click="updatePassword()" value="Save"
									class="btn btn-primary" data-dismiss="modal"
									ng-disabled="form2.current_password.$error.required || form2.new_password.$error.required || form2.cnfrm_new_password.$error.required || userdetails.password != userdetails.currentpassword || userdetails.newpassword != userdetails.cnfrmnewpassword">
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>



	</div>

	<div class="container">

		<%
			if (request.isUserInRole("ADMIN")) {
		%>

		<div>

			<h3>
				<i class="fa fa-user-secret" aria-hidden="true"></i>&nbsp
				{{userdetails.role}}
			</h3>

			<button ng-click="getAllUsers()" class="btn btn-primary">Get
				All Users</button>


			<table class="table" ng-show="allusers">
				<thead>

					<tr>
						<th>User Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>City</th>
						<th>Gender</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="user in allusers">
						<td>{{user.username}}</td>
						<td>{{user.email}}</td>
						<td>{{user.phone}}</td>
						<td>{{user.city}}</td>
						<td>{{user.gender}}</td>
						<td><button class="btn btn-danger btn-sm"
								ng-click="deleteUser(user.userId)">DELETE</button></td>
						<td>{{user.userId}}</td>
					</tr>

				</tbody>
			</table>

		</div>

		<%
			}
		%>
	</div>

	
</body>
</html>
