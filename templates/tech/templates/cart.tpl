<div class="container page_detail">
    <!-- -->
    <div class="path">
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div class="clear"></div>
    <!-- titles -->
    <div class="titles">
        <h1>{{ "Carrito de Compras" | translate }}</h1>
    </div>
    <!-- titles -->
</div>
<div class="container">
    <div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}">
        {% if cart.items %}
            {% if error.add %}
                <div class="alert alert-danger text-center">{{ "No hay suficiente stock para agregar este producto al carrito" | translate }}</div>
            {% endif %}
            <form id="cart-form" action="" method="post">
                <div class="cart-contents">
                    <ul class="firstrow border hidden-xs">
                        <li class="col-product col-md-5 col-sm-5 col-xs-5">{{ "Producto" | translate }}</li>
                        <li class="col-quantity col-md-2 col-sm-2 col-xs-2">{{ "Cantidad" | translate }}</li>
                        <li class="col-price col-md-2 col-sm-2 col-xs-2">{{ "Precio" | translate }}</li>
                        <li class="col-subtotal col-md-2 col-sm-2 col-xs-2">{{ "Subtotal" | translate }}</li>
                    </ul>
                    {% for item in cart.items %}
                        <ul class="productrow border2" data-item-id="{{ item.id }}" >
                            <li class="col-xs-12 visible-phone">
                                <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                            </li>
                            <li class="col-product col-md-5 col-sm-5 col-xs-5">
                                <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt) }}</a>
                                <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                            </li>
                            <li class="col-quantity col-md-2 col-sm-2 col-xs-3">
                                <div class="col-md-6 quantity-input">
                                    <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}"  data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" />
                                </div>
                                <div class="col-md-6 quantity-buttons text-center">
                                    <button
                                            type="button"
                                            class="item-plus hidden-phone"
                                            onclick="LS.plusQuantity({{ item.id }})">
                                        <i class="fa fa-plus"></i></button>
                                    <button
                                            type="button"
                                            class="item-minus hidden-phone"
                                            onclick="LS.minusQuantity({{ item.id }})">
                                        <i class="fa fa-minus"></i></button>
                                </div>
                            </li>
                            <li class="col-price col-md-2 col-sm-2 col-xs-2 hidden-xs hidden-phone">
                                <span>{{ item.unit_price | money }}</span>
                            </li>
                            <li class="col-subtotal col-md-2 col-sm-4 col-xs-3">
						<span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">
						{{ item.subtotal | money }}</span>
                            </li>
                            <li class="col-delete last col-md-1 col-sm-1 col-xs-1">
                                <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})">&times;</button>
                            </li>
                        </ul>
                    {% endfor %}
                    <div id="store-curr" class="hidden">{{ store.currency }}</div>
                    {% if error.add %}
                        <div id="error-ajax-stock" class="error container hidden">
                            <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                                <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                                    <span aria-hidden='true'>×</span></button>
                                <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito" | translate }}
                            </div>
                        </div>
                    {% endif %}
                    {% for error in error.update %}
                        <div id="error-ajax-stock" class="error container hidden">
                            <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                                <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                                    <span aria-hidden='true'>×</span></button>
                                <strong>Error</strong>{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades" | translate(error.requested, error.item.name, error.stock) }}
                            </div>
                        </div>
                    {% endfor %}
                    <div id="error-ajax-stock" class="container" style="display:none;">
                        <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                            <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                                <span aria-hidden='true'>×</span></button>
                            <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito" | translate }}
                        </div>
                    </div>
                    <div class="col-md-7 col-xs-12">
                        {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                        {% if cart.items and settings.continue_buying %}
                        {% set last_item_added = (cart.items | first) %}
                            <a href="{{ last_item_added.product.category.url }}" class="button continue-buying pull-left addbutton">{{ 'Seguir comprando' | translate }}</a>
                        {% endif %}

                    </div>
                    <div class="col-md-3 col-xs-12 pull-right checkout-CTA-container">
                        <div class='subtotal-price' data-priceraw="{{ cart.total }}">
                            {{ "Subtotal" | translate }}: {{ cart.total | money }}
                        </div>
                        <div class='total-price' data-priceraw="{{ cart.total }}">
                            {{ "Total" | translate }}: {{ cart.total | money }}
                        </div>
                        <div class="go-to-checkout">
                            {% set cart_total = (settings.cart_minimum_value * 100) %}
                            {% if cart.total >= cart_total %}
                                <input id="go-to-checkout" class="button addbutton" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
                            {% else %}
                                <h4 class="lessthan pull-right">{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h4>
                            {% endif %}
                        </div>
                    </div>
                </div>
            </form>
        {% else %}
            <div class="emptyCart centered st alert alert-warning">
                {% if error %}
                    {{ "No hay suficiente stock para agregar este producto al carrito" | translate }}
                {% else %}
                    {{ "El carrito de compras está vacío." | translate }}
                {% endif %}
                {{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}
            </div>
        {% endif %}
    </div>
</div>