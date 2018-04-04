{% snipplet "banner_products.tpl" %}
<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}" class="container">
    <div class="contenido">
        <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
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
                <div class="lista_carrito">
                    <div class="cart-header row">
                        <div class="col-xs-5 col-sm-6 col-md-6">{{ "Producto" | translate }}</div>
                        <div class="col-xs-3 col-sm-2 col-md-2">{{ "Cantidad" | translate }}</div>
                        <div class="col-xs-2 col-sm-2 col-md-2 hidden-xs">{{ "Precio" | translate }}</div>
                        <div class="col-xs-4 col-sm-2 col-md-2 subtotal-header">{{ "Subtotal" | translate }}</div>
                    </div>
                    {% for item in cart.items %}
                        <div class="cart-item row productrow" data-item-id="{{ item.id }}">
                            <div class="col-xs-5 col-sm-6 col-md-6">
                                <div class="row">
                                <div class="col-xs-2 col-sm-4 col-md-4 hidden-xs">
                                <a class="thumb"
                                   href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.name) }}</a>
                                </div>
                                <div class="col-xs-10 col-sm-8 col-md-8">
                                    <div class="cart-item-name">
                                        <a class="name" href="{{ item.url }}">{{ item.name }}</a></div>
                                </div>
                                </div>
                            </div>
                            <div class="col-xs-3 col-sm-2 col-md-2">
                                <div class="cart-item-cant col-quantity">
                                    <input  type="text" 
                                            name="quantity[{{ item.id }}]" 
                                            value="{{ item.quantity }}" 
                                            data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();"/>
                                </div>
                                <div class="quantity-buttons hidden-xs hidden-sm">
                                    <button 
                                        type="button" 
                                        class="item-minus hidden-phone" 
                                        onclick="LS.minusQuantity({{ item.id }})">
                                        <i class="fa fa-minus"></i></button>
                                    <button 
                                        type="button"
                                        class="item-plus hidden-phone" 
                                        onclick="LS.plusQuantity({{ item.id }})">
                                        <i class="fa fa-plus"></i></button>                                    
                                </div>
                            </div>
                            <div class="col-xs-2 col-sm-2 col-md-2 hidden-xs">
                                <div class="col-price cart-item-price">
                                <span>{{ item.unit_price | money }}</span>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-2">
                                <div class="col-subtotal cart-item-price">
                                    <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">
                            {{ item.subtotal | money }}</span>
                                </div>
                                <div class="col-delete cart-item-del">
                                    <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})"><i class="fa fa-trash-o"></i></button>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                    <ul class='total_tabla'>
                       
                        {% if cart.items and settings.continue_buying %}
                        {% set last_item_added = (cart.items | first) %}
                            <a href="{{ last_item_added.product.category.url }}" class="btn-lg cambiar_cant pull-left">{{ 'Seguir comprando' | translate }}</a>
                        {% endif %}
                        <li class='pull-right'>
                            <div class='total-price' data-priceraw="{{ cart.total }}">
                                {{ "Total" | translate }}: {{ cart.total | money }}
                            </div>
                        </li>
                        <li class='pull-right'>
                            <div class='subtotal-price' data-priceraw="{{ cart.total }}">
                                {{ "Subtotal" | translate }}: {{ cart.total | money }}
                            </div>
                        </li>                        

                    </ul>
                    {% if settings.shipping_calculator %}
                         {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                    {% endif %}
                
                    <ul class="col-md-6 pull-right">
                    {% set cart_total = (settings.cart_minimum_value * 100) %}

                        {% if cart.total >= cart_total %}
                            <input id="go-to-checkout" class="btn-lg agregar iniciar_compra" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
                        {% else %}
                            <h3 class="lessthan pull-right">{{ "El monto mínimo de compra (subtotal) es de" | translate }} <strong>{{ cart_total | money }}</strong></h3>
                        {% endif %}
                        
                    </ul>
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
    </div>

    <div id="store-curr" class="hidden">{{ store.currency }}</div>

    <div id="error-ajax-stock" style="display: none;">
        <div class='alert alert-warning alert-dismissible fade in' role='alert'>
        <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
            <span aria-hidden='true'>×</span></button>
        <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
        </div>
    </div>

</div>