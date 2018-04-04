<div class="products-list">
    <div class="products-header">
        <h3>{{ "Quizás te interesen los siguientes productos." | translate }}</h3>
    </div>

    {% if settings.home_display == "products" or settings.home_display == "both" and sections.primary.products %}
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
                                <a href="/admin/products/new" target="_top">{{ 'placeholder-product.png' | static_url | img_tag }}</a>
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