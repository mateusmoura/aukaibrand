<div id="product-listing">
    <div class="headerBox">
        {% if settings.welcome_message %}
        <h2>{{ settings.welcome_message }}</h2>
        {% endif %}
    </div>

    {% set show_help = not (settings.slider | length) and not ("banner-home.jpg" | has_custom_image) and (not has_products or (not sections.primary.products and not sections.secondary.products and settings.home_display != "image")) %}
    <div class="sections {% if show_help %}no-products{% endif %}">
        {% if show_help %}
        <div class="no-products-post-it">
            <div class="no-products-post-it-content">
                <em>{{"¡Bienvenido a tu tienda!" | translate}}</em>
                {% if has_products %}
                <p>{{"Todavía no destacaste productos, ¿deseas" | translate}} <a href="/admin/products/feature">{{"destacar uno ahora" | translate}}</a>?</p>
                {% else %}
                <p>{{"Todavía no tienes ningún producto, ¿deseas" | translate}} <a href="/admin/products/new">{{"crear uno ahora" | translate}}</a>?</p>
                {% endif %}
            </div>
        </div>
        <a class="no-products-overlay" href="/admin/products/new"></a>
        {% endif %}
        {% if settings.home_display == "slider" or settings.home_display == "both" %}
            <div class="contentBox slider-wrapper theme-light">
                <div class="nivoSlider">
                    {% for slide in settings.slider %}
                        {% set slide_img = slide.image | static_url %}
                        {% if slide.link is empty %}
                            <img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" />
                        {% else %}
                            <a href="{{ slide.link }}"><img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" /></a>
                        {% endif %}
                    {% endfor %}
                </div>
            </div>
        {% endif %}
        {% if settings.home_display == "products" or settings.home_display == "both" %}
        <div class="contentBox fullWidth no-border-bottom ">
            <div class="product-table">
                {% for product in sections.primary.products %}
                {% if loop.index % 3 == 1 %}
                <div class="product-row">
                    {% endif %}

                    <a class="dest-gral" href="{{ product.url }}" title="{{ product.name }}">
                        <span class="head">
                            {{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}
                        </span>
                        <span class="bajada">
                            <strong>{{ product.name }}</strong>
                            {% if product.display_price %}
                            <br />{{ product.price | money }}
                            {% endif %}
                        </span>
                    </a>

                    {% if loop.index % 3 == 0 or loop.last %}
                </div>
                {% endif %}
                {% else %}
                {% if show_help %}
                {% for i in 1..3 %}
                {% if loop.index % 3 == 1 %}
                <div class="product-row">
                    {% endif %}

                    <a class="dest-gral" href="#">
                                <span class="head">
                                    {{'placeholder-product.png' | static_url | img_tag}}
                                </span>
                                <span class="bajada">
                                    <strong>{{"Producto" | translate}}</strong>
                                    <br />{{"$0.00" | translate}}
                                </span>
                    </a>

                    {% if loop.index % 3 == 0 or loop.last %}
                </div>
                {% endif %}
                {% endfor %}
                {% endif %}
                {% endfor %}
            </div>
        </div>
        {% endif %}

        <div class="contentBox fullWidth">
            {% if "banner-home.jpg" | has_custom_image %}
                <div class="banner">
                    {% if settings.banner_home_url != '' %}
                        {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
                    {% else %}
                        {{ "banner-home.jpg" | static_url | img_tag }}
                    {% endif %}
                </div>
            {% endif %}
            <div class="product-table">
                {% for product in sections.secondary.products %}
                {% if loop.index % 6 == 1 %}
                <div class="product-row">
                    {% endif %}

                    <a class="dest" href="{{ product.url }}" title="{{ product.name }}">
                        <span class="head">
                            {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
                        </span>
                        <span class="bajada">
                            <strong>{{ product.name }}</strong>
                            {% if product.display_price %}
                                <br />{{ product.price | money }}
                            {% endif %}
                        </span>
                    </a>

                    {% if loop.index % 6 == 0 or loop.last %}
                </div>
                {% endif %}
                {% else %}
                {% if show_help %}
                <a class="no-products-overlay" href="/admin/products/new"></a>
                {% for i in 1..6 %}
                {% if loop.index % 6 == 1 %}
                <div class="product-row">
                    {% endif %}

                    <a class="dest" href="#">
                                <span class="head">
                                    {{'placeholder-product.png' | static_url | img_tag}}
                                </span>
                                <span class="bajada">
                                    <strong>{{"Producto" | translate}}</strong>
                                    <br />{{"$0.00" | translate}}
                                </span>
                    </a>

                    {% if loop.index % 6 == 0 or loop.last %}
                </div>
                {% endif %}
                {% endfor %}
                {% endif %}
                {% endfor %}
            </div>
        </div>
    </div>
</div>