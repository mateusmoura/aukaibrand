{% if cart.items_count > 0 %}
			{% if cart.items_count == 1 %}
				<a href="{{ store.cart_url }}">{{ "1 produto" | translate }} - {{ cart.total | money }}</a>
			{% else %}
				<a href="{{ store.cart_url }}">{{ "{1} produtos" | translate(cart.items_count ) }} - {{ cart.total | money }}</a>
			{% endif %}
		{% else %}
			<span>{{ "Carrinho vazio" | translate }}</span>
		{% endif %}