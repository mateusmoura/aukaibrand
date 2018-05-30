const gulp = require('gulp');
const browserSync = require('browser-sync').create();
const sass = require('gulp-sass');
// const watch = require('gulp-watch');
const fileinclude = require('gulp-file-include');
const eslint = require('gulp-eslint');
const sourcemaps = require('gulp-sourcemaps');
const util = require('gulp-util');
const livereload = require('gulp-livereload');

const config = {
  srcDir: 'src/',
  assetDir: 'assets/',
  nuvemDir: '../nuvem/',
  production: !!util.env.production,
  nuvem: !!util.env.nuvem,
};

gulp.task('lint', () =>
  (gulp.src(['**/*.js', '!node_modules/**'])
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError())));

// Include HTML
gulp.task('fileinclude', () => {
  gulp.src([`${config.srcDir}/*.html`])
    .pipe(fileinclude({
      prefix: '@@',
      basepath: '@file',
    }))
    .pipe(gulp.dest(config.production ? `${config.assetDir}/html` : `${config.srcDir}/html`));
});

// Sass to css conversion
gulp.task('sass', () => 
  (gulp.src(`${config.srcDir}/sass/*.scss`)
    .pipe(config.production ? util.noop() : sourcemaps.init())
    .pipe(sass({
      errLogToConsole: true,
      outputStyle: 'expanded',
      sourceComments: 'normal',
    }).on('error', sass.logError))
    .pipe(config.production ? util.noop() : sourcemaps.write('./maps'))
    .pipe(gulp.dest(config.production ? `${config.assetDir}/css` : `${config.srcDir}/css`))
    .pipe(config.production ? util.noop() : browserSync.stream())));

// Sass to css conversion IN NUVEM SHOP
gulp.task('sassnuvem', () => 
  (gulp.src(`${config.nuvemDir}static/sass/*.scss`)
    .pipe(sourcemaps.init())
    .pipe(sass({
      errLogToConsole: true,
      outputStyle: 'expanded',
      sourceComments: 'normal',
    }).on('error', sass.logError))
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest(`${config.nuvemDir}static/css/new/`))
    .pipe(browserSync.stream())));

gulp.task('styles', () => (
  gulp.src(`${config.srcDir}/css/{**/,}*.*`)
    .on('error', sass.logError)
    .pipe(gulp.dest(`${config.assetDir}/css`))
));

gulp.task('images', () => (
  gulp.src(`${config.srcDir}/images/{**/,}*.*`)
    .on('error', sass.logError)
    .pipe(gulp.dest(config.production ? `${config.assetDir}/images` : `${config.assetDir}/images`))
));

gulp.task('plugins', () => (
  gulp.src(`${config.srcDir}/plugins/{**/,}*.*`)
    .on('error', sass.logError)
    .pipe(gulp.dest(`${config.assetDir}/plugins`))
));

gulp.task('js', () => (
  gulp.src(`${config.srcDir}/js/base.js`)
    .on('error', sass.logError)
    .pipe(browserify({
      insertGlobals : true,
      debug : true,
    }))
    .pipe(concat('main.js'))
    .pipe(gulp.dest(config.production ? `${config.assetDir}/js` : `${config.srcDir}/js`))
));

gulp.task('javascript', () => (
  gulp.src(`${config.srcDir}/js/{**/,}*.*`)
    .on('error', sass.logError)
    .pipe(gulp.dest(`${config.assetDir}/js`))
));

const serverTasks = config.nuvem ? ['sassnuvem'] : ['sass', 'fileinclude'];

// Static Server + hot reload + watching scss/js/html files
gulp.task('serve', serverTasks, () => {
  browserSync.init({
    server: {
      baseDir: config.srcDir,
    },
    port: 9595,
  });
  if (config.nuvem) {
    gulp.watch([`${config.nuvemDir}static/sass/*.scss`, `${config.nuvemDir}static/sass/*/*.scss`], ['sassnuvem']);
  } else {
    gulp.watch([`${config.srcDir}/sass/*.scss`, `${config.srcDir}/sass/*/*.scss`], ['sass']);
    gulp.watch([`${config.srcDir}/js/*.js`, `${config.srcDir}/js/{**/,}*.js`], ['js']);
    gulp.watch([`${config.srcDir}/*.html`, `${config.srcDir}/includes/*.html`], ['fileinclude']).on('change', () => {
      setTimeout(() => {
        browserSync.reload();
      }, 1000);
    });
  }
});

const tasks = config.production ? ['sass', 'fileinclude', 'images', 'javascript'] : ['serve'];

gulp.task('default', tasks);