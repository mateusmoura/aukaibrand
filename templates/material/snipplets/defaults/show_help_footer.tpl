
<div class="newsletter-footer container-fluid">
    <div id="newsletter-footer-container" class="m-bottom container">
        {% snipplet "newsletter.tpl" %}
    </div>
</div>
{# Single snipplet that work as credit cards example #}

<footer>
    {# Common Footer: contains navigation, social networks, newsletter, payment and shipping Logos, contact information and seals #}
    <div id="footer-common" class="container p-half-top">
        <div class="row">
            <div id="social-newtworks-container" class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                <div class="social-networks-container" class="m-bottom">
                    <h4 class="text-uppercase">{{ "Redes Sociales" | translate }}</h4>
                    <a class="soc-foot facebook d-inline-block text-center" href="#"><i class="fa fa-facebook"></i></a>
                    <a class="soc-foot twitter d-inline-block text-center" href="#"><i class="fa fa-twitter"></i></a>
                    <a class="soc-foot google_plus d-inline-block text-center" href="#"><i class="fa fa-google-plus"></i></a>
                    <a class="soc-foot pinterest d-inline-block text-center" href="#"><i class="fa fa-pinterest"></i></a>
                    <a class="soc-foot instagram d-inline-block text-center" href="#"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <div id="shipping-payment-logos-container" class="col-xs-12 {% if not (store.afip or ebit) %}col-sm-3 col-md-3 col-lg-3 {% else %}col-sm-2 col-md-2 col-lg-2{% endif %}">
                <div class="footer-payment m-bottom">
                    <h4 class="text-uppercase">{{ "Ejemplos de medios de pago" | translate }}</h4>
                     {% if store.country == 'BR' %}
                        {{ "visa" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "mastercard" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "amex" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "diners" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "pagseguro" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "moip" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                    {% else %}
                         {{ "visa" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "mastercard" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "amex" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "diners" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {% if store.country == 'AR' %}
                            {{ "ar/pagofacil" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                            {{ "ar/rapipago" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                            {{ "ar/tarjeta-naranja" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {% endif %}
                        {{ "mercadopago" | payment_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                    {% endif %}
                </div>
                <div class="footer-shipping m-bottom">
                    <h4 class="text-uppercase">{{ "Ejemplos de formas de envío" | translate }}</h4>
                     {% if store.country == 'BR' %}
                        {{ "br/correios" | shipping_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "br/jadlog" | shipping_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                    {% else %}
                        {{ "fedex" | shipping_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {{ "ups" | shipping_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {% if store.country == 'AR' %}
                            {{ "ar/oca" | shipping_logo | img_tag('', {class : 'img-logo', height : 30}) }}
                        {% endif %}
                    {% endif %}
                </div>
            </div>
            {#  **** Seals *** #}
            {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 m-bottom">
                    <h4 class="text-uppercase line-height-inherit">{{ "Seguridad y Certificaciones" | translate }}</h4>
                    {% if store.afip %}
                        {{ store.afip | raw }}
                    {% endif %}
                    {% if ebit %}
                        {{ ebit }}
                    {% endif %}
                </div>
            {% endif %}
        </div>
    </div>
    {#  Legal Footer: contains store´s legal information #}
    <div id="footer-legal" class="text-center-xs">
        <div class="container p-top-half p-bottom-half">
            <div class="row">
                <div class="powered-by col-xs-12 col-sm-6 col-md-6 col-lg-6 text-left text-center-xs m-half-top m-half-bottom">
                    {#
                    La leyenda que aparece debajo de esta linea de código debe mantenerse
                    con las mismas palabras y con su apropiado link a Tienda Nube;
                    como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                    Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                    tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
                    Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
                    palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                    http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                    e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                    manter visivél e com um link funcionando.
                    #}
                    {{ powered_by_link }}
                </div>
                <div class="copyright-container col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right text-center-xs m-half-top m-half-bottom">
                    {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                </div>
            </div>
        </div>
    </div>
    </footer>