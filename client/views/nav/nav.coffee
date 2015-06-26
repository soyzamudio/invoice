'use strict'
angular.module('invoice').controller 'NavCtrl', [
  '$rootScope'
  '$scope'
  'User'
  ($rootScope, $scope, User) ->

    $scope.logout = ->
      User.logout().then ->
        delete $rootScope.email
]
