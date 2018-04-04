{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% paginate by 8 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% if not show_help %}

{% if "banner-products.jpg" | has_custom_image %}
<div class="banner">
	<div class="banner-shadow"></div>
	{% if settings.banner_products_url != '' %}
		{{ "banner-products.jpg" | static_url | img_tag(category.name) | a_tag(settings.banner_products_url) }}
	{% else %}
		{{ "banner-products.jpg" | static_url | img_tag(category.name) }}
	{% endif %}
</div>
{% endif %}

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ category.name }}</h1></legend></fieldset>
			</div>
		</div>
	</div>
	{% snipplet "breadcrumbs.tpl" %}
	<div class="container centered">
        {% snipplet 'sort_by.tpl' %}
    </div>   
	<div class="row">
		<div class="banner-services-category">
			{% if settings.banner_services_category %} 
				{% include 'snipplets/banner-services.tpl' %}
			{% endif %} 
		</div>
			{% if show_sidebar %} 
	            {% snipplet 'sidebar.tpl' %}
	        {% endif %} 
	        <div {% if show_sidebar %}class="col-md-10"{% else %}class="col-md-12"{% endif %}>
	        {% if products %}
				<section id="grid" class="product-grid grid">
				{% include 'snipplets/product_grid.tpl' %}
				</section>
				 {% if settings.infinite_scrolling and not pages.is_last and products %}
			        <div class="loadMoreContainer centered">
			            <a id="loadMoreBtn" class="general-button"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
			        </div>
			    {% endif %}
				<div class="crumbPaginationContainer bottom">
					<div class='pagination'>
						{% snipplet "pagination.tpl" %}
					</div>
				</div>
			{% else %}
		        <div class="filters-msg">
		            <h3>{{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}</h3>
		        </div>
		    {% endif %}
	        </div>
        {% elseif show_help %}
            {% snipplet 'defaults/show_help_category.tpl' %}
        {% endif %}
	</div>
</div>
