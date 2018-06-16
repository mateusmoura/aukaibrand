{% paginate by 30 %}
<section class="section-category section-orders section-search">
    {% if products %}
        <div class="container">
            <div class="section-title">
                <h1>{{ "Resultados de búsqueda" | translate }}</h1>
                <a class="goBack" title="{{ "Volver" | translate }}">{{ "Volver" | translate }}</a>
            </div>
        </div>

        <div class="container-fluid">
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
        </div>
    {% else %}
        <div class="container">
            <div class="section-title">
                <h1>{{ "No hubo resultados para tu búsqueda" | translate }}</h1>
                <h2>{{ "Quizás te interesen los siguientes productos." | translate }}</h2>
            </div>
        </div>

        <div class="container-fluid">
            {% set primary_section_products %}
                {% if sections.primary.products and pages.is_last %}
                    <div class="last-page" style="display:none;"></div>
                {% endif %}
                {% for product in sections.primary.products %}
                    {% if loop.index % 4 == 1 %}
                        <div class="row no-gutters section-category--list">
                    {% endif %}
                    {% include 'snipplets/product/single-product.tpl' %}
                    {% if loop.index % 4 == 0 or loop.last %}
                        </div>
                    {% endif %}
                {% endfor %}
            {% endset %}

            {% if sections.primary.products %}
                {{ primary_section_products }}
            {% endif %}
        </div>
    {% endif %}
</section>