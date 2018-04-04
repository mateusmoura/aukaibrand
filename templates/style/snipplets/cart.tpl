{% if cart.items_count > 0 %}
<div class="cart-summary">
{% else %}
<div class="cart-summary empty-cart">
{% endif %}
    {% if cart.items_count > 0 %}
	<div class="cart-icon">
		<a href="{{ store.cart_url }}">
			{% set total_comprado = 0 %}
			{% for compra in cart.items %}
				{% set total_comprado = compra.quantity + total_comprado %}
			{% endfor %}

			<div class="cart-circle">{{ "{1}" | translate(total_comprado ) }}</div>
			<div class="img_icon_cart"><i class="fa fa-shopping-cart"></i></div>
		</a>
	</div>
	<div class="cart-money">
		<a href="{{ store.cart_url }}">
			<span>{{ cart.total | money }}</span>
		</a>
	</div>
    {% else %}
	<div class="cart-icon">
		<a href="{{ store.cart_url }}">
			<div class="cart-circle">0</div>
			<div class="img_icon_cart"><i class="fa fa-shopping-cart"></i></div>
		</a>
	</div>
    {% endif %}
</div>