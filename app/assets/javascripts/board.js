var app = angular.module('app', ['ngRoute']);

app.controller('boardController', function($scope) {
  $(document).ready(function() { 
    $.get('/api/v1/articles.json', function(data) {
      $scope.articles = data;
      $scope.$apply();
    });
  });
});

app.controller('articleController', function($scope) {
  angular.element(document).ready(function() {
    $.get('/api/v1/article.json', {'id': $scope.article_id}, function(data) {
      $scope.article = data;
      $scope.$apply();
    });
    $.get('/api/v1/comments.json', {'article': $scope.article_id}, function(data) {
      $scope.comments = data;
      $scope.$apply();
    });
  });
});

app.run(['$compile', '$rootScope', '$document', function($compile, $rootScope, $document) {
    return $document.on('page:load', function() {
      var body, compiled;
      body = $('.contents');
      compiled = $compile(body.html())($rootScope);
      return body.html(compiled);
   });
}])