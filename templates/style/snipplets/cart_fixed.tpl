{% if cart.items_count > 0 %}
<div class="cart-summary-fixed">
{% else %}
<div class="cart-summary-fixed empty-cart-fixed">
{% endif %}
    {% if cart.items_count > 0 %}
	<a href="{{ store.cart_url }}">
		<div class="img_icon_cart_fixed"><i class="fa fa-shopping-cart"></i></div>
	</a>
	<a href="{{ store.cart_url }}">
		{% set total_comprado = 0 %}
		{% for compra in cart.items %}
			{% set total_comprado = compra.quantity + total_comprado %}
		{% endfor %}
		<div class="cart-circle">{{ "{1}" | translate(total_comprado ) }}</div>
	</a>
	<div class="cart-money">
		<a href="{{ store.cart_url }}">
			<span>{{ cart.total | money }}</span>
		</a>
	</div>
    {% else %}
	<a href="{{ store.cart_url }}">
		<div class="img_icon_cart_fixed"><i class="fa fa-shopping-cart"></i></div>
	</a>
	<a href="{{ store.cart_url }}">
		<div class="cart-circle">{{ "{1}" | translate(cart.items_count ) }}</div>
	</a>
    {% endif %}
</div>