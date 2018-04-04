{% paginate by 16 %}
<div class="row-fluid" id="category-page">
	<div class="container">
        {% if products %}
            <div class="headerBox-List">
                <div class="span8">
                    <h1>{{ "Resultados de búsqueda" | translate }}</h1>
                </div>
                <div class="span4 breadcrumbs-wrapper">
                    <div id="breadcrumb">
                        <a class="goBack" title="{{ "Volver" | translate }}">{{ "Volver" | translate }}</a>
                    </div>
                </div>
            </div>
        
             <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% if settings.infinite_scrolling and not pages.is_last and products%}
                <div class="load-more-container">
                     <a id="loadMoreBtn" class="button secondary clear"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                </div>
            {% endif %}
            <div class="crumbPaginationContainer bottom">
                <div class='pagination'>
                    {% snipplet "pagination.tpl" %}
                </div>
            </div>
        {% else %}

			<div class="headerBox-Error">
                <h1>{{ "No hubo resultados para tu búsqueda" | translate }}</h1>
            </div>

            {% set primary_section_products %}
                {% for product in sections.primary.products %}
                    {% include 'snipplets/single_product.tpl' %}
                {% endfor %}
            {% endset %}

            {% if sections.primary.products %}
                <div class="dest-list">
                    <h2>{{ "Quizás te interesen los siguientes productos." | translate }}</h2>
                        <div id="tS1" class="jThumbnailScroller hidden-phone">
                            <div class="jTscrollerContainer">
                                <div class="jTscroller">
                                    {{ primary_section_products }}
                                </div>
                            </div>
                            <a href="#" class="jTscrollerPrevButton"></a>
                            <a href="#" class="jTscrollerNextButton"></a>
                    	</div>
                        
                        <div class="visible-phone">
                            {{ primary_section_products }}
                    	</div>
                	</div>
            {% endif %}
        {% endif %}
    </div>
</div>