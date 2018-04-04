<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    <ul class="breadcrumb" itemprop="breadcrumb">
        <li class="home"><a href="{{ store.url }}">{{ "Inicio" | translate }}</a></li>
        {% for crumb in breadcrumbs %}
            {% if crumb.last %}
                <li class="last">{{ crumb.name }}</li>
            {% else %}
                <li><a href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a></li>
            {% endif %}
        {% endfor %}
    </ul>
</div>