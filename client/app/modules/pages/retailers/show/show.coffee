angular.module('app.pages')
.controller 'RetailersShowController', [ '$scope', '$state', ($scope, $state) ->
  _.extend $scope,
    retailerId: $state.params.retailerId
    randomNumber: Math.floor (Math.random() * 90000000) + 10000000
]
