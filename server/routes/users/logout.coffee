module.exports =
  handler: (request, reply) ->
    request.auth.session.clear()
    reply()
