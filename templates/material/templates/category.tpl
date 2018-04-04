{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% paginate by 12 %}
{% set show_help = not has_products %}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{% if show_help %}
    {% include 'snipplets/defaults/show_help_category.tpl' %}
{% else %}
    {% snipplet "product-grid/mobile-categories.tpl" %}
    <div class="container">
        {% snipplet "page-header.tpl" with page_header_title = category.name %}
        <div class="row">
            {% snipplet 'sort-by.tpl' %}
            {% if show_sidebar %}
                {% snipplet 'product-grid/sidebar.tpl' %}
            {% endif %}
            {# ** the following if rule adds a full width class in case there is no sidebar that contains properties to filter or categories ** #}
            <div class="col-xs-12 col-sm-10 {% if show_sidebar %}col-lg-10 col-md-10 p-none{% else %}col-lg-12 col-md-12{% endif %} p-none-xs">
                {% if products %}
                    <div class="product-grid-container masonry-grid">
                        {% snipplet "product_grid.tpl" %}
                    </div>
                    {% snipplet "product-grid/pagination.tpl" %}
                {% else %}
                    {#  No products message  #}
                    <div class="container-fluid">
                        <div class="alert alert-info text-center-xs">
                            {% set no_products_message = has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente" %}
                            <i class="material-icons d-inline pull-left m-half-right m-none-xs m-half-bottom-xs">&#xE88E;</i>
                            <p>{{no_products_message | translate}}</p>
                        </div>           
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
{% endif %} 

{#  **** Banners ****  #}

{% if "banner-products.jpg" | has_custom_image %}
    {% include 'snipplets/banners/banner-categories.tpl' %}  
{% endif %}