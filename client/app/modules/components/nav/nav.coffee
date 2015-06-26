angular.module('app.components')
.controller 'NavBarController', [ '$scope', ($scope) ->
  _.extend $scope,
    test: 'testing'
]
