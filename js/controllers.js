var blogControllers = angular.module('blogControllers', []);

blogControllers.controller('ListController', ['$scope', '$http',
	function ($scope, $http) {
		$http.get('model/services/postService.cfc?method=list').success(function (data) {
			$scope.blogentries = data;

		});
	}
]);

blogControllers.controller('DetailsController', ['$scope', '$http', '$routeParams',
	function ($scope, $http, $routeParams) {
		$http.get('model/services/postService.cfc?method=get&id=' + $routeParams.id).success(function (data) {
			$scope.blogentries = data;
			$scope.createdOn = data.createdOn;
			$scope.formData = {} ;
			
 

			$scope.add = function () {
				$scope.formData.createdOn = GetFormatedDate();
				$scope.blogentries.comments.push($scope.formData);
				
			}

			$scope.processForm = function () {
				var postData = $(this).serializeArray();
				var data = $("#commentform").serialize();

				$.ajax({
					url: 'index.cfm?action=main.addcomment',
					type: "POST",
					data: data,
					success: function (data, textStatus, jqXHR) {
						// alert('success')   //data: return data from server
					},
					error: function (jqXHR, textStatus, errorThrown) {
						//if fails    
						// alert('fails')  
					}
				});
					// Reset the form and clear the formData model
					$('.form-control').val("");
					$scope.formData = {};
				
			};

		});
	}
]);

