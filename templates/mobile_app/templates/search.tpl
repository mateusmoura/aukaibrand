{% paginate by 16 %}
<div class="row-fluid" id="category-page">
	<div class="container">
        {% if products %}
            <div class="page-header-container container">
                 <div class="page-header col-md-8 col-sm-12 col-xs-12">
                    <h1>{{ "Resultados de búsqueda" | translate }}</h1>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-xs hidden-sm">
                    <div id="breadcrumb">
                        <a class="goBack" title="{{ "Volver" | translate }}">{{ "Volver" | translate }}</a>
                    </div>
                </div>
            </div>
             <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            
            <div class="crumbPaginationContainer bottom">
                <div class='pagination'>
                    {% snipplet "pagination.tpl" %}
                </div>
            </div>
            
        {% else %}

			<div class="error-box">
                <h1>{{ "No hubo resultados para tu búsqueda" | translate }}</h1>
            </div>

            {% set primary_section_products %}
                {% for product in sections.primary.products %}
                    {% include 'snipplets/single_product.tpl' %}
                {% endfor %}
            {% endset %}

        {% endif %}
    </div>
</div>