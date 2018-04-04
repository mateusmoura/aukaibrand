{# shopingCartPage ID is important for AJAX functionality #}
<div id="shoppingCartPage" class="container" data-minimum="{{ settings.cart_minimum_value }}">
	{% if settings.ajax_cart %}
    	{% snipplet "page-header.tpl" with page_header_title =  "Edición del carrito de compras" | translate  %}
    {% else %}
    	{% snipplet "page-header.tpl" with page_header_title =  "Carrito de Compras" | translate  %}
	{% endif %}
	{% if cart.items %}
        {% if error.add %}
            <div class="alert alert-warning text-center-xs"><i class="material-icons d-inline pull-left m-half-right m-none-xs m-half-bottom-xs">&#xE002;</i><p>{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</p></div>
        {% endif %}
        {% for error in error.update %}
        	<div class="alert alert-warning alert-no-stock-specific text-center-xs"><i class="material-icons d-inline pull-left m-half-right m-none-xs m-half-bottom-xs">&#xE002;</i><p>{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</p></div>
        {% endfor %}
        {% snipplet 'cart/cart-form.tpl' %}
	{% else %}
        {#  Empty cart  #}
		<div class="alert alert-info empty-cart-messages text-center-xs">
			<i class="material-icons d-inline pull-left m-half-right m-none-xs m-half-bottom-xs">&#xE88E;</i>
			<p>
			{% if error %}
				{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
			{% else %}
				{{ "El carrito de compras está vacío." | translate }}
			{% endif %}
			{{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}</p>
		</div>
	{% endif %}
</div>
