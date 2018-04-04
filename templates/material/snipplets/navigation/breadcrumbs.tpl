<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    <ul id="breadcrumb" class="breadcrumb {% if template != 'product' %}pull-left{% endif %} m-top" itemprop="breadcrumb">
        <li>
            <a class="crumb no-link" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
        </li>
        {% for crumb in breadcrumbs %}
            <span class="separator">/</span>
            {% if crumb.last %}
                <span class="crumb last">{{ crumb.name }}</span>
            {% else %}
                <a class="crumb no-link" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
            {% endif %}
        {% endfor %}
    </ul>
</div>