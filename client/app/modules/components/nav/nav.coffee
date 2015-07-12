angular.module('app.components')
.controller 'NavBarController', [
  '$scope'
  '$state'
  ($scope, $state) ->
    _.extend $scope,
      searchStore: (storeName) ->
        $state.go('retailers.show', {retailerId: storeName})
        @storeName = ''
]
