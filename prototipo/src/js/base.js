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

    if($('body').hasClass('home')) {
      site.home();
    }
    // MM.Calendar($('.block__fullcalendar'), data);
  },
  /* Menu functions */
  menu: () => {
    const header = $('header');
    const options = $('.options', header);
    const nav_mobile = $('.nav__bar--mobile');

    $('.options__nav a', options).on('click', () => {
      // nav_mobile.find('.nav__bar--links').toggleClass('nav__bar--mobile-expanded');
      // nav_mobile.find('.nav__bar--has-dropdown').toggleClass('nav__bar--expanded');
      nav_mobile.addClass('nav__bar--opended');

      return false;
    });

    $('.btn-close').on('click', () => {
      nav_mobile.removeClass('nav__bar--opended');

      return false;
    });

    $('.nav__bar--has-dropdown a', nav_mobile).on('click', (e) => {
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
  },
  /* Home page */
  home: () => {
    const section_video = $('.section__video');

    console.log('====================================');
    console.log(section_video);
    console.log('====================================');

    for (let i = 0; i < section_video.length; i++) {
      const element = $(section_video[i]);

      if ($.fn.YTPlayer) {
        element.find('#youtube-player').YTPlayer();
      } else {
        element.hide();
        element.parent().css('background-image', `url("${element.data('video-poster')}")`);
      }
      
    }
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