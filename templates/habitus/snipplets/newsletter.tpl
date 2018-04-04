<div class="widget-header">
    <small>{{ "Newsletter" | translate }}</small>
    <h3>{{ "Recibí todas las ofertas" | translate }}</h3>
</div>
<div class="widget-divider"></div>
<div class="widget-content newsletter-content">
    <p>{{ "¿Quieres recibir nuestras ofertas? ¡Regístrate ya mismo y comienza a disfrutarlas!" | translate }}</p>
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
        <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}">
        <input type="hidden" name="type" value="newsletter">
        <input type="submit" class="btn btn-primary" name="contact" value="{{ "Suscribir" | translate }}">
    </form>
</div>