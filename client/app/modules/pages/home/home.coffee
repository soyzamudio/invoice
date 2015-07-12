angular.module('app.pages')
.controller 'HomeController', [
  '$scope'
  ($scope) ->
    _.extend $scope,
      test: 'testing'
]
