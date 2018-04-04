
{% if settings.banner_services %}
    <div id="banner-services-footer" class="container-fluid">
         {% include 'snipplets/banners/banner-services.tpl' %}
     </div>   
{% endif %}
{% if template == 'home' %}
    <div class="newsletter-footer container-fluid">
        <div id="newsletter-footer-container" class="m-bottom container">
            {% snipplet "newsletter.tpl" %}
        </div>
    </div>
{% endif %}
<footer>
    {# Common Footer: contains navigation, social networks, newsletter, payment and shipping Logos, contact information and seals #}
    <div id="footer-common" class="container p-half-top">
        {% set has_shipping_logos = settings.shipping %}
        {% set has_payment_logos = settings.payments %}
        {% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
        <div class="row">
            <div id="footer-navigation" class="col-xs-12 col-sm-2 col-md-2 col-lg-2 hidden-xs m-bottom">
                <h4 class="text-uppercase">{{ "Navegación" | translate }}</h4>
                <ul class="p-none m-none list-style-none">
                    {% snipplet "navigation/navigation-footer.tpl" %}
                </ul>
            </div>
            {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
                <div id="social-newtworks-container" class="col-xs-12 col-sm-2 col-md-2 col-lg-2 m-bottom">
                    <div class="social-networks-container" class="m-bottom">
                        <h4 class="text-uppercase">{{ "Redes Sociales" | translate }}</h4>
                        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <a href="{{ sn_url }}" target="_blank" class="d-inline-block text-center" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                            {% endif %}
                        {% endfor %}
                    </div>
                </div>
            {% endif %}
            {% if has_shipping_payment_logos %}
                <div id="shipping-payment-logos-container" class="col-xs-12 {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}col-sm-2 col-md-2 col-lg-2 {% else %}col-sm-4 col-md-4 col-lg-4{% endif %}">
                    {% if has_payment_logos %}
                        <div class="footer-payment m-bottom">
                            <h4 class="text-uppercase">{{ "Medios de pago" | translate }}</h4>
                            {% for payment in settings.payments %}
                                {{ payment | payment_logo | img_tag('', {'height' : 20}) }}
                            {% endfor %}
                        </div>
                    {% endif %}
                    {% if has_shipping_logos %}
                        <div class="footer-shipping m-bottom">
                            <h4 class="text-uppercase">{{ "Formas de envío" | translate }}</h4>
                            {% for shipping in settings.shipping %}
                                {{ shipping | shipping_logo | img_tag('', {'height' : 20}) }}
                            {% endfor %}
                        </div>
                    {% endif %}
                </div>
            {% endif %}
            {% if store.phone or store.email or store.blog or store.address %}
                <div id="footer-store-contact" class="m-bottom col-xs-12 {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}col-sm-4 col-md-4 col-lg-4{% else %}col-sm-4 col-md-4 col-lg-4{% endif %}">
                    <h4 class="text-uppercase">{{ "Contactanos" | translate }}</h4>
                    <ul class="list-style-none p-none row">
                        {% if store.phone %}
                            <li class="m-half-bottom container-fluid"><i class="material-icons pull-left m-half-right">&#xE0CD;</i><p class="m-none pull-left hidden-xs">{{ store.phone }}</p><p class="m-none pull-left hidden-sm hidden-md hidden-lg"><a href="tel:{{ store.phone }}" class="no-link text-wrap">{{ store.phone }}</a></p></li>
                        {% endif %}
                        {% if store.email %}
                            <li class="m-half-bottom text-wrap container-fluid"><i class="material-icons pull-left m-half-right">&#xE0BE;</i><p class="pull-left m-none">{{ store.email | mailto }}</p></li>
                        {% endif %}
                        {% if store.blog %}
                            <li class="m-half-bottom container-fluid"><i class="material-icons pull-left m-half-right">&#xE0B7;</i><p class="pull-left m-none"><a target="_blank" href="{{ store.blog }}" class="no-link text-wrap">{{ store.blog }}</a></p></li>
                        {% endif %}
                        {% if store.address %}
                            <li class="m-half-bottom container-fluid"><i class="material-icons pull-left m-half-right">&#xE0C8;</i><p class="pull-left m-none"><a target="_blank" href=" http://maps.google.com/?q={{ store.address }}" class="no-link text-wrap">{{ store.address }}</a></p></li>
                        {% endif %}
                    </ul>
                </div>
            {% endif %}
            {#  **** Seals *** #}
            {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                <div id="seals-container" class="col-xs-12 col-sm-2 col-md-2 col-lg-2 m-bottom">
                    <h4 class="text-uppercase line-height-inherit">{{ "Seguridad y Certificaciones" | translate }}</h4>
                    {% if store.afip %}
                        {{ store.afip | raw }}
                    {% endif %}
                    {% if ebit %}
                        {{ ebit }}
                    {% endif %}
                    {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
                        <div class="custom-seals-container row">
                            {% if "seal_img.jpg" | has_custom_image %}
                                <div class="custom-seal custom-seal-img container-fluid m-half-top">
                                    {% if settings.seal_url != '' %}
                                        <a href="{{ settings.seal_url }}" target="_blank">
                                            {{ "seal_img.jpg" | static_url | img_tag(" ",{class: 'col-xs-4 col-sm-12 col-md-8 col-lg-8 p-none'})}}
                                        </a>
                                    {% else %}
                                        {{ "seal_img.jpg" | static_url | img_tag(" ",{class: 'col-xs-4 col-sm-12 col-md-8 col-lg-8 p-none m-half-top'})}}
                                    {% endif %}
                                </div>
                            {% endif %}
                            {% if settings.custom_seal_code %}
                                <div class="custom-seal custom-seal-code container-fluid m-half-top">
                                    {{ settings.custom_seal_code | raw }}
                                </div>
                            {% endif %}
                        </div>
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