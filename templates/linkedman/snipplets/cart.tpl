	<div class="cart-summary">
		{{ "cart.png" | static_url | img_tag }}
	
		{% if cart.items_count > 0 %}
			{% if cart.items_count == 1 %}
				<a href="{{ store.cart_url }}">{{ "1 producto" | translate }} - {{ cart.total | money }}</a>
			{% else %}
				<a href="{{ store.cart_url }}">{{ "{1} productos" | translate(cart.items_count ) }} - {{ cart.total | money }}</a>
			{% endif %}
		{% else %}
			<span>{{ "Carrito vacío" | translate }}</span>
		{% endif %}
	</div>