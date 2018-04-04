<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    <div id="crumbs" itemprop="breadcrumb">
        <a href="{{ store.products_url }}">{{ "Productos" | translate }}</a>
        {% for crumb in breadcrumbs %}
            &gt;
            {% if crumb.last %}
                <strong>{{ crumb.name }}</strong>
            {% else %}
                <a href="{{ crumb.url }}">{{ crumb.name }}</a>
            {% endif %}
        {% endfor %}
    </div>
</div>