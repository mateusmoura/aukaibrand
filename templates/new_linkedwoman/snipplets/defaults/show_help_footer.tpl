{# Single snipplet that work as credit cards example #} 
<div class="row-fluid"> 
    <div class="span{{ has_shipping_payment_logos ? 2 : 3 }} responsive-inline">
        <div class="col-foot">
            <h4>{{ "Navegación" | translate }}</h4>
            {% snipplet "navigation-foot.tpl" %}
        </div>
    </div>
    <div class="span{{ has_shipping_payment_logos ? 2 : 3 }} responsive-inline">
        <div class="col-foot">
            <h4>{{ settings.news_message }}</h4>
                {% snipplet "newsletter.tpl" %}
        </div>
    </div> 
    <div class="span3"> 
        {% if store.country == 'BR' %}
        <div class="col-foot">
            <h4>{{ "Ejemplos de medios de pago" | translate }}</h4>
                {{ "visa" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                {{ "mastercard" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                {{ "amex" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                {{ "diners" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                {{ "pagseguro" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                {{ "moip" | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
        </div>  
        <div class="col-foot">
            <h4>{{ "Ejemplos de formas de envío" | translate }}</h4>
            {{ "br/correios" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "br/jadlog" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
        </div> 
        {% else %}
        <div class="col-foot">
            <h4>{{ "Ejemplos de medios de pago" | translate }}</h4>
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
        <div class="col-foot">
            <h4>{{ "Ejemplos de formas de envío" | translate }}</h4>
            {{ "fedex" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {{ "ups" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {% if store.country == 'AR' %}
                {{ "ar/oca" | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
            {% endif %}
        </div> 
        {% endif %}
    </div>  
</div>