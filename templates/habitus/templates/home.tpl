
{% set has_banner = "banner-home.jpg" | has_custom_image %}
{% set show_help = not (settings.slider | length) and not has_banner and (not has_products or not sections.primary.products) %}
<div class="container {% if show_help %}no-products{% endif %}">
    {% if show_help %}
        <h2>{{ "¡Bienvenido a tu tienda!" | translate }}</h2>
        <div class="no-products-txt">
            {% if has_products %}
                <p>{{ "Todavía no destacaste productos, ¿deseas" | translate }} <a
                            href="/admin/products/feature" target="_top">{{ "destacar uno ahora" | translate }}</a>?</p>
            {% else %}
                <p>{{ "Todavía no tienes ningún producto, ¿deseas" | translate }} <a
                            href="/admin/products/new" target="_top">{{ "crear uno ahora" | translate }}</a>?</p>
            {% endif %}
        </div>
    {% endif %}
</div>

<div class="row-fluid slider-wrapper {% if not settings.slider or settings.slider is empty %}hidden{% endif %}">
     <i class="fa fa-spin fa-refresh"></i>
    <ul class="homeslider bxslider">
        {% if settings.slider and settings.slider is not empty %}
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                {% if slide.link is empty %}
                    <li><img src="{{ slide_img }}" style="visibility: hidden;" /></li>
                {% else %}
                    <li><a href="{{ slide.link }}"><img src="{{ slide_img }}" style="visibility: hidden;" /></a></li>
                {% endif %}
            {% endfor %}
        {% endif %}
    </ul>
</div>
{% if settings.banner_services_home %} 
    {% include 'snipplets/banner-services.tpl' %}
{% endif %} 
{% if settings.welcome_message %}
    <div class="container">
        <div class="welcomeMessage">
            <h2 class='text-center'>{{ settings.welcome_message }}</h2>
        </div>
    </div>
{% endif %}

<div class="container products-list page">
    <div class="products-header">
        <h3>{{ "Productos Destacados" | translate }}</h3>
    </div>

    {% if show_help or sections.primary.products %}
        {% for product in sections.primary.products %}
            {% if loop.index % 4 == 1 %}
                <div class="row">
            {% endif %}

            {% include 'snipplets/single_product.tpl' %}

            {% if loop.index % 4 == 0 or loop.last %}
                </div>
            {% endif %}
        {% else %}
            {% if show_help %}
                {% for i in 1..4 %}
                    {% if loop.index % 4 == 1 %}
                        <div>
                    {% endif %}

                    <div class="col-md-3 col-sm-4 col-xs-6">
                        <div class="thumbnail">
                            <figure class="image-wrap show-help">
                                <a href="/admin/products/new" target="_top">{{ 'img/placeholder-product.png' | static_url | img_tag }}</a>
                            </figure>
                            <div class="caption">
                                <h5 class="title"><a href="/admin/products/new" target="_top">{{ "Producto" | translate }}</a></h5>

                                <p class="price">{{ "$0.00" | translate }}</p>
                            </div>
                        </div>
                    </div>

                    {% if loop.index % 4 == 0 or loop.last %}
                        </div>
                    {% endif %}
                {% endfor %}
            {% endif %}
        {% endfor %}
    {% endif %}
</div>

{% if has_banner %}
    {% set banner_home %}
    <div class="banner widget-static-content">
        <div class="static-content-cover"></div>
        <div class="container">
            <div class="row inside">
                <h2 class="text-center">
                    {{ settings.banner_home_description }}
                </h2>
            </div>
        </div>
    </div>
    {% endset %}
    {% if settings.banner_home_url %}
        <a href="{{ settings.banner_home_url | raw }}">{{ banner_home }}</a>
    {% else %}
        {{ banner_home }}
    {% endif %}
{% endif %}

<div class="container">
    <!-- widget zone-->
    <div class="row widgets">

        {% set show_facebook = settings.show_footer_fb_like_box and store.facebook ? 1 : 0 %}
        {% set show_twitter = settings.twitter_widget ? 1 : 0 %}
        {% if show_facebook %}
            <div class="col-md-4 col-sm-4 col-xs-12" style="overflow:hidden;">
                <div class="widget-header">
                    <small>{{ "Facebook" | translate }}</small>
                    <h3>{{ "Síguenos en Facebook" | translate }}</h3>
                </div>
                <div class="widget-divider"></div>
                <div class="widget-content">
                    {{ store.facebook | fb_page_plugin(980,200) }}
                </div>
            </div>
        {% endif %}

        {% if show_twitter %}
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="widget-header">
                    <small>{{ "Twitter" | translate }}</small>
                    <h3>{{ "Síguenos en Twitter" | translate }}</h3>
                </div>
                <div class="widget-divider"></div>
                <div class="widget-content">
                    {{ settings.twitter_widget | raw }}
                </div>
            </div>
        {% endif %}

        {% set newsletter_col = show_facebook and show_twitter ? 4 : (show_facebook or show_twitter ? 8 : 6) %}
        <div class="col-md-{{ newsletter_col }} col-sm-{{ newsletter_col }} col-xs-12">
            {% include 'snipplets/newsletter.tpl' %}
        </div>
    </div>
</div>

<!-- Modal -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}
