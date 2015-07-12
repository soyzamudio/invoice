module.exports = [
  { register: require 'good',
    options: {
      reporters: [
        reporter: require 'good-console'
        events:
          log: '*'
          response: '*'
          error: '*'
      ]
    }
  },
  {
    register: require 'hapi-auth-cookie'
  }
]
