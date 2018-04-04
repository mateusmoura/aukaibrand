<a id="shopping-cart" href="{{ store.cart_url }}" class="alt-link bold supersleight">
	{% if cart.items_count > 0 %}
		{% if cart.items_count == 1 %}
			{{ "1 ítem en tu carrito" | translate }}
		{% else %}
			{{ "{1} ítems en tu carrito" | translate(cart.items_count ) }}
		{% endif %}
	{% else %}
		{{ "carrito vacío" | translate }}
	{% endif %}
</a>
