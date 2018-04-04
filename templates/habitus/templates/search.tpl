{% paginate by 12 %}
<div class="container page">
    <div id="product-listing">
        <div class="headerBox-Page">
            <h1>{{ "Resultados de búsqueda" | translate }}</h1>
        </div>
        {% if products %}
            <hr class="featurette-divider">
            <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% if settings.infinite_scrolling and not pages.is_last %}
                <div class="loadMoreContainer">
                    <a id="loadMoreBtn" class="btn btn-primary btn-lg"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                </div>
            {% endif %}
            {% snipplet "pagination.tpl" %}  
        {% else %}
            <p class="alert alert-info"><i class="fa fa-exclamation-triangle"></i>{{ "No hubo resultados para tu búsqueda" | translate }}
            </p>
            <hr class="featurette-divider">
            {% snipplet "maybe_products.tpl" %}
        {% endif %}
    </div>
</div>

 