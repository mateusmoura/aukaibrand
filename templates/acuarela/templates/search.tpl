{% paginate by 18 %}
<div id="excerpt">
	<h1>{{ "Resultados de búsqueda" | translate }}</h1>
</div>

{% if products %}
<ul id="products" class="product-grid clear">
    {% snipplet "product_grid.tpl" %}
</ul>
{% endif %}

<div id="paginate">
	<div>
		{% snipplet "pagination.tpl" %}
	</div>
</div>