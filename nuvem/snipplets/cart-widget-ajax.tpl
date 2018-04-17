<div class="cart-summary">
    <a href="#" class="js-toggle-cart cart-summary-link">
		<div class="js-cart-widget-amount cart-summary-items">{{ "{1}" | translate(cart.items_count ) }}</div>
		<div class="cart-summary-icon svg-text-fill">
            {% include "snipplets/svg/cart.tpl" %}
        </div>
		<div class="js-cart-widget-total cart-summary-total">{{ cart.total | money }}</div>
    </a>
</div>
