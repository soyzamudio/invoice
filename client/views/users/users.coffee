'use strict'
angular.module('invoice').controller 'UsersCtrl', [
  '$rootScope'
  '$scope'
  '$state'
  'User'
  ($rootScope, $scope, $state, User) ->
    $scope.name = _.capitalize($state.current.name)

    $scope.submit = (user) ->
      if $scope.name == 'Register'
        if user.password1 == user.password2 and user.email
          User.register(
            email: user.email
            password: user.password1).then (->
            $state.go 'login'
          ), ->
            user.email = user.password1 = user.password2 = ''
        else
          user.password1 = user.password2 = ''
      else
        User.login(user).then ((response) ->
          $rootScope.email = response.data.email
          $state.go 'home'
        ), ->
          user.email = user.password = ''
]
