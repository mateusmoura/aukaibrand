{% if (settings.correios or settings.ups or settings.dhl)%}
    <h4>{{ "Formas de envío" | translate }}</h4>
    {% if settings.correios %}
    <img src="{{ "/images/correios.png" | static_url }}"  width="110" height="24" alt="Correios" title="Correios" />
    {% endif %}
    {% if settings.ups %}
    <img src="{{ "/images/ups.png" | static_url }}"  width="24" height="24" alt="UPS" title="UPS" />
    {% endif %}
    {% if settings.dhl %}
    <img src="{{ "/images/dhl.png" | static_url }}"  width="95" height="22" alt="DHL" title="DHL" />
    {% endif %}
{% endif %}