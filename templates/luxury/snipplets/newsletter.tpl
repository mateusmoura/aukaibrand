<div id="newsletter">
    <form method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');">
        <div class="input-append">
            <input type="text" id="name" name="name" placeholder="{{ "Nombre" | translate }}" />
            <input type="email" class="email" name="email" placeholder="{{ "Email" | translate }}" />
            <div class="winnie-pooh">
                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
            </div>
            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
            <input type="hidden" name="type" value="newsletter" />
            <input type="submit" name="contact" class="btn" value='{{ "Enviar" | translate }}'>
        </div>
    </form>

	{% if contact and contact.type == 'newsletter' %}
        {% if contact.success %}
            <div class="alert alert-success">{{ "Se inscribió al newsletter correctamente." | translate }}</div>
        {% else %}
            <div class='alert alert-error' role='alert'>{{ "Ingresa tu email" | translate }}</div>
        {% endif %}
    {% endif %}
</div>