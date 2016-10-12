var postApp = angular.module ("postApp", []);

postApp.controller("postCtrl", function ($scope, $http){
	
	 $scope.delmypost = function (postid) {
	        $http.put('/demo/deletemy/'+postid).success(function (data) {
	        	$scope.refreshPost();
	        });
		 };
		 
		 $scope.refreshPost = function () {
		        $http.get('/demo/myposts').success(function (data) {
		        	  $scope.userPost=data;
		        });
		    };
	
});

