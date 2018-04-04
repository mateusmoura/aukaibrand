{% snipplet "banner_products.tpl" %}
{% paginate by 12 %}
<div class="container">
    <div class="contenido">
        <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
        <h1>{{ "Resultados de búsqueda" | translate }}</h1>
        {% if products %}
            <div class='productos product-table'>
                {% snipplet "product_grid.tpl" %}
            </div>
            {% if settings.infinite_scrolling and not pages.is_last %}
                <div class="loadBtnContainer"><a id="loadMoreBtn" class="button secondary"><i class="fa fa-circle-o-notch fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a></div>
            {% endif %}
            {% snipplet "pagination.tpl" %}
        {% else %}
            <p class="alert alert-info" style='margin-top:30px;'><i class="fa fa-exclamation-triangle"
               style="margin-right:10px;"></i>{{ "No hubo resultados para tu búsqueda" | translate }}
            </p>
            {% snipplet "maybe_products.tpl" %}
        {% endif %}
    </div>
</div>

 