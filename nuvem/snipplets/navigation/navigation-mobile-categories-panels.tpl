<ul id="js-category-{{ category.id }}" class="js-mobile-nav-subcategories-panel mobile-nav-subcategories-panel modal-xs modal-xs-right inverse" style="display:none;">
    <a class="js-go-back-mobile-categories modal-xs-header" href="#">
        <span class="modal-xs-header-icon">
            <i class="fa fa-angle-left fa-2x"></i>
        </span>
        <span class="modal-xs-header-text modal-xs-right-header-text">{{ category.name }}</span>
    </a>
    <li class="mobile-nav-list-item">
        <a class="modal-xs-list-item modal-xs-list-subtitle inverse" href="{{ category.url }}">
        {{ "Ver toda esta categoría" | translate }}
        </a>
    </li>
    {% snipplet "navigation/navigation-mobile-categories.tpl" with categories = category.subcategories %}
</ul>
{% for subcategory in category.subcategories %}
    {% snipplet "navigation/navigation-mobile-categories-panels.tpl" with category = subcategory %}
{% endfor %}
