User = require '../../models/user'
Joi = require 'joi'

module.exports =
  auth: false,
  validate:
    payload:
      email: Joi.string().email()
      password: Joi.string().required()
  handler: (request, reply) ->
    User.authenticate request.payload, (err, user) ->
      if err
        reply().code 400
      else
        request.auth.session.set user
        reply email: user.email
