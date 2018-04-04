{% if cart.items_count > 0 %}
    <div class="cart-container">
        <div class="left"><a href="{{ store.cart_url }}"><i class="fa fa-shopping-cart"></i>&nbsp; <p>{{ "Carrito" | translate }}</p></a></div>
        <div class="quantity left">{{ "{1}" | translate(cart.items_count ) }} </div>
        <div class="price left">{{ cart.total | money }}</div>
    </div>
{% else %}
    <div class="cart-container">
        <div class="left"><a href="{{ store.cart_url }}"><i class="fa fa-shopping-cart"></i>&nbsp;<p>{{ "Carrito" | translate }}</p></a></div>
        <div class="quantity left">0</div>
        <div class="price left">{{ cart.total | money }}</div>
    </div>
{% endif %}