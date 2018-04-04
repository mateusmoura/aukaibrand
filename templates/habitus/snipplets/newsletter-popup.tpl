<div class="modal fade" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog news" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="row">
            <div class='{% if "newsletter_image.jpg" | has_custom_image %}col-md-6{% else %}col-md-12{% endif %}'>
                {% if template == 'home' %}
                    <div class="img logo news">
                        {% if has_logo %}
                          {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        {% else %}
                            <div id="logo news">
                                <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                            </div>
                        {% endif %}
                    </div>
                {% endif %}
                {% if settings.news_popup_txt %}
                    <p class="newsletter">{{ settings.news_popup_txt }}</p>
                {% else %}
                    <p class="newsletter">{{ '¿Te gusta lo que ves? ¡Suscribite y recibí todas nuestras novedades!'  | translate }}</p>
                {% endif %}
                <div class="col-md-12">
                    <div class="widget-content newsletter-content">
                        <div id="newsletter-popup">
                            <form role="form" method="post" action="/winnie-pooh" class="newsletter">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" placeholder="{{ "Nombre" | translate }}">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" placeholder="{{ "Tu E-mail" | translate }}">
                                </div>
                                <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}">
                                <input type="hidden" name="type" value="newsletter-popup">
                                <input type="submit" class="btn btn-primary newsbtn" name="contact" value="{{ "Suscribir" | translate }}">
                            </form>
                            <div style='display: none;' class="loading-modal"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i></i> {{ "Enviando suscripción..." | translate }}</div>
                            <div style='display: none;' class="contact-ok alert alert-success">
                                <i class="fa fa-check-circle" style="margin-right:10px;"></i>{{ "Te has inscripto al newsletter correctamente" | translate }}
                            </div>
                            <div style='display: none;' class="contact-error alert alert-danger">
                                <i class="fa fa-exclamation-triangle"style="margin-right:10px;"></i>{{ "Ingresa tu email" | translate }}
                            </div>
                        </div>
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