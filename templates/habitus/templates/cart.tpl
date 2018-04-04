<div id="shoppingCartPage" class="container page" data-minimum="{{ settings.cart_minimum_value }}">
    <div class="headerBox-Page">
        <h1>{{ "Carrito de Compras" | translate }}</h1>
    </div>
    {% if cart.items %}
        {% if error.add %}
            <div class="alert alert-danger">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
        {% endif %}
        {% for error in error.update %}
            <div class="alert alert-danger">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
        {% endfor %}
        <form class="" action="" method="post">
            <div class="cart-contents">
                <ul class="firstrow row hidden-xs">
                    <li class="col-image-product col-md-5 col-sm-6 col-xs-3 col-xxs">{{ "Producto" | translate }}</li>
                    <li class="col-quantity col-md-2 col-sm-1 col-xs-2 col-xxs">{{ "Cantidad" | translate }}</li>
                    <li class="col-price col-md-2 col-sm-2 col-xs-3 col-xxs">{{ "Precio" | translate }}</li>
                    <li class="col-subtotal col-md-2 col-sm-2 col-xs-3 col-xxs">{{ "Subtotal" | translate }}</li>
                    <li class="col-delete col-md-1 col-sm-1 col-xs-1 col-xxs last"></li>
                </ul>
                {% for item in cart.items %}
                    <ul class="productrow row" data-item-id="{{ item.id }}">
                         <li class="col-product col-md-12 col-sm-12 col-xs-12 hidden-sm hidden-lg hidden-md">
                            <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                        </li>
                        <li class="col-image col-md-2 col-sm-1 col-xs-3">
                            <a class="thumb"
                               href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                        </li>
                        <li class="col-product col-md-3 col-sm-5 col-xs-1 hidden-xs">
                            <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                        </li>
                        <li class="col-quantity col-md-2 col-sm-1 col-xs-5">
                            <div class="col-xs-3 visible-xs">
                                 <button 
                                    type="button" 
                                    class="item-minus hidden-phone" 
                                    onclick="LS.minusQuantity({{ item.id }})">
                                    <i class="fa fa-minus"></i></button>
                            </div>
                            <div class="col-xs-6">
                            <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();"/>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-3">
                                <button 
                                    type="button"
                                    class="item-plus hidden-phone" 
                                    onclick="LS.plusQuantity({{ item.id }})">
                                    <i class="fa fa-plus"></i></button>
                                <button 
                                    type="button" 
                                    class="item-minus hidden-phone hidden-xs" 
                                    onclick="LS.minusQuantity({{ item.id }})">
                                    <i class="fa fa-minus"></i></button>
                            </div>
                        </li>
                        <li class="col-price col-md-2 col-sm-2 col-xs-3 hidden-xs">
                            <span>{{ item.unit_price | money }}</span>
                        </li>
                        <li class="col-subtotal col-md-2 col-sm-2 col-xs-5">
                            <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">
                                            {{ item.subtotal | money }}</span>
                        </li>
                        <li class="col-delete last col-md-1 col-sm-1 col-xs-1">
                            <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})">&times;</button>
                        </li>
                    </ul>
                {% endfor %}

                <div class="total">
                <div class='subtotal-price' data-priceraw="{{ cart.total }}">
                    {{ "Subtotal" | translate }}: {{ cart.total | money }}
                </div>
                <div class='total-price' data-priceraw="{{ cart.total }}">
                    {{ "Total" | translate }}: {{ cart.total | money }}
                </div>
                </div>

            </div>
            <div class="row checkOutCallOuts">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                    {% if cart.items and settings.continue_buying %}
                        {% set last_item_added = (cart.items | first) %}
                            <a href="{{ last_item_added.product.category.url }}" class="btn btn-primary btn-lg continue-buying pull-left button">{{ 'Seguir comprando' | translate }}</a>
                    {% endif %}
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                {% set cart_total = (settings.cart_minimum_value * 100) %}
                    {% if cart.total >= cart_total %}
                        <input id="go-to-checkout" class="btn btn-primary btn-lg col-md-4 go-to-checkout pull-right" type="submit"
                           name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
                    {% else %}
                        <h3 class="lessthan pull-right">{{ "Monto mínimo de compra (subtotal) es de" | translate }} <strong>{{ cart_total | money }}</strong></h3>
                    {% endif %} 

                </div>
            </div>
        </form>
    {% else %}
        <div class="emptyCart alert alert-warning">
            {% if error %}
                {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
            {% else %}
                {{ "El carrito de compras está vacío." | translate }}
            {% endif %}
            {{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}
        </div>
    {% endif %}


    <div id="store-curr" class="hidden">{{ store.currency }}</div>

    <div id="error-ajax-stock" style="display: none;">
        <div class='alert alert-warning alert-dismissible fade in' role='alert'>
        <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
            <span aria-hidden='true'>×</span></button>
        <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
        </div>
    </div>

</div>