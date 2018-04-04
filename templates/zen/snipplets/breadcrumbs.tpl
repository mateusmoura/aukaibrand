<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    <div id="breadcrumb" itemprop="breadcrumb">
        <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
        {% for crumb in breadcrumbs %}
            <span class="separator">></span>
            {% if crumb.last %}
                <span class="crumb last">{{ crumb.name }}</span>
            {% else %}
                <a class="crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
            {% endif %}
        {% endfor %}
    </div>
</div>