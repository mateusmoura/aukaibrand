function loginFacebook() {
    LS.facebookLogin(FB, function(status, hasEmail) {
        if (status === 'connected') {
            if (hasEmail) {
                window.location = "{{ store.url }}/account/facebook_login/";
            } else {
                $('#login-form').prepend("<div class=\"st error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
            }
        } else {
            $('#login-form').prepend("<div class=\"st error c\">{{ 'Debes completar el login.' | translate }}</div>");
        }
    });
}

{# Installments #}
function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
    if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
        if (installment_data.without_interests) {
            return [number_of_installment, installment_data.installment_value.toFixed(2)];
        }
    }
    return max_installments_without_interests;
}
function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
    if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
        if (installment_data.without_interests == false) {
            return [number_of_installment, installment_data.installment_value.toFixed(2)];
        }
    }
    return max_installments_with_interests;
}
{# Show help JS #}
{% if show_help %}
    $(document).ready(function(){
        $(".social-networks-container a").click(function(){
            return false;
        });
        {# 404 handling to show the example product #}
        if ( window.location.pathname === "/product/example/" ) {
            document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
            $("#404-page").hide();
            $("#product-example").show();
        } else {
            $("#product-example").hide();
        }
    });
{% endif %}

{# Variants change #}
function changeVariant(variant){
    $("#single-product .shipping-calculator-response").hide();
    $("#shipping-variant-id").val(variant.id);
    var parent = $("body");
    if (variant.element){
        parent = $(variant.element);
    }
    var sku = parent.find('#sku');
    if(sku.length) {
        sku.text(variant.sku).show();
    }
    var installment_helper = function($element, amount, price){
        $element.find('.installment-amount').text(amount);
        $element.find('.installment-price').text(LS.currency.display_short + price);
    };
    if (variant.installments_data) {
        var variant_installments = JSON.parse(variant.installments_data);
        var max_installments_without_interests = [0,0];
        var max_installments_with_interests = [0,0];
        $.each(variant_installments, function(payment_method, installments) {
            $.each(installments, function(number_of_installment, installment_data) {
                max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                var installment_container_selector = '#installment_' + payment_method + '_' + number_of_installment;
                installment_helper($(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
            });
        });
        var $installments_container = $('.installments.max_installments_container .max_installments');
        var $installments_modal_link = $('#button-installments');

        var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

        if(installments_to_use[0] <= 1 ) {
            $installments_container.hide();
            $installments_modal_link.hide();
        } else {
            $installments_container.show();
            $installments_modal_link.show();
            installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
        }
    }

    if (variant.price_short){
        parent.find('#price_display').text(variant.price_short).show();
    } else {
        parent.find('#price_display').hide();
    }

    if (variant.compare_at_price_short){
        parent.find('#compare_price_display').text(variant.compare_at_price_short).show();
        $(".final-price").addClass("border-left-dark p-half-left");
    } else {
        parent.find('#compare_price_display').hide();
        $(".final-price").remove("border-left-dark p-half-left");
    }

    if(variant.contact) {
        parent.find('.container-box').hide();
    } else {
        parent.find('.container-box').show();
    }

    var button = parent.find('.add-to-cart');
    button.removeClass('cart').removeClass('contact').removeClass('nostock');
    {% if not store.is_catalog %}
    if (!variant.available){
        button.val('{{ "Sin stock" | translate }}');
        button.addClass('nostock');
        button.attr('disabled', 'disabled');
        $("#single-product .shipping-calculator-form").hide();
    } else if (variant.contact) {
        button.val('{{ "Consultar precio" | translate }}');
        button.addClass('contact');
        button.removeAttr('disabled');
        $("#single-product .shipping-calculator-form").hide();
    } else {
        button.val('{{ "Agregar al carrito" | translate }}');
        button.addClass('cart');
        button.removeAttr('disabled');
        $("#single-product .shipping-calculator-form").show();
    }
    {% endif %}
}


$(document).ready(function(){
    {# Detect if navigating on IOS #}
    var isIOS = !!navigator.userAgent.match(/iPhone/i);
    if (isIOS) {
        $(".js-modal-mobile").addClass("modal-mobile-IOS");
    }
    {# Masonry Grid #}
    var $masonry_grid = $('.masonry-grid').masonry({
      // options
      itemSelector: '.product-grid-single-product',
      transitionDuration: 0
    });

    // layout Isotope after each image loads
    $masonry_grid.imagesLoaded().progress( function() {
      $masonry_grid.masonry('layout');
    });

    {# Show and hide part of nav depending scroll up or down#}
    
    var didScroll;
    var lastScrollTop = 0;
    var delta = 5;
    var navbarHeight = $('header').outerHeight();

    $(window).scroll(function(event){
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 250);

    function hasScrolled() {
        var st = $(this).scrollTop();
        
        // Make sure they scroll more than delta
        if(Math.abs(lastScrollTop - st) <= delta)
            return;
        
        // If they scrolled down and are past the navbar, add class .move-up.
        // This is necessary so you never see what is "behind" the navbar.
        if (st > lastScrollTop && st > navbarHeight){
            // Scroll Down
            {% if store.has_accounts or languages | length > 1 %}
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").addClass("move-up-with-accounts");
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").removeClass("move-down");
            {% else %}
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").addClass("move-up");
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").removeClass("move-down");
           {% endif %}
        } else {
            // Scroll Up
            if(st + $(window).height() < $(document).height()) {
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").removeClass("move-up-with-accounts");
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").removeClass("move-up");
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").addClass("move-down");
            }
        }
        
        lastScrollTop = st;
    }
    {# Places the navbar on it´s default size in case the page is loaded in a scrolled state #}
     $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").removeClass("move-up-with-accounts");
     $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").removeClass("move-up");
     $(".navbar-inverse, .backdrop, #categories-mobile-container, #added-to-cart").addClass("move-down");
    {# Search navbar animation #}
    $("#show-search, #back-arrow, #search-backdrop").click(function(e){
        e.preventDefault();
        if ($(window).width() < 768) {
            $(".secondary-navbar-mobile").toggle();
            $("#categories-mobile-container").toggleClass("move-up");
        }
        $(".menu-btn").toggle();
        $(".top-links").toggle();
        $(".nav-icons").toggle();
        $(".nav-store-name").toggle();
        $("#search-backdrop").toggle();    
        $(".product-grid-single-product.col-xs-6").addClass("col-half")    
        $(".navbar").toggleClass("search-visible");
        $(".navbar-header").toggleClass("contrast");
        $("#search-form").toggle();
        $("#search-form .material-input").focus();  
        var scrollPosition = $("body, html").scrollTop()
        {% if store.has_accounts or languages | length > 1 %}
            $("#main-content").addClass("move-up-with-accounts");
        {% else %}
            $("#main-content").addClass("move-up");
        {% endif %}
    });

    $("#back-arrow, #search-backdrop").click(function(e){
        e.preventDefault();
        var $nav_and_content = $(".navbar-inverse, .backdrop, #categories-mobile-container, #main-content");
        $nav_and_content.removeClass("move-up-with-accounts move-up").addClass("move-down").delay(1000).queue(function(){
            $(this).removeClass("move-down").dequeue();
        });;
        setTimeout(function(){
            $(".product-grid-single-product.col-xs-6").removeClass("col-half");
        },500);
    });

    $("#delete-search").click(function(e){
        e.preventDefault();
        $("#search-form input").val('');
        $("#search-form .material-input").focus();
    });
    if ($(window).width() < 768) {
        var $delete_search = $("#delete-search");
        $("#search-form .material-input").keyup(function(){
            $delete_search.show();
        });
        $("#search-form .material-input").focusout(function(){
            var val = $("#search-form input").val();
            if(val == ''){
                $delete_search.hide();
            }else{
                $delete_search.show();
            }
        });
    }

    {# Product quantity input to take only numbers #}
    function productValidateNumber(event) {
        var key = window.event ? event.keyCode : event.which;
        if (event.keyCode === 8 || event.keyCode === 46
            || event.keyCode === 37 || event.keyCode === 39) {
            return true;
        }
        else if ( key < 48 || key > 57 ) {
            return false;
        }
        else return true;
    }
    $('.product-quantity').keypress(productValidateNumber);

    {# Newsletter Popup #}
    {% if settings.show_news_box %}
        var $newsletter_popup = $('#newsletter-popup');
        $newsletter_popup.submit(function(){
            $(".loading-modal").show();
            $newsletter_popup.find(".btn").prop("disabled", true);
            ga_send_event('contact', 'newsletter', 'popup');
        });
        LS.newsletter('#newsletter-popup', '#newsModal', '{{ store.contact_url | escape('js') }}', function(response){
            $(".loading-modal").hide();
            var selector_to_use = response.success ? '.contact-ok' : '.contact-error';
            $(this).find(selector_to_use).fadeIn( 100 ).delay( 1300 ).fadeOut( 500 );
            if($newsletter_popup.find(".contact-ok").css("display") == "block"){
                setTimeout(function()
                { $("#newsModal").modal('hide'); }, 2500);
            }else{
                {# nothing happens here #}
            }
            $newsletter_popup.find('input[type="text"]').val('');
            $newsletter_popup.find(".btn").prop("disabled", false);
        });

        LS.newsletterPopup();

    {% endif %}


    {# Variants images change #}
    LS.registerOnChangeVariant(function(variant){
        // this is used on quick shop modals
        var current_image = $('img', '#quick'+variant.product_id);
        current_image.attr('src', variant.image_url);
        // this is used on single product view
        $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
    });
    {% if template == 'home' %}
        {# Footer newsletter focus to show messages #}
        {% if contact and contact.type == 'newsletter' %}
            {% if contact.success %}
                window.location.hash = '#footer-newsletter-success';
            {% else %}
                window.location.hash = '#footer-newsletter-failed';
            {% endif %}
        {% endif %}

        {# Home Slider #}
        window.homeSlider = {
            getSliderConfiguration: function() {
                return {
                    //JS For home slider Preloader - hides the images until loaded
                    onSliderLoad: function(){
                        $("#home-slider").css("visibility", "visible");
                        $(".bx-wrapper img").css("visibility", "visible");
                        $(".slider-wrapper .spinner").hide();
                    },
                    pause: 5000,
                    autoHover: true,
                    pagerCustom: '.home-slider-pager',
                    adaptiveHeight: false,
                    nextText:'<i class="material-icons">&#xE315;</i>',
                    prevText:'<i class="material-icons">&#xE314;</i>',
                };
            },
            getAutoRotation: function() {
                return {% if settings.slider_auto %}true{% else %}false{% endif %};
            },
            create: function() {
                var config = this.getSliderConfiguration();
                config.auto = this.getAutoRotation() && this.get$Element().children().size() > 1;
                this._instance = this.get$Element().bxSlider(config);
                return this;
            },
            getInstance: function() {
                return this._instance;
            },
            get$Element: function() {
                return $('.homeslider');
            },
            get$Wrapper: function() {
                return $('.slider-wrapper');
            }
        };
        window.homeSlider.create();
        $('.home-products-slider-container').bxSlider({
            nextText: '<i class="material-icons mat-chevron-right">&#xE5CC;</i>',
            prevText:'<i class="material-icons mat-chevron-left">&#xE5CB;</i>',
            pagerCustom: '.home-products-pager'
        });
    {% endif %}
    {# Contact #}
    {% if contact and contact.success %}
        {% if contact.type == 'newsletter' %}
            var $newsletter = $('#newsletter');
            $newsletter.find('form').hide();
            $newsletter.find('.title').hide();
            $newsletter.find('#ofertas').hide();
            ga_send_event('contact', 'newsletter', 'standard');
        {% elseif contact.type == 'contact' %}
            ga_send_event('contact', 'contact-form');
        {% endif %}
    {% endif %}

    {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
    {% endif %}

    {# Shipping Calculator #}
    $(".calculate-shipping-button").click(function(e) {
    e.preventDefault();
    LS.calculateShippingAjax(
        $(this).closest(".shipping-calculator").find("input.shipping-zipcode").val(),
        '{{store.shipping_calculator_url | escape('js')}}',
        $(this).closest(".shipping-calculator") );
    });

    {# Sort By Products #}
    {% if template == 'category' %}
        $('.sort-by').change(function(){
            var params = LS.urlParams;
            params['sort_by'] = $(this).val();
            var sort_params_array = [];
            for (var key in params) {
                if (params.hasOwnProperty(key)) {
                    if ($.inArray(key, ['results_only', 'page']) == -1) {
                        sort_params_array.push(key + '=' + params[key]);
                    }
                }
            }
            var sort_params = sort_params_array.join('&');
            window.location = window.location.pathname + '?' + sort_params;
        });
    {% endif %}

    {# Infinite Scrolling Button #}
    {% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
        new LS.infiniteScroll({
            afterSetup: function() {
                $('.pagination-container').hide();
            },
            finishData: function() {
                $('#loadMoreBtn').remove();
            },
            afterLoaded: function() {
              // Reload masonry items after load more products
              $masonry_grid.masonry('reloadItems')
              $masonry_grid.imagesLoaded().progress( function() {
                  $masonry_grid.masonry('layout');
                });
            },
            productsPerPage: 12,
            productGridClass: 'product-grid-container'

        });
    {% endif %}
    {# Category sidebar #}
    var categories_sidebar_limit = {{ template == 'home' ? 10 : 5 }};
    var $show_more_categories = $("#show-more-cats");
    var categoriesList = $("#categories-list").find("li");
    if (categoriesList.length > categories_sidebar_limit) {
        $show_more_categories.show();
        for (var i = categories_sidebar_limit; i < categoriesList.length; i++) {
            $(categoriesList[i]).hide();
        }
    }
    $show_more_categories.click(function(e){
        e.preventDefault();
        for (var i = categories_sidebar_limit; i < categoriesList.length; i++) {
            $(categoriesList[i]).toggle();
        }
        $(this).find("i").toggleClass("fa-angle-up fa-angle-down");
    });
    {# MOBILE Filters #}
    {# AJAX Cart #}
    {% if template == 'cart' %}
        var $quantity_input = $(".col-quantity input");
        // Key pressed in quantity input
        $quantity_input.keypress(function(e){
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });

        // Quantity input focus out
        $quantity_input.focusout(function(e){
            $("#go-to-checkout").prop( "disabled", true ); 
            var itemID = $(this).attr("data-item-id");
            var itemVAL = $(this).val();
            if(itemVAL == 0) {
                var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                if (r == true) {
                    LS.removeItem(itemID);
                } else {
                    $(this).val(1);
                }
            } else {
                LS.changeQuantity(itemID, itemVAL);
            }
        });

        // Clicked shipping method listener
        $(document).on( "click", "input.shipping-method", function() {
            var elem = $(this);
            var shippingPrice = elem.attr("data-price");
            elem.click(function() {
                LS.addToTotal(shippingPrice);
            });
            $('.shipping-suboption').hide();
            elem.closest('li').find('.shipping-suboption').show();
        });

        // Default shipping method listener
        $('input.shipping-method:checked').livequery(function(){
            var shippingPrice = $(this).attr("data-price");
            LS.addToTotal(shippingPrice);
        });

    {% endif %}
    {# Change variants on click  - Used to select variants from colors/sizes squares #}
    $("a.insta-variations").click(function(e){
        e.preventDefault();
        $this = $(this);
        $this.siblings().removeClass("selected");
        $this.addClass("selected");

        var option_id = $this.data('option');
        $selected_option = $this.closest('.product').find('.variation-option option[value="'+option_id+'"]');
        $selected_option.prop('selected', true).trigger('change');
        
        $this.closest("[class^='variation']").find('.variation-label strong').html(option_id);
    });
    {% if template == 'product' %}
        {# Show hide description #}
        $('#see-description').click(function(e){
            e.preventDefault();
             $("#product-detail .user-content").slideToggle();
             $(".see-description-text, .see-description-icon, .hide-description-text, .hide-description-icon").toggle();
        });
        {# Pinterest sharing #}
        $('.share-btn-pinterest').click(function(e){
            e.preventDefault();
            $(".pinterest-hidden span").click();
        });
        {# Products Slider #}
        var slider = $('#productbxslider').bxSlider({
            onSliderLoad: function(){
                $("#productbxslider").css("visibility", "visible");
                $(".bx-wrapper img").css("visibility", "visible");
                $(".product-slider .spinner").hide();
            },
            nextText:'<i class="material-icons">&#xE315;</i>',
            prevText:'<i class="material-icons">&#xE314;</i>',
            adaptiveHeight: true,
            startSlide: 0,
            pagerCustom: '.product-detail-pager',
        });

        {# Product submit #}
        var $product_form = $("#product-form");
        $product_form.submit(function(){
            var button = $(this).find(':submit');

            button.attr('disabled', 'disabled');
            if (button.hasClass('cart')){
                button.val('{{ "Agregando..." | translate }}');
            }
        });

        {# Change Image Variant for Mobile Slider #}
        LS.registerOnChangeVariant(function(variant){
            var liImage = $('#productbxslider').find("[data-image='"+variant.image+"']");
            var selectedPosition = liImage.data('image-position');
            var slideToGo = parseInt(selectedPosition);
            slider.goToSlide(slideToGo);
        });

        
        $('.product-share-button').click(function(){
            ga_send_event('social-sharing-product', $(this).data('network'))
        });
    {% endif %}

    {# Offer tags #}
    var $product_container = $(".product-container"); 

    if ($product_container.find(".compare-price-display").css("display") == "none") {
        $(this).closest(".product-container").find(".offer-product").hide();
        $(this).closest(".product-container").find(".final-price").removeClass("border-left-dark p-half-left");
    }
    else {
        $(this).closest(".product-container").find(".offer-product").show();
        $(this).closest(".product-container").find(".final-price").addClass("border-left-dark p-half-left");
    }
    $product_container.find("select.variation-option").change(function(){
        var $this_compare_price =  $(this).closest(".product-container").find(".compare-price-display");
        var $this_product_container = $(this).closest(".product-container");
        if ($this_compare_price.css("display") == "none") {
            $this_product_container.find(".offer-product").hide();
            $this_product_container.find(".final-price").removeClass("border-left-dark p-half-left");
        }
        else {
            $this_product_container.find(".offer-product").show();
            $this_product_container.find(".final-price").addClass("border-left-dark p-half-left");
        }
    });

    $product_container.find("a.insta-variations").click(function(e){
        var $this_compare_price =  $(this).closest(".product-container").find(".compare-price-display");
        var $this_product_container = $(this).closest(".product-container");
        e.preventDefault();
        if ($this_compare_price.css("display") == "none") {
            $this_product_container.find(".offer-product").hide();
            $this_product_container.find(".final-price").removeClass("border-left-dark p-half-left");
        }
        else {
            $this_product_container.find(".offer-product").show();
            $this_product_container.find(".final-price").addClass("border-left-dark p-half-left");
        }
    });

    {# AJAX cart widget #}
    {% if settings.ajax_cart %}
        LS.updateCart = function(cart){
            $("#cart-total").html(cart.total_short);
            $("#cart-table-total").html(cart.total_short);
            var products_count = 0;
             for (i = 0; i < cart.products.length; i++) { 
                 products_count = products_count + parseInt(cart.products[i].quantity);
             }
            $(".cart-amount").html(products_count)
            var table = $("#cart-table-body");
            table.html('');
            for (i = 0; i < cart.products.length; i++) { 
                table.append("<tr><td>"+cart.products[i].name+"</td><td>"+cart.products[i].quantity+"</td><td>"+cart.products[i].price_short+"</td><td>"+cart.products[i].subtotal_short+"</td></tr>");
            }

            var cart_minimum_value_in_cents = parseFloat($("#ajax-cart-minimum-value").val());
            var cart_minimum_value = (cart_minimum_value_in_cents / 100.0);

            if(cart.total >= cart_minimum_value) {
                $("#ajax-cart-minumum-div").hide();
                $("#ajax-cart-submit-div").show();
            } else {
                $("#ajax-cart-submit-div").hide();
                $("#ajax-cart-minumum-div").show();
            }

            $("#added-to-cart").fadeIn().delay(3000).fadeOut();
            {% if store.has_accounts or languages | length > 1 %}
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #main-content, #added-to-cart").removeClass("move-up-with-accounts");
            {% else %}
                $(".navbar-inverse, .backdrop, #categories-mobile-container, #main-content, #added-to-cart").removeClass("move-up");
            {% endif %}
            $(".navbar-inverse, .backdrop, #categories-mobile-container").addClass("move-down").delay(1000).queue(function(){
                $(this).removeClass("move-down").dequeue();
            });
            $(".cart-amount").addClass("jump").delay(7500).queue(function(){
                $(this).removeClass("jump").dequeue();
            });
        };
        $(document).on("click", ".js-addtocart", function(e) {
            if(!$(this).hasClass('contact')) {
                e.preventDefault();
                $prod_form = $(this).closest("form");
                LS.addToCart(
                    $prod_form,
                    '{{ "Agregar al carrito" | translate }}',
                    '{{ "Agregando..." | translate }}',
                    '{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}' );
                }
                
        });
        $('#cart-amount').bind("cartchange",function(){
            var cart_amount = document.getElementById("cart-amount"),
            value = cart_amount.innerHTML;
            $("#mobile-cart-amount").html(value);
        });
        $(".js-toggleCart-ajax").click(function(e){
            e.preventDefault();
            $("body").toggleClass("overflow-none");
            $("#ajax-cart-details").fadeToggle().toggleClass("overflow-y");
            $("#ajax-cart-backdrop").fadeToggle();
            $(".cart-pointer").fadeToggle().delay(500);
        });
        $('input.shipping-method:checked').livequery(function(){
            var shippingPrice = $(this).attr("data-price");
            LS.addToTotal(shippingPrice);
            $("#ajax-cart-details .ajax-total-row h3").html("Subtotal");
            $("#ajax-cart-details #ajax-cart-totalwshipping").show();
        });
        $(document).on( "click", "input.shipping-method", function() {
            var elem = $(this);
            var shippingPrice = elem.attr("data-price");
            elem.click(function() {
                LS.addToTotal(shippingPrice);
            });
        });
    {% endif %}

    {# Mobile Navigation #}

    $(".mobile-category-dropdown").click(function(){
        var $this = $(this);
        var $category_accordion = $this.next(".mobile-accordion");
        $category_accordion.slideToggle(300);
        $category_accordion.find("li a, .mobile-category-dropdown").addClass("border-left");
        $this.toggleClass("dropdown-selected");
        var $parent_accordion_trigger = $this.closest("li.mobile-subitems-container");
        $parent_accordion_trigger.not(".current").toggleClass("selected");
        $parent_accordion_trigger.closest(".item-with-subitems").next(".mobile-category-item").toggleClass("border-top");
    });
    $("#mobile-categories-btn, #close-categories-btn").click(function(e){
        e.preventDefault();
        $("body").toggleClass("overflow-none");
        $("#categories-mobile-container").toggleClass("overflow-y");
        if($("#mobile-categories-btn").hasClass("selected")){
            $("#mobile-categories-btn").removeClass("selected");
            $(".navbar a.current-page").addClass("selected");
        }else{
            $("#mobile-categories-btn").addClass("selected");
            $(".navbar a.current-page").removeClass("selected");
        }
        $("#categories-mobile-container").toggleClass("in-canvas-top-open");
    });

});
