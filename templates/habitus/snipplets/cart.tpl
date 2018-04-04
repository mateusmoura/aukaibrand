<div class="cart-summary">
    <i class="fa fa-shopping-cart"></i>
    {% if cart.items_count > 0 %}
        <a href="{{ store.cart_url }}"><span>{{ "Carrito" | translate }}</span>{{ "({1})" | translate(cart.items_count ) }} <span
                    class='badge'>{{ cart.total | money }}</span></a>
    {% else %}
        <span><span>{{ "Carrito" | translate }}</span> <span class='badge'>0</span></span>
    {% endif %}
</div>