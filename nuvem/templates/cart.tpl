<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}" class="container">
    <div class="title-container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Carrito de Compras" | translate }}</h1>
    </div>
    {# Page preloader #}
    <div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon page-loading-icon opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
	<form role="form" action="" method="post">
		{% if cart.items %}
        
        <div class="js-cart-contents cart-table col-xs-12 visible-when-content-ready">
            {% if error.add %}
				<div class="alert alert-info">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
			{% endif %}
			{% for error in error.update %}
				<div class="alert alert-info">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
			{% endfor %}

            {# Cart items #}

            {% for item in cart.items %}
            <ul class="js-cart-item cart-table-row row list-unstyled" data-item-id="{{ item.id }}">
                <li class="cart-table-product col-xs-12 col-sm-4">
                    <div class="row">

                        {# Cart item image #}
                        <a href="{{ item.url }}" class="col-xs-3">
                            {{ item.featured_image | product_image_url("medium") | img_tag(item.featured_image.alt, {class: 'img-responsive'}) }}
                        </a>

                        {# Cart item name #}
                        <div class="col-xs-9 m-top-half m-none-xs p-left-none-xs p-right-double-xs">
                            <a class="h5" href="{{ item.url }}">{{ item.name }}</a>
                        </div>
                    </div>
                </li>

                {# Cart item quantity controls #}
                <li class="cart-quantity col-xs-12 col-sm-3 m-top-half-xs">
                    <div class="cart-quantity-container m-top-half text-right text-left-xs pull-left-xs">
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-left" onclick="LS.minusQuantity({{ item.id }})">
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/minus.tpl" %}
                            </div>
                        </button>
                        <div class="cart-quantity-input-container d-inline-block">
                            <input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" class="js-cart-quantity-input cart-quantity-input" />
                        </div>
                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-right" onclick="LS.plusQuantity({{ item.id }})">
                            <div class="cart-quantity-svg-icon">
                                {% include "snipplets/svg/plus.tpl" %}
                            </div>
                        </button>
                    </div>

                    {# Cart item mobile subtotal #}
                    <div class="visible-xs cart-item-subtotal pull-right h5 font-medium-xs m-top">
                        <small class="hidden-xs">{{ "Precio" | translate }}</small>
                        <div class="js-cart-item-subtotal" data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</div>
                    </div>
                </li>

                {# Cart item unit price #}
                <li class="col-price col-sm-2 hidden-xs text-center m-top-quarter">
                    <small>{{ "Precio" | translate }}</small>
                    <div class="h4 m-top-quarter">{{ item.unit_price | money }}</div>
                </li>

                {# Cart item subtotal #}
                 <li class="col-sm-2 hidden-xs text-center m-top-quarter">
                    <small>{{ "Subtotal" | translate }}</small>
                    <div class="js-cart-item-subtotal h4 m-top-quarter" data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</div>
                </li>

                {# Cart item delete #}
                <li class="cart-delete-container col-xs-1 text-right">
                    <button type="button" class="item-delete cart-btn-delete pull-right-xs" onclick="LS.removeItem({{ item.id }})">
                        <div class="cart-delete-svg-icon svg-icon-text">
                            {% include "snipplets/svg/trash-o.tpl" %}
                        </div>
                    </button>
                </li>
            </ul>            
            {% endfor %}

            {# Cart alerts #}
            <div id="error-ajax-stock" class="row" style="display: none;">
                <span colspan="12" class='alert alert-warning alert-dismissible fade in col-xs-12' role='alert'>
                <button type='button' class='js-hide-alert close'>
                    <span aria-hidden='true'>×</span></button>
                <strong>{{ 'Error' | translate }}</strong> {{ "No hay suficiente stock para agregar este producto al carrito" | translate }}
                </span>
            </div>
        </div>
        
        {# Cart totals #}
		<div class="cart-totals-container col-xs-12 visible-when-content-ready">

            {# Cart subtotal #}
            <div class="cart-totals cart-subtotal">
                <span>
                    {{ "Subtotal" | translate }}
                </span>
                {% if settings.shipping_calculator_cart_page %}
                  <small>{{ " (sin envío)" | translate }}</small>
                {% endif %}
                :
    			<span class='js-cart-subtotal' data-priceraw="{{ cart.subtotal }}">
                    {{ cart.subtotal | money }}
                </span>
            </div>

            {# Cart promos #}
            <div class="js-total-promotions total-promotions clear-both m-top-none pull-right">
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
                    <span class="js-total-promotions-detail-row total-promotions-row p-bottom-quarter" id="{{ id }}">
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
                        <span class="cart-promotion-number">-{{ promotion.total_discount_amount_short }}</span>
                    </span>
                {% endfor %}
            </div>

            {# Cart total #}
            <div class="cart-totals cart-total">
                <span>{{ "Total" | translate }}: </span>
                <span class="js-cart-total" data-priceraw="{{ cart.total }}">{{ cart.total | money }}</span>

                {# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
                <div class="total-price hidden" data-priceraw="{{ cart.total }}">
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
		</div>

        {# Cart shipping #}
		{% if settings.shipping_calculator %}
            {% include "snipplets/shipping_cost_calculator.tpl" with {'shipping_calculator_show': settings.shipping_calculator_cart_page, 'calculator_big': false} %}
		{% endif %}
		
		<div class="go-to-checkout row clear-both m-top-half visible-when-content-ready">
			<div class="col-xs-12">

                {# Cart CTA #}
                {% set cart_total = (settings.cart_minimum_value * 100) %}
				{% if cart.total >= cart_total %}
					<input id="go-to-checkout" class="btn btn-primary pull-right full-width-xs m-bottom m-top-half-xs" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" autocomplete="off"/>
				{% else %}
					<h5 class="text-right pull-right">{{ "El monto mínimo de compra (subtotal) es de" | translate }} <strong>{{ cart_total | money }}</strong></h5>
				{% endif %}
				{% if cart.items and settings.continue_buying %}
				{% set last_item_added = (cart.items | first) %}
				<div class="continue-buying-container text-center-xs">
					<a href="{{ last_item_added.product.category.url }}" class="btn-link continue-buying pull-left m-top m-bottom m-top-none-xs full-width-xs">{{ 'Seguir comprando' | translate }}</a>
				</div>
				{% endif %}
				<input class="hidden pull-right" type="submit" name="update" value="{{ 'Cambiar Cantidades' | translate }}" id="change-quantities"/>
			</div>
		</div>
		{% else %}
		<div class="cart-detail text-center alert alert-warning">
			{% if error %}
				{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
			{% else %}
				{{ "El carrito de compras está vacío." | translate }}
			{% endif %}
			{{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}
		</div>
		{% endif %}		
	</form>

	<div id="store-curr" class="hidden">{{ store.currency }}</div>

</div>
