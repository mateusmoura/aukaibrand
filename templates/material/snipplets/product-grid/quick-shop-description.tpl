<div class="quickshop-description-container col-xs-12 col-sm-12 col-md-6 col-lg-6">
    <div class="quickshop-product-information">
        {#  **** Quickshop information, variants and button ****  #}
        <h2 itemprop="name" class="m-none-top text-center-xs">{{ product.name }}</h2>
        <div class="price-container text-center-xs">
            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <h3 class="price-compare d-inline-block text-line-through  m-none-top">
                     <span id="compare_price_display" class="opacity-50 p-half-right compare-price-display" {% if not product.compare_at_price %}style="display:none;"{% endif %}>{{ product.compare_at_price | money }}</span>
                </h3>
                <h2 class="price final-price d-inline-block m-none-top {% if product.compare_at_price %}border-left-dark p-half-left{% endif %}" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</h2>
                <meta itemprop="priceCurrency" content="{{ product.currency }}">
                {% if product.stock_control %}
                    <meta itemprop="inventoryLevel" content="{{ product.stock }}">
                    <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}">
                {% endif %}
            </div>
        </div>
        <div class="installments-container text-center-xs m-half-bottom">
             {% if product.show_installments %}
                {% set max_installments_without_interests = product.get_max_installments(false) %}
                {% if max_installments_without_interests %}
                    <div class="max_installments m-bottom">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong> sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money ) }}</div>
                {% else %}
                    {% set max_installments_with_interests = product.get_max_installments %}
                    {% if max_installments_with_interests %}
                        <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                    {% endif %}
                {% endif %}
            {% endif %}
         </div>
        <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}">
        <meta itemprop="url" content="{{ product.social_url }}">
        {% if page_description %}
            <meta itemprop="description" content="{{ page_description }}">
        {% endif %}
    </div>
    <form id="product_form" method="post" action="{{ store.cart_url }}">
        <input type="hidden" name="add_to_cart" value="{{product.id}}">
       {% if product.variations %}
            {% include "snipplets/product/variants.tpl" with {'quickshop': true} %}
        {% endif %}
        {% if product.available %}
             <div class="row">
                <div class="attributeLine-quickshop form-group col-xs-12 col-sm-12 col-md-3 col-lg-3">
                    <label class="variation-label">
                        <strong>{{ "Cantidad" | translate }}</strong>
                    </label>
                    <input class="form-control quantity-control product-quantity text-center-xs" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}">
                </div>
            </div>
        {% endif %}  
        <div class="add-to-cart-button row">
            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
            <div class="container-fluid {% if settings.ajax_cart %}js-addtocart-container{% endif %}">
                <input type="submit" class="add-to-cart btn btn-primary {% if settings.ajax_cart %}js-addtocart{% endif %} {{state}} col-xs-12 col-sm-12 col-md-8 col-lg-8" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} >
            </div>
        </div>
    </form>
    {% if product.description != '' %}
        <div class="quickshop-user-content row m-top">
            <div class="container-fluid">
                <h4>{{ "Descripción" | translate }}</h4>
                {{ product.description | plain | truncateWords(30) }} ...
                <a  href="{{ product.url }}" title="{{ product.name }}">{{ "Ver <strong>{1}</strong> en detalle" | translate(product.name) }}</a>
            </div>
        </div>
    {% endif %}
</div>
