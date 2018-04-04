<div class="col-md-4 col-lg-4 col-xs-12 newsletter">
     <h3>{{ "Newsletter" | translate }}</h3>
    <div id="newsletter">
        {% if contact and contact.type == 'newsletter' %}
            {% if contact.success %}
                <div class="contact-ok">{{ "Se inscribió al newsletter correctamente." | translate }}</div>
            {% else %}
                <div class="contact-error">{{ "Ingresa tu email" | translate }}</div>
            {% endif %}
        {% endif %}
        <form method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');">
            <div class="input-append">
                <input type="text"  onfocus="if (this.value == '{{ "Tu Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Tu Nombre" | translate }}' name="name" >
                <input type="text"  onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" >
                <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                <input type="hidden" name="type" value="newsletter" />
                <input type="submit" name="contact" value="{{ 'Enviar' | translate }}" class="send">
            </div>
        </form>
    </div>
</div>
