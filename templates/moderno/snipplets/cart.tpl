{% if cart.items_count == 1 %}
	{{ "1 producto" | translate }}
{% else %}
	{{ "{1} productos" | translate(cart.items_count) }}
{% endif %}