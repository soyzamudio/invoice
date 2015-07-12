angular.module('app.pages')
.controller 'RetailersListController', [ '$scope', ($scope) ->
  _.extend $scope,
    title: 'List of Retailers'
]
