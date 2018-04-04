{% snipplet "sidebar.tpl" %}
{% paginate by 12 %}
<div id="content" class="single">
    <h1 class="title">{{ category.name }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    {% if "banner-seccion.jpg" | has_custom_image %}
        <div class="banner">
            {% if settings.banner_seccion_url != '' %}
                {{ "banner-seccion.jpg" | static_url | img_tag | a_tag(settings.banner_seccion_url) }}
            {% else %}
                {{ "banner-seccion.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    {% endif %}
    {% if products %}
    {% snipplet 'sort_by.tpl' %}
    {% if settings.banner_services_category %} 
        {% include 'snipplets/banner-services.tpl' %}
    {% endif %} 
        <div class="product-table">{% snipplet "product_grid.tpl" %}</div>
    {% endif %}
    <div class="clear"></div>
    {% if settings.infinite_scrolling and not pages.is_last %}
    <div class="text-center">
        <a id="loadMoreBtn" class="button secondary"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar mais produtos' | t }}</a>
    </div>
    {% endif %}
    <div id="pages">
        <div class="crumbPaginationContainer">
            {% snipplet "pagination.tpl" %}
        </div>
        <div class="clear"></div>
    </div>
</div>
<!--content-->