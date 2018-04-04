{% snipplet "sidebar.tpl" %}
<div id="content">
    {% if sections.slider.products %}
	    <div id="slider">
	        <ul class="home-slider">
	        {% for product in sections.slider.products | take(9) %}
	            <li>
	                <a class="picture" href="{{ product.url }}" title="{{ product.name }}">
	                    {{ product.featured_image | product_image_url("huge") | img_tag(product.featured_image.alt) }}
	                </a>
	                <div class="description">
	                    <h2 class="title">{{ product.name | a_tag(product.url) }}</h2>
	                    {% if product.display_price %}
	                        {% if product.compare_at_price %}
	                            <del>{{ product.compare_at_price | money }}</del>
	                        {% endif %}
	                        <div class="price">{{ product.price | money }}</div>
	                        <div>
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
			                  </div>
	                    {% endif %}
	                    <div class="button detalles">
	                        {{ "Ver Detalhes" | translate | a_tag(product.url) }}
	                     </div>
	                </div><!--description-->
	            </li>
	        {% else %}
	            {% for i in 1..3 %}
	                <li>
	                    <a class="picture" href="#">
	                        {{ 'images/slider-default.png' | static_url | img_tag }}
	                    </a>
	                    <div class="description">
	                        <h2 class="title">{{ "Produto" | translate }}</h2>
	                        <div class="price">{{ "R$0.00" | translate }}</div>
	                        <div class="button detalles">
	                            {{ "Ver Detalhes" | translate | a_tag }}
	                        </div>
	                    </div>
	                </li>
	            {% endfor %}
	        {% endfor %}
	        </ul>
	    </div><!--slider-->
    {% elseif settings.slider and settings.slider is not empty %}
        <div class="slider-wrapper theme-light">
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
    {% endif %}
    {% if settings.banner_services_home %} 
        {% include 'snipplets/banner-services.tpl' %}
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
	<div id="right">
		<h2 class="title">{{ "Produtos em Destaque" | translate }}</h2>
		<div id="destacados">
			{% snipplet "product_grid.tpl" with products = sections.home.products, cols = 4 %}
		</div>

		<div class="clear"></div>
	</div><!--left-->


	{% endif %}

	<div class="clear"></div>

</div><!--content-->
