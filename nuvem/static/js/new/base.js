/**
* Arquivo responsavel pela chamada de todas as funcionalidades do site 
*
* @author: Mateus Moura
* @email: chagas[dot]mateus[at]gmail[dot]com
* @date: 27/03/2018
* 
* Copyright(c) Todos os direitos reservados a 
*/

if (window.console == null) window.console = { log: function (p) { }, error: function (p) { } };

if (!Function.prototype.bind) {
  Function.prototype.bind = function (oThis) {
    if (typeof this !== "function") {
      // closest thing possible to the ECMAScript 5 internal IsCallable function
      throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
    }

    var aArgs = Array.prototype.slice.call(arguments, 1),
      fToBind = this,
      fNOP = function () {},
      fBound = function () {
        return fToBind.apply(this instanceof fNOP && oThis
             ? this
             : oThis,
          aArgs.concat(Array.prototype.slice.call(arguments)));
      };

    fNOP.prototype = this.prototype;
    fBound.prototype = new fNOP();

    return fBound;
  };
}

const site = {
  /*
  * Funcionalidades GLOBAL onde e chamado em todas as páginas do projeto.
  */
  global: () => {
    const _collapse = $('.collapse');

    site.menu();

    // MM.Mascarar();
    // for (var i = _collapse.length - 1; i >= 0; i--) {
    //   MM.Collapsible(_collapse.eq(i), true);
    // };

    // MM.Modal();
    // MM.ValidarFormularios($('form.validate'));

    if($('body').hasClass('home') || $('.page-home').length) {
      site.home();
    }

    setTimeout(() => {
      $('div.loading').fadeOut();
    }, 2000);

    var headerStart = $("header.header").position().top;

    if (!$('.page-institutional, .section-login, .section-reset, .section-register').length) {
        $(window).scroll(function(){
            var position = $(window).scrollTop();

            if(position > headerStart){
                $("#header-slim").stop().animate({  top: 0  }, 500);
                $(".header__content").addClass("header-branca");
            } else {
                $("#header-slim").stop().animate({  top: -140  }, 120);
                $(".header__content").removeClass("header-branca");
            }
        });
    } else {
      $(".header__content").addClass("header-branca");
    }
    // MM.Calendar($('.block__fullcalendar'), data);
  },
  /* Menu functions */
  menu: () => {
    const header = $('header');
    const options = $('.options', header);
    const nav_mobile = $('.nav__bar--mobile');
    const search = $('.header__search', header);

    $('.options__nav a', options).on('click', () => {
      // nav_mobile.find('.nav__bar--links').toggleClass('nav__bar--mobile-expanded');
      // nav_mobile.find('.nav__bar--has-dropdown').toggleClass('nav__bar--expanded');
      nav_mobile.addClass('nav__bar--opended');

      return false;
    });

    $('.btn-close', nav_mobile).on('click', () => {
      nav_mobile.removeClass('nav__bar--opended');

      return false;
    });

    $('.nav__bar--has-dropdown > a', nav_mobile).on('click', (e) => {
      const btn = $(e.currentTarget);

      btn.parents('ul').addClass('nav__bar--mobile-expanded');
      btn.parent().addClass('nav__bar--expanded');

      return false;
    });

    $('.nav__bar--dropdown-close a', nav_mobile).on('click', (e) => {
      const btn = $(e.currentTarget);

      btn.parents('.nav__bar--expanded, .nav__bar--links').removeClass('nav__bar--expanded nav__bar--mobile-expanded');
    });

    $('.nav__bar--has-dropdown', header).on('mouseover', (e) => {
      $(e.currentTarget).addClass('nav-hover');
      header.addClass('dropdown-opened');
    }).on('mouseout', (e) => {
      $(e.currentTarget).removeClass('nav-hover');
      header.removeClass('dropdown-opened');
    });

    $('.options__search a', options).on('click', () => {
      search.addClass('active');

      return false;
    });

    $('.btn-close', search).on('click', () => {
      search.removeClass('active');

      return false;
    });

    if ($('.section-product').length) {
      header.addClass('black');
    }
  },
  /* Home page */
  home: () => {
    const section_video = $('.section__video');

    setTimeout(() => {
      const element = $(section_video[0]);
      element.find('#youtube-player').YTPlayer();


      // for (let i = 0; i < section_video.length; i++) {
      //   const element = $(section_video[i]);
  
      //   if ($.fn.YTPlayer) {
      //     element.find('#youtube-player').YTPlayer();
      //   } else {
      //     element.hide();
      //     element.parent().css('background-image', `url("${element.data('video-poster')}")`);
      //   }
      // }
    }, 2000);
  },
  /*
  * Callback quando salva um evento na modal.
  */
  registerEvent: () => {
    console.log('Callback modal');
  }
}


$(() => {
  site.global();
});