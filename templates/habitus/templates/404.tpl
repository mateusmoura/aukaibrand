<div class="container four-oh-four">
    <div class="row headerBox-Page">
        <div class="title error action-color">
            <h1>
                <i class="fa fa-exclamation-triangle"></i>{{ "La página que estás buscando no existe." | translate }}
            </h1>
        </div>
        <hr class="featurette-divider">
    </div>
    <div class="row products-list">
        <div class="products-header">
            <h3>{{ "Quizás te interesen los siguientes productos." | translate }}</h3>
        </div>
        {% snipplet "product_grid.tpl" with 'products' = sections.primary.products %}
    </div>
</div>

