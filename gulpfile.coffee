gulp = require 'gulp'
$ = require('gulp-load-plugins')()
angularInjector = require 'gulp-angular-injector'

paths =
  filesrc: ['./client/**/*', './server/**/*']
  jadesrc:  ['./client/**/*.jade', './client/*.jade']
  coffeesrc: ['./client/**/*.coffee']
  serversrc: ['./server/**/*.coffee']
  scsssrc:  ['./client/**/*.scss', './client/app/modules/components/**/*.scss']
  lintsrc:  ['./server/**/*.js']
  babelsrc: ['./client/**/*.js']
  mediasrc: ['./client/assets/**/*.mp3', './client/assets/**/*.jpg', './client/assets/**/*.wav', './client/assets/**/*.png', './client/assets/**/*.ico']
  client: './build/client'
  server: './build/server'

gulp.task 'jade', ->
  gulp.src paths.jadesrc
  .pipe $.jade
    pretty: true
    doctype: 'html'
  .on 'error', $.util.log
  .pipe gulp.dest paths.client

gulp.task 'coffee', ->
  gulp.src paths.coffeesrc
  .pipe $.coffee bare: true
  .pipe $.concat 'index.js'
  .on 'error', $.util.log
  .pipe gulp.dest paths.client

gulp.task 'templates', ->
  gulp.src paths.coffeesrc
  .pipe angularInjector()
  .pipe gulp.dest paths.client

gulp.task 'scss', ->
  gulp.src paths.scsssrc
  .pipe $.sass style: 'expanded'
  .pipe $.autoprefixer 'last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1'
  .pipe $.rename suffix: '.min'
  .pipe $.minifyCss()
  .pipe gulp.dest paths.client

gulp.task 'copy', ->
  gulp.src paths.mediasrc
  .pipe $.copy paths.client, prefix:1

gulp.task 'server', ->
  gulp.src paths.serversrc
  .pipe $.coffee bare: true
  .on 'error', $.util.log
  .pipe gulp.dest paths.server

gulp.task 'watch', ->
  gulp.watch paths.scsssrc, ['scss']
  gulp.watch paths.jadesrc, ['jade']
  gulp.watch paths.coffeesrc, ['coffee']

gulp.task 'default', ['server', 'scss', 'jade', 'coffee', 'templates', 'copy', 'watch'], ->
