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
        <input type="text" class="span2" onfocus="if (this.value == '{{ "Tu E-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu E-mail" | translate }}';}" value='{{ "Tu E-mail" | translate }}' name="email" >
        <div class="winnie-pooh">
            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
        </div>
        <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
        <input type="hidden" name="type" value="newsletter" />
        <input type="submit" name="contact" class="btn" value='{{ "Enviar" | translate }}'>
        </div>
    </form>
</div>