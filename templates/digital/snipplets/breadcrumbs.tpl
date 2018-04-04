<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    <ul class="breadcrumb" itemprop="breadcrumb">

        <li><a  href="{{ store.url }}" title="{{ store.name }}">{{ "Início" | translate }}</a><span class="separator">&gt;</span></li>
        {% for crumb in breadcrumbs %}

            {% if crumb.last %}
                <li><strong>{{ crumb.name }}</strong></li>
            {% else %}
                <li><a href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a><span class="separator">&gt;</span></li>
            {% endif %}
        {% endfor %}
    </ul>
</div>