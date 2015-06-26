'use strict'

angular.module('invoice').factory 'User', [
  '$http'
  ($http) ->
    User = {}
    User.register = (user) -> $http.post '/register', user
    User.register = (user) -> $http.post '/login', user
    User.register = -> $http.get '/status'
    User.register = -> $http.delete '/logout'
    User
]
