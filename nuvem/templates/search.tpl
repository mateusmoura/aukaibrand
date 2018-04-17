{% paginate by 16 %}
<div class="container">
	<div class="title-container">
	    {% snipplet "breadcrumbs.tpl" %}
   		<h1 class="title">{{ "Resultados de búsqueda" | translate }}</h1>
    </div>
	{% if products %}
		<div class="text-center-xs">
			<section class="js-product-table js-masonry-grid product-grid">
				<div class="js-masonry-grid">
					{% for product in products %}
						{% include 'snipplets/single_product.tpl' %}
					{% endfor %}
				</div>
			</section>
			{% if settings.infinite_scrolling and not pages.is_last and products%}
			    <div class="load-more-container clear-both m-bottom text-center">
			        <a class="js-load-more-btn btn btn-secondary m-top m-bottom full-width-xs">
			        	{{ 'Mostrar más productos' | t }}
			        	<i class="js-load-more-spinner btn-spinner fa-circle-o-notch fa-spin" style="display:none;"></i>
			        </a>
			    </div>
			{% endif %}
			<div class="visible-when-content-ready" {% if settings.infinite_scrolling %}style="display:none;"{% endif %}>
				{% snipplet "pagination.tpl" %}
			</div>
		</div>
	{% else %}
		<p class="text-secondary text-center">{{ "No hubo resultados para tu búsqueda" | translate }}</p>
		<p class="text-center">{{ "A continuación te sugerimos algunos productos que podrían interesarte" | translate }}</p>
		{% set related_products = sections.primary.products | take(4) | shuffle %}
		{% if related_products | length > 1 %}
		<div class="row">
			<div class="col-xs-12">
				<div class="title-container m-top">
			   		<h2 class="subtitle">{{"Productos recomendados" | translate}}</h2>
			    </div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<section id="grid" class="grid clearfix">
					<div class="js-masonry-grid">
						{% for related in related_products %}
							{% include 'snipplets/single_product.tpl' with {product : related} %}
						{% endfor %}
					</div>
				</section>
			</div>
		</div>
		{% endif %}	
	{% endif %}
</div>
