var gulp = require('gulp');
var jade = require('gulp-jade');
var coffee = require('gulp-coffee');
var sass = require('gulp-sass');
var lint = require('gulp-jshint');
var copy = require('gulp-copy');
var maps = require("gulp-sourcemaps");
var watch = require('gulp-watch');
var concat = require("gulp-concat");
var gutil = require('gulp-util');
var babel = require('gulp-babel');

var paths = {
  filesrc:  ['./client/**/*', './server/**/*', './test/**/*'],
  jadesrc:  ['./client/**/*.jade', './client/*.jade'],
  coffeesrc: ['./client/**/*.coffee'],
  scsssrc:  ['./client/**/*.scss', './client/app/modules/components/**/*.scss'],
  lintsrc:  ['./server/**/*.js'],
  babelsrc: ['./client/**/*.js'],
  mediasrc: ['./client/assets/**/*.mp3', './client/assets/**/*.jpg', './client/assets/**/*.wav', './client/assets/**/*.png', './client/assets/**/*.ico'],
  destination: './public'
};

gulp.task('build', ['jade', 'coffee', 'scss', 'lint', 'babel', 'copy']);
gulp.task('default', ['build', 'watch']);


gulp.task('jade', function() {
  gulp.src(paths.jadesrc)
    .pipe(jade({pretty: true, doctype: 'html'}))
    .on('error', gutil.log)
    .pipe(gulp.dest(paths.destination))
});

gulp.task('coffee', function() {
  gulp.src(paths.coffeesrc)
    .pipe(coffee({bare: true})
    .on('error', gutil.log))
    .pipe(gulp.dest(paths.destination))
});

gulp.task('scss', function() {
  gulp.src(paths.scsssrc)
    .pipe(sass())
    .on('error', gutil.log)
    .pipe(gulp.dest(paths.destination))
});

gulp.task('lint', function() {
  gulp.src(paths.lintsrc)
    .pipe(lint())
    .pipe(lint.reporter('jshint-stylish'));
});

gulp.task('babel', function() {
  gulp.src(paths.babelsrc)
    .pipe(maps.init())
    .pipe(concat("index.js"))
    .pipe(babel())
    .on('error', gutil.log)
    .pipe(maps.write("."))
    .pipe(gulp.dest(paths.destination));
});

gulp.task('copy', function() {
  gulp.src(paths.mediasrc)
    .pipe(copy(paths.destination, {prefix:1}));
});

gulp.task('watch', function() {
  watch(paths.filesrc, function() {
    gulp.start('build');
  });
});
