{% paginate by 18 %}

<div id="excerpt">
	<h1 class="title">{{ "Resultados de búsqueda" | translate }}</h1>
</div>

{% if products %}
    <ul id="products" class="product-grid clear">
	    {% snipplet "product_grid.tpl" %}
    </ul>
	{% snipplet "pagination.tpl" %}
{% else %}
	<p id="empty">{{ 'No hay resultados para "{1}".' | translate(query) }}</p>
{% endif %}