{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% paginate by 12 %}

{% if "banner-products.jpg" | has_custom_image %}
<div class="banner">
	<div class="banner-shadow"></div>
	{% if settings.banner_products_url != '' %}
		{{ "banner-products.jpg" | static_url | img_tag(store.name) | a_tag(settings.banner_products_url) }}
	{% else %}
		{{ "banner-products.jpg" | static_url | img_tag(store.name) }}
	{% endif %}
</div>
{% endif %}
<div class="container">

	<div class="row">
		<div class="col-md-12">
			<div class="section-title bottom-0">
				<h1 class="title">{{ category.name }}</h1>
				<hr class="line" />
			</div>
		</div>
	</div>
	{% snipplet "breadcrumbs.tpl" %}

	<div class="container centered sort-by-container">
            {% snipplet 'sort_by.tpl' %}
        </div>
	 {% if settings.banner_services_category %} 
		{% include 'snipplets/banner-services.tpl' %}
	{% endif %}  

	<div class="row">
        {% if show_sidebar %} 
            {% snipplet 'sidebar.tpl' %}
        {% endif %} 
        <div {% if show_sidebar %}class="col-md-10"{% else %}class="col-md-12"{% endif %} >        
        	<div class="row">
				<!-- Si está seleccionada la opción de columna con categorías -->
				{% if products %}
					{% if settings.category_col %}
					<div class="col-sm-3">
						<div class="category-col">
							<div class="category-list">
								<h2>{{"Categorías" | translate}}</h2>
								<ul>
									{% for category in categories %}
									<li class="category-title {{ category.active ? 'selected' : '' }}"><a href="{{ category.url }}">{{ category.name }}</a></li>
										{% if category.subcategories %}
										<ul> {% for subcategory in category.subcategories %}
											<li class="subcategory-title {{ subcategory.active ? 'selected' : '' }}"><a href="{{ subcategory.url }}">{{ subcategory.name }}</a></li>
										{% endfor %}
										</ul>
										{% endif %}
									{% endfor %}
								</ul>
							</div>
						</div>
						<!-- Columna responsiva desplegable -->
						<div class="category-col accordion clearfix">
							<div class="category-list">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseContent" class="collapse-button">
									<h2>{{"Categorías" | translate}}</h2>
									<i class="fa fa-angle-down"></i>
								</a>
								<ul id="collapseContent" class="collapse">
									{% for category in categories %}
									<li class="category-title {{ category.active ? 'selected' : '' }}"><a href="{{ category.url }}">{{ category.name }}</a></li>
										{% if category.subcategories %}
										<ul> {% for subcategory in category.subcategories %}
											<li class="subcategory-title {{ subcategory.active ? 'selected' : '' }}"><a href="{{ subcategory.url }}">{{ subcategory.name }}</a></li>
										{% endfor %}
										</ul>
										{% endif %}
									{% endfor %}
								</ul>
							</div>
						</div>
					</div>
					{% endif %}
					
					{% if settings.category_col %}
					<div class="col-sm-9">
					{% else %}
					<div class="col-sm-12">
					{% endif %}
						<section id="grid" class="product-grid grid">
							{% snipplet "product_grid.tpl" %}
						</section>
					</div>
					{% if settings.infinite_scrolling and not pages.is_last %}
						<div class="loadMoreContainer"><a id="loadMoreBtn" class="button secondary loadMoreBtn"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a></div>
					{% else %}			
					<div class="crumbPaginationContainer bottom col-sm-12">
						<div class="pagination-container">
							{% snipplet "pagination.tpl" %}
							<hr class="line" />
						</div>
					</div>
					{% endif %}
				{% else %}
				    <div class="col-sm-12 text-center">
				    	<i class="text-404 fa fa-frown-o small-404"></i>
                        {% if has_filters %}
				            <p>{{"No tenemos productos en esas variantes. Por favor, intentá con otros filtros." | translate}}</p>
                        {% else %}
                            <p>{{"No se encontraron productos en esta categoría" | translate}}</p>
                        {% endif %}
				    </div>
				{% endif %}
			</div>
        </div>
    </div>

	
</div>
