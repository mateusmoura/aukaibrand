{% for category in categories %}
    {% if category.subcategories %}
    <div class="mobile-category-item container-fluid p-none item-with-subitems p-relative clear-both">
        <li class="mobile-subitems-container p-relative">
            <span class="mobile-category-dropdown container-fluid clear-both d-block text-decoration-none text-wrap no-link p-top p-bottom border-bottom">
                {{ category.name }}
                <span class="mobile-dropdown-arrow c-pointer"><i class="material-icons">&#xE313;</i></span> 
            </span>
            <ul class="mobile-accordion p-none d-none">
                <li class="mobile-category-item">
                    <a class="mobile-see-all-category container-fluid clear-both d-block text-decoration-none text-wrap no-link p-top p-bottom border-bottom font-bold text-uppercase" href="{{ category.url }}">
                    {{ "Ver toda esta categoría" | translate }}
                    </a>
                </li>
                {% snipplet "navigation/navigation-mobile-categories.tpl" with categories = category.subcategories %}
            </ul>
         </li>
    </div>
    {% else %}
    <li class="mobile-category-item no-mobile-subitems">
        <a class="mobile-category-no-dropdown container-fluid clear-both d-block text-decoration-none text-wrap no-link p-top p-bottom border-bottom" href="{{ category.url }}">
            {{ category.name }}</a>
     </li>
    {% endif %}
{% endfor %}

