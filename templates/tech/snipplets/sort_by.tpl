{% set sort_text = {
'user': 'Destacado',
'price-ascending': 'Precio: Menor a Mayor',
'price-descending': 'Precio: Mayor a Menor',
'alpha-ascending': 'A - Z',
'alpha-descending': 'Z - A',
'created-ascending': 'Más Viejo al más Nuevo',
'created-descending': 'Más Nuevo al más Viejo',
'best-selling': 'Más Vendidos',
} %}
<span class="filter-by-sort col-md-3 col-sm-12 col-xs-12 clear">{{ 'Ordenar por:' | t }}</span>
<div class="col-md-3 col-sm-12 col-xs-12 clear">
	<select class="sort-by">
	    {% for sort_method in sort_methods %}
	        {# This is done so we only show the user sorting method when the user chooses it #}
	        {% if sort_method != 'user' or category.sort_method == 'user' %}
	            <option value="{{ sort_method }}" {% if sort_by == sort_method %}selected{% endif %}>{{ sort_text[sort_method] | t }}</option>
	        {% endif %}
	    {% endfor %}
	</select>
</div>