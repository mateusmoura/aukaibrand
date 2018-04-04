<div class="row-fluid">
    <div class="container">
        <div class="headerBox-List">
            <div class="span12">
                <h1>{{ "Carrito de Compras" | translate }}</h1>
            </div>
        </div>
        <div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}">
            {% if cart.items %}
                {% if error.add %}
                    <div class="error centered">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
                {% endif %}
                {% for error in error.update %}
                    <div class="error centered">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
                {% endfor %}
                <form id="cart-form" action="" method="post">
                    <div class="cart-contents">
                        <ul class="firstrow">
                            <li class="col-product span6">{{ "Producto" | translate }}</li>
                            <li class="col-quantity span2">{{ "Cantidad" | translate }}</li>
                            <li class="col-price span2">{{ "Precio" | translate }}</li>
                            <li class="col-subtotal span2 last">{{ "Subtotal" | translate }}</li>
                        </ul>
                        {% for item in cart.items %}
                            <ul class="productrow" data-item-id="{{ item.id }}" >
                                <div class="span12 cart-mobile-name visible-tablet visible-phone">
                                    <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                                </div>
                                <li class="col-product span6">
                                    <div class="span3 text-center">

                                    <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                                    </div>
                                    <div class="span8 hidden-tablet hidden-phone">
                                        <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                                    </div>
                                </li>
                                <li class="col-quantity span2">
                                    <div class="span3 minus-mobile">
                                        <button 
                                            type="button" 
                                            class="item-minus" 
                                            onclick="LS.minusQuantity({{ item.id }})">
                                            <i class="fa fa-minus"></i></button>
                                     </div>       
                                    <div class="span6">
                                        <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}"  data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" />
                                    </div>
                                    <div class="span6">
                                        <div class="span6 text-center">
                                            <button 
                                                type="button"
                                                class="item-plus" 
                                                onclick="LS.plusQuantity({{ item.id }})">
                                                <i class="fa fa-plus"></i></button>
                                            <button 
                                                type="button" 
                                                class="item-minus minus-desktop" 
                                                onclick="LS.minusQuantity({{ item.id }})">
                                                <i class="fa fa-minus"></i></button>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-price span2 hidden-phone">
                                    <span>{{ item.unit_price | money }}</span>
                                </li>
                                <li class="col-subtotal span2">
                                    <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">
                                            {{ item.subtotal | money }}</span>
                                </li>
                                <li class="col-delete last span1">
                                    <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})">&times;</button>
                                </li>
                            </ul>

                        {% endfor %}
                        <div id="store-curr" class="hidden">{{ store.currency }}</div>

                        <div id="error-ajax-stock" class="container" style="display:none;">
                            <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                            <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                                <span aria-hidden='true'>×</span></button>
                            <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                            </div>
                        </div>
                        <div class="span6">
                            {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                            {% if cart.items and settings.continue_buying %}
                            {% set last_item_added = (cart.items | first) %}
                                <a href="{{ last_item_added.product.category.url }}" class="cart-general-button continue-buying pull-left button">{{ 'Seguir comprando' | translate }}</a>
                            {% endif %}
                        </div>
                        <div class="span5 pull-right">
                            <div class='subtotal-price' data-priceraw="{{ cart.total }}">
                                {{ "Subtotal" | translate }}: {{ cart.total | money }}
                            </div>
                            <div class='total-price' data-priceraw="{{ cart.total }}">
                                {{ "Total" | translate }}: {{ cart.total | money }}
                            </div>

                            <div class="go-to-checkout">
                            {% set cart_total = (settings.cart_minimum_value * 100) %}
                            {% if cart.total >= cart_total %}
                                <input id="go-to-checkout" class="button" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
                            {% else %}
                                <h3 class="lessthan pull-right">{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h3>
                            {% endif %}                    
                            </div>
                        </div>
                        
                    </div>

                </form>

            {% else %}
                <div class="emptyCart centered st alert">
                    {% if error %}
                        {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                    {% else %}
                        {{ "El carrito de compras está vacío." | translate }}
                    {% endif %}
                    {{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}
                </div>
            {% endif %}
        </div>

    </div>
</div>