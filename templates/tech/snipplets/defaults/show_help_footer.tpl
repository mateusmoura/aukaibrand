{# Single snipplet that work as credit cards example #} 
<div class="col-md-4 col-lg-4 col-xs-12 footer-col-container">
    {% if store.country == 'BR' %}
        <div class="payment-container">
            <h3>{{ 'Ejemplos de medios de pago' | translate }}</h3>
            {{ "visa" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "mastercard" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "amex" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "diners" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "pagseguro" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "moip" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
        </div>
        <div class="shipping-container">
            <h3>{{ 'Ejemplos de formas de envío' | translate }}</h3>
            {{ "br/correios" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "br/jadlog" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
        </div>           
    {% else %} 
        <div class="payment-container">
            <h3>{{ 'Ejemplos de medios de pago' | translate }}</h3>
            {{ "visa" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "mastercard" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "amex" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "diners" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {% if store.country == 'AR' %}
                {{ "ar/pagofacil" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                {{ "ar/rapipago" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                {{ "ar/tarjeta-naranja" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {% endif %}
            {{ "mercadopago" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
        </div>  
        <div class="shipping-container">
            <h3>{{ 'Ejemplos de formas de envío' | translate }}</h3>
            {{ "fedex" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "ups" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {% if store.country == 'AR' %}
                {{ "ar/oca" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {% endif %}
        </div> 
    {% endif %} 
</div>