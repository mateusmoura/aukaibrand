<div class="container cart-page">
    <div class="page-header-container container">
         <div class="page-header col-md-12- col-sm-12 col-xs-12 ">          
            <h1>{{ "Carrito de compras" | translate }}</h1>
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
                    <ul class="firstrow hidden-xs">
                        <li class="col-product col-md-6 col-sm-5 col-xs-6">{{ "Producto" | translate }}</li>
                        <li class="col-quantity col-md-2 col-sm-3 col-xs-2">{{ "Cantidad" | translate }}</li>
                        <li class="col-price col-md-2 col-sm-2 col-xs-2">{{ "Precio" | translate }}</li>
                        <li class="col-subtotal col-md-2 col-sm-2 col-xs-2 last">{{ "Subtotal" | translate }}</li>
                    </ul>
                    {% for item in cart.items %}
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 item-row">
                        <ul class="productrow" data-item-id="{{ item.id }}" >
                            <div class="col-md-8 col-sm-12 col-xs-12 visible-xs">
                                <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                            </div>
                            <li class="col-product col-md-6 col-sm-5 col-xs-3">
                                <div class="col-md-3 col-sm-5 col-xs-3 text-center">
                                     <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                                </div>
                                <div class="col-md-8 col-sm-7 col-xs-12 hidden-xs">
                                    <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                                </div>
                            </li>
                            <li class="col-quantity col-md-2 col-sm-3 col-xs-4">
                                <div class="visible-xs col-xs-3 minus-control">
                                    <button 
                                        type="button" 
                                        class="item-minus" 
                                        onclick="LS.minusQuantity({{ item.id }})">
                                        <i class="fa fa-minus"></i></button>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6 quantity-input">
                                    <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}"  data-item-id="{{ item.id }}" />
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-3  minus-plus-control">
                                    <div class="col-md-6 text-center">
                                        <button 
                                            type="button"
                                            class="item-plus main-bg-color" 
                                            onclick="LS.plusQuantity({{ item.id }})">
                                            <i class="fa fa-plus"></i></button>
                                        <button 
                                            type="button" 
                                            class="item-minus hidden-xs" 
                                            onclick="LS.minusQuantity({{ item.id }})">
                                            <i class="fa fa-minus"></i></button>
                                    </div>
                                </div>
                            </li>
                            <li class="col-price col-md-2 col-sm-2 col-xs-2 hidden-xs">
                                <span>{{ item.unit_price | money }}</span>
                            </li>
                            <li class="col-subtotal col-md-2 col-sm-2 col-xs-4">
                                <span class="main-fg-color" data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">
                                        {{ item.subtotal | money }}</span>
                            </li>
                            <li class="col-delete last">
                                <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})"><i class="fa fa-trash-o"></i></button>
                            </li>
                        </ul>
                    </div>
                    {% endfor %}
                    <div id="store-curr" class="hidden">{{ store.currency }}</div>

                {% if error.add %}
                    <div id="error-ajax-stock" class="error hidden">
                        <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                            <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                                <span aria-hidden='true'>×</span></button>
                            <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                        </div>
                    </div>
                {% endif %}
                {% for error in error.update %}
                    <div id="error-ajax-stock" class="error hidden">
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
                        <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                    </div>
                </div>

                    <div class="col-md-6 col-sm-12 col-xs-12">
                    {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                    </div>

                    <div class="col-md-5 col-sm-12 col-xs-12 pull-right">
                        <div class='subtotal-price' data-priceraw="{{ cart.total }}">
                            {{ "Subtotal" | translate }}: {{ cart.total | money }}
                        </div>
                        <div class='total-price' data-priceraw="{{ cart.total }}">
                            {{ "Total" | translate }}: {{ cart.total | money }}
                        </div>

                        <div class="go-to-checkout text-center">
                        {% set cart_total = (settings.cart_minimum_value * 100) %}
                        {% if cart.total >= cart_total %}
                            <input id="go-to-checkout" class="btn btn-primary col-md-10 col-sm-12 col-xs-12 float-none" type="submit" name="go_to_checkout" value="{{ 'Ir al checkout' | translate }}" />
                        {% else %}
                            <h3 class="lessthan pull-right">{{ "Monto mínimo de compra (subtotal)" | translate }} {{ cart_total | money }}</h3>
                        {% endif %}                    
                        </div>
                    </div>
                    
                </div>

            </form>

        {% else %}
            <div class="emptyCart centered st">
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