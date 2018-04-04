{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% paginate by 12 %}
{% snipplet "banner_products.tpl" %}
<div class="container">
    <div class="contenido">
        <div class="breadcrumbs">{% snipplet "breadcrumbs.tpl" %}</div>
        <h1>{{ category.name }}</h1>

        <div class="row">
            <div class="col-md-8">
            {% snipplet 'sort_by.tpl' %}
            </div>
        </div>

        {% if settings.banner_services_category %} 
            {% include 'snipplets/banner-services.tpl' %}
        {% endif %} 

        <div class="row">
            {% if show_sidebar %} 
                {% snipplet 'sidebar.tpl' %}
            {% endif %} 
            <div {% if show_sidebar %}class="col-md-10"{% else %}class="col-md-12"{% endif %} >        
                {% if products %}
                    <div class='product-table'>
                        {% snipplet "product_grid.tpl" %}
                    </div>
                    {% if settings.infinite_scrolling and not pages.is_last %}
                        <div class="loadBtnContainer"><a id="loadMoreBtn" class="button secondary"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a></div>
                    {% endif %}
                    {% snipplet "pagination.tpl" %}
                {% elseif has_filters %}
                    <div class="filters-msg">{{ "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." | translate }}</div>
                {% else %}
                    <h2>{{ "Próximamente" | translate }}</h2>
                {% endif %}
            </div>
        </div>    

    </div>
</div>