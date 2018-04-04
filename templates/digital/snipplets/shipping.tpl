{% if settings.shipping %}
    <h4>{{ "Formas de envio" | translate }}</h4>
    {% for shipping in settings.shipping %}
        {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
    {% endfor %}
{% endif %}