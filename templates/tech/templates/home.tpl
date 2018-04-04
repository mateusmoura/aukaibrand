{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<div class="home-container">
    {% if categories %}
        <div class="col-md-2 left-col hidden-phone">
            {% snipplet 'sidebar-home.tpl' %}
        </div>
    {% endif %}
    <div class="{% if categories %}col-md-10 {% else %}col-md-12 no-categories{% endif %} col-xs-12 right-col">
            <div class="slider-container {% if not settings.slider or settings.slider is empty %}hidden{% endif %}">
                <i class="fa fa-cog fa-spin"></i>
                <ul class="homeslider bxslider">
                     {% if settings.slider %}
                        {% for slide in settings.slider %}
                            {% set slide_img = slide.image | static_url %}
                            {% set slide_link = slide.link %}
                            {% if slide.link is empty %}
                                <li><img src="{{ slide_img }}" style="visibility: hidden;"/></li>
                            {% else %}
                                <li><a href="{{ slide.link }}"><img src="{{ slide_img }}" style="visibility: hidden;" /></a></li>
                            {% endif %}
                        {% endfor %}
                    {% endif %}
                </ul>
            </div>
        {% if settings.banner_services_home %}
            <div class="banner-services-home">
                {% include 'snipplets/banner-services.tpl' %}
            </div>
        {% endif %} 
        {% if sections.primary.products %}
            {% include 'snipplets/product_grid.tpl' with { products : sections.primary.products } %}
        {% endif %}
    
    </div>
    {% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you upload some products #}
{% if show_help %}
    <div class="hidden-phone">
        {% snipplet 'defaults/show_help.tpl' %}
    </div>
    <div class="visible-phone">
        {% snipplet 'defaults/show_help_category.tpl' %}
    </div>
{% endif %}

    {% if "banner-home.jpg" | has_custom_image %}
        <div class="container bannerhome">
            {% if settings.banner_home_url != '' %}
                {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
            {% else %}
                {{ "banner-home.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    {% endif %}
    {% if settings.twitter_widget %}
    <div class="social-title">
        <div class="header"><h3>{{"Síguenos en Twitter" | translate}}</h3></div>
    </div>
    <div class="container twitter-like-widget">
        {{ settings.twitter_widget | raw }}
    </div>
    {% endif %}
    {% if store.facebook and settings.show_footer_fb_like_box %}
    <div class="social-title">
        <div class="header"><h3>{{"Síguenos en Facebook" | translate}}</h3></div>
    </div>
    <div class="container facebook-like-widget">
        {{ store.facebook | fb_page_plugin(980,200) }}
    </div>
    {% endif %}
</div>
<!-- Slider -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}