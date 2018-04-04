{% if cart.items_count > 0 %}
<a href="{{ store.cart_url }}">
{% endif %}
<div class="cart-summary-widget d-inline-block p-relative">
    <i class="material-icons">&#xE8CC;</i>
    {% if template != 'cart' %}
       <span id="cart-amount" class="cart-amount p-absolute">{{ "{1}" | translate(cart.items_count ) }}</span>
    {% endif %}
</div>
{% if cart.items_count > 0 %}
</a>
{% endif %}
