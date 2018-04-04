<div id="newsletter">
    {% if contact and contact.type == 'newsletter' %}
        {% if contact.success %}
            <div class="contact-ok alert alert-success">{{ "Se inscribió al newsletter correctamente." | translate }}</div>
        {% else %}
            <div class="contact-error alert alert-danger">{{ "Ingresa tu email" | translate }}</div>
        {% endif %}
    {% endif %}
    <form method="post" action="/winnie-pooh-newsletter" onsubmit="$(this).attr('action', '');">
        <div class="input-append">
        <input type="text" class="name" name="name" onfocus="if (this.value == '{{ "Nombre" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Nombre" | translate }}';}" value='{{ "Nombre" | translate }}' />
        <input type="text" class="email" onfocus="if (this.value == '{{ "Tu Email" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Tu Email" | translate }}';}" value='{{ "Tu Email" | translate }}' name="email" requiered>
        <div class="winnie-pooh">
            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh-newsletter"/>
        </div>
        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
        <input type="hidden" name="type" value="newsletter" />
        <input type="submit" name="contact" class="btn" value='>' />
        </div>
    </form>
</div>