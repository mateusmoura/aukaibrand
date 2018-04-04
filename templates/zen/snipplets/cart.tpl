<div id="cart-summary" class="hidden-phone cart-summary">
    {% if cart.items_count > 0 %}
    	<a href="{{ store.cart_url }}">
             <span class="items">{{ "({1})" | translate(cart.items_count ) }}</span>
             <i class="fa fa-shopping-cart"></i>
             <span class="sub-total">{{ cart.total | money }}</span>
		</a>
    {% else %}
         <span class="no-items">(0)</span>
          <i class="fa fa-shopping-cart"></i>
    {% endif %}
</div>

<div class="visible-phone cart-summary">
    <a href="{{ store.cart_url }}">
    {% if cart.items_count > 0 %}
         <span class="sub-total">{{ cart.total | money }}</span>
         <i class="fa fa-shopping-cart"></i>
         <span class="items">{{ "({1})" | translate(cart.items_count ) }}</span>
    {% else %}
        <i class="fa fa-shopping-cart"></i>
         <span class="no-items">(0)</span>
    {% endif %}
   
    </a>
</div>