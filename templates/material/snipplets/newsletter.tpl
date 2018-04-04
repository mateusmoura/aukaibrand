<div id="newsletter">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 m-half-top text-center-xs">

            <h4>{{ settings.news_message }}</h4>
            {% if contact and contact.type == 'newsletter' %}
                {% if contact.success %}
                    <div id="footer-newsletter-success" class="contact-ok alert alert-success text-center-xs"><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE86C;</i><p>{{ "Se inscribió al newsletter correctamente." | translate }}</p></div>
                {% endif %}
            {% endif %}

            {% set newsletter_contact_error = contact and contact.type == 'newsletter' and not contact.success %}
            <form method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');">
                <div class="row">
                     <div class="form-container col-xs-12 col-sm-12 col-md-8 col-lg-8 m-half-bottom">
                        <input type="text" class="form-control form-control-big" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email">
                        <div class="winnie-pooh d-none">
                            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                        </div>
                        <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
                        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                        <input type="hidden" name="type" value="newsletter" />
                        {% if newsletter_contact_error %}
                            <div id="footer-newsletter-failed" class="contact-error alert alert-danger text-center-xs m-half-top"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ "Ingresa tu email" | translate }}</p></div>
                        {% endif %}
                    </div>
                    <div class="submit-container col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <input type="submit" class="btn btn-info btn-block" name="contact" value='{{ "Enviar" | translate }}'>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>