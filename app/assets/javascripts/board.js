angular.module('app', ['ngRoute'])
.controller('boardController', function($scope) {
  $.get('/api/v1/articles.json', function(data) {
    $scope.articles = data;
    $scope.$apply();
  });
});

angular.module('app', ['ngRoute'])
.controller('articleController', function($scope) {
  angular.element(document).ready(function() {
      $.get('/api/v1/article.json', {'id': $scope.article_id}, function(data) {
      $scope.article = data;
      $scope.$apply();
    });
  });
});