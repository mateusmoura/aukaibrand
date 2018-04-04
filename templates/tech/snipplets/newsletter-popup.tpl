<!-- Modal -->
<div class="modal fade" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="modal-news-dialog" class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
         <div class="row">
            <div class='col-xs-11 {% if "newsletter_image.jpg" | has_custom_image %}col-md-7{% else %}col-md-12{% endif %}'>
                {% if template == 'home' %}
                    <div class="img logo news">
                        {% if has_logo %}
                          {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        {% else %}
                            <div class="no-logo-news">
                                <a id="logo" href="{{ store.url }}">{{ store.name }}</a>
                            </div>
                        {% endif %}
                    </div>
                {% endif %}
                {% if settings.news_popup_txt %}
                    <p class="newsletter">{{ settings.news_popup_txt }}</p>
                {% else %}
                    <p class="newsletter">{{ '¿Te gusta lo que ves? ¡Suscribite y recibí todas nuestras novedades!'  | translate }}</p>
                {% endif %}
                <div class="col-xs-12 col-md-12">
                   <div id="newsletter-popup">
                        <form method="post" action="/winnie-pooh">
                            <div class="input-append">
                                <input type="text"  onfocus="if (this.value == '{{ "Tu Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Tu Nombre" | translate }}' name="name" >
                                <input type="text"  onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" >
                                <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                                <input type="hidden" name="type" value="newsletter-popup" />
                                <input type="submit" name="contact" value="{{ 'Enviar' | translate }}" class="send">
                            </div>
                        </form>
                        <div style='display: none;' class="loading-modal"><i class="fa fa-cog fa-spin loading-modal"></i>{{ "Enviando..." | translate }}</div>
                        <div style='display: none;' class="contact-ok alert alert-success clear">{{ "Se inscribió al newsletter correctamente." | translate }}</div>
                        <div style='display: none;' class="contact-error alert alert-danger clear">{{ "Ingresa tu email" | translate }}</div>
                    </div>
                </div>
            </div>
            {% if "newsletter_image.jpg" | has_custom_image %}
             <div id="img-news" class="col-md-5">
                {{ "newsletter_image.jpg" | static_url | img_tag }}
             </div>
            {% endif %}
        </div>
      </div>
    </div>
  </div>
</div>