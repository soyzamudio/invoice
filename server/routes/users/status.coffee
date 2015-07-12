module.exports =
  handler: (request, reply) ->
    reply email: request.auth.credentials.email
