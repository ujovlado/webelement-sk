
var gulp = require('gulp');
var less = require('gulp-less');
var del = require('del');
var cssnano = require('gulp-cssnano');
var concatCss = require('gulp-concat-css');
var browserSync = require('browser-sync').create();
var childProcess = require('child_process');
var rev = require('gulp-rev');
var revReplace = require('gulp-rev-replace');
var spritesmith = require('gulp.spritesmith');
var imagemin = require('gulp-imagemin');
var htmlmin = require('gulp-htmlmin');
var filter = require('gulp-filter');
var changed = require('gulp-changed');
var runSequence = require('run-sequence');

var paths = {
  jekyll: [
    'app/_data/*.yml',
    'app/_includes/*.html',
    'app/_layouts/*.html',
    'app/_posts/*.md',
    'app/images/ad/*.*',
    'app/images/events/*.*',
    'app/images/similar/*.*',
    'app/images/*.*',
    'app/.*',
    'app/*.*'
  ],
  css: [
    'fontello/build/css/fontello.css',
    'css/main.less'
  ],
  fonts: [
    'fontello/build/font/*.*'
  ],
  images: [
    'app/images/speakers/*.*'
  ],
  site: [
    '_site/**/*.*',
    '_site/**/.*',
    '!_site/**/*.html'
  ],
  siteHtml: [
    '_site/**/*.html'
  ]
};

gulp.task('clean', function(callback) {
  del(['_build', '_site'], callback)
});

gulp.task('watch', ['initial'],function() {
  gulp.watch(paths.siteHtml, ['copy-site-html-and-minify']);
  gulp.watch(paths.site, ['copy-site-files']);
  gulp.watch(paths.images, ['copy-app-images']);
  gulp.watch(paths.jekyll, ['jekyll']);
  gulp.watch(paths.css, ['css']);
  gulp.watch(paths.fonts, ['fonts']);
});

gulp.task('jekyll', function(callback) {
  browserSync.notify('jekyll build standard');
  childProcess.spawn('jekyll', ['build', '-d', '../_site'], {
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

gulp.task('copy-site-files', function() {
  return gulp.src(paths.site)
    .pipe(changed('_build', {hasChanged: changed.compareSha1Digest}))
    .pipe(gulp.dest('_build'));
});

gulp.task('copy-site-html-and-minify', function() {
  return gulp.src(paths.siteHtml)
    .pipe(htmlmin({
      collapseWhitespace: true,
      conservativeCollapse: true
    }))
    .pipe(changed('_build', {hasChanged: changed.compareSha1Digest}))
    .pipe(gulp.dest('_build'))
    .pipe(browserSync.reload({stream:true}))
});

gulp.task('create-speakers-sprite', function () {
  var spriteData = gulp.src(['app/images/speakers/*.*']).pipe(spritesmith({
    imgName: 'sprite.png',
    cssName: 'sprite.css'
  }));
  return spriteData.pipe(imagemin())
    .pipe(gulp.dest('app/images/speakers/sprite'));
});

gulp.task('copy-app-images', ['create-speakers-sprite'], function() {
  return gulp.src('app/images/speakers/**/*.*')
    .pipe(changed('_site/images/speakers', {hasChanged: changed.compareSha1Digest}))
    .pipe(gulp.dest('_site/images/speakers'));
});

gulp.task('initial', function(callback) {
  runSequence('jekyll', 'copy-app-images',
    ['css', 'fonts'],
    ['copy-site-files', 'copy-site-html-and-minify'],
    callback);
});

gulp.task("revreplace", [], function() {
  var manifest = gulp.src('_build/css/rev-manifest.json');
  return gulp.src('_build/**/*.html')
    .pipe(revReplace({manifest: manifest}))
    .pipe(gulp.dest('_build'))
});

gulp.task('browser-sync', ['watch'],function() {
  browserSync.init({
    server: '_build',
    host: "localhost",
    port: 4000,
    online: false
  });
});

gulp.task('default', ['browser-sync', 'watch']);
