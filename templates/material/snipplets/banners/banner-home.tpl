<div class="banner home-banner container m-bottom">
    {% if settings.banner_home_url != '' %}
        {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
    {% else %}
        {{ "banner-home.jpg" | static_url | img_tag }}
    {% endif %}
</div>