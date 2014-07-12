<!doctype html>
<html>
<head>
	<title>Angular Forms</title>

	<!-- LOAD BOOTSTRAP CSS -->
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">

	<!-- LOAD JQUERY -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<!-- LOAD ANGULAR -->
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js"></script>

	<!-- PROCESS FORM WITH AJAX (NEW) -->
	<script>

		// define angular module/app
		var formApp = angular.module('formApp', []);

		// create angular controller and pass in $scope and $http
		function formController($scope, $http) {

			// create a blank object to hold our form information
			// $scope will allow this to pass between controller and view
			$scope.formData = {};

			// process the form
			$scope.processForm = function() {
				$http({
			        method  : 'POST',
			        url     : '/_BlogFW1_Angular/index.cfm?action=main.addcomment',
			        data    : $.param($scope.formData),  // pass in data as strings
			        headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
			    })
			        .success(function(data) {
			            console.log(data);

			            if (!data.success) {
			            	// if not successful, bind errors to error variables
			                $scope.errorName = data.errors.name;
			                $scope.errorSuperhero = data.errors.superheroAlias;
			            } else {
			            	// if successful, bind success message to message
			                $scope.message = data.message;
			            }
			        });

			};

		}

	</script>
</head>
<!-- apply the module and controller to our body so angular is applied to that -->
<body ng-app="formApp" ng-controller="formController">
<div class="container">
<div class="col-md-6 col-md-offset-3">

	<!-- PAGE TITLE -->
	<div class="page-header">
		<h1><span class="glyphicon glyphicon-tower"></span> Submitting Forms with Angular</h1>
	</div>

	<!-- SHOW ERROR/SUCCESS MESSAGES -->
	<div id="messages" class="well" ng-show="message">{{ message }}</div>

	<!-- FORM -->
	<form ng-submit="processForm()">
		<!-- NAME -->
		<div id="name-group" class="form-group" ng-class="{ 'has-error' : errorName }">
			<label>Name</label>
			<input type="text" name="name" class="form-control" placeholder="Bruce Wayne" ng-model="formData.name">
			<span class="help-block" ng-show="errorName">{{ errorName }}</span>
		</div>

		<!-- SUPERHERO NAME -->
		<div id="superhero-group" class="form-group" ng-class="{ 'has-error' : errorSuperhero }">
			<label>Superhero Alias</label>
			<input type="text" name="superheroAlias" class="form-control" placeholder="Caped Crusader" ng-model="formData.superheroAlias">
			<span class="help-block" ng-show="errorSuperhero">{{ errorSuperhero }}</span>
		</div>

		<!-- SUBMIT BUTTON -->
		<button type="submit" class="btn btn-success btn-lg btn-block">
			<span class="glyphicon glyphicon-flash"></span> Submit!
		</button>
	</form>

	<!-- SHOW DATA FROM INPUTS AS THEY ARE BEING TYPED -->
	<pre>
		{{ formData }}
	</pre>

</div>
</div>
</body>
</html>


<!---<!-- apply the module and controller to our body so angular is applied to that -->
<body ng-app="formApp" ng-controller="formController">
<div class="container">
<div class="col-md-6 col-md-offset-3">
 

	<!-- FORM -->
	<form ng-submit="processForm()">
		<!-- NAME -->
		<div id="name-group" class="form-group" ng-class="{ 'has-error' : errorName }">
			<label>Name</label>
			<input type="text" name="name" class="form-control" placeholder="name" ng-model="formData.name">
			<span class="help-block" ng-show="errorName">{{ errorName }}</span>
		</div>
		
		<!-- email -->
		<div id="email-group" class="form-group" ng-class="{ 'has-error' : erroremail }">
			<label>email</label>
			<input type="text" name="email" class="form-control" placeholder="email" ng-model="formData.email">
			<span class="help-block" ng-show="erroremail">{{ erroremail }}</span>
		</div>

		<!-- website -->
		<div id="website-group" class="form-group" ng-class="{ 'has-error' : errorwebsite }">
			<label>website</label>
			<input type="text" name="website" class="form-control" placeholder="website" ng-model="formData.website">
			<span class="help-block" ng-show="errorwebsite">{{ errorwebsite }}</span>
		</div>
		 
		<!-- body -->
		<div id="body-group" class="form-group" ng-class="{ 'has-error' : errorbody }">
			<label>body</label>
			<input type="text" name="body" class="form-control" placeholder="Bruce Wayne" ng-model="formData.body">
			<textarea name="body" id="body" class="form-control" placeholder="Bruce Wayne" ng-model="formData.body"></textarea> 
			
			<span class="help-block" ng-show="errorbody">{{ errorbody }}</span>
		</div>
		
 

		<!-- SUBMIT BUTTON -->
		<button type="submit" class="btn btn-success btn-lg btn-block">
			<span class="glyphicon glyphicon-flash"></span> Submit!
		</button>
	</form>

	<!-- SHOW DATA FROM INPUTS AS THEY ARE BEING TYPED -->
	<pre>
		{{ formData }}
	</pre>

</div>
</div> --->