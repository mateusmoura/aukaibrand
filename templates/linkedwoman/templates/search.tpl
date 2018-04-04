{% paginate by 18 %}
<div class="page-content">
	<div id="product-listing">	
		<div class="headerBox">
			<h2>{{ "Resultados de búsqueda" | translate }}</h2>
		</div>
		<div class="contentBox" id="productGridContainer">
			<div class="crumbPaginationContainer top">
				<div class='pagination'>
					{% snipplet "pagination.tpl" %}
				</div>
			</div>

            {% if products %}
            <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% endif %}
			
			<div class="crumbPaginationContainer bottom">
				<div class='pagination'>
					{% snipplet "pagination.tpl" %}
				</div>
			</div>
		</div>
	</div>
</div>