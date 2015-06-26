'use strict'

angular.module('app')
.config([
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/'
    $stateProvider.state 'home',
      url: '/'
      templateUrl: 'app/modules/pages/home/home.html'
      controller: 'HomeController'
])
