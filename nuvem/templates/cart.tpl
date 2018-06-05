<section class="section-cart">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h1>{{ "Carrinho de compras" | translate }}</h1>
                </div>

                <div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}" class="section-cart__products">
                    {% if cart.items %}
                        {% if error.add %}
                            <div class="error centered">{{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | translate }}</div>
                        {% endif %}
                        {% for error in error.update %}
                            <div class="error centered">{{ "Não podemos te oferecer {1} unidades do produto {2}. No momento, somente possuímos {3} unidades" | translate(error.requested, error.item.name, error.stock) }}</div>
                        {% endfor %}
                        <form id="cart-form" action="" method="post">
                            {% for item in cart.items %}
                                <div class="row productrow product-list" data-item-id="{{ item.id }}">
                                    <div class="col-6">
                                        <div class="product-data">
                                            <div class="product-data__img">
                                                <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                                            </div>
                                            <div class="product-data__text">
                                                <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-4 col-md-5">
                                        <div class="product-count">
                                            <div class="product-count__plus">
                                                <button 
                                                    type="button"
                                                    class="item-plus btn btn-dark" 
                                                    onclick="LS.plusQuantity({{ item.id }})">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                            <div class="product-count__input">
                                                <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}"  data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" />
                                            </div>
                                            <div class="product-count__less">
                                                <button 
                                                    type="button" 
                                                    class="item-minus btn btn-dark minus-desktop" 
                                                    onclick="LS.minusQuantity({{ item.id }})">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>

                                            <div class="product-count__subtotal">
                                                <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">
                                                    {{ item.subtotal | money }}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-2 col-md-1">
                                        <div class="product-remove">
                                            <button type="button" class="item-delete btn btn-link btn-remove" onclick="LS.removeItem({{ item.id }})">&times;</button>
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}

                            <div id="store-curr" class="hidden">{{ store.currency }}</div>

                            <div id="error-ajax-stock" class="container" style="display:none;">
                                <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                                <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                                    <span aria-hidden='true'>×</span></button>
                                <strong>Error</strong> {{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | translate }}
                                </div>
                            </div>

                            <div class="product-calculator">
                                {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
                            </div>

                            <div class="row subtotal-price product-subtotal__price" data-priceraw="{{ cart.total }}">
                                <div class="col-6">
                                    <p>{{ "Subtotal" | translate }}</p>
                                </div>
                                <div class="col-6 text-right">
                                    <p>{{ cart.total | money }}</p>
                                </div>
                            </div>

                            <div class="row total-price product-total__price">
                                <div class="col-6">
                                    <p>{{ "Total" | translate }}</p>
                                </div>

                                <div class="col-6 text-right">
                                    <p>{{ cart.total | money }}</p>
                                </div>
                            </div>

                            <div class="row product-button">
                                <div class="col-12 col-md-6">
                                    {% set cart_total = (settings.cart_minimum_value * 100) %}
                                    {% if cart.total >= cart_total %}
                                        <button id="go-to-checkout" name="go_to_checkout" type="submit" class="btn btn-success btn-block btn-checkout">{{ 'Iniciar Compra' | translate }}</button>
                                    {% else %}
                                        <div class="alert alert-info" role="alert">
                                            {{ "O valor mínimo de compra (subtotal) é de" | translate }} {{ cart_total | money }}
                                        </div>
                                    {% endif %}
                                </div>

                                <div class="col-12 col-md-6">
                                    {% if cart.items and settings.continue_buying %}
                                        {% set last_item_added = (cart.items | first) %}
                                        <a href="{{ last_item_added.product.category.url }}" class="btn btn-secondary btn-block btn-continue-buying cart-general-button continue-buying button">{{ 'Continuar comprando' | translate }}</a>
                                    {% endif %}
                                </div>
                            </div>
                        </form>

                    {% else %}
                        <div class="emptyCart centered st alert">
                            {% if error %}
                                {{ "Desculpe, mas não há estoque suficiente para incluir este produto ao carrinho." | translate }}
                            {% else %}
                                {{ "O carrinho de compras está vazio." | translate }}
                            {% endif %}
                            {{ ("Continuar comprando" | translate ~ " »") | a_tag(store.products_url) }}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</section>


<div class="row-fluid">
    <div class="container">
        <div class="headerBox-List">
            <div class="span12">
                
            </div>
        </div>
        <div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}">
            
        </div>

    </div>
</div>