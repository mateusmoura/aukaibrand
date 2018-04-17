{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
{% paginate by 16 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% if not show_help %}

{% if "banner-products.jpg" | has_custom_image %}
<div class="banner-container">
	<div class="top-shadow"></div>
	{% if settings.banner_products_url != '' %}
		{{ "banner-products.jpg" | static_url | img_tag(category.name, {class: 'banner-image'}) | a_tag(settings.banner_products_url) }}
	{% else %}
		{{ "banner-products.jpg" | static_url | img_tag(category.name, {class: 'banner-image'}) }}
	{% endif %}
</div>
{% endif %}

<div class="container">
	<div class="banner-services-category hidden-xs">
		{% if settings.banner_services_category %} 
			{% include 'snipplets/banner-services/banner-services.tpl' %}
		{% endif %} 
	</div>
	<div class="title-container">
	    {% snipplet "breadcrumbs.tpl" %}
   		<h1 class="title">{{ category.name }}</h1>
    </div>
	<div class="row m-bottom">
		<div class="col-xs-8 col-sm-7 text-right text-left-xs sort-by-container">
	      {% snipplet 'sort_by.tpl' %}
	    </div>
		{% if has_filters %}
		<a href="#" class="js-toggle-mobile-filters visible-xs col-xs-4 m-top p-top-half text-right btn-link-secondary">
			<span>{{ 'Filtrar' | translate }}</span>
			<i class="fa fa-caret-right fa-lg" aria-hidden="true"></i>
		</a>
	    {% endif %}  
	</div>
	<div class="row">
			{% if show_sidebar %} 
	            {% snipplet 'sidebar.tpl' %}
	        {% endif %} 
	        <div {% if show_sidebar %}class="col-sm-10 text-center-xs"{% else %}class="col-sm-12 text-center-xs"{% endif %}>
        	{% if show_filter_error %}
                <div class="text-center m-top m-bottom">
                    <h4 class="text-uppercase">{{ "No tenemos productos para mostrarte :(" | translate }}</h4>
                    <h5>{{ "Quizás encuentres lo que buscabas en los productos debajo." | translate }}</h5>
                </div>
            {% endif %}   
	        {% if products %}
				<section class="js-product-table js-masonry-grid product-grid">
					<div class="js-masonry-grid">
						{% include 'snipplets/product_grid.tpl' %}
					</div>
				</section>
			    {% if settings.infinite_scrolling and not pages.is_last and products%}
				    <div class="load-more-container clear-both m-bottom text-center">
				        <a class="js-load-more-btn btn btn-secondary m-top m-bottom full-width-xs">
				        	{{ 'Mostrar más productos' | t }}
				        	<i class="js-load-more-spinner btn-spinner fa fa-circle-o-notch fa-spin" style="display:none;"></i>
				        </a>
				    </div>
				{% endif %}
				<div class="visible-when-content-ready" {% if settings.infinite_scrolling %}style="display:none;"{% endif %}>
					{% snipplet "pagination.tpl" %}
				</div>
			{% else %}
		        <div class="filters-msg">
		            <h4>{{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}</h4>
		        </div>
		    {% endif %}
	        </div>
        {% elseif show_help %}
            {% snipplet 'defaults/show_help_category.tpl' %}
        {% endif %}
	</div>
</div>
{% if has_filters %}
    {% snipplet 'mobile-filters.tpl' %}
{% endif %}
