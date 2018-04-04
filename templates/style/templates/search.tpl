{% paginate by 8 %}
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ "Resultados de búsqueda" | translate }}</h1></legend></fieldset>
			</div>
		</div>
	</div>
	<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
		<ul class="breadcrumb-custom" itemprop="breadcrumb">
			<li>
				<a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
			</li>
			<li>
				<span class="separator">></span>
				<span class="crumb"><strong>{{ "Resultados de búsqueda" | translate }}</strong></span>
			</li>
		</ul>
	</div>	
	{% if products %}
		<section id="grid" class="grid clearfix product-grid">
		{% for product in products %}
			{% include 'snipplets/single_product.tpl' %}
		{% endfor %}
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
		<p class="search-no-result text-center">{{ "No hubo resultados para tu búsqueda" | translate }}</p>
		<p class="text-center">{{ "A continuación te sugerimos algunos productos que podrían interesarte" | translate }}</p>
		{% set related_products = sections.primary.products | take(4) | shuffle %}
		{% if related_products | length > 1 %}
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="section-title section-title-large">
					<fieldset><legend><h2 class="title">{{"Productos recomendados" | translate}}</h2></legend></fieldset>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<section id="grid" class="grid clearfix">
				{% for related in related_products %}
					{% include 'snipplets/single_product.tpl' with {product : related} %}
				{% endfor %}
				</section>
			</div>
		</div>
		{% endif %}	
	{% endif %}
</div>