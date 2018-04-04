{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}
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
{% if settings.slider %}
    <div id="slider" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                <div class="item {% if loop.first %}active{% endif %}">
                    {% if slide.link is empty %}
                        <img src="{{ slide_img }}" alt=""/>
                    {% else %}
                        <a href="{{ slide.link }}">
                            <img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt=""/>
                        </a>
                    {% endif %}
                </div>
            {% endfor %}
        </div>
        {% if settings.slider | length > 1 %}
            <a class="left carousel-control" href="#slider" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
            <a class="right carousel-control" href="#slider" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        {% endif %}
    </div>
{% else %}
    <div id="cabezal_interior" class="home"></div>
{% endif %}
{% if settings.banner_services_home %} 
<div class="container">
<div class="contenido">
    {% include 'snipplets/banner-services.tpl' %}
</div>
</div>
{% endif %} 
<div class="container">
    <div class="contenido">
        {% if show_help or sections.primary.products %}
            <h2>{{ "Productos Destacados" | translate }}</h2>
            {% for product in sections.primary.products %}
                {% if loop.index % 4 == 1 %}
                    <div class="productos">
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
                            <div class="producto producto-fake">
                                <a href="/admin/products/new" target="_top">{{ 'img/placeholder-product.png' | static_url | img_tag }}</a>
                                <div class="caption">
                                    <h5 class="title"><a href="/admin/products/new" target="_top">{{ "Producto" | translate }}</a></h5>
                                    <p class="price">{{ "$0.00" | translate }}</p>
                                </div>
                            </div>
                        {% if loop.index % 4 == 0 or loop.last %}
                            </div>
                        {% endif %}
                    {% endfor %}
                {% endif %}
            {% endfor %}
        {% endif %}
        {% if has_banner %}
            {% set banner_home %}
                <div class="banner_home">
                    <div class="filtro"></div>
                    <div class="texto_banner">
                        {{ settings.banner_home_description }}
                    </div>
                </div>
            {% endset %}
            {% set banner_home_2 %}
                <div class="banner_home_2">
                    <div class="filtro"></div>
                    <div class="texto_banner">
                        {{ settings.banner_home_description_2 }}
                    </div>
                </div>
            {% endset %}


            <div class="banners_home">
                {% if settings.banner_home_url %}
                    <a href="{{ settings.banner_home_url | raw }}">{{ banner_home }}</a>
                {% else %}
                    {{ banner_home }}
                {% endif %}

                {% if settings.banner_home_url_2 %}
                    <a href="{{ settings.banner_home_url_2 | raw }}">{{ banner_home_2 }}</a>
                {% else %}
                    {{ banner_home_2 }}
                {% endif %}
            </div>

            <hr>
        {% endif %}
    </div>
</div>
{% if settings.welcome_message or settings.welcome_message_link %}
<div class="row-fluid">
    <div class="container">
        <div id="wrap-welcome-message" class="contenido">
            <div class="row">
                <div class="co-md-12 col-xs-12 welcome-msg-container">
                    <div class="headerBox">
                        {% if settings.welcome_message %}
                            <h2>{{ settings.welcome_message }}</h2>
                        {% endif %}
                        {% if settings.welcome_message_link and settings.welcome_message_link_url %}
                            <a href="{{ settings.welcome_message_link_url }}">{{ settings.welcome_message_link }}</a>
                        {% elseif settings.welcome_message_link %}
                            <p>{{ settings.welcome_message_link }}</p>
                        {% endif %}
                    </div>
                </div>
             </div>   
        </div>
    </div>
</div>
{% endif %}

{% set show_facebook = settings.show_footer_fb_like_box and store.facebook ? 1 : 0 %}
{% set show_twitter = settings.twitter_widget ? 1 : 0 %}
{% set has_social = store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
{% if show_facebook or show_twitter or has_social%}
    <div class="container">
        <div class="contenido">
            <!-- widget zone-->
            <div class="row">
                {% if show_facebook %}
                    <div class="oh socials {% if show_twitter %}col-md-3{% else %}col-md-6{% endif %}">
                        <div class="widget-header">
                            <h2>{{ "Síguenos en Facebook" | translate }}</h2>
                        </div>
                        <div class="widget-divider"></div>
                        <div class="widget-content">
                            <div class="facebook-container">
                                {{ store.facebook | fb_page_plugin(show_twitter ? 238 : 500, 200) }}
                            </div>
                        </div>
                    </div>
                {% endif %}
                {% if show_twitter %}
                    <div class="oh socials {% if show_facebook %}col-md-3{% else %}col-md-6{% endif %}">
                        <div class="widget-header">
                            <h2>{{ "Síguenos en Twitter" | translate }}</h2>
                        </div>
                        <div class="widget-divider"></div>
                        <div class="widget-content">
                            {{ settings.twitter_widget | raw }}
                        </div>
                    </div>
                {% endif %}
                {% snipplet "social_networks.tpl" %}
            </div>
        </div>
    </div>
{% endif %}
