{% paginate by 20 %}
<div class="page-content">
	<div id="product-listing">	
		<div class="headerBox-Page">
			<h1>{{ "Resultados de búsqueda" | translate }}</h1>
		</div>
        {% if products %}
            <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% if settings.infinite_scrolling and not pages.is_last %}
               <div class="load-more-container">
                    <a id="loadMoreBtn" class="button secondary"><i class="fa fa-refresh fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                </div>
            {% endif %}
            <div class="row-fluid">
                <div class="span8 offset2">
                    <div class="crumbPaginationContainer bottom">
                        <div class='pagination'>
                            {% snipplet "pagination.tpl" %}
                        </div>
                    </div>
                 </div>
            </div>
        {% else %}
            <p class="centered st no-results">{{ "No hubo resultados para tu búsqueda" | translate }}</p>
        {% endif %}
    </div>
</div>