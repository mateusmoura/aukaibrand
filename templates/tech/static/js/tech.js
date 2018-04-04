/**
 * hoverIntent is similar to jQuery's built-in "hover" method except that
 * instead of firing the handlerIn function immediately, hoverIntent checks
 * to see if the user's mouse has slowed down (beneath the sensitivity
 * threshold) before firing the event. The handlerOut function is only
 * called after a matching handlerIn.
 *
 * hoverIntent r7 // 2013.03.11 // jQuery 1.9.1+
 * http://cherne.net/brian/resources/jquery.hoverIntent.html
 *
 * You may use hoverIntent under the terms of the MIT license. Basically that
 * means you are free to use hoverIntent as long as this header is left intact.
 * Copyright 2007, 2013 Brian Cherne
 *
 * // basic usage ... just like .hover()
 * .hoverIntent( handlerIn, handlerOut )
 * .hoverIntent( handlerInOut )
 *
 * // basic usage ... with event delegation!
 * .hoverIntent( handlerIn, handlerOut, selector )
 * .hoverIntent( handlerInOut, selector )
 *
 * // using a basic configuration object
 * .hoverIntent( config )
 *
 * @param  handlerIn   function OR configuration object
 * @param  handlerOut  function OR selector for delegation OR undefined
 * @param  selector    selector OR undefined
 * @author Brian Cherne <brian(at)cherne(dot)net>
 **/
(function($) {
    $.fn.hoverIntent = function(handlerIn,handlerOut,selector) {

        // default configuration values
        var cfg = {
            interval: 100,
            sensitivity: 7,
            timeout: 0
        };

        if ( typeof handlerIn === "object" ) {
            cfg = $.extend(cfg, handlerIn );
        } else if ($.isFunction(handlerOut)) {
            cfg = $.extend(cfg, { over: handlerIn, out: handlerOut, selector: selector } );
        } else {
            cfg = $.extend(cfg, { over: handlerIn, out: handlerIn, selector: handlerOut } );
        }

        // instantiate variables
        // cX, cY = current X and Y position of mouse, updated by mousemove event
        // pX, pY = previous X and Y position of mouse, set by mouseover and polling interval
        var cX, cY, pX, pY;

        // A private function for getting mouse position
        var track = function(ev) {
            cX = ev.pageX;
            cY = ev.pageY;
        };

        // A private function for comparing current and previous mouse position
        var compare = function(ev,ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            // compare mouse positions to see if they've crossed the threshold
            if ( ( Math.abs(pX-cX) + Math.abs(pY-cY) ) < cfg.sensitivity ) {
                $(ob).off("mousemove.hoverIntent",track);
                // set hoverIntent state to true (so mouseOut can be called)
                ob.hoverIntent_s = 1;
                return cfg.over.apply(ob,[ev]);
            } else {
                // set previous coordinates for next time
                pX = cX; pY = cY;
                // use self-calling timeout, guarantees intervals are spaced out properly (avoids JavaScript timer bugs)
                ob.hoverIntent_t = setTimeout( function(){compare(ev, ob);} , cfg.interval );
            }
        };

        // A private function for delaying the mouseOut function
        var delay = function(ev,ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            ob.hoverIntent_s = 0;
            return cfg.out.apply(ob,[ev]);
        };

        // A private function for handling mouse 'hovering'
        var handleHover = function(e) {
            // copy objects to be passed into t (required for event object to be passed in IE)
            var ev = jQuery.extend({},e);
            var ob = this;

            // cancel hoverIntent timer if it exists
            if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); }

            // if e.type == "mouseenter"
            if (e.type == "mouseenter") {
                // set "previous" X and Y position based on initial entry point
                pX = ev.pageX; pY = ev.pageY;
                // update "current" X and Y position based on mousemove
                $(ob).on("mousemove.hoverIntent",track);
                // start polling interval (self-calling timeout) to compare mouse coordinates over time
                if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout( function(){compare(ev,ob);} , cfg.interval );}

                // else e.type == "mouseleave"
            } else {
                // unbind expensive mousemove event
                $(ob).off("mousemove.hoverIntent",track);
                // if hoverIntent state is true, then call the mouseOut function after the specified delay
                if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout( function(){delay(ev,ob);} , cfg.timeout );}
            }
        };

        // listen for mouseenter and mouseleave
        return this.on({'mouseenter.hoverIntent':handleHover,'mouseleave.hoverIntent':handleHover}, cfg.selector);
    };
})(jQuery);

/*
 * jQuery Superfish Menu Plugin
 * Copyright (c) 2013 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 *	http://www.opensource.org/licenses/mit-license.php
 *	http://www.gnu.org/licenses/gpl.html
 */

(function ($) {
    "use strict";

    var methods = (function () {
        // private properties and methods go here
        var c = {
                bcClass: 'sf-breadcrumb',
                menuClass: 'sf-js-enabled',
                anchorClass: 'sf-with-ul',
                menuArrowClass: 'sf-arrows'
            },
            ios = (function () {
                var ios = /iPhone|iPad|iPod/i.test(navigator.userAgent);
                if (ios) {
                    // iOS clicks only bubble as far as body children
                    $(window).load(function () {
                        $('body').children().on('click', $.noop);
                    });
                }
                return ios;
            })(),
            wp7 = (function () {
                var style = document.documentElement.style;
                return ('behavior' in style && 'fill' in style && /iemobile/i.test(navigator.userAgent));
            })(),
            toggleMenuClasses = function ($menu, o) {
                var classes = c.menuClass;
                if (o.cssArrows) {
                    classes += ' ' + c.menuArrowClass;
                }
                $menu.toggleClass(classes);
            },
            setPathToCurrent = function ($menu, o) {
                return $menu.find('li.' + o.pathClass).slice(0, o.pathLevels)
                    .addClass(o.hoverClass + ' ' + c.bcClass)
                    .filter(function () {
                        return ($(this).children(o.popUpSelector).hide().show().length);
                    }).removeClass(o.pathClass);
            },
            toggleAnchorClass = function ($li) {
                $li.children('a').toggleClass(c.anchorClass);
            },
            toggleTouchAction = function ($menu) {
                var touchAction = $menu.css('ms-touch-action');
                touchAction = (touchAction === 'pan-y') ? 'auto' : 'pan-y';
                $menu.css('ms-touch-action', touchAction);
            },
            applyHandlers = function ($menu, o) {
                var targets = 'li:has(' + o.popUpSelector + ')';
                if ($.fn.hoverIntent && !o.disableHI) {
                    $menu.hoverIntent(over, out, targets);
                }
                else {
                    $menu
                        .on('mouseenter.superfish', targets, over)
                        .on('mouseleave.superfish', targets, out);
                }
                var touchevent = 'MSPointerDown.superfish';
                if (!ios) {
                    touchevent += ' touchend.superfish';
                }
                if (wp7) {
                    touchevent += ' mousedown.superfish';
                }
                $menu
                    .on('focusin.superfish', 'li', over)
                    .on('focusout.superfish', 'li', out)
                    .on(touchevent, 'a', o, touchHandler);
            },
            touchHandler = function (e) {
                var $this = $(this),
                    $ul = $this.siblings(e.data.popUpSelector);

                if ($ul.length > 0 && $ul.is(':hidden')) {
                    $this.one('click.superfish', false);
                    if (e.type === 'MSPointerDown') {
                        $this.trigger('focus');
                    } else {
                        $.proxy(over, $this.parent('li'))();
                    }
                }
            },
            over = function () {
                var $this = $(this),
                    o = getOptions($this);
                clearTimeout(o.sfTimer);
                $this.siblings().superfish('hide').end().superfish('show');
            },
            out = function () {
                var $this = $(this),
                    o = getOptions($this);
                if (ios) {
                    $.proxy(close, $this, o)();
                }
                else {
                    clearTimeout(o.sfTimer);
                    o.sfTimer = setTimeout($.proxy(close, $this, o), o.delay);
                }
            },
            close = function (o) {
                o.retainPath = ($.inArray(this[0], o.$path) > -1);
                this.superfish('hide');

                if (!this.parents('.' + o.hoverClass).length) {
                    o.onIdle.call(getMenu(this));
                    if (o.$path.length) {
                        $.proxy(over, o.$path)();
                    }
                }
            },
            getMenu = function ($el) {
                return $el.closest('.' + c.menuClass);
            },
            getOptions = function ($el) {
                return getMenu($el).data('sf-options');
            };

        return {
            // public methods
            hide: function (instant) {
                if (this.length) {
                    var $this = this,
                        o = getOptions($this);
                    if (!o) {
                        return this;
                    }
                    var not = (o.retainPath === true) ? o.$path : '',
                        $ul = $this.find('li.' + o.hoverClass).add(this).not(not).removeClass(o.hoverClass).children(o.popUpSelector),
                        speed = o.speedOut;

                    if (instant) {
                        $ul.show();
                        speed = 0;
                    }
                    o.retainPath = false;
                    o.onBeforeHide.call($ul);
                    $ul.stop(true, true).animate(o.animationOut, speed, function () {
                        var $this = $(this);
                        o.onHide.call($this);
                    });
                }
                return this;
            },
            show: function () {
                var o = getOptions(this);
                if (!o) {
                    return this;
                }
                var $this = this.addClass(o.hoverClass),
                    $ul = $this.children(o.popUpSelector);

                o.onBeforeShow.call($ul);
                $ul.stop(true, true).animate(o.animation, o.speed, function () {
                    o.onShow.call($ul);
                });
                return this;
            },
            destroy: function () {
                return this.each(function () {
                    var $this = $(this),
                        o = $this.data('sf-options'),
                        $hasPopUp;
                    if (!o) {
                        return false;
                    }
                    $hasPopUp = $this.find(o.popUpSelector).parent('li');
                    clearTimeout(o.sfTimer);
                    toggleMenuClasses($this, o);
                    toggleAnchorClass($hasPopUp);
                    toggleTouchAction($this);
                    // remove event handlers
                    $this.off('.superfish').off('.hoverIntent');
                    // clear animation's inline display style
                    $hasPopUp.children(o.popUpSelector).attr('style', function (i, style) {
                        return style.replace(/display[^;]+;?/g, '');
                    });
                    // reset 'current' path classes
                    o.$path.removeClass(o.hoverClass + ' ' + c.bcClass).addClass(o.pathClass);
                    $this.find('.' + o.hoverClass).removeClass(o.hoverClass);
                    o.onDestroy.call($this);
                    $this.removeData('sf-options');
                });
            },
            init: function (op) {
                return this.each(function () {
                    var $this = $(this);
                    if ($this.data('sf-options')) {
                        return false;
                    }
                    var o = $.extend({}, $.fn.superfish.defaults, op),
                        $hasPopUp = $this.find(o.popUpSelector).parent('li');
                    o.$path = setPathToCurrent($this, o);

                    $this.data('sf-options', o);

                    toggleMenuClasses($this, o);
                    toggleAnchorClass($hasPopUp);
                    toggleTouchAction($this);
                    applyHandlers($this, o);

                    $hasPopUp.not('.' + c.bcClass).superfish('hide', true);

                    o.onInit.call(this);
                });
            }
        };
    })();

    $.fn.superfish = function (method, args) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        }
        else if (typeof method === 'object' || ! method) {
            return methods.init.apply(this, arguments);
        }
        else {
            return $.error('Method ' +  method + ' does not exist on jQuery.fn.superfish');
        }
    };

    $.fn.superfish.defaults = {
        popUpSelector: 'ul,.sf-mega', // within menu context
        hoverClass: 'sfHover',
        pathClass: 'overrideThisToUse',
        pathLevels: 1,
        delay: 800,
        animation: {opacity: 'show'},
        animationOut: {opacity: 'hide'},
        speed: 'normal',
        speedOut: 'fast',
        cssArrows: true,
        disableHI: false,
        onInit: $.noop,
        onBeforeShow: $.noop,
        onShow: $.noop,
        onBeforeHide: $.noop,
        onHide: $.noop,
        onIdle: $.noop,
        onDestroy: $.noop
    };

    // soon to be deprecated
    $.fn.extend({
        hideSuperfishUl: methods.hide,
        showSuperfishUl: methods.show
    });

})(jQuery);


/*
 * Supersubs v0.3b - jQuery plugin
 * Copyright (c) 2013 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 * 	http://www.opensource.org/licenses/mit-license.php
 * 	http://www.gnu.org/licenses/gpl.html
 *
 *
 * This plugin automatically adjusts submenu widths of suckerfish-style menus to that of
 * their longest list item children. If you use this, please expect bugs and report them
 * to the jQuery Google Group with the word 'Superfish' in the subject line.
 *
 */

;(function($){ // $ will refer to jQuery within this closure

    $.fn.supersubs = function(options){
        var opts = $.extend({}, $.fn.supersubs.defaults, options);
        // return original object to support chaining
        return this.each(function() {
            // cache selections
            var $$ = $(this);
            // support metadata
            var o = $.meta ? $.extend({}, opts, $$.data()) : opts;
            // cache all ul elements and show them in preparation for measurements
            $ULs = $$.find('ul').show();
            // get the font size of menu.
            // .css('fontSize') returns various results cross-browser, so measure an em dash instead
            var fontsize = $('<li id="menu-fontsize">&#8212;</li>').css({
                'padding' : 0,
                'position' : 'absolute',
                'top' : '-999em',
                'width' : 'auto'
            }).appendTo($$)[0].clientWidth; //clientWidth is faster than .width()
            // remove em dash
            $('#menu-fontsize').remove();
            // loop through each ul in menu
            $ULs.each(function(i) {
                // cache this ul
                var $ul = $(this);
                // get all (li) children of this ul
                var $LIs = $ul.children();
                // get all anchor grand-children
                var $As = $LIs.children('a');
                // force content to one line and save current float property
                var liFloat = $LIs.css('white-space','nowrap').css('float');
                // remove width restrictions and floats so elements remain vertically stacked
                $ul.add($LIs).add($As).css({
                    'float' : 'none',
                    'width'	: 'auto'
                });
                // this ul will now be shrink-wrapped to longest li due to position:absolute
                // so save its width as ems.
                var emWidth = $ul[0].clientWidth / fontsize;
                // add more width to ensure lines don't turn over at certain sizes in various browsers
                emWidth += o.extraWidth;
                // restrict to at least minWidth and at most maxWidth
                if (emWidth > o.maxWidth)		{ emWidth = o.maxWidth; }
                else if (emWidth < o.minWidth)	{ emWidth = o.minWidth; }
                emWidth += 'em';
                // set ul to width in ems
                $ul.css('width',emWidth);
                // restore li floats to avoid IE bugs
                // set li width to full width of this ul
                // revert white-space to normal
                $LIs.css({
                    'float' : liFloat,
                    'width' : '100%',
                    'white-space' : 'normal'
                })
                    // update offset position of descendant ul to reflect new width of parent.
                    // set it to 100% in case it isn't already set to this in the CSS
                    .each(function(){
                        var $childUl = $(this).children('ul');
                        var offsetDirection = $childUl.css('left') !== undefined ? 'left' : 'right';
                        $childUl.css(offsetDirection,'100%');
                    });
            }).hide();

        });
    };
    // expose defaults
    $.fn.supersubs.defaults = {
        minWidth		: 9,		// requires em unit.
        maxWidth		: 25,		// requires em unit.
        extraWidth		: 0			// extra width can ensure lines don't sometimes turn over due to slight browser differences in how they round-off values
    };

})(jQuery); // plugin code ends

//////////////////////////////////////////////////////////////////////////////////
// Cloud Zoom V1.0.2.5
// (c) 2010 by R Cecco. <http://www.professorcloud.com>
// with enhancements by Philipp Andreas <https://github.com/smurfy/cloud-zoom>
//
// MIT License
//
// Please retain this copyright header in all versions of the software
//////////////////////////////////////////////////////////////////////////////////
(function($){function format(e){for(var t=1;t<arguments.length;t++){e=e.replace("%"+(t-1),arguments[t])}return e}function CloudZoom(e,t){var n=$("img",e);var r;var i;var s=null;var o=null;var u=null;var a=null;var f=null;var l=null;var c;var h=0;var p,d;var v=0;var m=0;var g=0;var y=0;var b=0;var w,E;var S=this,x;setTimeout(function(){if(o===null){var t=e.width();e.parent().append(format('<div style="width:%0px;position:absolute;top:75%;left:%1px;text-align:center" class="cloud-zoom-loading" >Loading...</div>',t/3,t/2-t/6)).find(":last").css("opacity",.5)}},200);var T=function(){if(l!==null){l.remove();l=null}};this.removeBits=function(){if(u){u.remove();u=null}if(a){a.remove();a=null}if(f){f.remove();f=null}T();$(".cloud-zoom-loading",e.parent()).remove()};this.destroy=function(){e.data("zoom",null);if(o){o.unbind();o.remove();o=null}if(s){s.remove();s=null}this.removeBits()};this.fadedOut=function(){if(s){s.remove();s=null}this.removeBits()};this.controlLoop=function(){if(u){var e=w-n.offset().left-p*.5>>0;var r=E-n.offset().top-d*.5>>0;if(e<0){e=0}else if(e>n.outerWidth()-p){e=n.outerWidth()-p}if(r<0){r=0}else if(r>n.outerHeight()-d){r=n.outerHeight()-d}u.css({left:e,top:r});u.css("background-position",-e+"px "+ -r+"px");v=e/n.outerWidth()*c.width>>0;m=r/n.outerHeight()*c.height>>0;y+=(v-y)/t.smoothMove;g+=(m-g)/t.smoothMove;s.css("background-position",-(y>>0)+"px "+(-(g>>0)+"px"))}h=setTimeout(function(){S.controlLoop()},30)};this.init2=function(e,t){b++;if(t===1){c=e}if(b===2){this.init()}};this.init=function(){$(".cloud-zoom-loading",e.parent()).remove();o=e.parent().append(format("<div class='mousetrap' style='background-image:url(\""+t.transparentImage+"\");z-index:999;position:absolute;width:%0px;height:%1px;left:%2px;top:%3px;'></div>",n.outerWidth(),n.outerHeight(),0,0)).find(":last");o.bind("mousemove",this,function(e){w=e.pageX;E=e.pageY});o.bind("mouseleave",this,function(e){clearTimeout(h);if(u){u.fadeOut(299)}if(a){a.fadeOut(299)}if(f){f.fadeOut(299)}s.fadeOut(300,function(){S.fadedOut()});return false});o.bind("mouseenter",this,function(r){w=r.pageX;E=r.pageY;x=r.data;if(s){s.stop(true,false);s.remove()}var i=t.adjustX,h=t.adjustY;var v=n.outerWidth();var m=n.outerHeight();var g=t.zoomWidth;var y=t.zoomHeight;if(t.zoomWidth=="auto"){g=v}if(t.zoomHeight=="auto"){y=m}var b=e.parent();switch(t.position){case"top":h-=y;break;case"right":i+=v;break;case"bottom":h+=m;break;case"left":i-=g;break;case"inside":g=v;y=m;break;default:b=$("#"+t.position);if(!b.length){b=e;i+=v;h+=m}else{g=b.innerWidth();y=b.innerHeight()}}s=b.append(format('<div id="cloud-zoom-big" class="cloud-zoom-big" style="display:none;position:absolute;left:%0px;top:%1px;width:%2px;height:%3px;background-image:url(\'%4\');z-index:99;"></div>',i,h,g,y,c.src)).find(":last");if(n.attr("title")&&t.showTitle){s.append(format('<div class="cloud-zoom-title">%0</div>',n.attr("title"))).find(":last").css("opacity",t.titleOpacity)}var S=/(msie) ([\w.]+)/.exec(navigator.userAgent);if(S){if((S[1]||"")=="msie"&&(S[2]||"0")<7){l=$('<iframe frameborder="0" src="#"></iframe>').css({position:"absolute",left:i,top:h,zIndex:99,width:g,height:y}).insertBefore(s)}}s.fadeIn(500);if(u){u.remove();u=null}p=n.outerWidth()/c.width*s.width();d=n.outerHeight()/c.height*s.height();u=e.append(format("<div class = 'cloud-zoom-lens' style='display:none;z-index:98;position:absolute;width:%0px;height:%1px;'></div>",p,d)).find(":last");o.css("cursor",u.css("cursor"));var T=false;if(t.tint){u.css("background",'url("'+n.attr("src")+'")');a=e.append(format('<div style="display:none;position:absolute; left:0px; top:0px; width:%0px; height:%1px; background-color:%2;" />',n.outerWidth(),n.outerHeight(),t.tint)).find(":last");a.css("opacity",t.tintOpacity);T=true;a.fadeIn(500)}if(t.softFocus){u.css("background",'url("'+n.attr("src")+'")');f=e.append(format('<div style="position:absolute;display:none;top:2px; left:2px; width:%0px; height:%1px;" />',n.outerWidth()-2,n.outerHeight()-2,t.tint)).find(":last");f.css("background",'url("'+n.attr("src")+'")');f.css("opacity",.5);T=true;f.fadeIn(500)}if(!T){u.css("opacity",t.lensOpacity)}if(t.position!=="inside"){u.fadeIn(500)}x.controlLoop();return})};r=new Image;$(r).load(function(){S.init2(this,0)});r.src=n.attr("src");i=new Image;$(i).load(function(){S.init2(this,1)});i.src=e.attr("href")}$(document).ready(function(){$(".cloud-zoom, .cloud-zoom-gallery").CloudZoom()});$.fn.CloudZoom=function(options){try{document.execCommand("BackgroundImageCache",false,true)}catch(e){}this.each(function(){var relOpts,opts;eval("var	a = {"+$(this).attr("rel")+"}");relOpts=a;if($(this).is(".cloud-zoom")){opts=$.extend({},$.fn.CloudZoom.defaults,options);opts=$.extend({},opts,relOpts);$(this).css({position:"relative",display:"block"});$("img",$(this)).css({display:"block"});if(!$(this).parent().hasClass("cloud-zoom-wrap")&&opts.useWrapper){$(this).wrap('<div class="cloud-zoom-wrap"></div>')}$(this).data("zoom",new CloudZoom($(this),opts))}else if($(this).is(".cloud-zoom-gallery")){opts=$.extend({},relOpts,options);$(this).data("relOpts",opts);$(this).bind("click",$(this),function(e){var t=e.data.data("relOpts");$("#"+t.useZoom).data("zoom").destroy();$("#"+t.useZoom).attr("href",e.data.attr("href"));$("#"+t.useZoom+" img").attr("src",e.data.data("relOpts").smallImage);$("#"+e.data.data("relOpts").useZoom).CloudZoom();return false})}});return this};$.fn.CloudZoom.defaults={zoomWidth:"auto",zoomHeight:"auto",position:"right",transparentImage:".",useWrapper:true,tint:false,tintOpacity:.5,lensOpacity:.5,softFocus:false,smoothMove:3,showTitle:true,titleOpacity:.5,adjustX:0,adjustY:0}})(jQuery);

/* == malihu jquery thumbnail scroller plugin == Version: 2.0.2, License: MIT License (MIT) */
!function(t,e){var n,a="mThumbnailScroller",i="mTS",o=".mThumbnailScroller",r={setTop:0,setLeft:0,type:"hover-50",axis:"x",speed:15,contentTouchScroll:25,markup:{buttonsPlaceholder:!1,buttonsHTML:{up:"SVG set 1",down:"SVG set 1",left:"SVG set 1",right:"SVG set 1"}},advanced:{autoExpandHorizontalScroll:!0,updateOnContentResize:!0,updateOnImageLoad:!0},theme:"none",callbacks:{onTotalScrollOffset:0,onTotalScrollBackOffset:0,alwaysTriggerOffsets:!0}},l=0,s={},c=e.attachEvent&&!e.addEventListener?1:0,d=!1,u=["mTS_disabled","mTS_destroyed","mTS_no_scroll"],h={init:function(e){var e=t.extend(!0,{},r,e),n=f.call(this);if(e.live){var a=e.liveSelector||this.selector||o,c=t(a);if("off"===e.live)return void m(a);s[a]=setTimeout(function(){c.mThumbnailScroller(e),"once"===e.live&&c.length&&m(a)},500)}else m(a);return e.speed=0===e.speed?100:e.speed,p(e),t(n).each(function(){var n=t(this);if(!n.data(i)){n.data(i,{idx:++l,opt:e,html:null,overflowed:null,bindEvents:!1,tweenRunning:!1,langDir:n.css("direction"),cbOffsets:null,trigger:null});var a=n.data(i).opt,o=n.data("mts-axis"),r=n.data("mts-type"),s=n.data("mts-theme");o&&(a.axis=o),r&&(a.type=r),s&&(a.theme=s,p(a)),v.call(this),h.update.call(null,n)}})},update:function(e){var n=e||f.call(this);return t(n).each(function(){var e=t(this);if(e.data(i)){var n=e.data(i),a=n.opt,o=t("#mTS_"+n.idx+"_container");if(!o.length)return;n.tweenRunning&&F(e),e.hasClass(u[0])&&e.removeClass(u[0]),e.hasClass(u[1])&&e.removeClass(u[1]),w.call(this),x.call(this),n.overflowed=b.call(this),C.call(this),y.call(this);var r=[o[0].offsetTop,o[0].offsetLeft];"x"!==a.axis&&(n.overflowed[0]?R(e,r[0].toString(),{dir:"y",dur:0,overwrite:"none"}):(_.call(this),"y"===a.axis?(R(e,"0",{dir:"y",dur:0,overwrite:"none"}),M.call(this)):"yx"===a.axis&&n.overflowed[1]&&R(e,r[1].toString(),{dir:"x",dur:0,overwrite:"none"}))),"y"!==a.axis&&(n.overflowed[1]?R(e,r[1].toString(),{dir:"x",dur:0,overwrite:"none"}):(_.call(this),"x"===a.axis?(R(e,"0",{dir:"x",dur:0,overwrite:"none"}),M.call(this)):"yx"===a.axis&&n.overflowed[0]&&R(e,r[0].toString(),{dir:"y",dur:0,overwrite:"none"}))),n.overflowed[0]||n.overflowed[1]?e.removeClass(u[2]):e.addClass(u[2]),D.call(this)}})},scrollTo:function(e,n){if("undefined"!=typeof e&&null!=e){var a=f.call(this);return t(a).each(function(){var a=t(this);if(a.data(i)){var o=a.data(i),r=o.opt,l={trigger:"external",speed:r.speed,duration:1e3,easing:"easeInOut",timeout:60,callbacks:!0,onStart:!0,onUpdate:!0,onComplete:!0},s=t.extend(!0,{},l,n),c=P.call(this,e),d=s.duration?s.duration:7e3/(s.speed||1);c[0]=E.call(this,c[0],"y"),c[1]=E.call(this,c[1],"x"),s.dur=d>0&&17>d?17:d,setTimeout(function(){null!==c[0]&&"undefined"!=typeof c[0]&&"x"!==r.axis&&o.overflowed[0]&&(s.dir="y",s.overwrite="all",R(a,-c[0].toString(),s)),null!==c[1]&&"undefined"!=typeof c[1]&&"y"!==r.axis&&o.overflowed[1]&&(s.dir="x",s.overwrite="none",R(a,-c[1].toString(),s))},s.timeout)}})}},stop:function(){var e=f.call(this);return t(e).each(function(){var e=t(this);e.data(i)&&F(e)})},disable:function(e){var n=f.call(this);return t(n).each(function(){var n=t(this);if(n.data(i)){{var a=n.data(i);a.opt}D.call(this,"remove"),M.call(this),e&&_.call(this),C.call(this,!0),n.addClass(u[0])}})},destroy:function(){var e=f.call(this);return t(e).each(function(){var n=t(this);if(n.data(i)){var o=n.data(i),r=o.opt,l=t("#mTS_"+o.idx),s=(t("#mTS_"+o.idx+"_container"),t("#mTS_"+o.idx+"_buttonUp,#mTS_"+o.idx+"_buttonDown,#mTS_"+o.idx+"_buttonLeft,#mTS_"+o.idx+"_buttonRight"));r.live&&m(e),D.call(this,"remove"),M.call(this),_.call(this),n.removeData(i),q(this,"mts"),s.remove(),l.replaceWith(o.html),n.removeClass(a+" _"+i+"_"+o.idx+" "+i+"-"+r.theme+" "+u[2]+" "+u[0]).addClass(u[1])}})}},f=function(){return"object"!=typeof t(this)||t(this).length<1?o:this},p=function(e){var n=["buttons-out"],a=["buttons-in"],i=["buttons-out"],o=["hover-classic"],r=["hover-full"];e.markup.buttonsPlaceholder=t.inArray(e.theme,n)>-1?"outside":e.markup.buttonsPlaceholder,e.markup.buttonsHTML=t.inArray(e.theme,a)>-1?{up:"SVG set 2",down:"SVG set 2",left:"SVG set 2",right:"SVG set 2"}:t.inArray(e.theme,i)>-1?{up:"SVG set 3",down:"SVG set 3",left:"SVG set 3",right:"SVG set 3"}:e.markup.buttonsHTML,e.type=t.inArray(e.theme,o)>-1?"hover-85":t.inArray(e.theme,r)>-1?"hover-precise":e.type,e.speed=t.inArray(e.theme,o)>-1?60:t.inArray(e.theme,r)>-1?10:e.speed},m=function(t){s[t]&&(clearTimeout(s[t]),q(s,t))},v=function(){var e=t(this),n=e.data(i),o=n.opt,r="yx"===o.axis?"mTS_vertical_horizontal":"x"===o.axis?"mTS_horizontal":"mTS_vertical",l=o.markup.thumbnailsContainer||"ul",s=o.markup.thumbnailContainer||"li",c=o.markup.thumbnailElement||"img";if(n.html=e.children().clone(!0,!0),!e.find(l).length){var d=e.find("li").length?"<ul class='"+i+"AutoContainer' />":"<div class='"+i+"AutoContainer' />";e.wrapInner(d),l="."+i+"AutoContainer"}o.setWidth&&e.css("width",o.setWidth),o.setHeight&&e.css("height",o.setHeight),o.setLeft="y"!==o.axis&&"rtl"===n.langDir?"-989999px":o.setLeft,e.addClass(a+" _"+i+"_"+n.idx+" "+i+"-"+o.theme).find(l).wrap("<div id='mTS_"+n.idx+"' class='mTSWrapper "+r+"' />").addClass(i+"Container").attr("id","mTS_"+n.idx+"_container").css({position:"relative",top:o.setTop,left:o.setLeft}).find(s).addClass(i+"ThumbContainer").find(c).addClass(i+"Thumb"),g.call(this)},x=function(){var e=t(this),n=e.data(i),a=n.opt,o=t("#mTS_"+n.idx+"_container");a.advanced.autoExpandHorizontalScroll&&"y"!==a.axis&&o.css({position:"absolute",width:"auto"}).wrap("<div class='mTS_h_wrapper' style='position:relative; left:0; width:999999px;' />").css({width:Math.ceil(o[0].getBoundingClientRect().right)-Math.floor(o[0].getBoundingClientRect().left),position:"relative"}).unwrap()},g=function(){{var e=t(this),n=e.data(i),o=n.opt,r=o.markup.buttonsPlaceholder?"outside"===o.markup.buttonsPlaceholder?e:t(o.markup.buttonsPlaceholder):t("#mTS_"+n.idx),l=["<a href='#' id='mTS_"+n.idx+"_buttonUp' class='mTSButton mTSButtonUp'><span class='mTSButtonIconContainer'>"+T.call(this,"up")+"</span></a>","<a href='#' id='mTS_"+n.idx+"_buttonDown' class='mTSButton mTSButtonDown'><span class='mTSButtonIconContainer'>"+T.call(this,"down")+"</span></a>","<a href='#' id='mTS_"+n.idx+"_buttonLeft' class='mTSButton mTSButtonLeft'><span class='mTSButtonIconContainer'>"+T.call(this,"left")+"</span></a>","<a href='#' id='mTS_"+n.idx+"_buttonRight' class='mTSButton mTSButtonRight'><span class='mTSButtonIconContainer'>"+T.call(this,"right")+"</span></a>"];["x"===o.axis?l[2]:l[0],"x"===o.axis?l[3]:l[1]]}r.hasClass(a)&&"static"===r.css("position")&&r.css("position","relative"),-1!==o.type.indexOf("click")&&("x"!==o.axis&&r.append(l[0]+l[1]),"y"!==o.axis&&r.append(l[2]+l[3]))},T=function(e){var n=t(this),a=n.data(i),o=a.opt,r=o.markup.buttonsHTML,l="SVG set 1"===r[e]?0:"SVG set 2"===r[e]?1:"SVG set 3"===r[e]?2:"SVG set 4"===r[e]?3:"SVG set 5"===r[e]?4:null;switch(e){case"up":return null===l?r[e]:c?"&uarr;":S(r[e])[l][0];case"down":return null===l?r[e]:c?"&darr;":S(r[e])[l][1];case"left":return null===l?r[e]:c?"&larr;":S(r[e])[l][2];case"right":return null===l?r[e]:c?"&rarr;":S(r[e])[l][3]}},S=function(){var t="<svg version='1.1' viewBox='0 0 24 24' preserveAspectRatio='xMinYMin meet' class='mTSButtonIcon'><g><line stroke-width='1' x1='' y1='' x2='' y2='' stroke='#449FDB' opacity=''></line></g>",e="</svg>";return[[t+"<path d='M20.561 9.439l-7.5-7.5c-0.586-0.586-1.535-0.586-2.121 0l-7.5 7.5c-0.586 0.586-0.586 1.536 0 2.121s1.536 0.586 2.121 0l4.939-4.939v14.379c0 0.828 0.672 1.5 1.5 1.5s1.5-0.672 1.5-1.5v-14.379l4.939 4.939c0.293 0.293 0.677 0.439 1.061 0.439s0.768-0.146 1.061-0.439c0.586-0.586 0.586-1.535 0-2.121z'></path>"+e,t+"<path d='M3.439 14.561l7.5 7.5c0.586 0.586 1.536 0.586 2.121 0l7.5-7.5c0.586-0.586 0.586-1.536 0-2.121s-1.536-0.586-2.121 0l-4.939 4.939v-14.379c0-0.828-0.672-1.5-1.5-1.5s-1.5 0.672-1.5 1.5v14.379l-4.939-4.939c-0.293-0.293-0.677-0.439-1.061-0.439s-0.768 0.146-1.061 0.439c-0.586 0.586-0.586 1.536 0 2.121z'></path>"+e,t+"<path d='M9.439 3.439l-7.5 7.5c-0.586 0.586-0.586 1.536 0 2.121l7.5 7.5c0.586 0.586 1.536 0.586 2.121 0s0.586-1.536 0-2.121l-4.939-4.939h14.379c0.828 0 1.5-0.672 1.5-1.5s-0.672-1.5-1.5-1.5h-14.379l4.939-4.939c0.293-0.293 0.439-0.677 0.439-1.061s-0.146-0.768-0.439-1.061c-0.586-0.586-1.536-0.586-2.121 0z'></path>"+e,t+"<path d='M14.561 20.561l7.5-7.5c0.586-0.586 0.586-1.536 0-2.121l-7.5-7.5c-0.586-0.586-1.536-0.586-2.121 0s-0.586 1.536 0 2.121l4.939 4.939h-14.379c-0.828 0-1.5 0.672-1.5 1.5s0.672 1.5 1.5 1.5h14.379l-4.939 4.939c-0.293 0.293-0.439 0.677-0.439 1.061s0.146 0.768 0.439 1.061c0.586 0.586 1.536 0.586 2.121 0z'></path>"+e],[t+"<path d='M18.58 13.724c-0.488-0.502-5.634-5.402-5.634-5.402-0.262-0.268-0.604-0.402-0.946-0.402-0.343 0-0.685 0.134-0.946 0.402 0 0-5.146 4.901-5.635 5.402-0.488 0.502-0.522 1.404 0 1.939 0.523 0.534 1.252 0.577 1.891 0l4.69-4.496 4.688 4.496c0.641 0.577 1.37 0.534 1.891 0 0.523-0.536 0.491-1.439 0-1.939z'</path>"+e,t+"<path d='M18.58 10.276c-0.488 0.502-5.634 5.404-5.634 5.404-0.262 0.268-0.604 0.401-0.946 0.401-0.343 0-0.685-0.133-0.946-0.401 0 0-5.146-4.902-5.635-5.404-0.488-0.502-0.522-1.403 0-1.939 0.523-0.535 1.252-0.577 1.891 0l4.69 4.498 4.688-4.496c0.641-0.577 1.37-0.535 1.891 0 0.523 0.535 0.491 1.438 0 1.938z'></path>"+e,t+"<path d='M13.724 5.419c-0.502 0.49-5.402 5.635-5.402 5.635-0.268 0.262-0.401 0.604-0.401 0.946s0.133 0.684 0.401 0.946c0 0 4.901 5.146 5.402 5.634 0.502 0.49 1.404 0.523 1.939 0 0.534-0.522 0.576-1.25-0.001-1.89l-4.496-4.69 4.496-4.69c0.577-0.641 0.535-1.369 0.001-1.891-0.536-0.522-1.439-0.49-1.939 0z'></path>"+e,t+"<path d='M10.276 5.419c0.502 0.49 5.402 5.635 5.402 5.635 0.269 0.262 0.402 0.604 0.402 0.946s-0.133 0.684-0.402 0.946c0 0-4.901 5.146-5.402 5.634-0.502 0.49-1.403 0.523-1.939 0-0.535-0.522-0.577-1.25 0-1.89l4.498-4.69-4.496-4.69c-0.577-0.641-0.535-1.369 0-1.891s1.438-0.49 1.938 0z'></path>"+e],[t+"<path d='M20.902 17.279c0.325 0.322 0.851 0.322 1.175 0 0.325-0.322 0.325-0.841 0-1.163l-9.49-9.396c-0.324-0.322-0.85-0.322-1.174 0l-9.49 9.396c-0.324 0.322-0.325 0.841 0 1.163s0.85 0.322 1.175 0l8.902-8.569 8.902 8.569z'></path>"+e,t+"<path d='M3.098 6.721c-0.325-0.322-0.851-0.322-1.175 0-0.324 0.32-0.324 0.841 0 1.163l9.49 9.396c0.325 0.322 0.85 0.322 1.175 0l9.49-9.396c0.324-0.322 0.325-0.841 0-1.163s-0.852-0.322-1.175-0.001l-8.903 8.569-8.902-8.568z'></path>"+e,t+"<path d='M17.279 20.902c0.322 0.325 0.322 0.85 0 1.175s-0.841 0.325-1.163 0l-9.396-9.488c-0.322-0.325-0.322-0.851 0-1.175l9.396-9.49c0.322-0.325 0.841-0.325 1.163 0s0.322 0.85 0 1.175l-8.568 8.902 8.568 8.902z'</path>"+e,t+"<path d='M6.72 20.902c-0.322 0.325-0.322 0.85 0 1.175s0.841 0.325 1.163 0l9.396-9.488c0.322-0.325 0.322-0.851 0-1.175l-9.396-9.49c-0.322-0.325-0.841-0.325-1.163 0s-0.322 0.85 0 1.175l8.568 8.902-8.568 8.902z'</path>"+e],[t+"<path d='M12 0l-12 12h7.5v12l9 0v-12h7.5z'></path>"+e,t+"<path d='M12 24l12-12h-7.5v-12l-9-0v12h-7.5z'></path>"+e,t+"<path d='M0 12l12 12v-7.5h12l0-9h-12v-7.5z'></path>"+e,t+"<path d='M24 12l-12-12v7.5h-12l-0 9h12v7.5z'></path>"+e],[t+"<path d='M6.48 16.8h11.040l-5.521-9.6z'></path>"+e,t+"<path d='M17.52 7.201l-11.040-0.001 5.52 9.6z'></path>"+e,t+"<path d='M16.799 6.48l0.001 11.040-9.6-5.52z'></path>"+e,t+"<path d='M7.201 6.48l-0.001 11.040 9.6-5.52z'></path>"+e]]},w=function(){var e=t(this),n=e.data(i),a=(n.opt,t("#mTS_"+n.idx)),o=e.css("max-height"),r=-1!==o.indexOf("%"),l=e.css("box-sizing");if("none"!==o){var s=r?e.parent().height()*parseInt(o)/100:parseInt(o);"border-box"===l&&(s-=e.innerHeight()-e.height()+(e.outerHeight()-e.innerHeight())),a.css("max-height",Math.round(s))}},b=function(){var e=t(this),n=e.data(i),a=t("#mTS_"+n.idx),o=t("#mTS_"+n.idx+"_container");return[o.height()>a.height(),o.width()>a.width()]},_=function(){var e=t(this),n=e.data(i),a=n.opt,o=t("#mTS_"+n.idx),r=t("#mTS_"+n.idx+"_container");if(F(e),("x"!==a.axis&&!n.overflowed[0]||"y"===a.axis&&n.overflowed[0])&&r.css("top",0),"y"!==a.axis&&!n.overflowed[1]||"x"===a.axis&&n.overflowed[1]){var l="rtl"===n.langDir?o.width()-r.width():0;r.css("left",l)}},y=function(){var e=t(this),n=e.data(i),a=n.opt;n.bindEvents||(a.contentTouchScroll&&I.call(this),-1!==a.type.indexOf("hover")?"hover-precise"===a.type?L.call(this):A.call(this):-1!==a.type.indexOf("click")&&B.call(this),n.bindEvents=!0)},M=function(){var e=t(this),n=e.data(i),a=i+"_"+n.idx,o=t("#mTS_"+n.idx+",#mTS_"+n.idx+"_container,#mTS_"+n.idx+"_buttonUp,#mTS_"+n.idx+"_buttonDown,#mTS_"+n.idx+"_buttonLeft,#mTS_"+n.idx+"_buttonRight"),r=t("#mTS_"+n.idx+"_container");n.bindEvents&&(o.each(function(){t(this).unbind("."+a)}),clearTimeout(r[0].onCompleteTimeout),q(r[0],"onCompleteTimeout"),n.bindEvents=!1)},C=function(e,n,a){var o=t(this),r=o.data(i),l=r.opt;if(-1!==l.type.indexOf("click")){a||(a=l.axis);var s=[t("#mTS_"+r.idx+"_buttonUp"),t("#mTS_"+r.idx+"_buttonDown"),t("#mTS_"+r.idx+"_buttonLeft"),t("#mTS_"+r.idx+"_buttonRight")],c=i+"-hidden";"x"!==a&&(sel=!r.overflowed[0]||e||n?1===n?[s[0],s[1]]:2===n?[s[1],s[0]]:[s[0].add(s[1]),null]:[r.overflowed[1]?null:s[2].add(s[3]),s[0].add(s[1])]),"y"!==a&&(sel=!r.overflowed[1]||e||n?1===n?[s[2],s[3]]:2===n?[s[3],s[2]]:[s[2].add(s[3]),null]:[r.overflowed[0]?null:s[0].add(s[1]),s[2].add(s[3])]),sel[0]&&sel[0].addClass(c),sel[1]&&sel[1].removeClass(c)}},k=function(t){var e=t.type;switch(e){case"pointerdown":case"MSPointerDown":case"pointermove":case"MSPointerMove":case"pointerup":case"MSPointerUp":return[t.originalEvent.pageY,t.originalEvent.pageX];case"touchstart":case"touchmove":case"touchend":var n=t.originalEvent.touches[0]||t.originalEvent.changedTouches[0];return[n.pageY,n.pageX];default:return[t.pageY,t.pageX]}},O=function(t){return n||-1!==t.type.indexOf("touch")||"undefined"!=typeof t.pointerType&&(2===t.pointerType||"touch"===t.pointerType)?"touch":"mouse"},I=function(){function e(t,e){var n=[1.5*e,2*e,e/1.5,e/2];return t>90?e>4?n[0]:n[3]:t>60?e>3?n[3]:n[2]:t>30?e>8?n[1]:e>6?n[0]:e>4?e:n[2]:e>8?e:n[3]}function a(t,e,n,a,i){t&&R(x,-t.toString(),{dur:e,easing:n,dir:a,overwrite:i})}var o,r,l,s,c,u,h,f,p,m,v,x=t(this),g=x.data(i),T=g.opt,S=i+"_"+g.idx,w=t("#mTS_"+g.idx),b=t("#mTS_"+g.idx+"_container"),_=[],y=[],M=0,C="yx"===T.axis?"none":"all",O=[];b.bind("touchstart."+S+" pointerdown."+S+" MSPointerDown."+S,function(t){if(j(t)&&!d){var e=b.offset();o=k(t)[0]-e.top,r=k(t)[1]-e.left,O=[k(t)[0],k(t)[1]]}}).bind("touchmove."+S+" pointermove."+S+" MSPointerMove."+S,function(t){if(j(t)&&!d){t.stopImmediatePropagation(),u=V();var e=w.offset(),n=k(t)[0]-e.top,i=k(t)[1]-e.left,l="linearOut";if(_.push(n),y.push(i),O[2]=Math.abs(k(t)[0]-O[0]),O[3]=Math.abs(k(t)[1]-O[1]),g.overflowed[0])var s=w.height()-b.height(),c=o-n>0&&n-o>s&&2*O[3]<O[2];if(g.overflowed[1])var h=w.width()-b.width(),f=r-i>0&&i-r>h&&2*O[2]<O[3];(c||f)&&t.preventDefault(),m="yx"===T.axis?[o-n,r-i]:"x"===T.axis?[null,r-i]:[o-n,null],b[0].idleTimer=250,g.overflowed[0]&&a(m[0],M,l,"y","all"),g.overflowed[1]&&a(m[1],M,l,"x",C)}}),w.bind("touchstart."+S+" pointerdown."+S+" MSPointerDown."+S,function(t){if(j(t)&&!d){t.stopImmediatePropagation(),n=!0,F(x),c=V();var e=w.offset();l=k(t)[0]-e.top,s=k(t)[1]-e.left,_=[],y=[]}}).bind("touchend."+S+" pointerup."+S+" MSPointerUp."+S,function(t){if(j(t)&&!d){t.stopImmediatePropagation(),h=V();var n=w.offset(),i=k(t)[0]-n.top,o=k(t)[1]-n.left;if(!(h-u>30)){p=1e3/(h-c);var r="easeOut",x=2.5>p,S=x?[_[_.length-2],y[y.length-2]]:[0,0];f=x?[i-S[0],o-S[1]]:[i-l,o-s];var M=[Math.abs(f[0]),Math.abs(f[1])];p=x?[Math.abs(f[0]/4),Math.abs(f[1]/4)]:[p,p];var O=[Math.abs(b[0].offsetTop)-f[0]*e(M[0]/p[0],p[0]),Math.abs(b[0].offsetLeft)-f[1]*e(M[1]/p[1],p[1])];m="yx"===T.axis?[O[0],O[1]]:"x"===T.axis?[null,O[1]]:[O[0],null],v=[4*M[0]+60*T.speed,4*M[1]+60*T.speed];var I=parseInt(T.contentTouchScroll)||0;m[0]=M[0]>I?m[0]:0,m[1]=M[1]>I?m[1]:0,g.overflowed[0]&&a(m[0],v[0],r,"y",C),g.overflowed[1]&&a(m[1],v[1],r,"x",C)}}})},L=function(){var n,a,o,r=t(this),l=r.data(i),s=l.opt,c=i+"_"+l.idx,d=t("#mTS_"+l.idx),u=t("#mTS_"+l.idx+"_container"),h=e.navigator.pointerEnabled?"pointermove":e.navigator.msPointerEnabled?"MSPointerMove":"mousemove";d.bind(h+"."+c,function(t){if("touch"!==O(t.originalEvent||t)&&(l.overflowed[0]||l.overflowed[1])){t.preventDefault();var e=d.height(),i=u.height(),c=d.width(),h=u.width(),f=h/c*7e3/(s.speed||1);n=[k(t)[0]-d.offset().top,k(t)[1]-d.offset().left],a=[n[0]/d.height(),n[1]/d.width()],o=[Math.round(-((i-e)*a[0])),Math.round(-((h-c)*a[1]))],"x"!==s.axis&&l.overflowed[0]&&R(r,o[0].toString(),{dir:"y",dur:f,easing:"easeOut"}),"y"!==s.axis&&l.overflowed[1]&&R(r,o[1].toString(),{dir:"x",dur:f,easing:"easeOut"})}})},A=function(){function a(){v[0].rAF||(l=e.requestAnimationFrame?e.requestAnimationFrame:function(t){return setTimeout(t,17)},v[0].rAF=l(r))}function o(){null!=v[0].rAF&&(e.requestAnimationFrame?e.cancelAnimationFrame(v[0].rAF):clearTimeout(v[0].rAF),clearTimeout(u),v[0].rAF=null)}function r(){if(!n){d=[c[0]+x[0].offsetTop,c[1]+x[0].offsetLeft];var t=[v.height()-x.height(),v.width()-x.width()];"x"!==p.axis&&f.overflowed[0]&&(d[0]=d[0]>0?0:d[0]<t[0]?t[0]:d[0],c[0]&&!_[0]&&R(h,d[0],{dir:"y",dur:0,easing:"linear"}),(d[0]>=0||d[0]<=t[0])&&(_[0]=1)),"y"!==p.axis&&f.overflowed[1]&&(d[1]=d[1]>0?0:d[1]<t[1]?t[1]:d[1],c[1]&&!_[1]&&R(h,d[1],{dir:"x",dur:0,easing:"linear"}),(d[1]>=0||d[1]<=t[1])&&(_[1]=1)),u=setTimeout(function(){v[0].rAF=l(r)},T)}}var l,s,c,d,u,h=t(this),f=h.data(i),p=f.opt,m=i+"_"+f.idx,v=t("#mTS_"+f.idx),x=t("#mTS_"+f.idx+"_container"),g=e.navigator.pointerEnabled?["pointerover","pointermove","pointerout"]:e.navigator.msPointerEnabled?["MSPointerOver","MSPointerMove","MSPointerOut"]:["mouseenter","mousemove","mouseleave"],T=e.requestAnimationFrame?0:17,S=p.speed,w=parseInt(p.type.split("hover-")[1])||1,b=S*w/100,_=[0,0];v.bind(g[0]+"."+m,function(t){"touch"!==O(t.originalEvent||t)&&(f.overflowed[0]||f.overflowed[1])&&a()}).bind(g[1]+"."+m,function(t){"touch"!==O(t.originalEvent||t)&&(f.overflowed[0]||f.overflowed[1])&&(s=[k(t)[0]-v.offset().top,k(t)[1]-v.offset().left],c=[Math.round(Math.cos(s[0]/v.height()*Math.PI)*S),Math.round(Math.cos(s[1]/v.width()*Math.PI)*S)],c[0]=c[0]<=-b?c[0]+=b:c[0]>=b?c[0]-=b:c[0]=0,c[1]=c[1]<=-b?c[1]+=b:c[1]>=b?c[1]-=b:c[1]=0,_=[0,0])}).bind(g[2]+"."+m,function(t){"touch"!==O(t.originalEvent||t)&&(f.overflowed[0]||f.overflowed[1])&&o()})},B=function(){var e=t(this),n=e.data(i),a=n.opt,o=i+"_"+n.idx,r=t("#mTS_"+n.idx),l=t("#mTS_"+n.idx+"_container"),s=[t("#mTS_"+n.idx+"_buttonUp"),t("#mTS_"+n.idx+"_buttonDown"),t("#mTS_"+n.idx+"_buttonLeft"),t("#mTS_"+n.idx+"_buttonRight")],c=s[0].add(s[1]).add(s[2]).add(s[3]);c.bind("click."+o,function(i){if(H(i)&&(n.overflowed[0]||n.overflowed[1])&&(i.preventDefault(),!n.tweenRunning)){if("x"!==a.axis&&n.overflowed[0]){var o=r.height(),s="click-thumb"===a.type?0:t(this).hasClass("mTSButtonUp")?"+=":t(this).hasClass("mTSButtonDown")?"-=":0;if("click-thumb"!==a.type)var c=parseInt(a.type.split("click-")[1])||1,d=s?[s+o*c/100,null]:0;else{var u=z.call(e[0])[0],f=z.call(e[0])[1];if(t(this).hasClass("mTSButtonDown"))var d=f?f[0].offsetTop-parseInt(f.css("margin-bottom"))-o:989999;else if(t(this).hasClass("mTSButtonUp")){var d=u?u[0].offsetTop-parseInt(u.css("margin-top")):0;if(0===l[0].offsetTop)return}}}if("y"!==a.axis&&n.overflowed[1]){var p=r.width(),s="click-thumb"===a.type?0:t(this).hasClass("mTSButtonLeft")?"+=":t(this).hasClass("mTSButtonRight")?"-=":0;if("click-thumb"!==a.type)var c=parseInt(a.type.split("click-")[1])||1,d=s?[null,s+p*c/100]:d;else{var u=z.call(e[0])[2],f=z.call(e[0])[3];if(t(this).hasClass("mTSButtonRight"))var d=f?f[0].offsetLeft-parseInt(f.css("margin-right"))-p:989999;else if(t(this).hasClass("mTSButtonLeft")){var d=u?u[0].offsetLeft-parseInt(u.css("margin-left")):0;if(0===l[0].offsetLeft)return}}}null!==d&&h.scrollTo.call(e[0],d,{duration:0})}})},z=function(){var e,n,a,o,r=t(this),l=r.data(i),s=(l.opt,t("#mTS_"+l.idx+"_container")),c=t("#mTS_"+l.idx),d=s.find(".mTSThumbContainer");return d.each(function(){var i=t(this),r=[Math.round(i.offset().top-s.offset().top+s[0].offsetTop),Math.round(i.offset().left-s.offset().left+s[0].offsetLeft)];if(r[0]<=0-parseInt(i.css("margin-top")))e=d.eq(0===r[0]?i.index()-1:i.index());else if(r[0]<=c.height()+parseInt(i.css("margin-bottom"))){var l=d.eq(i.index()+1);n=l.length?l:null}if(r[1]<=0-parseInt(i.css("margin-left")))a=d.eq(0===r[1]?i.index()-1:i.index());else if(r[1]<=c.width()+parseInt(i.css("margin-right"))){var u=d.eq(i.index()+1);o=u.length?u:null}}),[e,n,a,o]},P=function(e){var n=t(this).data(i).opt,a=[];return"function"==typeof e&&(e=e()),e instanceof Array?a=e.length>1?[e[0],e[1]]:"x"===n.axis?[null,e[0]]:[e[0],null]:(a[0]=e.y?e.y:e.x||"x"===n.axis?null:e,a[1]=e.x?e.x:e.y||"y"===n.axis?null:e),"function"==typeof a[0]&&(a[0]=a[0]()),"function"==typeof a[1]&&(a[1]=a[1]()),a},E=function(e,n){if(null!=e&&"undefined"!=typeof e){var a=t(this),o=a.data(i),r=o.opt,l=t("#mTS_"+o.idx),s=t("#mTS_"+o.idx+"_container"),c=typeof e;n||(n="x"===r.axis?"x":"y");var d="x"===n?s.width():s.height(),u="x"===n?s.offset().left:s.offset().top,f="x"===n?s[0].offsetLeft:s[0].offsetTop,p="x"===n?"left":"top";switch(c){case"function":return e();case"object":if(e.nodeType)var m="x"===n?t(e).offset().left:t(e).offset().top;else if(e.jquery){if(!e.length)return;var m="x"===n?e.offset().left:e.offset().top}return m-u;case"string":case"number":if(N(e))return Math.abs(e);if(-1!==e.indexOf("%"))return Math.abs(d*parseInt(e)/100);if(-1!==e.indexOf("-="))return Math.abs(f-parseInt(e.split("-=")[1]));if(-1!==e.indexOf("+=")){var v=f+parseInt(e.split("+=")[1]);return v>=0?0:Math.abs(v)}if(-1!==e.indexOf("px")&&N(e.split("px")[0]))return Math.abs(e.split("px")[0]);if("top"===e||"left"===e)return 0;if("bottom"===e)return Math.abs(l.height()-s.height());if("right"===e)return Math.abs(l.width()-s.width());if("first"===e||"last"===e){var x=s.find(":"+e),m="x"===n?t(x).offset().left:t(x).offset().top;return m-u}if(t(e).length){var m="x"===n?t(e).offset().left:t(e).offset().top;return m-u}return s.css(p,e),void h.update.call(null,a[0])}}},D=function(e){function n(){clearTimeout(f[0].autoUpdate),f[0].autoUpdate=setTimeout(function(){return d.advanced.updateOnSelectorChange&&(p=r(),p!==x)?(l(),void(x=p)):(d.advanced.updateOnContentResize&&(m=[f.height(),f.width(),u.height(),u.width(),s.height(),s.width()],(m[0]!==g[0]||m[1]!==g[1]||m[2]!==g[2]||m[3]!==g[3]||m[4]!==g[4]||m[5]!==g[5])&&(l(),g=m)),d.advanced.updateOnImageLoad&&(v=a(),v!==T&&(f.find("img").each(function(){o(this.src)}),T=v)),void((d.advanced.updateOnSelectorChange||d.advanced.updateOnContentResize||d.advanced.updateOnImageLoad)&&n()))},60)}function a(){var t=0;return d.advanced.updateOnImageLoad&&(t=f.find("img").length),t}function o(t){function e(t,e){return function(){return e.apply(t,arguments)}}function n(){this.onload=null,l()}var a=new Image;a.onload=e(a,n),a.src=t}function r(){d.advanced.updateOnSelectorChange===!0&&(d.advanced.updateOnSelectorChange="*");var e=0,n=f.find(d.advanced.updateOnSelectorChange);return d.advanced.updateOnSelectorChange&&n.length>0&&n.each(function(){e+=t(this).height()+t(this).width()}),e}function l(){clearTimeout(f[0].autoUpdate),h.update.call(null,s[0])}var s=t(this),c=s.data(i),d=c.opt,u=t("#mTS_"+c.idx),f=t("#mTS_"+c.idx+"_container");if(e)return clearTimeout(f[0].autoUpdate),void q(f[0],"autoUpdate");var p,m,v,x=r(),g=[f.height(),f.width(),u.height(),u.width(),s.height(),s.width()],T=a();n()},F=function(e){var n=e.data(i),a=t("#mTS_"+n.idx+"_container");a.each(function(){G.call(this)})},R=function(e,n,a){function o(t){return s&&c.callbacks[t]&&"function"==typeof c.callbacks[t]}function r(){return[c.callbacks.alwaysTriggerOffsets||v>=x+T,c.callbacks.alwaysTriggerOffsets||-S>=v]}function l(){var t=[h[0].offsetTop,h[0].offsetLeft],n=[h.height(),h.width()],i=[u.height(),u.width()];e[0].mts={content:h,top:t[0],left:t[1],topPct:Math.round(100*Math.abs(t[0])/(Math.abs(n[0])-i[0])),leftPct:Math.round(100*Math.abs(t[1])/(Math.abs(n[1])-i[1])),direction:a.dir}}var s=e.data(i),c=s.opt,d={trigger:"internal",dir:"y",easing:"easeOut",dur:60*c.speed,overwrite:"all",callbacks:!0,onStart:!0,onUpdate:!0,onComplete:!0},a=t.extend(d,a),u=t("#mTS_"+s.idx),h=t("#mTS_"+s.idx+"_container"),f=c.callbacks.onTotalScrollOffset?P.call(e,c.callbacks.onTotalScrollOffset):[0,0],p=c.callbacks.onTotalScrollBackOffset?P.call(e,c.callbacks.onTotalScrollBackOffset):[0,0];switch(s.trigger=a.trigger,(0!==u.scrollTop()||0!==u.scrollLeft())&&u.scrollTop(0).scrollLeft(0),a.dir){case"x":var m="left",v=h[0].offsetLeft,x=u.width()-h.width(),g=n,T=f[1],S=p[1],w=T>0?T:0,b=S>0?S:0;break;case"y":var m="top",v=h[0].offsetTop,x=u.height()-h.height(),g=n,T=f[0],S=p[0],w=T>0?T:0,b=S>0?S:0}g>=0?(g=0,C.call(e,!1,1,a.dir)):x>=g?(g=x,C.call(e,!1,2,a.dir)):(g=g,C.call(e,!1,0,a.dir)),e[0].mts||(l(),o("onInit")&&c.callbacks.onInit.call(e[0])),clearTimeout(h[0].onCompleteTimeout),(s.tweenRunning||!(0===v&&g>=0||v===x&&x>=g))&&U(h[0],m,Math.round(g),a.dur,a.easing,a.overwrite,{onStart:function(){a.callbacks&&a.onStart&&!s.tweenRunning&&(o("onScrollStart")&&(l(),c.callbacks.onScrollStart.call(e[0])),s.tweenRunning=!0,s.cbOffsets=r())},onUpdate:function(){a.callbacks&&a.onUpdate&&o("whileScrolling")&&(l(),c.callbacks.whileScrolling.call(e[0]))},onComplete:function(){if(a.callbacks&&a.onComplete){"yx"===c.axis&&clearTimeout(h[0].onCompleteTimeout);var t=h[0].idleTimer||0;h[0].onCompleteTimeout=setTimeout(function(){o("onScroll")&&(l(),c.callbacks.onScroll.call(e[0])),o("onTotalScroll")&&x+w>=g&&s.cbOffsets[0]&&(l(),c.callbacks.onTotalScroll.call(e[0])),o("onTotalScrollBack")&&g>=-b&&s.cbOffsets[1]&&(l(),c.callbacks.onTotalScrollBack.call(e[0])),s.tweenRunning=!1,h[0].idleTimer=0},t)}}})},U=function(t,n,a,i,o,r,l){function s(){b.stop||(T||m.call(),T=V()-g,c(),T>=b.time&&(b.time=T>b.time?T+f-(T-b.time):T+f-1,b.time<T+1&&(b.time=T+1)),b.time<i?b.id=p(s):x.call())}function c(){i>0?(b.currVal=h(b.time,S,_,i,o),w[n]=Math.round(b.currVal)+"px"):w[n]=a+"px",v.call()}function d(){f=1e3/60,b.time=T+f,p=e.requestAnimationFrame?e.requestAnimationFrame:function(t){return c(),setTimeout(t,.01)},b.id=p(s)}function u(){null!=b.id&&(e.requestAnimationFrame?e.cancelAnimationFrame(b.id):clearTimeout(b.id),b.id=null)}function h(t,e,n,a,i){switch(i){case"linear":return n*t/a+e;case"linearOut":return t/=a,t--,n*Math.sqrt(1-t*t)+e;case"easeInOutSmooth":return t/=a/2,1>t?n/2*t*t+e:(t--,-n/2*(t*(t-2)-1)+e);case"easeInOutStrong":return t/=a/2,1>t?n/2*Math.pow(2,10*(t-1))+e:(t--,n/2*(-Math.pow(2,-10*t)+2)+e);case"easeInOut":return t/=a/2,1>t?n/2*t*t*t+e:(t-=2,n/2*(t*t*t+2)+e);case"easeOutSmooth":return t/=a,t--,-n*(t*t*t*t-1)+e;case"easeOutStrong":return n*(-Math.pow(2,-10*t/a)+1)+e;case"easeOut":default:var o=(t/=a)*t,r=o*t;return e+n*(.499999999999997*r*o+-2.5*o*o+5.5*r+-6.5*o+4*t)}}t._mTween||(t._mTween={top:{},left:{}});var f,p,l=l||{},m=l.onStart||function(){},v=l.onUpdate||function(){},x=l.onComplete||function(){},g=V(),T=0,S=t.offsetTop,w=t.style,b=t._mTween[n];"left"===n&&(S=t.offsetLeft);var _=a-S;b.stop=0,"none"!==r&&u(),d()},V=function(){return e.performance&&e.performance.now?e.performance.now():e.performance&&e.performance.webkitNow?e.performance.webkitNow():Date.now?Date.now():(new Date).getTime()},G=function(){var t=this;t._mTween||(t._mTween={top:{},left:{}});for(var n=["top","left"],a=0;a<n.length;a++){var i=n[a];t._mTween[i].id&&(e.requestAnimationFrame?e.cancelAnimationFrame(t._mTween[i].id):clearTimeout(t._mTween[i].id),t._mTween[i].id=null,t._mTween[i].stop=1)}},q=function(t,e){try{delete t[e]}catch(n){t[e]=null}},H=function(t){return!(t.which&&1!==t.which)},j=function(t){var e=t.originalEvent.pointerType;return!(e&&"touch"!==e&&2!==e)},N=function(t){return!isNaN(parseFloat(t))&&isFinite(t)};t.fn[a]=function(e){return h[e]?h[e].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof e&&e?void t.error("Method "+e+" does not exist"):h.init.apply(this,arguments)},t[a]=function(e){return h[e]?h[e].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof e&&e?void t.error("Method "+e+" does not exist"):h.init.apply(this,arguments)},t[a].defaults=r,e[a]=!0,t(e).load(function(){var e=t(o),n=[];if(e.length){e.each(function(){var e=t(this),a=e.data("mts-axis")||r.axis,o=e.data("mts-type")||r.type,l=e.data("mts-theme")||r.theme,s="auto-"+i+"-"+a+"-"+o+"-"+l,c=[s,a,o];e.addClass(s),-1===t.inArray(s,n)&&n.push(c)});for(var l=0;l<n.length;l++)t("."+n[l][0])[a]({axis:n[l][1],type:n[l][2]})}})}(jQuery,window,document);

/**
 * BxSlider v4.1.1 - Fully loaded, responsive content slider
 * http://bxslider.com
 *
 * Copyright 2013, Steven Wanderski - http://stevenwanderski.com - http://bxcreative.com
 * Written while drinking Belgian ales and listening to jazz
 *
 * Released under the MIT license - http://opensource.org/licenses/MIT
 */
!function(t){var e={},s={mode:"horizontal",slideSelector:"",infiniteLoop:!0,hideControlOnEnd:!1,speed:500,easing:null,slideMargin:0,startSlide:0,randomStart:!1,captions:!1,ticker:!1,tickerHover:!1,adaptiveHeight:!1,adaptiveHeightSpeed:500,video:!1,useCSS:!0,preloadImages:"visible",responsive:!0,touchEnabled:!0,swipeThreshold:50,oneToOneTouch:!0,preventDefaultSwipeX:!0,preventDefaultSwipeY:!1,pager:!0,pagerType:"full",pagerShortSeparator:" / ",pagerSelector:null,buildPager:null,pagerCustom:null,controls:!0,nextText:"Next",prevText:"Prev",nextSelector:null,prevSelector:null,autoControls:!1,startText:"Start",stopText:"Stop",autoControlsCombine:!1,autoControlsSelector:null,auto:!1,pause:4e3,autoStart:!0,autoDirection:"next",autoHover:!1,autoDelay:0,minSlides:1,maxSlides:1,moveSlides:0,slideWidth:0,onSliderLoad:function(){},onSlideBefore:function(){},onSlideAfter:function(){},onSlideNext:function(){},onSlidePrev:function(){}};t.fn.bxSlider=function(n){if(0==this.length)return this;if(this.length>1)return this.each(function(){t(this).bxSlider(n)}),this;var o={},r=this;e.el=this;var a=t(window).width(),l=t(window).height(),d=function(){o.settings=t.extend({},s,n),o.settings.slideWidth=parseInt(o.settings.slideWidth),o.children=r.children(o.settings.slideSelector),o.children.length<o.settings.minSlides&&(o.settings.minSlides=o.children.length),o.children.length<o.settings.maxSlides&&(o.settings.maxSlides=o.children.length),o.settings.randomStart&&(o.settings.startSlide=Math.floor(Math.random()*o.children.length)),o.active={index:o.settings.startSlide},o.carousel=o.settings.minSlides>1||o.settings.maxSlides>1,o.carousel&&(o.settings.preloadImages="all"),o.minThreshold=o.settings.minSlides*o.settings.slideWidth+(o.settings.minSlides-1)*o.settings.slideMargin,o.maxThreshold=o.settings.maxSlides*o.settings.slideWidth+(o.settings.maxSlides-1)*o.settings.slideMargin,o.working=!1,o.controls={},o.interval=null,o.animProp="vertical"==o.settings.mode?"top":"left",o.usingCSS=o.settings.useCSS&&"fade"!=o.settings.mode&&function(){var t=document.createElement("div"),e=["WebkitPerspective","MozPerspective","OPerspective","msPerspective"];for(var i in e)if(void 0!==t.style[e[i]])return o.cssPrefix=e[i].replace("Perspective","").toLowerCase(),o.animProp="-"+o.cssPrefix+"-transform",!0;return!1}(),"vertical"==o.settings.mode&&(o.settings.maxSlides=o.settings.minSlides),r.data("origStyle",r.attr("style")),r.children(o.settings.slideSelector).each(function(){t(this).data("origStyle",t(this).attr("style"))}),c()},c=function(){r.wrap('<div class="bx-wrapper"><div class="bx-viewport"></div></div>'),o.viewport=r.parent(),o.loader=t('<div class="bx-loading" />'),o.viewport.prepend(o.loader),r.css({width:"horizontal"==o.settings.mode?100*o.children.length+215+"%":"auto",position:"relative"}),o.usingCSS&&o.settings.easing?r.css("-"+o.cssPrefix+"-transition-timing-function",o.settings.easing):o.settings.easing||(o.settings.easing="swing"),f(),o.viewport.css({width:"100%",overflow:"hidden",position:"relative"}),o.viewport.parent().css({maxWidth:v()}),o.settings.pager||o.viewport.parent().css({margin:"0 auto 0px"}),o.children.css({"float":"horizontal"==o.settings.mode?"left":"none",listStyle:"none",position:"relative"}),o.children.css("width",u()),"horizontal"==o.settings.mode&&o.settings.slideMargin>0&&o.children.css("marginRight",o.settings.slideMargin),"vertical"==o.settings.mode&&o.settings.slideMargin>0&&o.children.css("marginBottom",o.settings.slideMargin),"fade"==o.settings.mode&&(o.children.css({position:"absolute",zIndex:0,display:"none"}),o.children.eq(o.settings.startSlide).css({zIndex:50,display:"block"})),o.controls.el=t('<div class="bx-controls" />'),o.settings.captions&&P(),o.active.last=o.settings.startSlide==x()-1,o.settings.video&&r.fitVids();var e=o.children.eq(o.settings.startSlide);"all"==o.settings.preloadImages&&(e=o.children),o.settings.ticker?o.settings.pager=!1:(o.settings.pager&&T(),o.settings.controls&&C(),o.settings.auto&&o.settings.autoControls&&E(),(o.settings.controls||o.settings.autoControls||o.settings.pager)&&o.viewport.after(o.controls.el)),g(e,h)},g=function(e,i){var s=e.find("img, iframe").length;if(0==s)return i(),void 0;var n=0;e.find("img, iframe").each(function(){t(this).one("load",function(){++n==s&&i()}).each(function(){this.complete&&t(this).load()})})},h=function(){if(o.settings.infiniteLoop&&"fade"!=o.settings.mode&&!o.settings.ticker){var e="vertical"==o.settings.mode?o.settings.minSlides:o.settings.maxSlides,i=o.children.slice(0,e).clone().addClass("bx-clone"),s=o.children.slice(-e).clone().addClass("bx-clone");r.append(i).prepend(s)}o.loader.remove(),S(),"vertical"==o.settings.mode&&(o.settings.adaptiveHeight=!0),o.viewport.height(p()),r.redrawSlider(),o.settings.onSliderLoad(o.active.index),o.initialized=!0,o.settings.responsive&&t(window).bind("resize",B),o.settings.auto&&o.settings.autoStart&&H(),o.settings.ticker&&L(),o.settings.pager&&I(o.settings.startSlide),o.settings.controls&&W(),o.settings.touchEnabled&&!o.settings.ticker&&O()},p=function(){var e=0,s=t();if("vertical"==o.settings.mode||o.settings.adaptiveHeight)if(o.carousel){var n=1==o.settings.moveSlides?o.active.index:o.active.index*m();for(s=o.children.eq(n),i=1;i<=o.settings.maxSlides-1;i++)s=n+i>=o.children.length?s.add(o.children.eq(i-1)):s.add(o.children.eq(n+i))}else s=o.children.eq(o.active.index);else s=o.children;return"vertical"==o.settings.mode?(s.each(function(){e+=t(this).outerHeight()}),o.settings.slideMargin>0&&(e+=o.settings.slideMargin*(o.settings.minSlides-1))):e=Math.max.apply(Math,s.map(function(){return t(this).outerHeight(!1)}).get()),e},v=function(){var t="100%";return o.settings.slideWidth>0&&(t="horizontal"==o.settings.mode?o.settings.maxSlides*o.settings.slideWidth+(o.settings.maxSlides-1)*o.settings.slideMargin:o.settings.slideWidth),t},u=function(){var t=o.settings.slideWidth,e=o.viewport.width();return 0==o.settings.slideWidth||o.settings.slideWidth>e&&!o.carousel||"vertical"==o.settings.mode?t=e:o.settings.maxSlides>1&&"horizontal"==o.settings.mode&&(e>o.maxThreshold||e<o.minThreshold&&(t=(e-o.settings.slideMargin*(o.settings.minSlides-1))/o.settings.minSlides)),t},f=function(){var t=1;if("horizontal"==o.settings.mode&&o.settings.slideWidth>0)if(o.viewport.width()<o.minThreshold)t=o.settings.minSlides;else if(o.viewport.width()>o.maxThreshold)t=o.settings.maxSlides;else{var e=o.children.first().width();t=Math.floor(o.viewport.width()/e)}else"vertical"==o.settings.mode&&(t=o.settings.minSlides);return t},x=function(){var t=0;if(o.settings.moveSlides>0)if(o.settings.infiniteLoop)t=o.children.length/m();else for(var e=0,i=0;e<o.children.length;)++t,e=i+f(),i+=o.settings.moveSlides<=f()?o.settings.moveSlides:f();else t=Math.ceil(o.children.length/f());return t},m=function(){return o.settings.moveSlides>0&&o.settings.moveSlides<=f()?o.settings.moveSlides:f()},S=function(){if(o.children.length>o.settings.maxSlides&&o.active.last&&!o.settings.infiniteLoop){if("horizontal"==o.settings.mode){var t=o.children.last(),e=t.position();b(-(e.left-(o.viewport.width()-t.width())),"reset",0)}else if("vertical"==o.settings.mode){var i=o.children.length-o.settings.minSlides,e=o.children.eq(i).position();b(-e.top,"reset",0)}}else{var e=o.children.eq(o.active.index*m()).position();o.active.index==x()-1&&(o.active.last=!0),void 0!=e&&("horizontal"==o.settings.mode?b(-e.left,"reset",0):"vertical"==o.settings.mode&&b(-e.top,"reset",0))}},b=function(t,e,i,s){if(o.usingCSS){var n="vertical"==o.settings.mode?"translate3d(0, "+t+"px, 0)":"translate3d("+t+"px, 0, 0)";r.css("-"+o.cssPrefix+"-transition-duration",i/1e3+"s"),"slide"==e?(r.css(o.animProp,n),r.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",function(){r.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"),D()})):"reset"==e?r.css(o.animProp,n):"ticker"==e&&(r.css("-"+o.cssPrefix+"-transition-timing-function","linear"),r.css(o.animProp,n),r.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",function(){r.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"),b(s.resetValue,"reset",0),N()}))}else{var a={};a[o.animProp]=t,"slide"==e?r.animate(a,i,o.settings.easing,function(){D()}):"reset"==e?r.css(o.animProp,t):"ticker"==e&&r.animate(a,speed,"linear",function(){b(s.resetValue,"reset",0),N()})}},w=function(){for(var e="",i=x(),s=0;i>s;s++){var n="";o.settings.buildPager&&t.isFunction(o.settings.buildPager)?(n=o.settings.buildPager(s),o.pagerEl.addClass("bx-custom-pager")):(n=s+1,o.pagerEl.addClass("bx-default-pager")),e+='<div class="bx-pager-item"><a href="" data-slide-index="'+s+'" class="bx-pager-link">'+n+"</a></div>"}o.pagerEl.html(e)},T=function(){o.settings.pagerCustom?o.pagerEl=t(o.settings.pagerCustom):(o.pagerEl=t('<div class="bx-pager" />'),o.settings.pagerSelector?t(o.settings.pagerSelector).html(o.pagerEl):o.controls.el.addClass("bx-has-pager").append(o.pagerEl),w()),o.pagerEl.delegate("a","click",q)},C=function(){o.controls.next=t('<a class="bx-next" href="">'+o.settings.nextText+"</a>"),o.controls.prev=t('<a class="bx-prev" href="">'+o.settings.prevText+"</a>"),o.controls.next.bind("click",y),o.controls.prev.bind("click",z),o.settings.nextSelector&&t(o.settings.nextSelector).append(o.controls.next),o.settings.prevSelector&&t(o.settings.prevSelector).append(o.controls.prev),o.settings.nextSelector||o.settings.prevSelector||(o.controls.directionEl=t('<div class="bx-controls-direction" />'),o.controls.directionEl.append(o.controls.prev).append(o.controls.next),o.controls.el.addClass("bx-has-controls-direction").append(o.controls.directionEl))},E=function(){o.controls.start=t('<div class="bx-controls-auto-item"><a class="bx-start" href="">'+o.settings.startText+"</a></div>"),o.controls.stop=t('<div class="bx-controls-auto-item"><a class="bx-stop" href="">'+o.settings.stopText+"</a></div>"),o.controls.autoEl=t('<div class="bx-controls-auto" />'),o.controls.autoEl.delegate(".bx-start","click",k),o.controls.autoEl.delegate(".bx-stop","click",M),o.settings.autoControlsCombine?o.controls.autoEl.append(o.controls.start):o.controls.autoEl.append(o.controls.start).append(o.controls.stop),o.settings.autoControlsSelector?t(o.settings.autoControlsSelector).html(o.controls.autoEl):o.controls.el.addClass("bx-has-controls-auto").append(o.controls.autoEl),A(o.settings.autoStart?"stop":"start")},P=function(){o.children.each(function(){var e=t(this).find("img:first").attr("title");void 0!=e&&(""+e).length&&t(this).append('<div class="bx-caption"><span>'+e+"</span></div>")})},y=function(t){o.settings.auto&&r.stopAuto(),r.goToNextSlide(),t.preventDefault()},z=function(t){o.settings.auto&&r.stopAuto(),r.goToPrevSlide(),t.preventDefault()},k=function(t){r.startAuto(),t.preventDefault()},M=function(t){r.stopAuto(),t.preventDefault()},q=function(e){o.settings.auto&&r.stopAuto();var i=t(e.currentTarget),s=parseInt(i.attr("data-slide-index"));s!=o.active.index&&r.goToSlide(s),e.preventDefault()},I=function(e){var i=o.children.length;return"short"==o.settings.pagerType?(o.settings.maxSlides>1&&(i=Math.ceil(o.children.length/o.settings.maxSlides)),o.pagerEl.html(e+1+o.settings.pagerShortSeparator+i),void 0):(o.pagerEl.find("a").removeClass("active"),o.pagerEl.each(function(i,s){t(s).find("a").eq(e).addClass("active")}),void 0)},D=function(){if(o.settings.infiniteLoop){var t="";0==o.active.index?t=o.children.eq(0).position():o.active.index==x()-1&&o.carousel?t=o.children.eq((x()-1)*m()).position():o.active.index==o.children.length-1&&(t=o.children.eq(o.children.length-1).position()),"horizontal"==o.settings.mode?b(-t.left,"reset",0):"vertical"==o.settings.mode&&b(-t.top,"reset",0)}o.working=!1,o.settings.onSlideAfter(o.children.eq(o.active.index),o.oldIndex,o.active.index)},A=function(t){o.settings.autoControlsCombine?o.controls.autoEl.html(o.controls[t]):(o.controls.autoEl.find("a").removeClass("active"),o.controls.autoEl.find("a:not(.bx-"+t+")").addClass("active"))},W=function(){1==x()?(o.controls.prev.addClass("disabled"),o.controls.next.addClass("disabled")):!o.settings.infiniteLoop&&o.settings.hideControlOnEnd&&(0==o.active.index?(o.controls.prev.addClass("disabled"),o.controls.next.removeClass("disabled")):o.active.index==x()-1?(o.controls.next.addClass("disabled"),o.controls.prev.removeClass("disabled")):(o.controls.prev.removeClass("disabled"),o.controls.next.removeClass("disabled")))},H=function(){o.settings.autoDelay>0?setTimeout(r.startAuto,o.settings.autoDelay):r.startAuto(),o.settings.autoHover&&r.hover(function(){o.interval&&(r.stopAuto(!0),o.autoPaused=!0)},function(){o.autoPaused&&(r.startAuto(!0),o.autoPaused=null)})},L=function(){var e=0;if("next"==o.settings.autoDirection)r.append(o.children.clone().addClass("bx-clone"));else{r.prepend(o.children.clone().addClass("bx-clone"));var i=o.children.first().position();e="horizontal"==o.settings.mode?-i.left:-i.top}b(e,"reset",0),o.settings.pager=!1,o.settings.controls=!1,o.settings.autoControls=!1,o.settings.tickerHover&&!o.usingCSS&&o.viewport.hover(function(){r.stop()},function(){var e=0;o.children.each(function(){e+="horizontal"==o.settings.mode?t(this).outerWidth(!0):t(this).outerHeight(!0)});var i=o.settings.speed/e,s="horizontal"==o.settings.mode?"left":"top",n=i*(e-Math.abs(parseInt(r.css(s))));N(n)}),N()},N=function(t){speed=t?t:o.settings.speed;var e={left:0,top:0},i={left:0,top:0};"next"==o.settings.autoDirection?e=r.find(".bx-clone").first().position():i=o.children.first().position();var s="horizontal"==o.settings.mode?-e.left:-e.top,n="horizontal"==o.settings.mode?-i.left:-i.top,a={resetValue:n};b(s,"ticker",speed,a)},O=function(){o.touch={start:{x:0,y:0},end:{x:0,y:0}},o.viewport.bind("touchstart",X)},X=function(t){if(o.working)t.preventDefault();else{o.touch.originalPos=r.position();var e=t.originalEvent;o.touch.start.x=e.changedTouches[0].pageX,o.touch.start.y=e.changedTouches[0].pageY,o.viewport.bind("touchmove",Y),o.viewport.bind("touchend",V)}},Y=function(t){var e=t.originalEvent,i=Math.abs(e.changedTouches[0].pageX-o.touch.start.x),s=Math.abs(e.changedTouches[0].pageY-o.touch.start.y);if(3*i>s&&o.settings.preventDefaultSwipeX?t.preventDefault():3*s>i&&o.settings.preventDefaultSwipeY&&t.preventDefault(),"fade"!=o.settings.mode&&o.settings.oneToOneTouch){var n=0;if("horizontal"==o.settings.mode){var r=e.changedTouches[0].pageX-o.touch.start.x;n=o.touch.originalPos.left+r}else{var r=e.changedTouches[0].pageY-o.touch.start.y;n=o.touch.originalPos.top+r}b(n,"reset",0)}},V=function(t){o.viewport.unbind("touchmove",Y);var e=t.originalEvent,i=0;if(o.touch.end.x=e.changedTouches[0].pageX,o.touch.end.y=e.changedTouches[0].pageY,"fade"==o.settings.mode){var s=Math.abs(o.touch.start.x-o.touch.end.x);s>=o.settings.swipeThreshold&&(o.touch.start.x>o.touch.end.x?r.goToNextSlide():r.goToPrevSlide(),r.stopAuto())}else{var s=0;"horizontal"==o.settings.mode?(s=o.touch.end.x-o.touch.start.x,i=o.touch.originalPos.left):(s=o.touch.end.y-o.touch.start.y,i=o.touch.originalPos.top),!o.settings.infiniteLoop&&(0==o.active.index&&s>0||o.active.last&&0>s)?b(i,"reset",200):Math.abs(s)>=o.settings.swipeThreshold?(0>s?r.goToNextSlide():r.goToPrevSlide(),r.stopAuto()):b(i,"reset",200)}o.viewport.unbind("touchend",V)},B=function(){var e=t(window).width(),i=t(window).height();(a!=e||l!=i)&&(a=e,l=i,r.redrawSlider())};return r.goToSlide=function(e,i){if(!o.working&&o.active.index!=e)if(o.working=!0,o.oldIndex=o.active.index,o.active.index=0>e?x()-1:e>=x()?0:e,o.settings.onSlideBefore(o.children.eq(o.active.index),o.oldIndex,o.active.index),"next"==i?o.settings.onSlideNext(o.children.eq(o.active.index),o.oldIndex,o.active.index):"prev"==i&&o.settings.onSlidePrev(o.children.eq(o.active.index),o.oldIndex,o.active.index),o.active.last=o.active.index>=x()-1,o.settings.pager&&I(o.active.index),o.settings.controls&&W(),"fade"==o.settings.mode)o.settings.adaptiveHeight&&o.viewport.height()!=p()&&o.viewport.animate({height:p()},o.settings.adaptiveHeightSpeed),o.children.filter(":visible").fadeOut(o.settings.speed).css({zIndex:0}),o.children.eq(o.active.index).css("zIndex",51).fadeIn(o.settings.speed,function(){t(this).css("zIndex",50),D()});else{o.settings.adaptiveHeight&&o.viewport.height()!=p()&&o.viewport.animate({height:p()},o.settings.adaptiveHeightSpeed);var s=0,n={left:0,top:0};if(!o.settings.infiniteLoop&&o.carousel&&o.active.last)if("horizontal"==o.settings.mode){var a=o.children.eq(o.children.length-1);n=a.position(),s=o.viewport.width()-a.outerWidth()}else{var l=o.children.length-o.settings.minSlides;n=o.children.eq(l).position()}else if(o.carousel&&o.active.last&&"prev"==i){var d=1==o.settings.moveSlides?o.settings.maxSlides-m():(x()-1)*m()-(o.children.length-o.settings.maxSlides),a=r.children(".bx-clone").eq(d);n=a.position()}else if("next"==i&&0==o.active.index)n=r.find("> .bx-clone").eq(o.settings.maxSlides).position(),o.active.last=!1;else if(e>=0){var c=e*m();n=o.children.eq(c).position()}if("undefined"!=typeof n){var g="horizontal"==o.settings.mode?-(n.left-s):-n.top;b(g,"slide",o.settings.speed)}}},r.goToNextSlide=function(){if(o.settings.infiniteLoop||!o.active.last){var t=parseInt(o.active.index)+1;r.goToSlide(t,"next")}},r.goToPrevSlide=function(){if(o.settings.infiniteLoop||0!=o.active.index){var t=parseInt(o.active.index)-1;r.goToSlide(t,"prev")}},r.startAuto=function(t){o.interval||(o.interval=setInterval(function(){"next"==o.settings.autoDirection?r.goToNextSlide():r.goToPrevSlide()},o.settings.pause),o.settings.autoControls&&1!=t&&A("stop"))},r.stopAuto=function(t){o.interval&&(clearInterval(o.interval),o.interval=null,o.settings.autoControls&&1!=t&&A("start"))},r.getCurrentSlide=function(){return o.active.index},r.getSlideCount=function(){return o.children.length},r.redrawSlider=function(){o.children.add(r.find(".bx-clone")).outerWidth(u()),o.viewport.css("height",p()),o.settings.ticker||S(),o.active.last&&(o.active.index=x()-1),o.active.index>=x()&&(o.active.last=!0),o.settings.pager&&!o.settings.pagerCustom&&(w(),I(o.active.index))},r.destroySlider=function(){o.initialized&&(o.initialized=!1,t(".bx-clone",this).remove(),o.children.each(function(){void 0!=t(this).data("origStyle")?t(this).attr("style",t(this).data("origStyle")):t(this).removeAttr("style")}),void 0!=t(this).data("origStyle")?this.attr("style",t(this).data("origStyle")):t(this).removeAttr("style"),t(this).unwrap().unwrap(),o.controls.el&&o.controls.el.remove(),o.controls.next&&o.controls.next.remove(),o.controls.prev&&o.controls.prev.remove(),o.pagerEl&&o.pagerEl.remove(),t(".bx-caption",this).remove(),o.controls.autoEl&&o.controls.autoEl.remove(),clearInterval(o.interval),o.settings.responsive&&t(window).unbind("resize",B))},r.reloadSlider=function(t){void 0!=t&&(n=t),r.destroySlider(),d()},d(),this}}(jQuery);

/*!
 *  GMAP3 Plugin for JQuery
 *  Version   : 5.1.1
 *  Date      : 2013-05-25
 *  Licence   : GPL v3 : http://www.gnu.org/licenses/gpl.html
 *  Author    : DEMONTE Jean-Baptiste
 *  Contact   : jbdemonte@gmail.com
 *  Web site  : http://gmap3.net
 *
 *  Copyright (c) 2010-2012 Jean-Baptiste DEMONTE
 *  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   - Neither the name of the author nor the names of its contributors
 *     may be used to endorse or promote products derived from this
 *     software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
;(function ($, undef) {

    /***************************************************************************/
    /*                           GMAP3 DEFAULTS                                */
    /***************************************************************************/
    // defaults are defined later in the code to pass the rails asset pipeline and
    //jasmine while google library is not loaded
    var defaults, gId = 0;

    function initDefaults() {
        if (!defaults) {
            defaults = {
                verbose: false,
                queryLimit: {
                    attempt: 5,
                    delay: 250, // setTimeout(..., delay + random);
                    random: 250
                },
                classes: {
                    Map               : google.maps.Map,
                    Marker            : google.maps.Marker,
                    InfoWindow        : google.maps.InfoWindow,
                    Circle            : google.maps.Circle,
                    Rectangle         : google.maps.Rectangle,
                    OverlayView       : google.maps.OverlayView,
                    StreetViewPanorama: google.maps.StreetViewPanorama,
                    KmlLayer          : google.maps.KmlLayer,
                    TrafficLayer      : google.maps.TrafficLayer,
                    BicyclingLayer    : google.maps.BicyclingLayer,
                    GroundOverlay     : google.maps.GroundOverlay,
                    StyledMapType     : google.maps.StyledMapType,
                    ImageMapType      : google.maps.ImageMapType
                },
                map: {
                    mapTypeId : google.maps.MapTypeId.ROADMAP,
                    center: [46.578498, 2.457275],
                    zoom: 2
                },
                overlay: {
                    pane: "floatPane",
                    content: "",
                    offset: {
                        x: 0,
                        y: 0
                    }
                },
                geoloc: {
                    getCurrentPosition: {
                        maximumAge: 60000,
                        timeout: 5000
                    }
                }
            }
        }
    }

    function globalId(id, simulate){
        return id !== undef ? id : "gmap3_" + (simulate ? gId + 1 : ++gId);
    }

    /**
     * Return true if current version of Google Maps is equal or above to these in parameter
     * @param version {string} Minimal version required
     * @return {Boolean}
     */
    function googleVersionMin(version) {
        var i,
            gmVersion = google.maps.version.split(".");
        version = version.split(".");
        for(i = 0; i < gmVersion.length; i++) {
            gmVersion[i] = parseInt(gmVersion[i], 10);
        }
        for(i = 0; i < version.length; i++) {
            version[i] = parseInt(version[i], 10);
            if (gmVersion.hasOwnProperty(i)) {
                if (gmVersion[i] < version[i]) {
                    return false;
                }
            } else {
                return false;
            }
        }
        return true;
    }

    /**
     * attach events from a container to a sender
     * todo[
     *  events => { eventName => function, }
     *  onces  => { eventName => function, }
     *  data   => mixed data
     * ]
     **/
    function attachEvents($container, args, sender, id, senders){
        if (args.todo.events || args.todo.onces) {
            var context = {
                id: id,
                data: args.todo.data,
                tag: args.todo.tag
            };
            if (args.todo.events){
                $.each(args.todo.events, function(name, f){
                    var that = $container, fn = f;
                    if ($.isArray(f)) {
                        that = f[0];
                        fn = f[1]
                    }
                    google.maps.event.addListener(sender, name, function(event) {
                        fn.apply(that, [senders ? senders : sender, event, context]);
                    });
                });
            }
            if (args.todo.onces){
                $.each(args.todo.onces, function(name, f){
                    var that = $container, fn = f;
                    if ($.isArray(f)) {
                        that = f[0];
                        fn = f[1]
                    }
                    google.maps.event.addListenerOnce(sender, name, function(event) {
                        fn.apply(that, [senders ? senders : sender, event, context]);
                    });
                });
            }
        }
    }

    /***************************************************************************/
    /*                                STACK                                    */
    /***************************************************************************/

    function Stack (){
        var st = [];
        this.empty = function (){
            return !st.length;
        };
        this.add = function(v){
            st.push(v);
        };
        this.get = function (){
            return st.length ? st[0] : false;
        };
        this.ack = function (){
            st.shift();
        };
    }

    /***************************************************************************/
    /*                                TASK                                     */
    /***************************************************************************/

    function Task(ctx, onEnd, todo){
        var session = {},
            that = this,
            current,
            resolve = {
                latLng:{ // function => bool (=> address = latLng)
                    map:false,
                    marker:false,
                    infowindow:false,
                    circle:false,
                    overlay: false,
                    getlatlng: false,
                    getmaxzoom: false,
                    getelevation: false,
                    streetviewpanorama: false,
                    getaddress: true
                },
                geoloc:{
                    getgeoloc: true
                }
            };

        if (typeof todo === "string"){
            todo =  unify(todo);
        }

        function unify(todo){
            var result = {};
            result[todo] = {};
            return result;
        }

        function next(){
            var k;
            for(k in todo){
                if (k in session){ // already run
                    continue;
                }
                return k;
            }
        }

        this.run = function (){
            var k, opts;
            while(k = next()){
                if (typeof ctx[k] === "function"){
                    current = k;
                    opts = $.extend(true, {}, defaults[k] || {}, todo[k].options || {});
                    if (k in resolve.latLng){
                        if (todo[k].values){
                            resolveAllLatLng(todo[k].values, ctx, ctx[k], {todo:todo[k], opts:opts, session:session});
                        } else {
                            resolveLatLng(ctx, ctx[k], resolve.latLng[k], {todo:todo[k], opts:opts, session:session});
                        }
                    } else if (k in resolve.geoloc){
                        geoloc(ctx, ctx[k], {todo:todo[k], opts:opts, session:session});
                    } else {
                        ctx[k].apply(ctx, [{todo:todo[k], opts:opts, session:session}]);
                    }
                    return; // wait until ack
                } else {
                    session[k] = null;
                }
            }
            onEnd.apply(ctx, [todo, session]);
        };

        this.ack = function(result){
            session[current] = result;
            that.run.apply(that, []);
        };
    }

    function getKeys(obj){
        var k, keys = [];
        for(k in obj){
            keys.push(k);
        }
        return keys;
    }

    function tuple(args, value){
        var todo = {};

        // "copy" the common data
        if (args.todo){
            for(var k in args.todo){
                if ((k !== "options") && (k !== "values")){
                    todo[k] = args.todo[k];
                }
            }
        }
        // "copy" some specific keys from value first else args.todo
        var i, keys = ["data", "tag", "id", "events",  "onces"];
        for(i=0; i<keys.length; i++){
            copyKey(todo, keys[i], value, args.todo);
        }

        // create an extended options
        todo.options = $.extend({}, args.opts || {}, value.options || {});

        return todo;
    }

    /**
     * copy a key content
     **/
    function copyKey(target, key){
        for(var i=2; i<arguments.length; i++){
            if (key in arguments[i]){
                target[key] = arguments[i][key];
                return;
            }
        }
    }

    /***************************************************************************/
    /*                             GEOCODERCACHE                               */
    /***************************************************************************/

    function GeocoderCache(){
        var cache = [];

        this.get = function(request){
            if (cache.length){
                var i, j, k, item, eq,
                    keys = getKeys(request);
                for(i=0; i<cache.length; i++){
                    item = cache[i];
                    eq = keys.length == item.keys.length;
                    for(j=0; (j<keys.length) && eq; j++){
                        k = keys[j];
                        eq = k in item.request;
                        if (eq){
                            if ((typeof request[k] === "object") && ("equals" in request[k]) && (typeof request[k] === "function")){
                                eq = request[k].equals(item.request[k]);
                            } else{
                                eq = request[k] === item.request[k];
                            }
                        }
                    }
                    if (eq){
                        return item.results;
                    }
                }
            }
        };

        this.store = function(request, results){
            cache.push({request:request, keys:getKeys(request), results:results});
        };
    }

    /***************************************************************************/
    /*                                OVERLAYVIEW                              */
    /***************************************************************************/
    function OverlayView(map, opts, latLng, $div) {
        var that = this, listeners = [];

        defaults.classes.OverlayView.call(this);
        this.setMap(map);

        this.onAdd = function() {
            var panes = this.getPanes();
            if (opts.pane in panes) {
                $(panes[opts.pane]).append($div);
            }
            $.each("dblclick click mouseover mousemove mouseout mouseup mousedown".split(" "), function(i, name){
                listeners.push(
                    google.maps.event.addDomListener($div[0], name, function(e) {
                        $.Event(e).stopPropagation();
                        google.maps.event.trigger(that, name, [e]);
                        that.draw();
                    })
                );
            });
            listeners.push(
                google.maps.event.addDomListener($div[0], "contextmenu", function(e) {
                    $.Event(e).stopPropagation();
                    google.maps.event.trigger(that, "rightclick", [e]);
                    that.draw();
                })
            );
        };
        this.getPosition = function(){
            return latLng;
        };
        this.setPosition = function(newLatLng){
            latLng = newLatLng;
            this.draw();
        };
        this.draw = function() {
            var ps = this.getProjection().fromLatLngToDivPixel(latLng);
            $div
                .css("left", (ps.x+opts.offset.x) + "px")
                .css("top" , (ps.y+opts.offset.y) + "px");
        };
        this.onRemove = function() {
            for (var i = 0; i < listeners.length; i++) {
                google.maps.event.removeListener(listeners[i]);
            }
            $div.remove();
        };
        this.hide = function() {
            $div.hide();
        };
        this.show = function() {
            $div.show();
        };
        this.toggle = function() {
            if ($div) {
                if ($div.is(":visible")){
                    this.show();
                } else {
                    this.hide();
                }
            }
        };
        this.toggleDOM = function() {
            if (this.getMap()) {
                this.setMap(null);
            } else {
                this.setMap(map);
            }
        };
        this.getDOMElement = function() {
            return $div[0];
        };
    }

    /***************************************************************************/
    /*                              CLUSTERING                                 */
    /***************************************************************************/

    /**
     * Usefull to get a projection
     * => done in a function, to let dead-code analyser works without google library loaded
     **/
    function newEmptyOverlay(map, radius){
        function Overlay(){
            this.onAdd = function(){};
            this.onRemove = function(){};
            this.draw = function(){};
            return defaults.classes.OverlayView.apply(this, []);
        }
        Overlay.prototype = defaults.classes.OverlayView.prototype;
        var obj = new Overlay();
        obj.setMap(map);
        return obj;
    }

    /**
     * Class InternalClusterer
     * This class manage clusters thanks to "todo" objects
     *
     * Note:
     * Individuals marker are created on the fly thanks to the todo objects, they are
     * first set to null to keep the indexes synchronised with the todo list
     * This is the "display" function, set by the gmap3 object, which uses theses data
     * to create markers when clusters are not required
     * To remove a marker, the objects are deleted and set not null in arrays
     *    markers[key]
     *      = null : marker exist but has not been displayed yet
     *      = false : marker has been removed
     **/
    function InternalClusterer($container, map, raw){
        var updating = false,
            updated = false,
            redrawing = false,
            ready = false,
            enabled = true,
            that = this,
            events =  [],
            store = {},   // combin of index (id1-id2-...) => object
            ids = {},     // unique id => index
            idxs = {},    // index => unique id
            markers = [], // index => marker
            todos = [],   // index => todo or null if removed
            values = [],  // index => value
            overlay = newEmptyOverlay(map, raw.radius),
            timer, projection,
            ffilter, fdisplay, ferror; // callback function

        main();

        function prepareMarker(index) {
            if (!markers[index]) {
                delete todos[index].options.map;
                markers[index] = new defaults.classes.Marker(todos[index].options);
                attachEvents($container, {todo: todos[index]}, markers[index], todos[index].id);
            }
        }

        /**
         * return a marker by its id, null if not yet displayed and false if no exist or removed
         **/
        this.getById = function(id){
            if (id in ids) {
                prepareMarker(ids[id]);
                return  markers[ids[id]];
            }
            return false;
        };

        /**
         * remove one object from the store
         **/
        this.rm = function (id) {
            var index = ids[id];
            if (markers[index]){ // can be null
                markers[index].setMap(null);
            }
            delete markers[index];
            markers[index] = false;

            delete todos[index];
            todos[index] = false;

            delete values[index];
            values[index] = false;

            delete ids[id];
            delete idxs[index];
            updated = true;
        };

        /**
         * remove a marker by its id
         **/
        this.clearById = function(id){
            if (id in ids){
                this.rm(id);
                return true;
            }
        };

        /**
         * remove objects from the store
         **/
        this.clear = function(last, first, tag){
            var start, stop, step, index, i,
                list = [],
                check = ftag(tag);
            if (last) {
                start = todos.length - 1;
                stop = -1;
                step = -1;
            } else {
                start = 0;
                stop =  todos.length;
                step = 1;
            }
            for (index = start; index != stop; index += step) {
                if (todos[index]) {
                    if (!check || check(todos[index].tag)){
                        list.push(idxs[index]);
                        if (first || last) {
                            break;
                        }
                    }
                }
            }
            for (i = 0; i < list.length; i++) {
                this.rm(list[i]);
            }
        };

        // add a "marker todo" to the cluster
        this.add = function(todo, value){
            todo.id = globalId(todo.id);
            this.clearById(todo.id);
            ids[todo.id] = markers.length;
            idxs[markers.length] = todo.id;
            markers.push(null); // null = marker not yet created / displayed
            todos.push(todo);
            values.push(value);
            updated = true;
        };

        // add a real marker to the cluster
        this.addMarker = function(marker, todo){
            todo = todo || {};
            todo.id = globalId(todo.id);
            this.clearById(todo.id);
            if (!todo.options){
                todo.options = {};
            }
            todo.options.position = marker.getPosition();
            attachEvents($container, {todo:todo}, marker, todo.id);
            ids[todo.id] = markers.length;
            idxs[markers.length] = todo.id;
            markers.push(marker);
            todos.push(todo);
            values.push(todo.data || {});
            updated = true;
        };

        // return a "marker todo" by its index
        this.todo = function(index){
            return todos[index];
        };

        // return a "marker value" by its index
        this.value = function(index){
            return values[index];
        };

        // return a marker by its index
        this.marker = function(index){
            if (index in markers) {
                prepareMarker(index);
                return  markers[index];
            }
            return false;
        };

        // return a marker by its index
        this.markerIsSet = function(index){
            return Boolean(markers[index]);
        };

        // store a new marker instead if the default "false"
        this.setMarker = function(index, marker){
            markers[index] = marker;
        };

        // link the visible overlay to the logical data (to hide overlays later)
        this.store = function(cluster, obj, shadow){
            store[cluster.ref] = {obj:obj, shadow:shadow};
        };

        // free all objects
        this.free = function(){
            for(var i = 0; i < events.length; i++){
                google.maps.event.removeListener(events[i]);
            }
            events = [];

            $.each(store, function(key){
                flush(key);
            });
            store = {};

            $.each(todos, function(i){
                todos[i] = null;
            });
            todos = [];

            $.each(markers, function(i){
                if (markers[i]){ // false = removed
                    markers[i].setMap(null);
                    delete markers[i];
                }
            });
            markers = [];

            $.each(values, function(i){
                delete values[i];
            });
            values = [];

            ids = {};
            idxs = {};
        };

        // link the display function
        this.filter = function(f){
            ffilter = f;
            redraw();
        };

        // enable/disable the clustering feature
        this.enable = function(value){
            if (enabled != value){
                enabled = value;
                redraw();
            }
        };

        // link the display function
        this.display = function(f){
            fdisplay = f;
        };

        // link the errorfunction
        this.error = function(f){
            ferror = f;
        };

        // lock the redraw
        this.beginUpdate = function(){
            updating = true;
        };

        // unlock the redraw
        this.endUpdate = function(){
            updating = false;
            if (updated){
                redraw();
            }
        };

        // extends current bounds with internal markers
        this.autofit = function(bounds){
            for(var i=0; i<todos.length; i++){
                if (todos[i]){
                    bounds.extend(todos[i].options.position);
                }
            }
        };

        // bind events
        function main(){
            projection = overlay.getProjection();
            if (!projection){
                setTimeout(function(){
                        main.apply(that, []);
                    },
                    25);
                return;
            }
            ready = true;
            events.push(google.maps.event.addListener(map, "zoom_changed", function(){delayRedraw();}));
            events.push(google.maps.event.addListener(map, "bounds_changed", function(){delayRedraw();}));
            redraw();
        }

        // flush overlays
        function flush(key){
            if (typeof store[key] === "object"){ // is overlay
                if (typeof(store[key].obj.setMap) === "function") {
                    store[key].obj.setMap(null);
                }
                if (typeof(store[key].obj.remove) === "function") {
                    store[key].obj.remove();
                }
                if (typeof(store[key].shadow.remove) === "function") {
                    store[key].obj.remove();
                }
                if (typeof(store[key].shadow.setMap) === "function") {
                    store[key].shadow.setMap(null);
                }
                delete store[key].obj;
                delete store[key].shadow;
            } else if (markers[key]){ // marker not removed
                markers[key].setMap(null);
                // don't remove the marker object, it may be displayed later
            }
            delete store[key];
        }

        /**
         * return the distance between 2 latLng couple into meters
         * Params :
         *  Lat1, Lng1, Lat2, Lng2
         *  LatLng1, Lat2, Lng2
         *  Lat1, Lng1, LatLng2
         *  LatLng1, LatLng2
         **/
        function distanceInMeter(){
            var lat1, lat2, lng1, lng2, e, f, g, h;
            if (arguments[0] instanceof google.maps.LatLng){
                lat1 = arguments[0].lat();
                lng1 = arguments[0].lng();
                if (arguments[1] instanceof google.maps.LatLng){
                    lat2 = arguments[1].lat();
                    lng2 = arguments[1].lng();
                } else {
                    lat2 = arguments[1];
                    lng2 = arguments[2];
                }
            } else {
                lat1 = arguments[0];
                lng1 = arguments[1];
                if (arguments[2] instanceof google.maps.LatLng){
                    lat2 = arguments[2].lat();
                    lng2 = arguments[2].lng();
                } else {
                    lat2 = arguments[2];
                    lng2 = arguments[3];
                }
            }
            e = Math.PI*lat1/180;
            f = Math.PI*lng1/180;
            g = Math.PI*lat2/180;
            h = Math.PI*lng2/180;
            return 1000*6371 * Math.acos(Math.min(Math.cos(e)*Math.cos(g)*Math.cos(f)*Math.cos(h)+Math.cos(e)*Math.sin(f)*Math.cos(g)*Math.sin(h)+Math.sin(e)*Math.sin(g),1));
        }

        // extend the visible bounds
        function extendsMapBounds(){
            var radius = distanceInMeter(map.getCenter(), map.getBounds().getNorthEast()),
                circle = new google.maps.Circle({
                    center: map.getCenter(),
                    radius: 1.25 * radius // + 25%
                });
            return circle.getBounds();
        }

        // return an object where keys are store keys
        function getStoreKeys(){
            var keys = {}, k;
            for(k in store){
                keys[k] = true;
            }
            return keys;
        }

        // async the delay function
        function delayRedraw(){
            clearTimeout(timer);
            timer = setTimeout(function(){
                    redraw();
                },
                25);
        }

        // generate bounds extended by radius
        function extendsBounds(latLng) {
            var p = projection.fromLatLngToDivPixel(latLng),
                ne = projection.fromDivPixelToLatLng(new google.maps.Point(p.x+raw.radius, p.y-raw.radius)),
                sw = projection.fromDivPixelToLatLng(new google.maps.Point(p.x-raw.radius, p.y+raw.radius));
            return new google.maps.LatLngBounds(sw, ne);
        }

        // run the clustering process and call the display function
        function redraw(){
            if (updating || redrawing || !ready){
                return;
            }

            var keys = [], used = {},
                zoom = map.getZoom(),
                forceDisabled = ("maxZoom" in raw) && (zoom > raw.maxZoom),
                previousKeys = getStoreKeys(),
                i, j, k, indexes, check = false, bounds, cluster, position, previous, lat, lng, loop;

            // reset flag
            updated = false;

            if (zoom > 3){
                // extend the bounds of the visible map to manage clusters near the boundaries
                bounds = extendsMapBounds();

                // check contain only if boundaries are valid
                check = bounds.getSouthWest().lng() < bounds.getNorthEast().lng();
            }

            // calculate positions of "visibles" markers (in extended bounds)
            for(i=0; i<todos.length; i++){
                if (todos[i] && (!check || bounds.contains(todos[i].options.position)) && (!ffilter || ffilter(values[i]))){
                    keys.push(i);
                }
            }

            // for each "visible" marker, search its neighbors to create a cluster
            // we can't do a classical "for" loop, because, analysis can bypass a marker while focusing on cluster
            while(1){
                i=0;
                while(used[i] && (i<keys.length)){ // look for the next marker not used
                    i++;
                }
                if (i == keys.length){
                    break;
                }

                indexes = [];

                if (enabled && !forceDisabled){
                    loop = 10;
                    do{
                        previous = indexes;
                        indexes = [];
                        loop--;

                        if (previous.length){
                            position = bounds.getCenter()
                        } else {
                            position = todos[ keys[i] ].options.position;
                        }
                        bounds = extendsBounds(position);

                        for(j=i; j<keys.length; j++){
                            if (used[j]){
                                continue;
                            }
                            if (bounds.contains(todos[ keys[j] ].options.position)){
                                indexes.push(j);
                            }
                        }
                    } while( (previous.length < indexes.length) && (indexes.length > 1) && loop);
                } else {
                    for(j=i; j<keys.length; j++){
                        if (used[j]){
                            continue;
                        }
                        indexes.push(j);
                        break;
                    }
                }

                cluster = {indexes:[], ref:[]};
                lat = lng = 0;
                for(k=0; k<indexes.length; k++){
                    used[ indexes[k] ] = true;
                    cluster.indexes.push(keys[indexes[k]]);
                    cluster.ref.push(keys[indexes[k]]);
                    lat += todos[ keys[indexes[k]] ].options.position.lat();
                    lng += todos[ keys[indexes[k]] ].options.position.lng();
                }
                lat /= indexes.length;
                lng /= indexes.length;
                cluster.latLng = new google.maps.LatLng(lat, lng);

                cluster.ref = cluster.ref.join("-");

                if (cluster.ref in previousKeys){ // cluster doesn't change
                    delete previousKeys[cluster.ref]; // remove this entry, these still in this array will be removed
                } else { // cluster is new
                    if (indexes.length === 1){ // alone markers are not stored, so need to keep the key (else, will be displayed every time and marker will blink)
                        store[cluster.ref] = true;
                    }
                    fdisplay(cluster);
                }
            }

            // flush the previous overlays which are not still used
            $.each(previousKeys, function(key){
                flush(key);
            });
            redrawing = false;
        }
    }

    /**
     * Class Clusterer
     * a facade with limited method for external use
     **/
    function Clusterer(id, internalClusterer){
        this.id = function(){
            return id;
        };
        this.filter = function(f){
            internalClusterer.filter(f);
        };
        this.enable = function(){
            internalClusterer.enable(true);
        };
        this.disable = function(){
            internalClusterer.enable(false);
        };
        this.add = function(marker, todo, lock){
            if (!lock) {
                internalClusterer.beginUpdate();
            }
            internalClusterer.addMarker(marker, todo);
            if (!lock) {
                internalClusterer.endUpdate();
            }
        };
        this.getById = function(id){
            return internalClusterer.getById(id);
        };
        this.clearById = function(id, lock){
            var result;
            if (!lock) {
                internalClusterer.beginUpdate();
            }
            result = internalClusterer.clearById(id);
            if (!lock) {
                internalClusterer.endUpdate();
            }
            return result;
        };
        this.clear = function(last, first, tag, lock){
            if (!lock) {
                internalClusterer.beginUpdate();
            }
            internalClusterer.clear(last, first, tag);
            if (!lock) {
                internalClusterer.endUpdate();
            }
        };
    }
    /***************************************************************************/
    /*                                STORE                                    */
    /***************************************************************************/

    function Store(){
        var store = {}, // name => [id, ...]
            objects = {}; // id => object

        function normalize(res) {
            return {
                id: res.id,
                name: res.name,
                object:res.obj,
                tag:res.tag,
                data:res.data
            };
        }

        /**
         * add a mixed to the store
         **/
        this.add = function(args, name, obj, sub){
            var todo = args.todo || {},
                id = globalId(todo.id);
            if (!store[name]){
                store[name] = [];
            }
            if (id in objects){ // object already exists: remove it
                this.clearById(id);
            }
            objects[id] = {obj:obj, sub:sub, name:name, id:id, tag:todo.tag, data:todo.data};
            store[name].push(id);
            return id;
        };

        /**
         * return a stored object by its id
         **/
        this.getById = function(id, sub, full){
            if (id in objects){
                if (sub) {
                    return objects[id].sub
                } else if (full) {
                    return normalize(objects[id]);
                }
                return objects[id].obj;

            }
            return false;
        };

        /**
         * return a stored value
         **/
        this.get = function(name, last, tag, full){
            var n, id, check = ftag(tag);
            if (!store[name] || !store[name].length){
                return null;
            }
            n = store[name].length;
            while(n){
                n--;
                id = store[name][last ? n : store[name].length - n - 1];
                if (id && objects[id]){
                    if (check && !check(objects[id].tag)){
                        continue;
                    }
                    return full ? normalize(objects[id]) : objects[id].obj;
                }
            }
            return null;
        };

        /**
         * return all stored values
         **/
        this.all = function(name, tag, full){
            var result = [],
                check = ftag(tag),
                find = function(n){
                    var i, id;
                    for(i=0; i<store[n].length; i++){
                        id = store[n][i];
                        if (id && objects[id]){
                            if (check && !check(objects[id].tag)){
                                continue;
                            }
                            result.push(full ? normalize(objects[id]) : objects[id].obj);
                        }
                    }
                };
            if (name in store){
                find(name);
            } else if (name === undef){ // internal use only
                for(name in store){
                    find(name);
                }
            }
            return result;
        };

        /**
         * hide and remove an object
         **/
        function rm(obj){
            // Google maps element
            if (typeof(obj.setMap) === "function") {
                obj.setMap(null);
            }
            // jQuery
            if (typeof(obj.remove) === "function") {
                obj.remove();
            }
            // internal (cluster)
            if (typeof(obj.free) === "function") {
                obj.free();
            }
            obj = null;
        }

        /**
         * remove one object from the store
         **/
        this.rm = function(name, check, pop){
            var idx, id;
            if (!store[name]) {
                return false;
            }
            if (check){
                if (pop){
                    for(idx = store[name].length - 1; idx >= 0; idx--){
                        id = store[name][idx];
                        if ( check(objects[id].tag) ){
                            break;
                        }
                    }
                } else {
                    for(idx = 0; idx < store[name].length; idx++){
                        id = store[name][idx];
                        if (check(objects[id].tag)){
                            break;
                        }
                    }
                }
            } else {
                idx = pop ? store[name].length - 1 : 0;
            }
            if ( !(idx in store[name]) ) {
                return false;
            }
            return this.clearById(store[name][idx], idx);
        };

        /**
         * remove object from the store by its id
         **/
        this.clearById = function(id, idx){
            if (id in objects){
                var i, name = objects[id].name;
                for(i=0; idx === undef && i<store[name].length; i++){
                    if (id === store[name][i]){
                        idx = i;
                    }
                }
                rm(objects[id].obj);
                if(objects[id].sub){
                    rm(objects[id].sub);
                }
                delete objects[id];
                store[name].splice(idx, 1);
                return true;
            }
            return false;
        };

        /**
         * return an object from a container object in the store by its id
         * ! for now, only cluster manage this feature
         **/
        this.objGetById = function(id){
            var result;
            if (store["clusterer"]) {
                for(var idx in store["clusterer"]){
                    if ((result = objects[store["clusterer"][idx]].obj.getById(id)) !== false){
                        return result;
                    }
                }
            }
            return false;
        };

        /**
         * remove object from a container object in the store by its id
         * ! for now, only cluster manage this feature
         **/
        this.objClearById = function(id){
            if (store["clusterer"]) {
                for(var idx in store["clusterer"]){
                    if (objects[store["clusterer"][idx]].obj.clearById(id)){
                        return true;
                    }
                }
            }
            return null;
        };

        /**
         * remove objects from the store
         **/
        this.clear = function(list, last, first, tag){
            var k, i, name, check = ftag(tag);
            if (!list || !list.length){
                list = [];
                for(k in store){
                    list.push(k);
                }
            } else {
                list = array(list);
            }
            for(i=0; i<list.length; i++){
                name = list[i];
                if (last){
                    this.rm(name, check, true);
                } else if (first){
                    this.rm(name, check, false);
                } else { // all
                    while(this.rm(name, check, false));
                }
            }
        };

        /**
         * remove object from a container object in the store by its tags
         * ! for now, only cluster manage this feature
         **/
        this.objClear = function(list, last, first, tag){
            if (store["clusterer"] && ($.inArray("marker", list) >= 0 || !list.length)) {
                for(var idx in store["clusterer"]){
                    objects[store["clusterer"][idx]].obj.clear(last, first, tag);
                }
            }
        };
    }

    /***************************************************************************/
    /*                           GMAP3 GLOBALS                                 */
    /***************************************************************************/

    var services = {},
        geocoderCache = new GeocoderCache();

    //-----------------------------------------------------------------------//
    // Service tools
    //-----------------------------------------------------------------------//

    function geocoder(){
        if (!services.geocoder) {
            services.geocoder = new google.maps.Geocoder();
        }
        return services.geocoder;
    }

    function directionsService(){
        if (!services.directionsService) {
            services.directionsService = new google.maps.DirectionsService();
        }
        return services.directionsService;
    }

    function elevationService(){
        if (!services.elevationService) {
            services.elevationService = new google.maps.ElevationService();
        }
        return services.elevationService;
    }

    function maxZoomService(){
        if (!services.maxZoomService) {
            services.maxZoomService = new google.maps.MaxZoomService();
        }
        return services.maxZoomService;
    }

    function distanceMatrixService(){
        if (!services.distanceMatrixService) {
            services.distanceMatrixService = new google.maps.DistanceMatrixService();
        }
        return services.distanceMatrixService;
    }

    //-----------------------------------------------------------------------//
    // Unit tools
    //-----------------------------------------------------------------------//

    function error(){
        if (defaults.verbose){
            var i, err = [];
            if (window.console && (typeof console.error === "function") ){
                for(i=0; i<arguments.length; i++){
                    err.push(arguments[i]);
                }
                console.error.apply(console, err);
            } else {
                err = "";
                for(i=0; i<arguments.length; i++){
                    err += arguments[i].toString() + " " ;
                }
                alert(err);
            }
        }
    }

    /**
     * return true if mixed is usable as number
     **/
    function numeric(mixed){
        return (typeof(mixed) === "number" || typeof(mixed) === "string") && mixed !== "" && !isNaN(mixed);
    }

    /**
     * convert data to array
     **/
    function array(mixed){
        var k, a = [];
        if (mixed !== undef){
            if (typeof(mixed) === "object"){
                if (typeof(mixed.length) === "number") {
                    a = mixed;
                } else {
                    for(k in mixed) {
                        a.push(mixed[k]);
                    }
                }
            } else{
                a.push(mixed);
            }
        }
        return a;
    }

    /**
     * create a function to check a tag
     */
    function ftag(tag){
        if (tag){
            if (typeof tag === "function"){
                return tag;
            }
            tag = array(tag);
            return function(val){
                if (val === undef){
                    return false;
                }
                if (typeof val === "object"){
                    for(var i=0; i<val.length; i++){
                        if($.inArray(val[i], tag) >= 0){
                            return true;
                        }
                    }
                    return false;
                }
                return $.inArray(val, tag) >= 0;
            }
        }
    }

    /**
     * convert mixed [ lat, lng ] objet to google.maps.LatLng
     **/
    function toLatLng (mixed, emptyReturnMixed, noFlat){
        var empty = emptyReturnMixed ? mixed : null;
        if (!mixed || (typeof mixed === "string")){
            return empty;
        }
        // defined latLng
        if (mixed.latLng) {
            return toLatLng(mixed.latLng);
        }
        // google.maps.LatLng object
        if (mixed instanceof google.maps.LatLng) {
            return mixed;
        }
        // {lat:X, lng:Y} object
        else if ( numeric(mixed.lat) ) {
            return new google.maps.LatLng(mixed.lat, mixed.lng);
        }
        // [X, Y] object
        else if ( !noFlat && $.isArray(mixed)){
            if ( !numeric(mixed[0]) || !numeric(mixed[1]) ) {
                return empty;
            }
            return new google.maps.LatLng(mixed[0], mixed[1]);
        }
        return empty;
    }

    /**
     * convert mixed [ sw, ne ] object by google.maps.LatLngBounds
     **/
    function toLatLngBounds(mixed){
        var ne, sw;
        if (!mixed || mixed instanceof google.maps.LatLngBounds) {
            return mixed || null;
        }
        if ($.isArray(mixed)){
            if (mixed.length == 2){
                ne = toLatLng(mixed[0]);
                sw = toLatLng(mixed[1]);
            } else if (mixed.length == 4){
                ne = toLatLng([mixed[0], mixed[1]]);
                sw = toLatLng([mixed[2], mixed[3]]);
            }
        } else {
            if ( ("ne" in mixed) && ("sw" in mixed) ){
                ne = toLatLng(mixed.ne);
                sw = toLatLng(mixed.sw);
            } else if ( ("n" in mixed) && ("e" in mixed) && ("s" in mixed) && ("w" in mixed) ){
                ne = toLatLng([mixed.n, mixed.e]);
                sw = toLatLng([mixed.s, mixed.w]);
            }
        }
        if (ne && sw){
            return new google.maps.LatLngBounds(sw, ne);
        }
        return null;
    }

    /**
     * resolveLatLng
     **/
    function resolveLatLng(ctx, method, runLatLng, args, attempt){
        var latLng = runLatLng ? toLatLng(args.todo, false, true) : false,
            conf = latLng ?  {latLng:latLng} : (args.todo.address ? (typeof(args.todo.address) === "string" ? {address:args.todo.address} : args.todo.address) : false),
            cache = conf ? geocoderCache.get(conf) : false,
            that = this;
        if (conf){
            attempt = attempt || 0; // convert undefined to int
            if (cache){
                args.latLng = cache.results[0].geometry.location;
                args.results = cache.results;
                args.status = cache.status;
                method.apply(ctx, [args]);
            } else {
                if (conf.location){
                    conf.location = toLatLng(conf.location);
                }
                if (conf.bounds){
                    conf.bounds = toLatLngBounds(conf.bounds);
                }
                geocoder().geocode(
                    conf,
                    function(results, status) {
                        if (status === google.maps.GeocoderStatus.OK){
                            geocoderCache.store(conf, {results:results, status:status});
                            args.latLng = results[0].geometry.location;
                            args.results = results;
                            args.status = status;
                            method.apply(ctx, [args]);
                        } else if ( (status === google.maps.GeocoderStatus.OVER_QUERY_LIMIT) && (attempt < defaults.queryLimit.attempt) ){
                            setTimeout(
                                function(){
                                    resolveLatLng.apply(that, [ctx, method, runLatLng, args, attempt+1]);
                                },
                                defaults.queryLimit.delay + Math.floor(Math.random() * defaults.queryLimit.random)
                            );
                        } else {
                            error("geocode failed", status, conf);
                            args.latLng = args.results = false;
                            args.status = status;
                            method.apply(ctx, [args]);
                        }
                    }
                );
            }
        } else {
            args.latLng = toLatLng(args.todo, false, true);
            method.apply(ctx, [args]);
        }
    }

    function resolveAllLatLng(list, ctx, method, args){
        var that = this, i = -1;

        function resolve(){
            // look for next address to resolve
            do{
                i++;
            }while( (i < list.length) && !("address" in list[i]) );

            // no address found, so run method
            if (i >= list.length){
                method.apply(ctx, [args]);
                return;
            }

            resolveLatLng(
                that,
                function(args){
                    delete args.todo;
                    $.extend(list[i], args);
                    resolve.apply(that, []); // resolve next (using apply avoid too much recursion)
                },
                true,
                {todo:list[i]}
            );
        }
        resolve();
    }

    /**
     * geolocalise the user and return a LatLng
     **/
    function geoloc(ctx, method, args){
        var is_echo = false; // sometime, a kind of echo appear, this trick will notice once the first call is run to ignore the next one
        if (navigator && navigator.geolocation){
            navigator.geolocation.getCurrentPosition(
                function(pos) {
                    if (is_echo){
                        return;
                    }
                    is_echo = true;
                    args.latLng = new google.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
                    method.apply(ctx, [args]);
                },
                function() {
                    if (is_echo){
                        return;
                    }
                    is_echo = true;
                    args.latLng = false;
                    method.apply(ctx, [args]);
                },
                args.opts.getCurrentPosition
            );
        } else {
            args.latLng = false;
            method.apply(ctx, [args]);
        }
    }

    /***************************************************************************/
    /*                                GMAP3                                    */
    /***************************************************************************/

    function Gmap3($this){
        var that = this,
            stack = new Stack(),
            store = new Store(),
            map = null,
            task;

        //-----------------------------------------------------------------------//
        // Stack tools
        //-----------------------------------------------------------------------//

        /**
         * store actions to execute in a stack manager
         **/
        this._plan = function(list){
            for(var k = 0; k < list.length; k++) {
                stack.add(new Task(that, end, list[k]));
            }
            run();
        };

        /**
         * if not running, start next action in stack
         **/
        function run(){
            if (!task && (task = stack.get())){
                task.run();
            }
        }

        /**
         * called when action in finished, to acknoledge the current in stack and start next one
         **/
        function end(){
            task = null;
            stack.ack();
            run.call(that); // restart to high level scope
        }

        //-----------------------------------------------------------------------//
        // Tools
        //-----------------------------------------------------------------------//

        /**
         * execute callback functions
         **/
        function callback(args){
            if (args.todo.callback) {
                var params = Array.prototype.slice.call(arguments, 1);
                if (typeof args.todo.callback === "function") {
                    args.todo.callback.apply($this, params);
                } else if ($.isArray(args.todo.callback)) {
                    if (typeof args.todo.callback[1] === "function") {
                        args.todo.callback[1].apply(args.todo.callback[0], params);
                    }
                }
            }
        }

        /**
         * execute ending functions
         **/
        function manageEnd(args, obj, id){
            if (id){
                attachEvents($this, args, obj, id);
            }
            callback(args, obj);
            task.ack(obj);
        }

        /**
         * initialize the map if not yet initialized
         **/
        function newMap(latLng, args){
            args = args || {};
            if (map) {
                if (args.todo && args.todo.options){
                    if (args.todo.options.center) {
                        args.todo.options.center = toLatLng(args.todo.options.center);
                    }
                    map.setOptions(args.todo.options);
                }
            } else {
                var opts = args.opts || $.extend(true, {}, defaults.map, args.todo && args.todo.options ? args.todo.options : {});
                opts.center = latLng || toLatLng(opts.center);
                map = new defaults.classes.Map($this.get(0), opts);
            }
        }

        /* = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
         => function with latLng resolution
         = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = */

        /**
         * Initialize google.maps.Map object
         **/
        this.map = function(args){
            newMap(args.latLng, args);
            attachEvents($this, args, map);
            manageEnd(args, map);
        };

        /**
         * destroy an existing instance
         **/
        this.destroy = function(args){
            store.clear();
            $this.empty();
            if (map){
                map = null;
            }
            manageEnd(args, true);
        };

        /**
         * add an infowindow
         **/
        this.infowindow = function(args){
            var objs = [], multiple = "values" in args.todo;
            if (!multiple){
                if (args.latLng) {
                    args.opts.position = args.latLng;
                }
                args.todo.values = [{options:args.opts}];
            }
            $.each(args.todo.values, function(i, value){
                var id, obj, todo = tuple(args, value);
                todo.options.position = todo.options.position ? toLatLng(todo.options.position) : toLatLng(value.latLng);
                if (!map){
                    newMap(todo.options.position);
                }
                obj = new defaults.classes.InfoWindow(todo.options);
                if (obj && ((todo.open === undef) || todo.open)){
                    if (multiple){
                        obj.open(map, todo.anchor ? todo.anchor : undef);
                    } else {
                        obj.open(map, todo.anchor ? todo.anchor : (args.latLng ? undef : (args.session.marker ? args.session.marker : undef)));
                    }
                }
                objs.push(obj);
                id = store.add({todo:todo}, "infowindow", obj);
                attachEvents($this, {todo:todo}, obj, id);
            });
            manageEnd(args, multiple ? objs : objs[0]);
        };

        /**
         * add a circle
         **/
        this.circle = function(args){
            var objs = [], multiple = "values" in args.todo;
            if (!multiple){
                args.opts.center = args.latLng || toLatLng(args.opts.center);
                args.todo.values = [{options:args.opts}];
            }
            if (!args.todo.values.length){
                manageEnd(args, false);
                return;
            }
            $.each(args.todo.values, function(i, value){
                var id, obj, todo = tuple(args, value);
                todo.options.center = todo.options.center ? toLatLng(todo.options.center) : toLatLng(value);
                if (!map){
                    newMap(todo.options.center);
                }
                todo.options.map = map;
                obj = new defaults.classes.Circle(todo.options);
                objs.push(obj);
                id = store.add({todo:todo}, "circle", obj);
                attachEvents($this, {todo:todo}, obj, id);
            });
            manageEnd(args, multiple ? objs : objs[0]);
        };

        /**
         * add an overlay
         **/
        this.overlay = function(args, internal){
            var objs = [], multiple = "values" in args.todo;
            if (!multiple){
                args.todo.values = [{latLng: args.latLng, options: args.opts}];
            }
            if (!args.todo.values.length){
                manageEnd(args, false);
                return;
            }
            if (!OverlayView.__initialised) {
                OverlayView.prototype = new defaults.classes.OverlayView();
                OverlayView.__initialised = true;
            }
            $.each(args.todo.values, function(i, value){
                var id, obj, todo = tuple(args, value),
                    $div = $(document.createElement("div")).css({
                        border: "none",
                        borderWidth: "0px",
                        position: "absolute"
                    });
                $div.append(todo.options.content);
                obj = new OverlayView(map, todo.options, toLatLng(todo) || toLatLng(value), $div);
                objs.push(obj);
                $div = null; // memory leak
                if (!internal){
                    id = store.add(args, "overlay", obj);
                    attachEvents($this, {todo:todo}, obj, id);
                }
            });
            if (internal){
                return objs[0];
            }
            manageEnd(args, multiple ? objs : objs[0]);
        };

        /**
         * returns address structure from latlng
         **/
        this.getaddress = function(args){
            callback(args, args.results, args.status);
            task.ack();
        };

        /**
         * returns latlng from an address
         **/
        this.getlatlng = function(args){
            callback(args, args.results, args.status);
            task.ack();
        };

        /**
         * return the max zoom of a location
         **/
        this.getmaxzoom = function(args){
            maxZoomService().getMaxZoomAtLatLng(
                args.latLng,
                function(result) {
                    callback(args, result.status === google.maps.MaxZoomStatus.OK ? result.zoom : false, status);
                    task.ack();
                }
            );
        };

        /**
         * return the elevation of a location
         **/
        this.getelevation = function(args){
            var i, locations = [],
                f = function(results, status){
                    callback(args, status === google.maps.ElevationStatus.OK ? results : false, status);
                    task.ack();
                };

            if (args.latLng){
                locations.push(args.latLng);
            } else {
                locations = array(args.todo.locations || []);
                for(i=0; i<locations.length; i++){
                    locations[i] = toLatLng(locations[i]);
                }
            }
            if (locations.length){
                elevationService().getElevationForLocations({locations:locations}, f);
            } else {
                if (args.todo.path && args.todo.path.length){
                    for(i=0; i<args.todo.path.length; i++){
                        locations.push(toLatLng(args.todo.path[i]));
                    }
                }
                if (locations.length){
                    elevationService().getElevationAlongPath({path:locations, samples:args.todo.samples}, f);
                } else {
                    task.ack();
                }
            }
        };

        /* = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
         => function without latLng resolution
         = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = */

        /**
         * define defaults values
         **/
        this.defaults = function(args){
            $.each(args.todo, function(name, value){
                if (typeof defaults[name] === "object"){
                    defaults[name] = $.extend({}, defaults[name], value);
                } else {
                    defaults[name] = value;
                }
            });
            task.ack(true);
        };

        /**
         * add a rectangle
         **/
        this.rectangle = function(args){
            var objs = [], multiple = "values" in args.todo;
            if (!multiple){
                args.todo.values = [{options:args.opts}];
            }
            if (!args.todo.values.length){
                manageEnd(args, false);
                return;
            }
            $.each(args.todo.values, function(i, value){
                var id, obj, todo = tuple(args, value);
                todo.options.bounds = todo.options.bounds ? toLatLngBounds(todo.options.bounds) : toLatLngBounds(value);
                if (!map){
                    newMap(todo.options.bounds.getCenter());
                }
                todo.options.map = map;

                obj = new defaults.classes.Rectangle(todo.options);
                objs.push(obj);
                id = store.add({todo:todo}, "rectangle", obj);
                attachEvents($this, {todo:todo}, obj, id);
            });
            manageEnd(args, multiple ? objs : objs[0]);
        };

        /**
         * add a polygone / polyline
         **/
        function poly(args, poly, path){
            var objs = [], multiple = "values" in args.todo;
            if (!multiple){
                args.todo.values = [{options:args.opts}];
            }
            if (!args.todo.values.length){
                manageEnd(args, false);
                return;
            }
            newMap();
            $.each(args.todo.values, function(_, value){
                var id, i, j, obj, todo = tuple(args, value);
                if (todo.options[path]){
                    if (todo.options[path][0][0] && $.isArray(todo.options[path][0][0])){
                        for(i=0; i<todo.options[path].length; i++){
                            for(j=0; j<todo.options[path][i].length; j++){
                                todo.options[path][i][j] = toLatLng(todo.options[path][i][j]);
                            }
                        }
                    } else {
                        for(i=0; i<todo.options[path].length; i++){
                            todo.options[path][i] = toLatLng(todo.options[path][i]);
                        }
                    }
                }
                todo.options.map = map;
                obj = new google.maps[poly](todo.options);
                objs.push(obj);
                id = store.add({todo:todo}, poly.toLowerCase(), obj);
                attachEvents($this, {todo:todo}, obj, id);
            });
            manageEnd(args, multiple ? objs : objs[0]);
        }

        this.polyline = function(args){
            poly(args, "Polyline", "path");
        };

        this.polygon = function(args){
            poly(args, "Polygon", "paths");
        };

        /**
         * add a traffic layer
         **/
        this.trafficlayer = function(args){
            newMap();
            var obj = store.get("trafficlayer");
            if (!obj){
                obj = new defaults.classes.TrafficLayer();
                obj.setMap(map);
                store.add(args, "trafficlayer", obj);
            }
            manageEnd(args, obj);
        };

        /**
         * add a bicycling layer
         **/
        this.bicyclinglayer = function(args){
            newMap();
            var obj = store.get("bicyclinglayer");
            if (!obj){
                obj = new defaults.classes.BicyclingLayer();
                obj.setMap(map);
                store.add(args, "bicyclinglayer", obj);
            }
            manageEnd(args, obj);
        };

        /**
         * add a ground overlay
         **/
        this.groundoverlay = function(args){
            args.opts.bounds = toLatLngBounds(args.opts.bounds);
            if (args.opts.bounds){
                newMap(args.opts.bounds.getCenter());
            }
            var id, obj = new defaults.classes.GroundOverlay(args.opts.url, args.opts.bounds, args.opts.opts);
            obj.setMap(map);
            id = store.add(args, "groundoverlay", obj);
            manageEnd(args, obj, id);
        };

        /**
         * set a streetview
         **/
        this.streetviewpanorama = function(args){
            if (!args.opts.opts){
                args.opts.opts = {};
            }
            if (args.latLng){
                args.opts.opts.position = args.latLng;
            } else if (args.opts.opts.position){
                args.opts.opts.position = toLatLng(args.opts.opts.position);
            }
            if (args.todo.divId){
                args.opts.container = document.getElementById(args.todo.divId)
            } else if (args.opts.container){
                args.opts.container = $(args.opts.container).get(0);
            }
            var id, obj = new defaults.classes.StreetViewPanorama(args.opts.container, args.opts.opts);
            if (obj){
                map.setStreetView(obj);
            }
            id = store.add(args, "streetviewpanorama", obj);
            manageEnd(args, obj, id);
        };

        this.kmllayer = function(args){
            var objs = [], multiple = "values" in args.todo;
            if (!multiple){
                args.todo.values = [{options:args.opts}];
            }
            if (!args.todo.values.length){
                manageEnd(args, false);
                return;
            }
            $.each(args.todo.values, function(i, value){
                var id, obj, options, todo = tuple(args, value);
                if (!map){
                    newMap();
                }
                options = todo.options;
                // compatibility 5.0-
                if (todo.options.opts) {
                    options = todo.options.opts;
                    if (todo.options.url) {
                        options.url = todo.options.url;
                    }
                }
                // -- end --
                options.map = map;
                if (googleVersionMin("3.10")) {
                    obj = new defaults.classes.KmlLayer(options);
                } else {
                    obj = new defaults.classes.KmlLayer(options.url, options);
                }
                objs.push(obj);
                id = store.add({todo:todo}, "kmllayer", obj);
                attachEvents($this, {todo:todo}, obj, id);
            });
            manageEnd(args, multiple ? objs : objs[0]);
        };

        /**
         * add a fix panel
         **/
        this.panel = function(args){
            newMap();
            var id, x= 0, y=0, $content,
                $div = $(document.createElement("div"));

            $div.css({
                position: "absolute",
                zIndex: 1000,
                visibility: "hidden"
            });

            if (args.opts.content){
                $content = $(args.opts.content);
                $div.append($content);
                $this.first().prepend($div);

                if (args.opts.left !== undef){
                    x = args.opts.left;
                } else if (args.opts.right !== undef){
                    x = $this.width() - $content.width() - args.opts.right;
                } else if (args.opts.center){
                    x = ($this.width() - $content.width()) / 2;
                }

                if (args.opts.top !== undef){
                    y = args.opts.top;
                } else if (args.opts.bottom !== undef){
                    y = $this.height() - $content.height() - args.opts.bottom;
                } else if (args.opts.middle){
                    y = ($this.height() - $content.height()) / 2
                }

                $div.css({
                    top: y,
                    left: x,
                    visibility: "visible"
                });
            }

            id = store.add(args, "panel", $div);
            manageEnd(args, $div, id);
            $div = null; // memory leak
        };

        /**
         * Create an InternalClusterer object
         **/
        function createClusterer(raw){
            var internalClusterer = new InternalClusterer($this, map, raw),
                todo = {},
                styles = {},
                thresholds = [],
                isInt = /^[0-9]+$/,
                calculator,
                k;

            for(k in raw){
                if (isInt.test(k)){
                    thresholds.push(1*k); // cast to int
                    styles[k] = raw[k];
                    styles[k].width = styles[k].width || 0;
                    styles[k].height = styles[k].height || 0;
                } else {
                    todo[k] = raw[k];
                }
            }
            thresholds.sort(function (a, b) { return a > b});

            // external calculator
            if (todo.calculator){
                calculator = function(indexes){
                    var data = [];
                    $.each(indexes, function(i, index){
                        data.push(internalClusterer.value(index));
                    });
                    return todo.calculator.apply($this, [data]);
                };
            } else {
                calculator = function(indexes){
                    return indexes.length;
                };
            }

            // set error function
            internalClusterer.error(function(){
                error.apply(that, arguments);
            });

            // set display function
            internalClusterer.display(function(cluster){
                var i, style, atodo, obj, offset,
                    cnt = calculator(cluster.indexes);

                // look for the style to use
                if (raw.force || cnt > 1) {
                    for(i = 0; i < thresholds.length; i++) {
                        if (thresholds[i] <= cnt) {
                            style = styles[thresholds[i]];
                        }
                    }
                }

                if (style){
                    offset = style.offset || [-style.width/2, -style.height/2];
                    // create a custom overlay command
                    // nb: 2 extends are faster that a deeper extend
                    atodo = $.extend({}, todo);
                    atodo.options = $.extend({
                            pane: "overlayLayer",
                            content:style.content ? style.content.replace("CLUSTER_COUNT", cnt) : "",
                            offset:{
                                x: ("x" in offset ? offset.x : offset[0]) || 0,
                                y: ("y" in offset ? offset.y : offset[1]) || 0
                            }
                        },
                        todo.options || {});

                    obj = that.overlay({todo:atodo, opts:atodo.options, latLng:toLatLng(cluster)}, true);

                    atodo.options.pane = "floatShadow";
                    atodo.options.content = $(document.createElement("div")).width(style.width+"px").height(style.height+"px").css({cursor:"pointer"});
                    shadow = that.overlay({todo:atodo, opts:atodo.options, latLng:toLatLng(cluster)}, true);

                    // store data to the clusterer
                    todo.data = {
                        latLng: toLatLng(cluster),
                        markers:[]
                    };
                    $.each(cluster.indexes, function(i, index){
                        todo.data.markers.push(internalClusterer.value(index));
                        if (internalClusterer.markerIsSet(index)){
                            internalClusterer.marker(index).setMap(null);
                        }
                    });
                    attachEvents($this, {todo:todo}, shadow, undef, {main:obj, shadow:shadow});
                    internalClusterer.store(cluster, obj, shadow);
                } else {
                    $.each(cluster.indexes, function(i, index){
                        internalClusterer.marker(index).setMap(map);
                    });
                }
            });

            return internalClusterer;
        }
        /**
         *  add a marker
         **/
        this.marker = function(args){
            var multiple = "values" in args.todo,
                init = !map;
            if (!multiple){
                args.opts.position = args.latLng || toLatLng(args.opts.position);
                args.todo.values = [{options:args.opts}];
            }
            if (!args.todo.values.length){
                manageEnd(args, false);
                return;
            }
            if (init){
                newMap();
            }

            if (args.todo.cluster && !map.getBounds()){ // map not initialised => bounds not available : wait for map if clustering feature is required
                google.maps.event.addListenerOnce(map, "bounds_changed", function() { that.marker.apply(that, [args]); });
                return;
            }
            if (args.todo.cluster){
                var clusterer, internalClusterer;
                if (args.todo.cluster instanceof Clusterer){
                    clusterer = args.todo.cluster;
                    internalClusterer = store.getById(clusterer.id(), true);
                } else {
                    internalClusterer = createClusterer(args.todo.cluster);
                    clusterer = new Clusterer(globalId(args.todo.id, true), internalClusterer);
                    store.add(args, "clusterer", clusterer, internalClusterer);
                }
                internalClusterer.beginUpdate();

                $.each(args.todo.values, function(i, value){
                    var todo = tuple(args, value);
                    todo.options.position = todo.options.position ? toLatLng(todo.options.position) : toLatLng(value);
                    if (todo.options.position) {
                        todo.options.map = map;
                        if (init){
                            map.setCenter(todo.options.position);
                            init = false;
                        }
                        internalClusterer.add(todo, value);
                    }
                });

                internalClusterer.endUpdate();
                manageEnd(args, clusterer);

            } else {
                var objs = [];
                $.each(args.todo.values, function(i, value){
                    var id, obj, todo = tuple(args, value);
                    todo.options.position = todo.options.position ? toLatLng(todo.options.position) : toLatLng(value);
                    if (todo.options.position) {
                        todo.options.map = map;
                        if (init){
                            map.setCenter(todo.options.position);
                            init = false;
                        }
                        obj = new defaults.classes.Marker(todo.options);
                        objs.push(obj);
                        id = store.add({todo:todo}, "marker", obj);
                        attachEvents($this, {todo:todo}, obj, id);
                    }
                });
                manageEnd(args, multiple ? objs : objs[0]);
            }
        };

        /**
         * return a route
         **/
        this.getroute = function(args){
            args.opts.origin = toLatLng(args.opts.origin, true);
            args.opts.destination = toLatLng(args.opts.destination, true);
            directionsService().route(
                args.opts,
                function(results, status) {
                    callback(args, status == google.maps.DirectionsStatus.OK ? results : false, status);
                    task.ack();
                }
            );
        };

        /**
         * add a direction renderer
         **/
        this.directionsrenderer = function(args){
            args.opts.map = map;
            var id, obj = new google.maps.DirectionsRenderer(args.opts);
            if (args.todo.divId){
                obj.setPanel(document.getElementById(args.todo.divId));
            } else if (args.todo.container){
                obj.setPanel($(args.todo.container).get(0));
            }
            id = store.add(args, "directionsrenderer", obj);
            manageEnd(args, obj, id);
        };

        /**
         * returns latLng of the user
         **/
        this.getgeoloc = function(args){
            manageEnd(args, args.latLng);
        };

        /**
         * add a style
         **/
        this.styledmaptype = function(args){
            newMap();
            var obj = new defaults.classes.StyledMapType(args.todo.styles, args.opts);
            map.mapTypes.set(args.todo.id, obj);
            manageEnd(args, obj);
        };

        /**
         * add an imageMapType
         **/
        this.imagemaptype = function(args){
            newMap();
            var obj = new defaults.classes.ImageMapType(args.opts);
            map.mapTypes.set(args.todo.id, obj);
            manageEnd(args, obj);
        };

        /**
         * autofit a map using its overlays (markers, rectangles ...)
         **/
        this.autofit = function(args){
            var bounds = new google.maps.LatLngBounds();
            $.each(store.all(), function(i, obj){
                if (obj.getPosition){
                    bounds.extend(obj.getPosition());
                } else if (obj.getBounds){
                    bounds.extend(obj.getBounds().getNorthEast());
                    bounds.extend(obj.getBounds().getSouthWest());
                } else if (obj.getPaths){
                    obj.getPaths().forEach(function(path){
                        path.forEach(function(latLng){
                            bounds.extend(latLng);
                        });
                    });
                } else if (obj.getPath){
                    obj.getPath().forEach(function(latLng){
                        bounds.extend(latLng);""
                    });
                } else if (obj.getCenter){
                    bounds.extend(obj.getCenter());
                } else if (obj instanceof Clusterer){
                    obj = store.getById(obj.id(), true);
                    if (obj){
                        obj.autofit(bounds);
                    }
                }
            });

            if (!bounds.isEmpty() && (!map.getBounds() || !map.getBounds().equals(bounds))){
                if ("maxZoom" in args.todo){
                    // fitBouds Callback event => detect zoom level and check maxZoom
                    google.maps.event.addListenerOnce(
                        map,
                        "bounds_changed",
                        function() {
                            if (this.getZoom() > args.todo.maxZoom){
                                this.setZoom(args.todo.maxZoom);
                            }
                        }
                    );
                }
                map.fitBounds(bounds);
            }
            manageEnd(args, true);
        };

        /**
         * remove objects from a map
         **/
        this.clear = function(args){
            if (typeof args.todo === "string"){
                if (store.clearById(args.todo) || store.objClearById(args.todo)){
                    manageEnd(args, true);
                    return;
                }
                args.todo = {name:args.todo};
            }
            if (args.todo.id){
                $.each(array(args.todo.id), function(i, id){
                    store.clearById(id) || store.objClearById(id);
                });
            } else {
                store.clear(array(args.todo.name), args.todo.last, args.todo.first, args.todo.tag);
                store.objClear(array(args.todo.name), args.todo.last, args.todo.first, args.todo.tag);
            }
            manageEnd(args, true);
        };

        /**
         * run a function on each items selected
         **/
        this.exec = function(args){
            var that = this;
            $.each(array(args.todo.func), function(i, func){
                $.each(that.get(args.todo, true, args.todo.hasOwnProperty("full") ? args.todo.full : true), function(j, res){
                    func.call($this, res);
                });
            });
            manageEnd(args, true);
        };

        /**
         * return objects previously created
         **/
        this.get = function(args, direct, full){
            var name, res,
                todo = direct ? args : args.todo;
            if (!direct) {
                full = todo.full;
            }
            if (typeof todo === "string"){
                res = store.getById(todo, false, full) || store.objGetById(todo);
                if (res === false){
                    name = todo;
                    todo = {};
                }
            } else {
                name = todo.name;
            }
            if (name === "map"){
                res = map;
            }
            if (!res){
                res = [];
                if (todo.id){
                    $.each(array(todo.id), function(i, id) {
                        res.push(store.getById(id, false, full) || store.objGetById(id));
                    });
                    if (!$.isArray(todo.id)) {
                        res = res[0];
                    }
                } else {
                    $.each(name ? array(name) : [undef], function(i, aName) {
                        var result;
                        if (todo.first){
                            result = store.get(aName, false, todo.tag, full);
                            if (result) res.push(result);
                        } else if (todo.all){
                            $.each(store.all(aName, todo.tag, full), function(i, result){
                                res.push(result);
                            });
                        } else {
                            result = store.get(aName, true, todo.tag, full);
                            if (result) res.push(result);
                        }
                    });
                    if (!todo.all && !$.isArray(name)) {
                        res = res[0];
                    }
                }
            }
            res = $.isArray(res) || !todo.all ? res : [res];
            if (direct){
                return res;
            } else {
                manageEnd(args, res);
            }
        };

        /**
         * return the distance between an origin and a destination
         *
         **/
        this.getdistance = function(args){
            var i;
            args.opts.origins = array(args.opts.origins);
            for(i=0; i<args.opts.origins.length; i++){
                args.opts.origins[i] = toLatLng(args.opts.origins[i], true);
            }
            args.opts.destinations = array(args.opts.destinations);
            for(i=0; i<args.opts.destinations.length; i++){
                args.opts.destinations[i] = toLatLng(args.opts.destinations[i], true);
            }
            distanceMatrixService().getDistanceMatrix(
                args.opts,
                function(results, status) {
                    callback(args, status === google.maps.DistanceMatrixStatus.OK ? results : false, status);
                    task.ack();
                }
            );
        };

        /**
         * trigger events on the map
         **/
        this.trigger = function(args){
            if (typeof args.todo === "string"){
                google.maps.event.trigger(map, args.todo);
            } else {
                var options = [map, args.todo.eventName];
                if (args.todo.var_args) {
                    $.each(args.todo.var_args, function(i, v){
                        options.push(v);
                    });
                }
                google.maps.event.trigger.apply(google.maps.event, options);
            }
            callback(args);
            task.ack();
        };
    }

    /**
     * Return true if get is a direct call
     * it means :
     *   - get is the only key
     *   - get has no callback
     * @param obj {Object} The request to check
     * @return {Boolean}
     */
    function isDirectGet(obj) {
        var k;
        if (!typeof obj === "object" || !obj.hasOwnProperty("get")){
            return false;
        }
        for(k in obj) {
            if (k !== "get") {
                return false;
            }
        }
        return !obj.get.hasOwnProperty("callback");
    }

    //-----------------------------------------------------------------------//
    // jQuery plugin
    //-----------------------------------------------------------------------//

    $.fn.gmap3 = function(){
        var i, list = [], empty = true, results = [];

        // init library
        initDefaults();

        // store all arguments in a todo list
        for(i=0; i<arguments.length; i++){
            if (arguments[i]){
                list.push(arguments[i]);
            }
        }

        // resolve empty call - run init
        if (!list.length) {
            list.push("map");
        }

        // loop on each jQuery object
        $.each(this, function() {
            var $this = $(this), gmap3 = $this.data("gmap3");
            empty = false;
            if (!gmap3){
                gmap3 = new Gmap3($this);
                $this.data("gmap3", gmap3);
            }
            if (list.length === 1 && (list[0] === "get" || isDirectGet(list[0]))){
                if (list[0] === "get") {
                    results.push(gmap3.get("map", true));
                } else {
                    results.push(gmap3.get(list[0].get, true, list[0].get.full));
                }
            } else {
                gmap3._plan(list);
            }
        });

        // return for direct call only
        if (results.length){
            if (results.length === 1){ // 1 css selector
                return results[0];
            } else {
                return results;
            }
        }

        return this;
    }

})(jQuery);

/**
 * BxSlider v4.1.1 - Fully loaded, responsive content slider
 * http://bxslider.com
 *
 * Copyright 2013, Steven Wanderski - http://stevenwanderski.com - http://bxcreative.com
 * Written while drinking Belgian ales and listening to jazz
 *
 * Released under the MIT license - http://opensource.org/licenses/MIT
 */
!function(t){var e={},s={mode:"horizontal",slideSelector:"",infiniteLoop:!0,hideControlOnEnd:!1,speed:500,easing:null,slideMargin:0,startSlide:0,randomStart:!1,captions:!1,ticker:!1,tickerHover:!1,adaptiveHeight:!1,adaptiveHeightSpeed:500,video:!1,useCSS:!0,preloadImages:"visible",responsive:!0,touchEnabled:!0,swipeThreshold:50,oneToOneTouch:!0,preventDefaultSwipeX:!0,preventDefaultSwipeY:!1,pager:!0,pagerType:"full",pagerShortSeparator:" / ",pagerSelector:null,buildPager:null,pagerCustom:null,controls:!0,nextText:"Next",prevText:"Prev",nextSelector:null,prevSelector:null,autoControls:!1,startText:"Start",stopText:"Stop",autoControlsCombine:!1,autoControlsSelector:null,auto:!1,pause:4e3,autoStart:!0,autoDirection:"next",autoHover:!1,autoDelay:0,minSlides:1,maxSlides:1,moveSlides:0,slideWidth:0,onSliderLoad:function(){},onSlideBefore:function(){},onSlideAfter:function(){},onSlideNext:function(){},onSlidePrev:function(){}};t.fn.bxSlider=function(n){if(0==this.length)return this;if(this.length>1)return this.each(function(){t(this).bxSlider(n)}),this;var o={},r=this;e.el=this;var a=t(window).width(),l=t(window).height(),d=function(){o.settings=t.extend({},s,n),o.settings.slideWidth=parseInt(o.settings.slideWidth),o.children=r.children(o.settings.slideSelector),o.children.length<o.settings.minSlides&&(o.settings.minSlides=o.children.length),o.children.length<o.settings.maxSlides&&(o.settings.maxSlides=o.children.length),o.settings.randomStart&&(o.settings.startSlide=Math.floor(Math.random()*o.children.length)),o.active={index:o.settings.startSlide},o.carousel=o.settings.minSlides>1||o.settings.maxSlides>1,o.carousel&&(o.settings.preloadImages="all"),o.minThreshold=o.settings.minSlides*o.settings.slideWidth+(o.settings.minSlides-1)*o.settings.slideMargin,o.maxThreshold=o.settings.maxSlides*o.settings.slideWidth+(o.settings.maxSlides-1)*o.settings.slideMargin,o.working=!1,o.controls={},o.interval=null,o.animProp="vertical"==o.settings.mode?"top":"left",o.usingCSS=o.settings.useCSS&&"fade"!=o.settings.mode&&function(){var t=document.createElement("div"),e=["WebkitPerspective","MozPerspective","OPerspective","msPerspective"];for(var i in e)if(void 0!==t.style[e[i]])return o.cssPrefix=e[i].replace("Perspective","").toLowerCase(),o.animProp="-"+o.cssPrefix+"-transform",!0;return!1}(),"vertical"==o.settings.mode&&(o.settings.maxSlides=o.settings.minSlides),r.data("origStyle",r.attr("style")),r.children(o.settings.slideSelector).each(function(){t(this).data("origStyle",t(this).attr("style"))}),c()},c=function(){r.wrap('<div class="bx-wrapper"><div class="bx-viewport"></div></div>'),o.viewport=r.parent(),o.loader=t('<div class="bx-loading" />'),o.viewport.prepend(o.loader),r.css({width:"horizontal"==o.settings.mode?100*o.children.length+215+"%":"auto",position:"relative"}),o.usingCSS&&o.settings.easing?r.css("-"+o.cssPrefix+"-transition-timing-function",o.settings.easing):o.settings.easing||(o.settings.easing="swing"),f(),o.viewport.css({width:"100%",overflow:"hidden",position:"relative"}),o.viewport.parent().css({maxWidth:v()}),o.settings.pager||o.viewport.parent().css({margin:"0 auto 0px"}),o.children.css({"float":"horizontal"==o.settings.mode?"left":"none",listStyle:"none",position:"relative"}),o.children.css("width",u()),"horizontal"==o.settings.mode&&o.settings.slideMargin>0&&o.children.css("marginRight",o.settings.slideMargin),"vertical"==o.settings.mode&&o.settings.slideMargin>0&&o.children.css("marginBottom",o.settings.slideMargin),"fade"==o.settings.mode&&(o.children.css({position:"absolute",zIndex:0,display:"none"}),o.children.eq(o.settings.startSlide).css({zIndex:50,display:"block"})),o.controls.el=t('<div class="bx-controls" />'),o.settings.captions&&P(),o.active.last=o.settings.startSlide==x()-1,o.settings.video&&r.fitVids();var e=o.children.eq(o.settings.startSlide);"all"==o.settings.preloadImages&&(e=o.children),o.settings.ticker?o.settings.pager=!1:(o.settings.pager&&T(),o.settings.controls&&C(),o.settings.auto&&o.settings.autoControls&&E(),(o.settings.controls||o.settings.autoControls||o.settings.pager)&&o.viewport.after(o.controls.el)),g(e,h)},g=function(e,i){var s=e.find("img, iframe").length;if(0==s)return i(),void 0;var n=0;e.find("img, iframe").each(function(){t(this).one("load",function(){++n==s&&i()}).each(function(){this.complete&&t(this).load()})})},h=function(){if(o.settings.infiniteLoop&&"fade"!=o.settings.mode&&!o.settings.ticker){var e="vertical"==o.settings.mode?o.settings.minSlides:o.settings.maxSlides,i=o.children.slice(0,e).clone().addClass("bx-clone"),s=o.children.slice(-e).clone().addClass("bx-clone");r.append(i).prepend(s)}o.loader.remove(),S(),"vertical"==o.settings.mode&&(o.settings.adaptiveHeight=!0),o.viewport.height(p()),r.redrawSlider(),o.settings.onSliderLoad(o.active.index),o.initialized=!0,o.settings.responsive&&t(window).bind("resize",B),o.settings.auto&&o.settings.autoStart&&H(),o.settings.ticker&&L(),o.settings.pager&&I(o.settings.startSlide),o.settings.controls&&W(),o.settings.touchEnabled&&!o.settings.ticker&&O()},p=function(){var e=0,s=t();if("vertical"==o.settings.mode||o.settings.adaptiveHeight)if(o.carousel){var n=1==o.settings.moveSlides?o.active.index:o.active.index*m();for(s=o.children.eq(n),i=1;i<=o.settings.maxSlides-1;i++)s=n+i>=o.children.length?s.add(o.children.eq(i-1)):s.add(o.children.eq(n+i))}else s=o.children.eq(o.active.index);else s=o.children;return"vertical"==o.settings.mode?(s.each(function(){e+=t(this).outerHeight()}),o.settings.slideMargin>0&&(e+=o.settings.slideMargin*(o.settings.minSlides-1))):e=Math.max.apply(Math,s.map(function(){return t(this).outerHeight(!1)}).get()),e},v=function(){var t="100%";return o.settings.slideWidth>0&&(t="horizontal"==o.settings.mode?o.settings.maxSlides*o.settings.slideWidth+(o.settings.maxSlides-1)*o.settings.slideMargin:o.settings.slideWidth),t},u=function(){var t=o.settings.slideWidth,e=o.viewport.width();return 0==o.settings.slideWidth||o.settings.slideWidth>e&&!o.carousel||"vertical"==o.settings.mode?t=e:o.settings.maxSlides>1&&"horizontal"==o.settings.mode&&(e>o.maxThreshold||e<o.minThreshold&&(t=(e-o.settings.slideMargin*(o.settings.minSlides-1))/o.settings.minSlides)),t},f=function(){var t=1;if("horizontal"==o.settings.mode&&o.settings.slideWidth>0)if(o.viewport.width()<o.minThreshold)t=o.settings.minSlides;else if(o.viewport.width()>o.maxThreshold)t=o.settings.maxSlides;else{var e=o.children.first().width();t=Math.floor(o.viewport.width()/e)}else"vertical"==o.settings.mode&&(t=o.settings.minSlides);return t},x=function(){var t=0;if(o.settings.moveSlides>0)if(o.settings.infiniteLoop)t=o.children.length/m();else for(var e=0,i=0;e<o.children.length;)++t,e=i+f(),i+=o.settings.moveSlides<=f()?o.settings.moveSlides:f();else t=Math.ceil(o.children.length/f());return t},m=function(){return o.settings.moveSlides>0&&o.settings.moveSlides<=f()?o.settings.moveSlides:f()},S=function(){if(o.children.length>o.settings.maxSlides&&o.active.last&&!o.settings.infiniteLoop){if("horizontal"==o.settings.mode){var t=o.children.last(),e=t.position();b(-(e.left-(o.viewport.width()-t.width())),"reset",0)}else if("vertical"==o.settings.mode){var i=o.children.length-o.settings.minSlides,e=o.children.eq(i).position();b(-e.top,"reset",0)}}else{var e=o.children.eq(o.active.index*m()).position();o.active.index==x()-1&&(o.active.last=!0),void 0!=e&&("horizontal"==o.settings.mode?b(-e.left,"reset",0):"vertical"==o.settings.mode&&b(-e.top,"reset",0))}},b=function(t,e,i,s){if(o.usingCSS){var n="vertical"==o.settings.mode?"translate3d(0, "+t+"px, 0)":"translate3d("+t+"px, 0, 0)";r.css("-"+o.cssPrefix+"-transition-duration",i/1e3+"s"),"slide"==e?(r.css(o.animProp,n),r.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",function(){r.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"),D()})):"reset"==e?r.css(o.animProp,n):"ticker"==e&&(r.css("-"+o.cssPrefix+"-transition-timing-function","linear"),r.css(o.animProp,n),r.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",function(){r.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"),b(s.resetValue,"reset",0),N()}))}else{var a={};a[o.animProp]=t,"slide"==e?r.animate(a,i,o.settings.easing,function(){D()}):"reset"==e?r.css(o.animProp,t):"ticker"==e&&r.animate(a,speed,"linear",function(){b(s.resetValue,"reset",0),N()})}},w=function(){for(var e="",i=x(),s=0;i>s;s++){var n="";o.settings.buildPager&&t.isFunction(o.settings.buildPager)?(n=o.settings.buildPager(s),o.pagerEl.addClass("bx-custom-pager")):(n=s+1,o.pagerEl.addClass("bx-default-pager")),e+='<div class="bx-pager-item"><a href="" data-slide-index="'+s+'" class="bx-pager-link">'+n+"</a></div>"}o.pagerEl.html(e)},T=function(){o.settings.pagerCustom?o.pagerEl=t(o.settings.pagerCustom):(o.pagerEl=t('<div class="bx-pager" />'),o.settings.pagerSelector?t(o.settings.pagerSelector).html(o.pagerEl):o.controls.el.addClass("bx-has-pager").append(o.pagerEl),w()),o.pagerEl.delegate("a","click",q)},C=function(){o.controls.next=t('<a class="bx-next" href="">'+o.settings.nextText+"</a>"),o.controls.prev=t('<a class="bx-prev" href="">'+o.settings.prevText+"</a>"),o.controls.next.bind("click",y),o.controls.prev.bind("click",z),o.settings.nextSelector&&t(o.settings.nextSelector).append(o.controls.next),o.settings.prevSelector&&t(o.settings.prevSelector).append(o.controls.prev),o.settings.nextSelector||o.settings.prevSelector||(o.controls.directionEl=t('<div class="bx-controls-direction" />'),o.controls.directionEl.append(o.controls.prev).append(o.controls.next),o.controls.el.addClass("bx-has-controls-direction").append(o.controls.directionEl))},E=function(){o.controls.start=t('<div class="bx-controls-auto-item"><a class="bx-start" href="">'+o.settings.startText+"</a></div>"),o.controls.stop=t('<div class="bx-controls-auto-item"><a class="bx-stop" href="">'+o.settings.stopText+"</a></div>"),o.controls.autoEl=t('<div class="bx-controls-auto" />'),o.controls.autoEl.delegate(".bx-start","click",k),o.controls.autoEl.delegate(".bx-stop","click",M),o.settings.autoControlsCombine?o.controls.autoEl.append(o.controls.start):o.controls.autoEl.append(o.controls.start).append(o.controls.stop),o.settings.autoControlsSelector?t(o.settings.autoControlsSelector).html(o.controls.autoEl):o.controls.el.addClass("bx-has-controls-auto").append(o.controls.autoEl),A(o.settings.autoStart?"stop":"start")},P=function(){o.children.each(function(){var e=t(this).find("img:first").attr("title");void 0!=e&&(""+e).length&&t(this).append('<div class="bx-caption"><span>'+e+"</span></div>")})},y=function(t){o.settings.auto&&r.stopAuto(),r.goToNextSlide(),t.preventDefault()},z=function(t){o.settings.auto&&r.stopAuto(),r.goToPrevSlide(),t.preventDefault()},k=function(t){r.startAuto(),t.preventDefault()},M=function(t){r.stopAuto(),t.preventDefault()},q=function(e){o.settings.auto&&r.stopAuto();var i=t(e.currentTarget),s=parseInt(i.attr("data-slide-index"));s!=o.active.index&&r.goToSlide(s),e.preventDefault()},I=function(e){var i=o.children.length;return"short"==o.settings.pagerType?(o.settings.maxSlides>1&&(i=Math.ceil(o.children.length/o.settings.maxSlides)),o.pagerEl.html(e+1+o.settings.pagerShortSeparator+i),void 0):(o.pagerEl.find("a").removeClass("active"),o.pagerEl.each(function(i,s){t(s).find("a").eq(e).addClass("active")}),void 0)},D=function(){if(o.settings.infiniteLoop){var t="";0==o.active.index?t=o.children.eq(0).position():o.active.index==x()-1&&o.carousel?t=o.children.eq((x()-1)*m()).position():o.active.index==o.children.length-1&&(t=o.children.eq(o.children.length-1).position()),"horizontal"==o.settings.mode?b(-t.left,"reset",0):"vertical"==o.settings.mode&&b(-t.top,"reset",0)}o.working=!1,o.settings.onSlideAfter(o.children.eq(o.active.index),o.oldIndex,o.active.index)},A=function(t){o.settings.autoControlsCombine?o.controls.autoEl.html(o.controls[t]):(o.controls.autoEl.find("a").removeClass("active"),o.controls.autoEl.find("a:not(.bx-"+t+")").addClass("active"))},W=function(){1==x()?(o.controls.prev.addClass("disabled"),o.controls.next.addClass("disabled")):!o.settings.infiniteLoop&&o.settings.hideControlOnEnd&&(0==o.active.index?(o.controls.prev.addClass("disabled"),o.controls.next.removeClass("disabled")):o.active.index==x()-1?(o.controls.next.addClass("disabled"),o.controls.prev.removeClass("disabled")):(o.controls.prev.removeClass("disabled"),o.controls.next.removeClass("disabled")))},H=function(){o.settings.autoDelay>0?setTimeout(r.startAuto,o.settings.autoDelay):r.startAuto(),o.settings.autoHover&&r.hover(function(){o.interval&&(r.stopAuto(!0),o.autoPaused=!0)},function(){o.autoPaused&&(r.startAuto(!0),o.autoPaused=null)})},L=function(){var e=0;if("next"==o.settings.autoDirection)r.append(o.children.clone().addClass("bx-clone"));else{r.prepend(o.children.clone().addClass("bx-clone"));var i=o.children.first().position();e="horizontal"==o.settings.mode?-i.left:-i.top}b(e,"reset",0),o.settings.pager=!1,o.settings.controls=!1,o.settings.autoControls=!1,o.settings.tickerHover&&!o.usingCSS&&o.viewport.hover(function(){r.stop()},function(){var e=0;o.children.each(function(){e+="horizontal"==o.settings.mode?t(this).outerWidth(!0):t(this).outerHeight(!0)});var i=o.settings.speed/e,s="horizontal"==o.settings.mode?"left":"top",n=i*(e-Math.abs(parseInt(r.css(s))));N(n)}),N()},N=function(t){speed=t?t:o.settings.speed;var e={left:0,top:0},i={left:0,top:0};"next"==o.settings.autoDirection?e=r.find(".bx-clone").first().position():i=o.children.first().position();var s="horizontal"==o.settings.mode?-e.left:-e.top,n="horizontal"==o.settings.mode?-i.left:-i.top,a={resetValue:n};b(s,"ticker",speed,a)},O=function(){o.touch={start:{x:0,y:0},end:{x:0,y:0}},o.viewport.bind("touchstart",X)},X=function(t){if(o.working)t.preventDefault();else{o.touch.originalPos=r.position();var e=t.originalEvent;o.touch.start.x=e.changedTouches[0].pageX,o.touch.start.y=e.changedTouches[0].pageY,o.viewport.bind("touchmove",Y),o.viewport.bind("touchend",V)}},Y=function(t){var e=t.originalEvent,i=Math.abs(e.changedTouches[0].pageX-o.touch.start.x),s=Math.abs(e.changedTouches[0].pageY-o.touch.start.y);if(3*i>s&&o.settings.preventDefaultSwipeX?t.preventDefault():3*s>i&&o.settings.preventDefaultSwipeY&&t.preventDefault(),"fade"!=o.settings.mode&&o.settings.oneToOneTouch){var n=0;if("horizontal"==o.settings.mode){var r=e.changedTouches[0].pageX-o.touch.start.x;n=o.touch.originalPos.left+r}else{var r=e.changedTouches[0].pageY-o.touch.start.y;n=o.touch.originalPos.top+r}b(n,"reset",0)}},V=function(t){o.viewport.unbind("touchmove",Y);var e=t.originalEvent,i=0;if(o.touch.end.x=e.changedTouches[0].pageX,o.touch.end.y=e.changedTouches[0].pageY,"fade"==o.settings.mode){var s=Math.abs(o.touch.start.x-o.touch.end.x);s>=o.settings.swipeThreshold&&(o.touch.start.x>o.touch.end.x?r.goToNextSlide():r.goToPrevSlide(),r.stopAuto())}else{var s=0;"horizontal"==o.settings.mode?(s=o.touch.end.x-o.touch.start.x,i=o.touch.originalPos.left):(s=o.touch.end.y-o.touch.start.y,i=o.touch.originalPos.top),!o.settings.infiniteLoop&&(0==o.active.index&&s>0||o.active.last&&0>s)?b(i,"reset",200):Math.abs(s)>=o.settings.swipeThreshold?(0>s?r.goToNextSlide():r.goToPrevSlide(),r.stopAuto()):b(i,"reset",200)}o.viewport.unbind("touchend",V)},B=function(){var e=t(window).width(),i=t(window).height();(a!=e||l!=i)&&(a=e,l=i,r.redrawSlider())};return r.goToSlide=function(e,i){if(!o.working&&o.active.index!=e)if(o.working=!0,o.oldIndex=o.active.index,o.active.index=0>e?x()-1:e>=x()?0:e,o.settings.onSlideBefore(o.children.eq(o.active.index),o.oldIndex,o.active.index),"next"==i?o.settings.onSlideNext(o.children.eq(o.active.index),o.oldIndex,o.active.index):"prev"==i&&o.settings.onSlidePrev(o.children.eq(o.active.index),o.oldIndex,o.active.index),o.active.last=o.active.index>=x()-1,o.settings.pager&&I(o.active.index),o.settings.controls&&W(),"fade"==o.settings.mode)o.settings.adaptiveHeight&&o.viewport.height()!=p()&&o.viewport.animate({height:p()},o.settings.adaptiveHeightSpeed),o.children.filter(":visible").fadeOut(o.settings.speed).css({zIndex:0}),o.children.eq(o.active.index).css("zIndex",51).fadeIn(o.settings.speed,function(){t(this).css("zIndex",50),D()});else{o.settings.adaptiveHeight&&o.viewport.height()!=p()&&o.viewport.animate({height:p()},o.settings.adaptiveHeightSpeed);var s=0,n={left:0,top:0};if(!o.settings.infiniteLoop&&o.carousel&&o.active.last)if("horizontal"==o.settings.mode){var a=o.children.eq(o.children.length-1);n=a.position(),s=o.viewport.width()-a.outerWidth()}else{var l=o.children.length-o.settings.minSlides;n=o.children.eq(l).position()}else if(o.carousel&&o.active.last&&"prev"==i){var d=1==o.settings.moveSlides?o.settings.maxSlides-m():(x()-1)*m()-(o.children.length-o.settings.maxSlides),a=r.children(".bx-clone").eq(d);n=a.position()}else if("next"==i&&0==o.active.index)n=r.find("> .bx-clone").eq(o.settings.maxSlides).position(),o.active.last=!1;else if(e>=0){var c=e*m();n=o.children.eq(c).position()}if("undefined"!=typeof n){var g="horizontal"==o.settings.mode?-(n.left-s):-n.top;b(g,"slide",o.settings.speed)}}},r.goToNextSlide=function(){if(o.settings.infiniteLoop||!o.active.last){var t=parseInt(o.active.index)+1;r.goToSlide(t,"next")}},r.goToPrevSlide=function(){if(o.settings.infiniteLoop||0!=o.active.index){var t=parseInt(o.active.index)-1;r.goToSlide(t,"prev")}},r.startAuto=function(t){o.interval||(o.interval=setInterval(function(){"next"==o.settings.autoDirection?r.goToNextSlide():r.goToPrevSlide()},o.settings.pause),o.settings.autoControls&&1!=t&&A("stop"))},r.stopAuto=function(t){o.interval&&(clearInterval(o.interval),o.interval=null,o.settings.autoControls&&1!=t&&A("start"))},r.getCurrentSlide=function(){return o.active.index},r.getSlideCount=function(){return o.children.length},r.redrawSlider=function(){o.children.add(r.find(".bx-clone")).outerWidth(u()),o.viewport.css("height",p()),o.settings.ticker||S(),o.active.last&&(o.active.index=x()-1),o.active.index>=x()&&(o.active.last=!0),o.settings.pager&&!o.settings.pagerCustom&&(w(),I(o.active.index))},r.destroySlider=function(){o.initialized&&(o.initialized=!1,t(".bx-clone",this).remove(),o.children.each(function(){void 0!=t(this).data("origStyle")?t(this).attr("style",t(this).data("origStyle")):t(this).removeAttr("style")}),void 0!=t(this).data("origStyle")?this.attr("style",t(this).data("origStyle")):t(this).removeAttr("style"),t(this).unwrap().unwrap(),o.controls.el&&o.controls.el.remove(),o.controls.next&&o.controls.next.remove(),o.controls.prev&&o.controls.prev.remove(),o.pagerEl&&o.pagerEl.remove(),t(".bx-caption",this).remove(),o.controls.autoEl&&o.controls.autoEl.remove(),clearInterval(o.interval),o.settings.responsive&&t(window).unbind("resize",B))},r.reloadSlider=function(t){void 0!=t&&(n=t),r.destroySlider(),d()},d(),this}}(jQuery);

/*** PUSHY MOBILE NAVIGATION ****/
/*! Pushy - v0.9.2 - 2014-9-13
* Pushy is a responsive off-canvas navigation menu using CSS transforms & transitions.
* https://github.com/christophery/pushy/
* by Christopher Yee */

$(function() {
    var pushy = $('.pushy'), //menu css class
        body = $('body'),
        container = $('#container'), //container css class
        push = $('.push'), //css class to add pushy capability
        siteOverlay = $('.site-overlay'), //site overlay
        pushyClass = "pushy-left pushy-open", //menu position & menu open class
        pushyActiveClass = "pushy-active", //css class to toggle site overlay
        containerClass = "container-push", //container open class
        pushClass = "push-push", //css class to add pushy capability
        menuBtn = $('.menu-btn'), //css classes to toggle the menu
        menuSpeed = 200, //jQuery fallback menu speed
        menuWidth = pushy.width() + "px"; //jQuery fallback menu width

    function togglePushy(){
        body.toggleClass(pushyActiveClass); //toggle site overlay
        pushy.toggleClass(pushyClass);
        container.toggleClass(containerClass);
        push.toggleClass(pushClass); //css class to add pushy capability
    }

    function openPushyFallback(){
        body.addClass(pushyActiveClass);
        pushy.animate({left: "0px"}, menuSpeed);
        container.animate({left: menuWidth}, menuSpeed);
        push.animate({left: menuWidth}, menuSpeed); //css class to add pushy capability
    }

    function closePushyFallback(){
        body.removeClass(pushyActiveClass);
        pushy.animate({left: "-" + menuWidth}, menuSpeed);
        container.animate({left: "0px"}, menuSpeed);
        push.animate({left: "0px"}, menuSpeed); //css class to add pushy capability
    }

    //checks if 3d transforms are supported removing the modernizr dependency
    cssTransforms3d = (function csstransforms3d(){
        var el = document.createElement('p'),
        supported = false,
        transforms = {
            'webkitTransform':'-webkit-transform',
            'OTransform':'-o-transform',
            'msTransform':'-ms-transform',
            'MozTransform':'-moz-transform',
            'transform':'transform'
        };

        // Add it to the body to get the computed style
        document.body.insertBefore(el, null);

        for(var t in transforms){
            if( el.style[t] !== undefined ){
                el.style[t] = 'translate3d(1px,1px,1px)';
                supported = window.getComputedStyle(el).getPropertyValue(transforms[t]);
            }
        }

        document.body.removeChild(el);

        return (supported !== undefined && supported.length > 0 && supported !== "none");
    })();

    if(cssTransforms3d){
        //toggle menu
        menuBtn.click(function() {
            togglePushy();
        });
        //close menu when clicking site overlay
        siteOverlay.click(function(){ 
            togglePushy();
        });
    }else{
        //jQuery fallback
        pushy.css({left: "-" + menuWidth}); //hide menu by default
        container.css({"overflow-x": "hidden"}); //fixes IE scrollbar issue

        //keep track of menu state (open/close)
        var state = true;

        //toggle menu
        menuBtn.click(function() {
            if (state) {
                openPushyFallback();
                state = false;
            } else {
                closePushyFallback();
                state = true;
            }
        });

        //close menu when clicking site overlay
        siteOverlay.click(function(){ 
            if (state) {
                openPushyFallback();
                state = false;
            } else {
                closePushyFallback();
                state = true;
            }
        });
    }
});