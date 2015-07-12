bcrypt = require 'bcrypt'
mongoose = require 'mongoose'

userSchema = mongoose.Schema {
  email:
    type: String
    required: true
  password:
    type: String
    required: true
  createdAt:
    type: Date
    default: Date.now
    required: true
}

userSchema.statics.register = (o, cb) ->
  User.findOne {email: o.email}, (err, user) ->
    return cb true if user
    user = new User o
    user.password = bcrypt.hashSync o.password, 8
    user.save cb

userSchema.statics.authenticate = (o, cb) ->
  User.findOne {email: o.email}, (err, user) ->
    return cb true if not user
    isGood = bcrypt.compareSync o.password, user.password
    return cb true if not isGood
    cb null, user

User = mongoose.model 'User', userSchema
module.exports = User
