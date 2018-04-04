<div class="cart-summary">
    <i class="fa fa-lock"></i>

    {% if cart.items_count > 0 %}
            <a href="{{ store.cart_url }}">{{ "Carrito" | translate }} {{ "({1})" | translate(cart.items_count ) }} - {{ cart.total | money }}</a>

    {% else %}
        <span>{{ "Carrito" | translate }} (0)</span>
    {% endif %}
</div>