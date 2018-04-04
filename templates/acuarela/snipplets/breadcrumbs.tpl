<div id="breadcrumb" itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    <div itemprop="breadcrumb">
        <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
        {% for crumb in breadcrumbs %}
            <span class="separator">&gt;</span>
            {% if crumb.last %}
                <strong class="crumb last">{{ crumb.name }}</strong>
            {% else %}
                <a class="crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
            {% endif %}
        {% endfor %}
    </div>
</div>