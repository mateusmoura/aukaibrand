{% paginate by 16 %}
<div class="container">
    <div class="search-result">
        <!-- titles -->
        <div class="titles">
            <h1>{{ "Resultados de búsqueda" | translate }}</h1>
        </div>
        <!-- titles -->
        {% if products %}
            <div class="product-table category-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% if settings.infinite_scrolling and not pages.is_last %}
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 loadMoreContainer">
                    <a id="loadMoreBtn" class="button secondary m-center {% if not settings.banner_services_home %}m-top m-double-bottom{% endif %}"><i class="fa fa-cog fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                     <div id="no-more-products"><p>No quedan mas productos para mostrar</p></div>
                </div>
            {% endif %}
            <div class="crumbPaginationContainer bottom">
                {% snipplet "pagination.tpl" %}
            </div>
        {% else %}
            <div class="no-result">{{ "No hubo resultados para tu búsqueda" | translate }}</div>
            <!-- titles -->
            <div class="titles titles related-title">
                <h2>{{ "Productos destacados" | translate }}</h2>
            </div>
            {% set related_products = sections.primary.products | take(4) | shuffle %}
            {% if related_products | length > 1 %}
            <div class="products row">
                {% for related in related_products %}
                    {% include 'snipplets/single_product.tpl' with {product : related} %}
                {% endfor %}
            </div>
            {% endif %} 


        {% endif %}
    </div>
</div>