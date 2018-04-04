{% if filter_categories %}
<div id="horizontal-mobile-categories" class="horizontal-container mobile-categories visible-xs p-top">
    <ul class="list-style-none p-left-none p-half-top m-none-bottom p-half-bottom">
        {% for category in filter_categories %}
            <li data-item="{{ loop.index }}" class="pill-container d-inline-block"><a class="no-link pill big label label-primary contrast" href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a></li>
        {% endfor %}
    </ul>
</div>
{% endif %}