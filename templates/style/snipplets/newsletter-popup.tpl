<!-- Modal -->
<div class="modal fade" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="row">
            <div class='{% if "newsletter_image.jpg" | has_custom_image %}col-md-6{% else %}col-md-12{% endif %}'>
                {% if template == 'home' %}
                    <div id="logo-news" class="img logo-news">
                        {% if has_logo %}
                          {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        {% else %}
                           <div id="logo-news"> <a id="no-logo-news" href="{{ store.url }}">{{ store.name }}</a></div>
                        {% endif %}
                    </div>
                {% endif %}
                {% if settings.news_popup_txt %}
                    <p class="newsletter">{{ settings.news_popup_txt }}</p>
                {% else %}
                    <p class="newsletter">{{ '¿Te gusta lo que ves? ¡Suscribite y recibí todas nuestras novedades!'  | translate }}</p>
                {% endif %}
                <div class="col-md-12">
                    <div id="newsletter-popup">
                        <form method="post" action="/winnie-pooh">
                            <div class="form-group">
                                <input type="text" class="form-control" name="name" onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}' />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email">
                            </div>
                            <div class="form-group winnie-pooh">
                                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                            </div>
                            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                            <input type="hidden" name="type" value="newsletter-popup" />
                            <input type="submit" name="contact" class="general-button center-block" value='{{ "Inscribirse" | translate }}' />
                        </form>
                        <div style='display: none;' class="loading-modal"><i class="fa fa-circle-o-notch fa-spin"></i> {{ "Enviando suscripción..." | translate }}</div>
                        <div style='display: none;' class="contact-ok">{{ "Se inscribió al newsletter correctamente" | translate }}</div>
                        <div style='display: none;' class="contact-error">{{ "Ingrese su Email" | translate }}</div>
                    </div>
                </div>
            </div>
            {% if "newsletter_image.jpg" | has_custom_image %}
                <div id="img-news" class="col-md-6 ">
                    {{ "newsletter_image.jpg" | static_url | img_tag }}
                </div>
            {% endif %}
        </div>
      </div>
    </div>
  </div>
</div>
