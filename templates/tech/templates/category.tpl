{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% paginate by 16 %}
{% if not show_help %}
<div class="container prod_detail" style="padding-bottom:0;">
    <!-- -->
    <div class="path">
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div class="clear"></div>
    <div class="titles">
        <h1>{{ category.name }}</h1>
    </div>
</div>
<!-- banner -->
{% if "banner-products.jpg" | has_custom_image %}
    <div class="container bannerhome">
        {% if settings.banner_products_url != '' %}
            {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
        {% else %}
            {{ "banner-products.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
{% endif %}
<!-- banner-->
{% if settings.banner_services_category %}
    {% include 'snipplets/banner-services.tpl' %}
{% endif %}

<div class="container">
<div class="row">
{% if show_sidebar %}
    {% snipplet 'sidebar.tpl' %}
{% endif %}
    <div {% if show_sidebar %}class="col-xs-10 prods-with-side"{% else %}class="col-xs-12"{% endif %} >
    {% if products %}
        <div class="sort-by-container">
            {% snipplet 'sort_by.tpl' %}
        </div>
        <div class="product-table category-table">
            {% snipplet "product_grid.tpl" %}
        </div>
        {% if settings.infinite_scrolling and not pages.is_last %}
            <div class="col-md-12 col-xs-12 loadMoreContainer">
                <a id="loadMoreBtn" class="button secondary m-center {% if not settings.banner_services_home %}m-top m-double-bottom{% endif %}"><i class="fa fa-cog fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                 <div id="no-more-products"><p>No quedan mas productos para mostrar</p></div>
            </div>
        {% endif %}
        <div class="crumbPaginationContainer bottom">
            {% snipplet "pagination.tpl" %}
        </div>
    {% else %}
        <div align="center" style="padding:51px;">
            {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
        </div>
    {% endif %}
    </div>
{% elseif show_help %}
    {% snipplet 'defaults/show_help_category.tpl' %}
{% endif %}
</div> <!-- /row -->
</div> <!-- /container -->
