<div class="banner contact-banner container m-top m-bottom">
    {% if settings.banner_contact_url != '' %}
        {{ "banner-contact.jpg" | static_url | img_tag | a_tag(settings.banner_contact_url) }}
    {% else %}
        {{ "banner-contact.jpg" | static_url | img_tag }}
    {% endif %}
</div>