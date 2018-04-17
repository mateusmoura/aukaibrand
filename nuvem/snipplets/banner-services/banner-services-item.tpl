<div class="service-item-container col-xs-12 col-sm-{{ 12 / num_banners_services }} has-{{ num_banners_services }}-banner{% if num_banners_services > 1 %}s{% endif %}">
    <div class="js-service-item service-item {% if num_banners_services == 1 %} p-bottom-half-xs {% endif %}">
        <span class="service-icon svg-text-fill">
            {% if banner == 'banner_services_01' %}
                {% include "snipplets/svg/truck.tpl" %}
            {% elseif banner == 'banner_services_02' %}
                {% include "snipplets/svg/credit-card.tpl" %}
            {% else %}
                {% include "snipplets/svg/lock.tpl" %}
            {% endif %}
        </span>
        <h5 class="service-title">{{ banner_services_title }}</h5>
        <p class="service-text">{{ banner_services_description }}</p>
    </div>
</div>
