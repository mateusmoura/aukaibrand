{% paginate by 9 %}
<div id="content" class="listado">
	{% snipplet "breadcrumbs.tpl" %}

    {% if "banner-products.jpg" | has_custom_image %}
        <div class="banner">
            {% if settings.banner_products_url != '' %}
                {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
            {% else %}
                {{ "banner-products.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    {% endif %}

    <div class="container center">
            {% snipplet 'sort_by.tpl' %}
        </div>
    {% if settings.banner_services_category %} 
        {% include 'snipplets/banner-services.tpl' %}
    {% endif %} 
	{% if products %}
        <div class="product-grid">
		    {% snipplet "product_grid.tpl" %}
        </div>
        {% if settings.infinite_scrolling and not pages.is_last %}
            <div class="loadMoreContainer"><a id="loadMoreBtn" class="loadMoreBtn"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a></div>
        {% endif %}
	{% endif %}
	
	<div class="clear"></div>
	
	<div id="pages">
		{% snipplet "pagination.tpl" %}
		<div class="clear"></div>
	</div>
	
</div><!--content-->