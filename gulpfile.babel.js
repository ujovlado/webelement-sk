import gulp from 'gulp';
import spritesmith from 'gulp.spritesmith';
import imagemin from 'gulp-imagemin';
import buffer from 'vinyl-buffer';

export const createSpeakersSprite = () => {
  const spriteData = gulp.src(['app/images/speakers/*.*']).pipe(spritesmith({
    imgName: 'sprite.png',
    cssName: 'sprite.css'
  }));

  return spriteData.img
    .pipe(buffer())
    .pipe(imagemin())
    .pipe(gulp.dest('app/images/speakers/sprite'));
}
