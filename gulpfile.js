
var gulp = require('gulp');
var less = require('gulp-less');
var del = require('del');
var cssnano = require('gulp-cssnano');
var concatCss = require('gulp-concat-css');
var browserSync = require('browser-sync');
var childProcess = require('child_process');
var rev = require('gulp-rev');
var revReplace = require('gulp-rev-replace');
var spritesmith = require('gulp.spritesmith');
var imagemin = require('gulp-imagemin');
var htmlmin = require('gulp-htmlmin');
var filter = require('gulp-filter');

var paths = {
  jekyll: [
    'app/**/*.md',
    'app/**/*.html',
    'app/**/*.yml',
    'app/**/.htaccess'
  ],
  css: [
    'fontello/build/css/fontello.css',
    'css/main.less'
  ],
  fonts: [
    'fontello/build/font/*.*'
  ],
  site: [
    '_site/**/*.*',
    '_site/**/.*'
  ]
};

gulp.task('clean', function(callback) {
  del(['_build/*', '_site/*'], callback)
});


gulp.task('watch', function() {
  gulp.watch(paths.site, ['site']);
  gulp.watch(paths.jekyll, ['jekyll-incremental']);
  gulp.watch(paths.css, ['css']);
  gulp.watch(paths.fonts, ['fonts']);
});

gulp.task('jekyll', function(callback) {
  browserSync.notify('jekyll');
  childProcess.spawn('jekyll', ['build', '-d', '../_site'], {
    cwd: './app',
    stdio: 'inherit'
  })
  .on('close', callback);
});

gulp.task('jekyll-incremental', function(callback) {
  browserSync.notify('jekyll');
  childProcess.spawn('jekyll', ['build', '-d', '../_site', '-I'], {
        cwd: './app',
        stdio: 'inherit'
      })
      .on('close', callback);
});

gulp.task('fonts', function() {
  return gulp.src(paths.fonts)
    .pipe(gulp.dest('_build/font'));
});

gulp.task('css', function() {
  return gulp.src(paths.css)
    .pipe(less())
    .pipe(concatCss("main.css"))
    .pipe(cssnano())
    .pipe(gulp.dest('_build/css'))
    .pipe(rev())
    .pipe(gulp.dest('_build/css'))
    .pipe(rev.manifest())
    .pipe(gulp.dest('_build/css'))
    .pipe(browserSync.reload({stream:true}))
});

gulp.task('site', function() {
  var htmlFilter = filter('**/*.html', {restore: true});
  return gulp.src(paths.site)
    .pipe(htmlFilter)
    .pipe(htmlmin({
      collapseWhitespace: true,
      conservativeCollapse: true
    }))
    .pipe(htmlFilter.restore)
    .pipe(gulp.dest('_build'));
});

gulp.task('sprite', function () {
  var spriteData = gulp.src(['images/speakers/*.*']).pipe(spritesmith({
    imgName: 'sprite.png',
    cssName: 'sprite.css'
  }));
  return spriteData.pipe(imagemin())
    .pipe(gulp.dest('images/speakers/sprite'));
});

gulp.task("revreplace", [], function() {
  var manifest = gulp.src('_build/css/rev-manifest.json');
  return gulp.src('_build/**/*.html')
    .pipe(revReplace({manifest: manifest}))
    .pipe(gulp.dest('_build'))
});

gulp.task('browser-sync', [], function() {
  browserSync({
    server: {
      baseDir: '_build'
    },
    host: "localhost",
    port: 4000
  });
});

gulp.task('default', ['jekyll', 'css', 'fonts', 'sprite'], function() {
  gulp.start('site', 'watch', 'browser-sync');
});
