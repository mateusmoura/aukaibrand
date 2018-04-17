<div id="categories-column" class="visible-when-content-ready">

    <div class="js-append-filters m-bottom" style="display: none;">
        <h5 class="visible-phone m-top-half font-medium weight-normal m-bottom-quarter">{{ 'Filtro aplicado:' | translate }}</h5>
    </div>

    {% if parent_category and parent_category.id!=0 %}
        <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back hidden-xs"><i class="fa fa-chevron-left"></i>{{ parent_category.name }}</a>
    {% endif %}

    {% if filter_categories %}
        <div class="hidden-xs">
            <h5 class="m-bottom-half weight-normal">{{ 'Filtrar por' | translate }}</h5>    
            <h5 class="m-bottom">{{ category.id!=0 ? category.name :("Categorías" | translate) }}</h5>
            <ul id="categories-list" class="list-unstyled list-unstyled-spaced font-medium">
                {% for category in filter_categories %}
                    <li class="js-category-sidebar-item" data-item="{{ loop.index }}"><a href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a></li>
                {% endfor %}
            </ul>
            <a href="#" id="show-more-categories" class="btn-more-categories clear-both" style="display: none;" title="{{ 'Mostrar más categorías' | translate }}"><i class="fa fa-angle-down fa-lg"></i></a>
        </div>
    {% endif %}

</div>