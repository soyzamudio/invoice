angular.module('app.components')
.controller 'NavBarController', [ '$scope', ($scope) ->
  _.extend $scope,
    searchStore: (storeName) ->
      console.log storeName

]
