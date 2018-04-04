{% set banner_contact %}
    {% if settings.banner_contact_description or "banner-contact.jpg" | has_custom_image %}
    <div id="cabezal_interior">
        {% if "banner-contact.jpg" | has_custom_image %}
            {{ 'banner-contact.jpg' | static_url | img_tag }}
        {% endif %}
         <h3 class="banner-copy banner-contact container {% if settings.banner_contact_align == "aligncontact_left" %}text-left {% elseif settings.banner_contact_align == "aligncontact_right" %}text-right
            {% else %}text-center{% endif %}">
                {% if settings.banner_contact_description %}
                    {{ settings.banner_contact_description }}
                {% else %}
                    
                {% endif %}
        </h3>
    </div>
    {% endif %}
{% endset %}
{% if settings.banner_contact_url %}
    <a href="{{ settings.banner_contact_url | raw  }}">{{ banner_contact }}</a>
{% else %}
    {{ banner_contact }}
{% endif %}
