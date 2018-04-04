{% snipplet "banner_products.tpl" %}
<div class="container">
    <div class="contenido">
        <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
        <div class="row headerBox-Page" style='margin-bottom:80px;'>
            <div class="title error action-color">
                <h1>
                    <i class="fa fa-exclamation-triangle"
                       style="margin-right:20px;"></i>{{ "La página que estás buscando no existe" | translate }}
                </h1>
            </div>
        </div>
        <div class="row products-list">
            <div class="products-header">
                <h2>{{ "Quizás te interesen los siguientes productos." | translate }}</h2>
            </div>
            {% snipplet "product_grid.tpl" with 'products' = sections.primary.products %}
        </div>
    </div>
</div>

