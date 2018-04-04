<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}">
{% if cart.items %}
    <div id="content" class="carrito cf">
        <h1 class="title">{{ "Carrinho de Compras" | translate }}</h1>
        {% if error %}
            <div class="error">{{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | translate }}</div>
        {% endif %}
        <ul class="firstrow">
            <li class="col-product">{{ "Produtos" | translate }}</li>
            <li class="col-quantity">{{ "Quantidade" | translate }}</li>
            <li class="col-price">{{ "Preço" | translate }}</li>
            <li class="col-subtotal">{{ "Subtotal" | translate }}</li>
        </ul>
        <form action="" method="post">
            <input type="hidden" name="mwp_change_quantities" value="1" />
            <ul class="productos">
                {% for item in cart.items %}
                    <li class="productrow" data-item-id="{{ item.id }}">
                        <div class="thumb"><a href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a></div>
                        <h3 class="title"><a href="{{ item.url }}">{{ item.name }}</a></h3>
                        <div class="cantidad">
                            <div class="cant-input">
                            <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" />
                            </div>
                            <div class="cant-ctas">
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
                        </div>

                        <span class="price">{{ item.unit_price | money }}</span>

                        <span class="subtotal col-subtotal">
                        <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
                        </span>

                        <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})">&times;</button>

                        <div class="clear"></div>
                    </li>
                {% endfor %}
            </ul>

            <div class="total">
            <div class='subtotal-price' data-priceraw="{{ cart.total }}">
                {{ "Subtotal" | translate }}: {{ cart.total | money }}
            </div>
            <div class='total-price' data-priceraw="{{ cart.total }}">
                {{ "Total" | translate }}: {{ cart.total | money }}
            </div>
            </div>

            {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
            {% if settings.continue_buying %}
                <div class="continue-shopping">&laquo; <a href="{{ store.products_url }}">{{ "Continuar comprando" | translate }}</a></div>
            {% endif %}
            {% set cart_total = (settings.cart_minimum_value * 100) %}
                {% if cart.total >= cart_total %}
                    <input id="go-to-checkout" class="button iniciar" type="submit" name="go_to_checkout" value="{{ "Finalizar Compra" | translate }}" />
                {% else %}
                    <h3 class="lessthan pull-right">{{ "O valor mínimo de compra (subtotal) é de" | translate }} <strong>{{ cart_total | money }}</strong></h3>
                {% endif %}
        </form>
    </div>

    <div id="error-ajax-stock" class="container hidden">
        <div class='alert alert-warning alert-dismissible fade in' role='alert'>
        <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
            <span aria-hidden='true'>×</span></button>
        <strong>Error</strong> {{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | translate }}
        </div>
    </div>

    <div id="store-curr" class="hidden">{{ store.currency }}</div>

{% else %}
    {% snipplet "sidebar.tpl" %}
    <div id="content" class="single">
        <h1 class="title">{{ (error ? "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." : "O carrinho de compras está vazio.") | translate }} <small>{{ "Talvez você se interesse pelos seguintes produtos:" | translate }}</small></h1>
        <div class="listado">{% snipplet "product_grid.tpl" with products = sections.slider.products %}</div>
        <div class="clear"></div>
    </div>
{% endif %}
</div>