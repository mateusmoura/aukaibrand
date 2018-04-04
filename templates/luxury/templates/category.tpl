{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% paginate by 16 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% if settings.category_banner_top %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %} 
<div class="row-fluid" id="category-page">
	<div class="container">        
        {% if products %}
        <div class="headerBox-List">
            <div class="span8">
                <h1>{{ category.name }}</h1>
            </div>
            <div class="span4 breadcrumbs-wrapper">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        {% endif %}

        {% if "banner-products.jpg" | has_custom_image %}
            <div class="banner">
                {% if settings.banner_products_url != '' %}
                    {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
                {% else %}
                    {{ "banner-products.jpg" | static_url | img_tag }}
                {% endif %}
            </div>
        {% endif %}
        {% if settings.banner_services_category %} 
            {% include 'snipplets/banner-services.tpl' %}
        {% endif %}
        {% if not show_help %}

        <div class="row-fluid">
            {% if show_sidebar %}
                {% snipplet 'sidebar.tpl' %}
            {% endif %}
            <div {% if show_sidebar %}class="span10"{% else %}class="span12"{% endif %} >

                {% if products %}
                    <div class="sort-bar">
                    {% snipplet 'sort_by.tpl' %}
                    </div>
                    <div class="product-table">
                        {% snipplet "product_grid.tpl" %}
                    </div>
                    {% if settings.infinite_scrolling and not pages.is_last and products%}
                        <div class="load-more-container">
                            <a id="loadMoreBtn" class="button secondary clear"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                         </div>
                    {% endif %}
                    <div class="crumbPaginationContainer bottom">
                        <div class='pagination'>
                            {% snipplet "pagination.tpl" %}
                        </div>
                    </div>
                {% else %}
                    <div class="filters-msg">
                        {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
                    </div>
                {% endif %}
            </div>
        </div>

            
	
        {% elseif show_help %}
            {% snipplet 'defaults/show_help_category.tpl' %}
        {% endif %}

    </div>
</div>
{% if settings.category_banner_bottom %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %} 
