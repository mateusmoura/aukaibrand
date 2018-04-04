<a href="{{ store.cart_url }}">
	<i class="fa fa-shopping-cart color"></i>
</a><br/>
{% if cart.items_count > 0 %}
    <span class="texto-carrito">{{ cart.total | money }}</span>
    <div class="cantidad">
    	{{ "{1}" | translate(cart.items_count ) }}
    </div>
{% else %}
	<span class="texto-carrito">{{ "Carrito vacío" | translate }}</span>
    <div class="cantidad">0</div>
{% endif %}