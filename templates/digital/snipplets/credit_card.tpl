{% if settings.payments %}
    <h4>{{ "Formas de pagamento" | translate }}</h4>
    {% for payment in settings.payments %}
        {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
    {% endfor %}
{% endif %}