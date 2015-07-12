Hapi = require 'hapi'
server = new Hapi.Server()
plugins = require './config/plugins'
routes = require './config/routes'
authentication = require './config/authentication'
mongoose = require 'mongoose'

mongoose.connect process.env.MONGO_URL
server.connection port: process.env.PORT

mongoose.connection.once 'open', ->
  server.register plugins, ->
    server.auth.strategy 'session', 'cookie', true, authentication
    server.route routes
    server.start ->
      console.log 'info', server.info.uri
      console.log 'info', process.env.MONGO_URL

module.exports = server
