angular.module('app')
.config([
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/'
    $stateProvider
    .state 'home',
      url: '/'
      templateUrl: 'app/modules/pages/home/home.html'
      controller: 'HomeController'
    .state 'retailers',
      url: '/retailers'
      templateUrl: 'app/modules/pages/retailers/retailers.html'
      abstract: true
    .state 'retailers.list',
      url: '/'
      templateUrl: 'app/modules/pages/retailers/list/list.html'
      controller: 'RetailersListController'
    .state 'retailers.show',
      url: '/:retailerId'
      templateUrl: 'app/modules/pages/retailers/show/show.html'
      controller: 'RetailersShowController'
])
