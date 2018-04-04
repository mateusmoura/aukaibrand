<form id="product-form" class="m-half-top" method="post" action="{{ store.cart_url }}">
    <input type="hidden" name="add_to_cart" value="{{product.id}}">
    {#  **** Product Variants ****  #}
    {% if product.variations %}
        {% include "snipplets/product/variants.tpl" with {'quickshop': false} %}
    {% endif %}
    {% if product.available %}
         <div class="row">
            <div class="attributeLine-quickshop form-group text-left col-xs-12 col-sm-12 {% if settings.show_description_bottom %}col-md-2 col-md-offset-5 col-lg-2 col-lg-offset-5 {% else %}col-md-4 col-lg-4{% endif %}">
                <label class="variation-label">
                    <strong>{{ "Cantidad" | translate }}</strong>
                </label>
                <input class="form-control quantity-control product-quantity text-center-xs" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}">
            </div>
        </div>
    {% endif %}  
    {#  **** Product Shipping Calculator ****  #}
    <div class="row">
        <div class="col-xs-12 col-sm-12 {% if settings.show_description_bottom %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 {% else %}col-md-12 col-lg-12{% endif %} m-top">
            {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
        </div>
    </div>
    {#  **** Product Add to Cart button ****  #}
     <div id="cta-buttons-wrapper" class="row add-to-card-container">
        <div class="product-add-to-cart m-half-top col-xs-12 col-sm-12 {% if settings.ajax_cart %}js-addtocart-container{% endif %} {% if settings.show_description_bottom %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% else %}col-md-12 col-lg-12{% endif %}">
             {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
            <input type="submit" class="main-add-to-cart add-to-cart btn btn-primary js-addtocart {{state}} btn-block" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} >
        </div>
    </div>
</div>
</form>