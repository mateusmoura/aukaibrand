{% snipplet "sidebar.tpl" %}

{% paginate by 9 %}
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
    
    {% snipplet 'sort_by.tpl' %}
    {% if settings.banner_services_category %} 
        {% include 'snipplets/banner-services.tpl' %}
    {% endif %} 
	{% if products %}
        <div class="listado">
            {% snipplet "product_grid.tpl" %}
        </div>
        {% if settings.infinite_scrolling and not pages.is_last %}
        <div class="loadMoreContainer">
            <a id="loadMoreBtn" class="loadBtn">{{ 'Mostrar mais produtos' | t }}</a>
        </div>
        {% endif %}
    {% endif %}
	<div class="clear"></div>
	
	<div id="pages">
		{% snipplet "pagination.tpl" %}
		<div class="clear"></div>
	</div>
	
</div><!--content-->