<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}" class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ "Carrito de Compras" | translate }}</h1></legend></fieldset>
			</div>
		</div>
	</div>
	<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
		<ul class="breadcrumb-custom" itemprop="breadcrumb">
			<li>
				<a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
			</li>
			<li>
				<span class="separator">></span>
				<span class="crumb"><strong>{{ "Carrito de Compras" | translate }}</strong></span>
			</li>
		</ul>
	</div>
	<form role="form" action="" method="post">
		{% if cart.items %}
        
        {# New mobile first for all structure #}        
        <div class="cart-detail mob-first">
            {% if error.add %}
				<p class="bg-info">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</p>
			{% endif %}
			{% for error in error.update %}
				<p class="bg-info">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</p>
			{% endfor %}
            {% for item in cart.items %}
            <div class="row main no-gutter">
                <div class="col-md-12 productrow" data-item-id="{{ item.id }}">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row thumb">
                                <div class="col-md-3" data-item-id="{{ item.id }}">
                                    <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.name) }}</a>
                                </div>
                                <div class="col-md-9 no-gutter">
                                    <h2 class="text-left"><a class="name" href="{{ item.url }}">{{ item.name |length > 60 ? item.name|slice(0, 60) ~ '...' : item.name }}</a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-4 qty-row">
                                    <div class="qty-group-btn">
                                        <div class="quantity-buttons">
                                            <button 
                                                type="button" 
                                                class="item-minus hidden-phone" 
                                                onclick="LS.minusQuantity({{ item.id }})">
                                                <i class="fa fa-minus"></i></button>
                                        </div>
                                        <div class="quantity-input">
                                            <input 	class="form-control text-center" 
                                                    type="text" 
                                                    name="quantity[{{ item.id }}]" 
                                                    value="{{ item.quantity }}" 
                                                    data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" />
                                        </div>
                                        <div class="quantity-buttons">
                                            <button 
                                                type="button"
                                                class="item-plus hidden-phone" 
                                                onclick="LS.plusQuantity({{ item.id }})">
                                                <i class="fa fa-plus"></i></button>
                                        </div>                        
                                    </div>
                                </div>
                                <div class="col-md-3 precio">
                                    <small>{{ "Precio" | translate }}</small>
                                    <span>{{ item.unit_price | money }}</span>
                                </div>
                                <div class="col-md-3 col-subtotal  sub-tot">
                                    <small>{{ "Subtotal" | translate }}</small>
                                    <span class="subtotal-mobile" data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})">
                                        <i class="fa fa-trash-o"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            {% endfor %}
            <div id="error-ajax-stock" class="col-md-12 no-gutter" style="display: none;">
                <span colspan="12" class='alert alert-warning alert-dismissible fade in col-md-12' role='alert'>
                <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                    <span aria-hidden='true'>×</span></button>
                <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                </span>
            </div>
        </div>
        
		<div class="cart-detail-totals col-md-12 no-gutter">

			<div class='subtotal-price' data-priceraw="{{ cart.total }}">
                {{ "Subtotal" | translate }}: {{ cart.total | money }}
            </div>
            <div class='total-price' data-priceraw="{{ cart.total }}">
                {{ "Total" | translate }}: {{ cart.total | money }}
            </div>

            <div class="row">
                <div class="col-md-12 no-gutter">
                    {% if settings.shipping_calculator %}
                        {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                    {% endif %}
                </div>
			</div>
            
			<div class="go-to-checkout row">
			{% set cart_total = (settings.cart_minimum_value * 100) %}
                {% if cart.total >= cart_total %}
					<input id="go-to-checkout" class="cart-button pull-right" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
				{% else %}
                    <h3 class="lessthan pull-right">{{ "El monto mínimo de compra (subtotal) es de" | translate }} <strong>{{ cart_total | money }}</strong></h3>
                {% endif %}
                {% if cart.items and settings.continue_buying %}
                {% set last_item_added = (cart.items | first) %}
                <div class="continue-buying-container">
                    <a href="{{ last_item_added.product.category.url }}" class="cart-general-button continue-buying pull-left">{{ 'Seguir comprando' | translate }}</a>
                </div>
                {% endif %}
				<input class="cart-general-button hidden pull-right" type="submit" name="update" value="{{ 'Cambiar Cantidades' | translate }}" id="change-quantities"/>
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