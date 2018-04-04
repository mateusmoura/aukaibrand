{% paginate by 18 %}
<div id="content" class="listado">
	<h1 class="title">{{ "Resultados de búsqueda" | translate }}</h1>

	{% if products %}
        <div class="product-grid">
		    {% snipplet "product_grid.tpl" %}
        </div>
	{% else %}
		<p>{{ "No hubo resultados para su búsqueda." | translate }}</p>
	{% endif %}
	
	<div class="clear"></div>
		
	<div id="pages">
		{% snipplet "pagination.tpl" %}
		<div class="clear"></div>
	</div>
	
</div><!--content-->