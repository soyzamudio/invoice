User = require '../../models/user'
Joi = require 'joi'

module.exports =
  auth: false
  validate:
    payload:
      email: Joi.string().email()
      password: Joi.string().required()
  handler: (request, reply) ->
    User.register request.payload, (err) ->
      reply().code if err then 400 else 200
