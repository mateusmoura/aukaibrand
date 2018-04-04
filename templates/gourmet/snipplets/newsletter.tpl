<div class="widget-header">
    <h2>{{ settings.news_footer_title_text }}</h2>
</div>
<div class="widget-divider"></div>
<div class="widget-content">
    <p>{{ settings.news_footer_pitch_text }}</p>
    {% if contact %}
        {% if contact.success %}
            <div class="contact-ok alert alert-success">
                <i class="fa fa-check-circle" style="margin-right:10px;"></i>{{ "Te has inscripto al newsletter correctamente" | translate }}
            </div>
        {% else %}
            <div class="contact-error alert alert-danger">
                <i class="fa fa-exclamation-triangle"style="margin-right:10px;"></i>{{ "Ingresa tu email" | translate }}
            </div>
        {% endif %}
    {% endif %}

    <form role="form" method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');"
          class="newsletter">
        <div class="form-group">
            <input type="text" name="name" class="form-control" placeholder="{{ "Nombre" | translate }}">
        </div>
        <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="{{ "Tu E-mail" | translate }}">
        </div>
        <div class="form-group hide">
            <input id="winnie-pooh" type="text" name="winnie-pooh" placeholder="{{ "No completar este campo" | translate }}"/>
        </div>
        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}">
        <input type="hidden" name="type" value="newsletter">
        <input type="submit" class="boton" name="contact" value="{{ "Suscribir" | translate }}">
    </form>
</div>