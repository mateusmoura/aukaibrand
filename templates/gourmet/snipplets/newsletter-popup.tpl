<!-- Modal -->
<div class="modal fade" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="news" class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body news">
        <button type="button" class="close news" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="row">
            <div class='col-xs-11 {% if "newsletter_image.jpg" | has_custom_image %}col-md-7{% else %}col-md-12{% endif %}'>
                {% if template == 'home' %}
                    <div class="img logo news {% if not has_logo %}no-logo-container{% endif %}">
                        {% if has_logo %}
                          {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        {% else %}
                          <a id="logo news" class="no-logo" href="{{ store.url }}">{{ store.name }}</a>
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
                            <div class="form-group news-modal">
                                <input type="text" name="name" class="form-control" placeholder="{{ "Nombre" | translate }}">
                            </div>
                            <div class="form-group news-modal">
                                <input type="email" class="form-control" name="email" placeholder="{{ "Tu E-mail" | translate }}">
                            </div>
                            <div class="form-group hide">
                                <input id="winnie-pooh" type="text" name="winnie-pooh" placeholder="{{ "No completar este campo" | translate }}"/>
                            </div>
                            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}">
                            <input type="hidden" name="type" value="newsletter-popup">
                            <input type="submit" class="boton news-modal" name="contact" value="{{ "Suscribir" | translate }}">
                        </form>
                        <div style='display: none;' class="loading-modal"><i class="fa fa-circle-o-notch fa-spin"></i> {{ "Enviando suscripción..." | translate }}</div>
                        <div style='display: none;' class="contact-ok alert alert-success">
                            <i class="fa fa-check-circle" style="margin-right:10px;"></i>{{ "Te has inscripto al newsletter correctamente" | translate }}
                        </div>
                        <div style='display: none;' class="contact-error alert alert-danger">
                            <i class="fa fa-exclamation-triangle"style="margin-right:10px;"></i>{{ "Ingresa tu email" | translate }}
                        </div>
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