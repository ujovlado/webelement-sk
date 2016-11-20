
var gulp = require('gulp');
var spritesmith = require('gulp.spritesmith');
var imagemin = require('gulp-imagemin');

gulp.task('create-speakers-sprite', function () {
  var spriteData = gulp.src(['app/images/speakers/*.*']).pipe(spritesmith({
    imgName: 'sprite.png',
    cssName: 'sprite.css'
  }));
  return spriteData.pipe(imagemin())
    .pipe(gulp.dest('app/images/speakers/sprite'));
});
