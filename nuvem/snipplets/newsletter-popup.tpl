<div id="newsModal" class="modal hide fade newsmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  <div class="modal-body">
    <button type="button" class="close news" data-dismiss="modal" aria-hidden="true">×</button>
        <div class="row-fluid">
            <div class='{% if "newsletter_image.jpg" | has_custom_image %}span7{% else %}span12{% endif %}'>
                {% if template == 'home' %}
                    {% if has_logo %}
                        <div class="img logo">
                            {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        </div>
                    {% else %}
                        <div id="no-logo-wrapper">
                            <div class="logo text-only">
                                <a href="{{ store.url }}">{{ store.name }}</a>
                            </div>
                        </div>
                    {% endif %}
                {% endif %}
                {% if settings.news_popup_txt %}
                    <p class="newsletter">{{ settings.news_popup_txt }}</p>
                {% else %}
                    <p class="newsletter">{{ '¿Te gusta lo que ves? ¡Suscribite y recibí todas nuestras novedades!'  | translate }}</p>
                {% endif %}
                <div id="newsletter-popup">
                    <form method="post" action="/winnie-pooh">
                        <div class="input-append">
                            <input type="text" name="name" placeholder="{{ "Nombre" | translate }}" />
                            <input type="email" class="email" name="email" placeholder="{{ "Email" | translate }}" />
                            <div class="winnie-pooh">
                                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                            </div>
                            <input type="hidden" name="message" value='{{ "Pedido de inscripción a newsletter" | translate }}' />
                            <input type="hidden" name="type" value="newsletter-popup" />
                            <input type="submit" name="contact" class="btn" value='{{ 'enviar' | translate }}' />
                        </div>
                    </form>
                     <div style='display: none;' class="loading-modal"><i class="fa fa-circle-o-notch fa-spin"></i> {{ "Enviando..." | translate }}</div>
                    <div style='display: none;' class="alert alert-success">{{ "Se inscribió al newsletter correctamente." | translate }}</div>
                    <div style='display: none;' class="alert alert-error" role='alert'>{{ "Ingresa tu email" | translate }}</div>
                </div>
            </div>
             {% if "newsletter_image.jpg" | has_custom_image %}
                <div class="span5 img-news">
                    {{ "newsletter_image.jpg" | static_url | img_tag }}
                </div>
            {% endif %}
        </div>  
    </div>
</div>