<div id="content">
    {% if sections.slider.products %}
	<div id="slider">
		<ul class="home-slider">
            {% for product in sections.slider.products %}
            <li>
                <a class="picture" href="{{ product.url }}" title="{{ product.name }}">
                    {{ product.featured_image | product_image_url("huge") | img_tag(product.featured_image.alt) }}
                </a>
                <div class="description">
                    <h1 class="title">{{ product.name | a_tag(product.url) }}</h1>
                    <div class="desc">{{ product.description | plain | truncateWords(50) }}</div>
                     <div class="button detalles">
                        {{ "Ver Detalles" | translate | a_tag(product.url) }}
                     </div>

                    {% if product.display_price %}
                        <span class="price">{{ product.price | money }}</span>
                    {% endif %}
                </div><!--description-->
            </li>
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
    {% if "banner-home.jpg" | has_custom_image %}
        <div class="banner">
            {% if settings.banner_home_url != '' %}
                {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
            {% else %}
                {{ "banner-home.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    {% endif %}

	{% if sections.home.products %}
	<div id="left">
		<h1 class="title">{{ "Productos Destacados" | translate }}</h1>
		<div id="destacados">
			{% for product in sections.home.products %}
				{% if loop.index is odd %}
				<div class="producto-row">
				{% endif %}

				<a class="producto" href="{{ product.url }}">
					<span class="thumb block">
						{{ product.featured_image | product_image_url("thumb") | img_tag(product.featured_image.alt) }}
					</span>
					<span class="description block">
						<h3>
							{{ product.name }}
							{% if product.display_price %}
								<small>{{ product.price | money | replace(' ', '&nbsp;') | raw }}</small>
							{% endif %}
						</h3>
						<span class="desc block">{{ product.description | plain | truncateWords(40) }}</span>
					</span><!--desc-->
					<span class="clear"></span>
				</a>

				{% if loop.index is even or loop.last %}
				<div class="clear"></div>
				</div>
				{% endif %}
			{% endfor %}

			<div class="clear"></div>
		</div>

		<div class="clear"></div>
	</div><!--left-->
	{% endif %}

	<div id="sidebar">
		<h1 class="title">{{ "Productos" | translate }}</h1>
		<ul id="categorias">
			{% snipplet "categories.tpl" %}
		</ul>
        {% if "banner-sidebar.jpg" | has_custom_image %}
            <div class="banner-sidebar">
                {% if settings.banner_sidebar_url != '' %}
                    {{ "banner-sidebar.jpg" | static_url | img_tag | a_tag(settings.banner_sidebar_url) }}
                {% else %}
                    {{ "banner-sidebar.jpg" | static_url | img_tag }}
                {% endif %}
            </div>
        {% endif %}
	</div><!--sidebar-->

	<div class="clear"></div>
</div><!--content-->
