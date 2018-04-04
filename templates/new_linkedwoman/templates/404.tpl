{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<div class="page-content" id="404">
	<div class="headerBox-Page">
		<h1>{{ "La página no existe" | translate }}</h1>
	</div>
	<div class="row-fluid">
		<p class="centered st">{{ "La página que estás buscando no existe." | translate }} <small>{{ "Quizás te interesen los siguientes productos." | translate }}</small></p>
        {% snipplet "product_grid.tpl" with 'products' = sections.primary.products %}
	</div>
</div>
{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
    <div class="row-fluid" id="product-example">
        {% snipplet 'defaults/show_help_product.tpl' %}
    </div>
{% endif %}