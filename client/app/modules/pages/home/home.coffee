angular.module('app.pages')
.controller 'HomeController', [ '$scope', '$window', ($scope, $window) ->

  _.extend $scope,
    test: 'testing'
]
