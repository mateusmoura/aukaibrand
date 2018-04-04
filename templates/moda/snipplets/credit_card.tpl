{% if (settings.visa or settings.mastercard or settings.americanexpress or settings.dinners or settings.aura or settings.elo or settings.itau or settings.bradesco or settings.bancodobrasil ) %}
    <h4>{{ "Formas de pagamento" | translate }}</h4>
    {% if settings.visa %}
        <img src="{{ "/images/visa.jpg" | static_url }}"  width="37" height="24" alt="Visa" title="Visa" />
    {% endif %}
    {% if settings.mastercard %}
        <img src="{{ "/images/mastercard.jpg" | static_url }}"  width="37" height="24" alt="Mastercard" title="Mastercard" />
    {% endif %}
    {% if settings.americanexpress %}
        <img src="{{ "/images/americanexpress.jpg" | static_url }}"  width="37" height="24" alt="American Express" title="American Express" />
    {% endif %}
    {% if settings.dinners %}
        <img src="{{ "/images/dinners.jpg" | static_url }}"  width="37" height="24" alt="Dinners" title="Dinners" />
    {% endif %}
    {% if settings.aura %}
        <img src="{{ "/images/aura.jpg" | static_url }}"  width="37" height="24" alt="Aura" title="Aura" />
    {% endif %}
    {% if settings.elo %}
        <img src="{{ "/images/elo.jpg" | static_url }}"  width="37" height="24" alt="Elo" title="Elo" />
    {% endif %}
    {% if settings.itau %}
        <img src="{{ "/images/itau.jpg" | static_url }}"  width="37" height="24" alt="Itaú" title="Itaú" />
    {% endif %}
    {% if settings.bradesco %}
        <img src="{{ "/images/bradesco.jpg" | static_url }}"  width="37" height="24" alt="Bradesco" title="Bradesco" />
    {% endif %}
    {% if settings.bancodobrasil %}
        <img src="{{ "/images/bancodobrasil.jpg" | static_url }}"  width="37" height="24" alt="Banco do Brasil" title="Banco do Brasil" />
    {% endif %}
{% endif %}