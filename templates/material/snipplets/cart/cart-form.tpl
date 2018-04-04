<form action="" method="post" class="m-top m-bottom">
	<div class="cart-contents">
        <div class="cart-table material-card container-fluid m-bottom">
            <ul class="header-row row list-style-none hidden-xs m-none-bottom p-half-all">
    			<li class="col-product col-xs-4 col-sm-4 col-md-4 col-lg-4">{{ "Producto" | translate }}</li>
    			<li class="col-quantity col-xs-3 col-sm-5 col-md-3 col-lg-3">{{ "Cantidad" | translate }}</li>
    			<li class="col-price col-xs-2 col-sm-2 col-md-2 col-lg-2 hidden-sm hidden-xs">{{ "Precio" | translate }}</li>
    			<li class="col-subtotal col-xs-2 col-sm-2 col-md-2 col-lg-2">{{ "Subtotal" | translate }}</li>
    		</ul>
    		{% for item in cart.items %}
                {# productrow class is nedded to show the AJAX JS errors #}
    			<ul class="productrow row list-style-none p-relative m-none-bottom p-half-all border-bottom m-half-bottom-xs drop-shadow-xs border-bottom-none-xs" data-item-id="{{ item.id }}" >
                    <li class="col-product col-xs-7 col-sm-4 col-md-4 col-lg-4 col-tight-xs">
                        <div class="row">
                            <a href="{{ item.url }}" class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-tight-xs m-quarter-bottom">
                                {{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt, {class: 'img-responsive'}) }}
                            </a>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 m-half-top col-tight-xs m-none-xs">
                                <a class="name no-link" href="{{ item.url }}">{{ item.name }}</a>
                                <div class="visible-xs product-price-xs col-subtotal">
                                    <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="col-quantity col-xs-5 col-sm-5 col-md-3 col-lg-3 m-bottom p-none-xs">
                    	<div class="quantities-controls-container row m-none-xs">
                             <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3 p-right-none p-none-xs">
                                <button 
                                type="button" 
                                class="btn btn-grey btn-xs item-minus minus-desktop btn-block" 
                                onclick="LS.minusQuantity({{ item.id }})">
                                <i class="fa fa-minus"></i></button>
                            </div>
                        	<div class="quantity-input col-xs-4 col-sm-5 col-md-5 col-lg-5 text-center p-none-xs">
                                <input type="tel" autocorrect="off" class="form-control text-center form-control-big" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();">
                            </div>
                            <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3 p-left-none p-none-xs">
                                <button 
                                type="button"
                                class="btn btn-info btn-xs item-plus btn-block" 
                                onclick="LS.plusQuantity({{ item.id }})">
                                <i class="fa fa-plus"></i></button>
                            </div>
                    	</div>
                    </li>
                    <li class="col-price col-xs-12 col-sm-2 col-md-2 col-lg-2 hidden-sm hidden-xs">
                        <span>{{ item.unit_price | money }}</span>
                    </li>
                     <li class="col-subtotal col-xs-12 col-sm-2 col-md-2 col-lg-2 text-center-xs hidden-xs">
                        <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">
                           {{ item.subtotal | money }}
                        </span>
                    </li>
                    <li class="col-delete col-xs-1 col-sm-1 col-md-1 col-lg-1 text-right">
                        <button type="button" class="btn btn-danger item-delete btn-xs" onclick="LS.removeItem({{ item.id }})"><i class="material-icons">&#xE872;</i></button>
                    </li>
    			</ul>
            {% endfor %}
        </div>
        <div class="totals-container row clear-both">
            <div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
                <div class="row">
                    <div class="col-xs-12 col-sm-11 col-md-11 col-lg-11">
                        {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                    </div>
                </div>
                {% if cart.items and settings.continue_buying %}
                    {% snipplet "cart/continue-buying.tpl" %}
                {% endif %}
            </div>
            <div class="col-xs-12 col-sm-6 col-md-7 col-lg-7 text-right text-center-xs">
                <div class="subtotal-price" data-priceraw="{{ cart.total }}">
                    <h4 class="m-none">{{ "Subtotal" | translate }}: {{ cart.total | money }}</h4>
                </div>
                <h2>
                    <div class="total-price" data-priceraw="{{ cart.total }}">
                        {{ "Total" | translate }}: {{ cart.total | money }}
                    </div>
                </h2>
                <div class="to-checkout-container m-top">
                    {% set cart_total = (settings.cart_minimum_value * 100) %}
                    {% if cart.total >= cart_total %}
                        <input id="go-to-checkout" class="btn btn-primary col-xs-12 col-sm-6 col-md-6 col-lg-6 pull-right" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}">
                    {% else %}
                        <h3>{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h3>
                    {% endif %}                 
                </div>
            </div>
        </div>
	</div>
	<div id="error-ajax-stock" style="display:none;">
        <div class='alert alert-warning m-top text-center-xs' role='alert'>
            <i class="material-icons d-inline pull-left m-half-right m-quarter-bottom-xs">&#xE002;</i>
            <p class="clear-both-xs">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</p>
        </div>
    </div>

</form>