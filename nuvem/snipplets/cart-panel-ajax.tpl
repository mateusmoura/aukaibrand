<div id="ajax-cart-details" class="js-ajax-cart-panel modal-right modal-xs modal-xs-right modal-xs-right-out" style="display: none;">
	<form action="{{ store.cart_url }}" method="post">
	  	<div id="store-curr" class="hidden">{{ cart.currency }}</div>
	  	<div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>

	  	{# Cart panel header #}
 	    <a class="js-toggle-cart modal-xs-header visible-xs" href="#">
	        <i class="fa fa-2x fa-angle-left modal-xs-header-icon"></i>
	        <span class="modal-xs-header-text modal-xs-right-header-text">{{ "Carrito de compras" | translate }}</span>
	    </a>
	 	<div class="modal-right-header hidden-xs">
			<a href="#" class="js-toggle-cart m-bottom">
		 		<i class="fa fa-times fa-2x" aria-hidden="true"></i>
		 	</a>
	 	</div>

	 	{# Cart panel body #}
	 	<div class="ajax-cart-body modal-right-body modal-xs-body">
	 		<div class="cart-table container-fluid">
			 	 <div class="ajax-cart-table-header cart-table-header hidden-xs row">
		          	<div class="pull-left p-left-half">
	            		<h5>{{ "Producto" | translate }}</h5>
	          		</div>
	          		<div class="pull-right text-right p-right-half m-right-double">
	            		<h5>{{ "Subtotal" | translate }}</h5>
	          		</div>
		        </div>

		        {# Cart panel items #}
			 	<div class="js-ajax-cart-list ajax-cart">
			 	  {% if cart.items %}
			 	  	{% for item in cart.items %}
						{% include "snipplets/cart-item-ajax.tpl" %}
					{% endfor %}
			 	  {% endif %}
			 	</div>

				{# Cart panel empty #}
	            <div class="js-empty-ajax-cart clear-both alert alert-info m-top" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
	              {{ "El carrito de compras está vacío." | translate }}
	            </div>
			 </div>

			{# Cart panel totals #}
			<div class=" js-visible-on-cart-filled cart-subtotal cart-totals" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>

				{# Cart panel subtotal #}
				<span>
					{{ "Subtotal" | translate }}
					{% if settings.shipping_calculator_cart_page %}
					  <small>{{ " (sin envío)" | translate }}</small>
					{% endif %}
					:
				</span>
				<span class="js-ajax-cart-total js-cart-subtotal" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
	      	</div>

			{# Cart panel promos #}
		 	<div class="js-total-promotions total-promotions full-width pull-left ajax-cart-promotions">
		        <span class="js-promo-title" style="display:none;">{{ "Promo" | translate }}</span>
		        <span class="js-promo-in" style="display:none;">{{ "en" | translate }}</span>
		        <span class="js-promo-all" style="display:none;">{{ "todos los productos" | translate }}</span>
		        <span class="js-promo-buying" style="display:none;"> {{ "comprando" | translate }}</span>
                <span class="js-promo-units-or-more" style="display:none;"> {{ "o más un." | translate }}</span>
		        {% for promotion in cart.promotional_discount.promotions_applied %}
				{% if(promotion.scope_value_id) %}
		  			{% set id = promotion.scope_value_id %}
				{% else %}
			  		{% set id = 'all' %}
				{% endif %}
				<span class="js-total-promotions-detail-row total-promotions-row" id="{{ id }}">
					<span class="cart-promotion-detail">
						{% if promotion.discount_script_type == "NAtX%off" %}
	                        {{ promotion.selected_threshold.discount_decimal_percentage * 100 }}% OFF
	                    {% else %}
                            {{ "Promo" | translate }} {{ promotion.discount_script_type }} 
                        {% endif %}

                        {{ "en" | translate }} {% if id == 'all' %}{{ "todos los productos" | translate }}{% else %}{{ promotion.scope_value_name }}{% endif %}

                        {% if promotion.discount_script_type == "NAtX%off" %}
                            <span class="text-lowercase">{{ "Comprando {1} o más un." | translate(promotion.selected_threshold.quantity) }}</span>
                        {% endif %}
                        :
					</span>
					<span class="cart-promotion-number">-{{ promotion.total_discount_amount_short }}</span>
				</span>
				{% endfor %}
	      	</div>

			{# Cart panel shipping #}
		 	{% if settings.shipping_calculator_cart_page %}
				<div id="ajax-cart-shipping" class="js-visible-on-cart-filled pull-left full-width m-top-half" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
                    {% include "snipplets/shipping_cost_calculator.tpl" with {'shipping_calculator_show': settings.shipping_calculator_cart_page, 'calculator_big': true} %}
				</div>
            {% endif %}

			{# Cart panel total #}
		 	<div class="js-visible-on-cart-filled cart-totals cart-total" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
	          	<div id="error-ajax-stock" class='alert alert-warning alert-dismissible m-top' role='alert' style="display:none;">
	              	<button type='button' class='close js-hide-alert'>
                	<span aria-hidden='true'>×</span></button>
	              	{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
	          	</div>
				<span>{{ "Total" | translate }}: </span>
				<span class="js-cart-total">{{ cart.total | money }}</span>
			 	{# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
	            <div class='total-price hidden'>
	                {{ "Total" | translate }} {{ cart.total | money }}
	            </div>

	            {# Cart installments #}
              	{% if store.has_new_installmentsv2_ab and store.country == 'BR' %}
					{% if cart.installments.max_installments_without_interest > 1 %}
						{% set installment =  cart.installments.max_installments_without_interest  %}
						{% set total_installment = cart.total %}
						{% set interest = false %}
						{% set interest_value = 0 %}
					{% else %}
						{% set installment = cart.installments.max_installments_with_interest  %}
						{% set total_installment = (cart.total * (1 + cart.installments.interest)) %}
						{% set interest = true %}
						{% set interest_value = cart.installments.interest %}
					{% endif %}
					<div {% if installment < 2 %} style="display: none;" {% endif %} data-interest="{{ interest_value }}" data-cart-installment="{{ installment }}" class="js-installments-cart-total font-body"> 
						{{ 'O hasta' | translate }}
						<span class="js-cart-installments-amount">{{ installment }}</span> 
						{{ 'cuotas de' | translate }} 
						<span class="js-cart-installments">{{ (total_installment / installment) | money }}</span> 
						<span {% if interest == true %} style="display: none;" {% endif %}class="js-installments-type-interest">{{ 'sin interés' | translate}}</span>
					</div>
		        {% endif %}
			</div>

		 	<div class="js-visible-on-cart-filled full-width pull-left" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>

		 		{# Cart panel CTA #}
		 		{% set cart_total = (settings.cart_minimum_value * 100) %}
		 		<div class="js-ajax-cart-submit m-bottom" {{ cart.total < cart_total ? 'style="display:none"' }} id="ajax-cart-submit-div">
					<input class="btn btn-primary btn-block" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
		 		</div>
		 		<div class="js-ajax-cart-minimum clear-both p-top-half" {{ cart.total >= cart_total ? 'style="display:none"' }} id="ajax-cart-minumum-div">
		 			<div class="alert alert-warning" role="alert">
		 		  	{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}
		 			</div>
		 		</div>

		 		{# Cart panel continue buying #}
		 		{% if settings.continue_buying %}
					<div class="text-center">
						<a href="#" class="js-toggle-cart btn btn-link m-bottom p-none">{{ 'Seguir comprando' | translate }}</a>
			 		</div>
		 		{% endif %}
		 		<input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>
		 	</div>
	 	</div>
 	</form>
 </div>
 <div id="ajax-cart-backdrop" class="js-ajax-backdrop js-toggle-cart backdrop" style="display: none;"></div>
