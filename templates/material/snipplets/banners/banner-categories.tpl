<div class="banner category-banner container container m-bottom">
    {% if settings.banner_products_url != '' %}
        {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
    {% else %}
        {{ "banner-products.jpg" | static_url | img_tag }}
    {% endif %}
</div>
