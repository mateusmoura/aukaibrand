{% set show_help = not has_products %}
{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
		<div class="row-fluid" id="product-example">
			{% include 'snipplets/defaults/show_help_product.tpl' %}
		</div>
	{% else %}
		<div id="404-page" class="container">
			<div class="text-center">
			      {% snipplet "page-header.tpl" with page_header_title = "La página no existe" | translate  , hide_breadcrumbs = true %}
			  </div>
		  	<div class="text-center">
			    <i class="material-icons icon-404">&#xE033;</i>
			</div>
		    <h4 class="text-center border-bottom p-bottom">{{ "La página que estás buscando no existe." | translate }} {{ "Quizás te interesen los siguientes productos." | translate }}</h4>
		</div>
		{% include 'snipplets/home/primary-products.tpl' %}
{% endif %}
