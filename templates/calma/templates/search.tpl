{% paginate by 18 %}

<h2 class="light">{{ "Resultados de búsqueda" | translate }}</h2>

{% if products %}
    {% snipplet "pagination.tpl" %}

    {% if products %}
    <table id="collection" class="product-grid" cellpadding="0" cellspacing="0">
        {% snipplet "product_grid.tpl" with show_prices = true %}
    </table>
    {% endif %}

    {% snipplet "pagination.tpl" %}
{% else %}
	<p class="box">{{ 'No hay resultados para "{1}".' | translate(query) }}</p>
{% endif %}
