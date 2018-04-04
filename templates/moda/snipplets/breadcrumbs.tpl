<ul class="breadcrumb" itemscope itemtype="http://www.schema.org/WebPage">
    <div itemprop="breadcrumb">
        <li><a  href="{{ store.url }}" title="{{ store.name }}">{{ "Início" | translate }}</a><span class="separator">&gt;</span></li>
        {% for crumb in breadcrumbs %}
            {% if crumb.last %}
                <li><strong>{{ crumb.name }}</strong></li>
            {% else %}
                <li><a href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a><span class="separator">&gt;</span></li>
            {% endif %}
        {% endfor %}
    </div>
</ul>
