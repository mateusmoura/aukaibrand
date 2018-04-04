<div id="gocart">
	<p>
	{% if cart.items_count > 0 %}
		{% if cart.items_count == 1 %}
			<a {% if template == "cart" %} class="active"{% endif %} href="{{ store.cart_url }}">{{ "1 ítem" | translate }}</a>
		{% else %}
			<a {% if template == "cart" %} class="active"{% endif %} href="{{ store.cart_url }}">{{ "{1} ítems" | translate(cart.items_count ) }}</a>
		{% endif %}
	{% else %}
		<span class="active">{{ "{1} ítems" | translate(0) }}</span>
	{% endif %}
	</p>
</div>

