{% for category in categories %}
    {% if category.subcategories %}
        <li class="mobile-nav-list-item">
            <span data-target="js-category-{{ category.id }}" class="js-open-mobile-subcategory modal-xs-list-item inverse">
                {{ category.name }}
                <div class="link-modal-xs-right-icon modal-xs-list-icon">
                  {% include "snipplets/svg/angle-right.tpl" %}
                </div>  
            </span>
        </li>
    {% else %}
        <li class="mobile-nav-list-item">
            <a class="modal-xs-list-item inverse" href="{{ category.url }}">
                {{ category.name }}
            </a>
        </li>
    {% endif %}
{% endfor %}
