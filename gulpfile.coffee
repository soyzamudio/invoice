gulp = require 'gulp'
$ = require('gulp-load-plugins')()
browserSync = require('browser-sync').create()

paths =
  filesrc: ['./client/**/*', './server/**/*', './test/**/*']
  jadesrc:  ['./client/**/*.jade', './client/*.jade']
  coffeesrc: ['./client/**/*.coffee']
  scsssrc:  ['./client/**/*.scss', './client/app/modules/components/**/*.scss']
  lintsrc:  ['./server/**/*.js']
  babelsrc: ['./client/**/*.js']
  mediasrc: ['./client/assets/**/*.mp3', './client/assets/**/*.jpg', './client/assets/**/*.wav', './client/assets/**/*.png', './client/assets/**/*.ico']
  destination: './public'

gulp.task 'scss', ->
  gulp.src paths.scsssrc
  .pipe $.sass style: 'expanded'
  .pipe $.autoprefixer 'last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1'
  .pipe $.rename suffix: '.min'
  .pipe $.minifyCss()
  .pipe gulp.dest paths.destination
  .pipe browserSync.stream()

gulp.task 'jade', ->
  gulp.src paths.jadesrc
  .pipe $.jade
    pretty: true
    doctype: 'html'
  .on 'error', $.util.log
  .pipe gulp.dest paths.destination
  .pipe browserSync.stream()

gulp.task 'coffee', ->
  gulp.src paths.coffeesrc
  .pipe $.coffee bare: true
  .pipe $.concat 'index.js'
  .on 'error', $.util.log
  .pipe gulp.dest paths.destination
  .pipe browserSync.stream()

gulp.task 'copy', ->
  gulp.src paths.mediasrc
  .pipe $.copy paths.destination, prefix:1

gulp.task 'watch', ->
  gulp.watch paths.scsssrc, ['scss']
  gulp.watch paths.jadesrc, ['jade']
  gulp.watch paths.coffeesrc, ['coffee']

gulp.task 'default', ['scss', 'jade', 'coffee', 'copy', 'watch'], ->
  browserSync.init
    server:
      baseDir: paths.destination
