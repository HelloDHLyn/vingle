angular.module('app', ['ngRoute'])
.controller('articleController', function($scope) {
  $.get('/api/v1/articles.json', function(data) {
    $scope.articles = data;
    $scope.$apply();
  });
});