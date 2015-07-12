angular.module('app.pages')
.controller 'HomeController', [ '$scope', '$parse', ($scope, $parse) ->
  _.extend $scope,
    test: 'testing'
]
