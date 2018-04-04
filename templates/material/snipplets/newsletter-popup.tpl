{#  **** Newsletter modal -- Uses Bootsrap Modal plugin by default ****  #}
<div id="newsModal" class="modal fade newsmodal hidden-xs hidden-sm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-body">
                <span class="btn btn-default btn-close pull-right" data-dismiss="modal" aria-label="Close">
                  <i class="material-icons">&#xE5CD;</i>
                </span>
                <div class="row clear-both">
                    <div class='newsletter-form-column m-top col-xs-12 col-sm-12  {% if "newsletter_image.jpg" | has_custom_image %}col-md-6 col-lg-6{% else %}col-md-12 col-lg-12{% endif %}'>
                        <div class="img logo{% if not has_logo %} hidden{% endif %}">
                            {{ store.logo  | img_tag(store.name,  {class: 'img-responsive col-xs-8 col-xs-offset-2 col-sm-8 col-md-8 col-lg-8 m-half-bottom'}) | a_tag(store.url)}}
                        </div>
                        <div class="m-none-top text-center {% if has_logo %} hidden{% endif %}">
                            <div id="logo">
                                <a class="text-wrap no-logo" href="{{ store.url }}">{{ store.name }}</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="container-fluid clear-both">
                            {% if settings.news_popup_txt %}
                                <p class="newsletter-custom-message text-center">{{ settings.news_popup_txt }}</p>
                            {% else %}
                                <p class="newsletter-default-message text-center">{{ '¿Te gusta lo que ves? ¡Suscribite y recibí todas nuestras novedades!'  | translate }}</p>
                            {% endif %}
                            </div>
                        </div>
                        <div id="newsletter-popup">
                            <form method="post" action="/winnie-pooh">
                                <div class="input-append">
                                    <div class="form-group">
                                        <input type="text" name="name" class="form-control" onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}'>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email">
                                    </div>
                                    <div class="winnie-pooh" style="display:none;">
                                        <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                                        <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh">
                                    </div>
                                    <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}">
                                    <input type="hidden" name="type" value="newsletter-popup">
                                    <input type="submit" name="contact" class="btn btn-info btn-block" value='{{ "Enviar" | translate }}'>
                                </div>
                            </form>
                            <div style='display: none;' class="loading-modal container-fluid clear-both text-center m-top">
                                <div class="spinner contrast">
                                    <div class="spinnerContainer active common full-height full-width">
                                        <div class="spinner-layer layer-1 common full-height full-width p-absolute">
                                            <div class="circle-clipper left common">
                                                <div class="circle common"></div>
                                            </div><div class="gap-patch common full-height"><div class="circle common"></div></div><div class="circle-clipper right common full-height"><div class="circle common full-height"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style='display: none;' class="alert alert-success contact-ok container-fluid m-top"><i class="material-icons d-inline pull-left m-half-right">&#xE86C;</i><p>{{ "Se inscribió al newsletter correctamente." | translate }}</p></div>
                            <div style='display: none;'class="alert alert-danger contact-error container-fluid m-top"><i class="material-icons d-inline pull-left m-half-right">&#xE000;</i><p>{{ "Ingresa tu email" | translate }}</p></div>
                        </div>
                    </div>
                     {% if "newsletter_image.jpg" | has_custom_image %}
                        <div class="newsletter-image-column col-xs-12 col-sm-12 col-md-6 col-lg-6 m-half-top">
                            {{ "newsletter_image.jpg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </div>
                    {% endif %}
                </div>
             </div>
        </div>
    </div>
</div>