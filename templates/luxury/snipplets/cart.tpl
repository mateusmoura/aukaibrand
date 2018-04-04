<div id="cart-summary" class="cart-summary">
    {% if cart.items_count > 0 %}
    	<a href="{{ store.cart_url }}">
             <span class="items">{{ "{1}" | translate(cart.items_count ) }} <small>x</small> {{ cart.total | money }}</span>
             <span class="item-img"><i class="fa fa-shopping-cart"></i></span>
		</a>
    {% else %}
         <span class="items">0 {{ "items" | translate }}</span>
         <span class="item-img"><i class="fa fa-shopping-cart"></i></span>
    {% endif %}
</div>
