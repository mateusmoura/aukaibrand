<div id="categories-column" class="m-bottom hidden-xs">
    <script>LS.showWhiteListedFilters("{{ filters|json_encode() }}");</script>
    {% if parent_category and parent_category.id!=0 %}
        <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back"><i class="fa fa-chevron-left"></i>{{ parent_category.name }}</a>
    {% endif %}
    {% if filter_categories %}
        <h4>{{ category.id!=0 ? category.name :("Categorías" | translate) }}</h4>
        <ul id="categories-list" class="list-style-none p-none">
            {% for category in filter_categories %}
                <li data-item="{{ loop.index }}" class="m-half-bottom"><a class="no-link" href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a></li>
            {% endfor %}
        </ul>
        <a href="#" id="show-more-cats" class="btn btn-default" style="display: none;" title="{{ 'Mostrar más categorías' | translate }}"><i class="fa fa-angle-down"></i></a>
    {% endif %}
</div>
