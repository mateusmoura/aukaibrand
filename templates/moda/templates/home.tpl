{% snipplet "sidebar.tpl" %}
{% if (settings.slider and settings.slider is not empty) or sections.slider.products %}
<div id="content">
    {% if settings.slider and settings.slider is not empty %}
        <div class="contentBox slider-wrapper theme-light">
            <ul class="homeslider bxslider">
                {% for slide in settings.slider %}
                    {% set slide_img = slide.image | static_url %}
                    {% if slide.link is empty %}
                        <li><img src="{{ slide_img }}"/></li>
                    {% else %}
                        <li><a href="{{ slide.link }}"><img src="{{ slide_img }}"/></a></li>
                    {% endif %}
                {% endfor %}
            </ul>
        </div>
    {% elseif sections.slider.products %}
        <div id="slider">
            <div id="page"></div>
            <div class="divisor"></div>
            <ul class="home-slider">
                {% for product in sections.slider.products %}
                    <li>
                        <a class="picture" href="{{ product.url }}" title="{{ product.name }}">
                            <div>{{ product.featured_image | product_image_url("huge") | img_tag(product.featured_image.alt) }}</div>
                        </a>
                        <div class="description">
                            <h1 class="title">{{ product.name | a_tag(product.url) }}</h1>
                            {% if product.display_price %}
                                {% if product.compare_at_price %}
                                    <del class="price"><span class="compare_price">{{ product.compare_at_price | money }}</span></del>
                                {% endif %}
                                <div class="price">{{ product.price | money }}</div>
                                {% if product.show_installments %}
                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                    {% if max_installments_without_interests %}
                                        <span class="max_installments">{{ '<strong>{1}x</strong> de <strong>{2}</strong> sem juros' | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                                    {% else %}
                                        {% set max_installments_with_interests = product.get_max_installments %}
                                        {% if max_installments_with_interests %}
                                            <span class="max_installments">{{ '<strong>{1}x</strong> de <strong>{2}</strong>' | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                                        {% endif %}
                                    {% endif %}
                                {% endif %}
                            {% endif %}
                            <div class="button detalles">
                                {{ "Ver Detalhes" | translate | a_tag(product.url) }}
                            </div>
                        </div>
                    </li>
                {% endfor %}
            </ul>
        </div>
    {% endif %}
    {% if settings.banner_services_home %}
        {% include 'snipplets/banner-services.tpl' %}
    {% endif %}
</div>
{% endif %}
{% if "banner.jpg" | has_custom_image %}
    <div class="banner">
        {% if settings.banner_url != '' %}
            {{ "banner.jpg" | static_url | img_tag | a_tag(settings.banner_url) }}
        {% else %}
            {{ "banner.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
{% endif %}
{% if sections.home.products %}
    <div class="contentBox">
        <h1 id="destacados">{{ "Produtos em Destaque" | translate }}</h1>
        {% for product in sections.home.products %}
            {% if loop.index % 4 == 1 %}
                <div class="product-row">
            {% endif %}
            <a class="product" href="{{ product.url }}" title="{{ product.name }}">
		<span class="head">
		{{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
		</span>
		<span class="bajada">
		<strong>{{ product.name }}</strong>
            {% if product.display_price %}
                <br />
                {% if product.compare_at_price %}
                    <del class="price"><span class="compare_price">{{ product.compare_at_price | money }}</span></del>
                {% endif %}
                <span class="price">{{ product.price | money }}</span>
                {% if product.show_installments %}
                    {% set max_installments_without_interests = product.get_max_installments(false) %}
                    {% if max_installments_without_interests %}
                        <span class="max_installments">{{ '<strong>{1}x</strong> de <strong>{2}</strong> sem juros' | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                    {% else %}
                        {% set max_installments_with_interests = product.get_max_installments %}
                        {% if max_installments_with_interests %}
                            <span class="max_installments">{{ '<strong>{1}x</strong> de <strong>{2}</strong>' | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                        {% endif %}
                    {% endif %}
                {% endif %}
            {% endif %}
		</span>
            </a>
            {% if loop.index % 4 == 0 or loop.last %}
                </div>
            {% endif %}
        {% endfor %}
    </div>
{% endif %}
