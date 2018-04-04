<div class="cart-summary d-inline-block p-relative">
    <a href="#" class="js-toggleCart js-toggleCart-ajax">
	  {% if template != 'cart' %}
      	<span id="cart-amount" class="cart-amount p-absolute">{{ "{1}" | translate(cart.items_count ) }}</span>
      {% endif %}
      <span class="item-img"><i class="material-icons">&#xE8CC;</i></span>
    </a>
</div>
