{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% paginate by 12 %}

{% if "banner-products.jpg" | has_custom_image %}
    {% set banner_products %}
    <div class="banner-innerpage-content category-banner" id="banner-innerpage">
        <div class="banner-innerpage-cover"></div>
        {% if settings.banner_products_description %}
            <div class="container text-banner">
                <div class="row inside">
                    <div class="col-xs-12">
                        <h2 class="banner-copy {% if settings.banner_products_align == "aligncategory_left" %}text-left
                        {% elseif settings.banner_products_align == "aligncategory_right" %}text-right
                        {% else %}text-center{% endif %}">
                            {{ settings.banner_products_description }}
                        </h2>
                    </div>
                </div>
            </div>
        {% endif %}
    </div>
    {% endset %}
    {% if settings.banner_products_url %}
        <a class="banner-innerpage-link" href="{{ settings.banner_products_url | raw }}">{{ banner_products }}</a>
    {% else %}
        {{ banner_products }}
    {% endif %}
{% endif %}
<div class="container products-list page">
    <div class="products-header">
        <div class="breadcrumbs-wrapper">{% snipplet "breadcrumbs.tpl" %}</div>
        <div class="title"><h1>{{ category.name }}</h1></div>
    </div>
    <div class="row">
        {% if show_sidebar %} 
            {% snipplet 'sidebar.tpl' %}
        {% endif %} 
        <div {% if show_sidebar %}class="col-md-10 products-wfilters"{% else %}class="col-md-12"{% endif %}>
            <div>
            {% snipplet 'sort_by.tpl' %}
            </div>
            {% if settings.banner_services_category %} 
            {% include 'snipplets/banner-services.tpl' %}
            {% endif %} 
            {% if products %}
                <div class="product-table row-fluid">
                    {% snipplet "product_grid.tpl" %}
                </div>
            {% if settings.infinite_scrolling and not pages.is_last %}
                <div class="loadMoreContainer">
                    <a id="loadMoreBtn" class="btn btn-primary btn-lg"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                </div>
            {% endif %}
            {% snipplet "pagination.tpl" %}  
            {% else %}
                <div class="filters-msg">
                    {{ (has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate }}
                </div>
            {% endif %}
        </div>
    </div>    
</div> <!-- container -->