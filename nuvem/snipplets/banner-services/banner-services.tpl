{# Desktop Banner Services #}
{% macro for_each_banner_include(template) %}
    {% set num_banners_services = 0 %}
    {% set available_banners = []%}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03'] %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
            {% set num_banners_services = num_banners_services + 1 %}
            {% set available_banners = available_banners | merge([banner]) %}
        {% endif %}
    {% endfor %}
    {% for banner in available_banners %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% include template %}
    {% endfor %}
{% endmacro %}
{% import _self as banner_services %}
<div class="hidden-xs container services {% if footer %} border-top {% endif %}">
    {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item.tpl') }}
</div>
{# Mobile Banner Services #}
<div class="visible-xs js-mobile-services-container clear-both {% if footer %} border-top p-top-half m-top {% endif %}">
    {% snipplet 'placeholders/banner-services-placeholder.tpl' %}
    <div class="js-mobile-services services" style="visibility:hidden; height:0;">
        {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item.tpl') }}
    </div>
</div>
