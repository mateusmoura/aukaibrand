{% paginate by 12 %}
<div id="search-results" class="container">
	<div id="product-listing">	
        {% snipplet "page-header.tpl" with page_header_title = "Resultados de búsqueda" | translate  , hide_breadcrumbs = true %}
        {% if products %}
           <div class="m-top row masonry-grid">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% snipplet "product-grid/pagination.tpl" %}
        {% else %}
            <h4 class="m-double-bottom">{{ "No hubo resultados para tu búsqueda" | translate }}</h4>
        {% endif %}
    </div>
</div>
