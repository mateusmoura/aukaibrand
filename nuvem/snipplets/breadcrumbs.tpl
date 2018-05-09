<nav itemscope itemtype="http://www.schema.org/WebPage" itemid="body" aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a></li>
        {% for crumb in breadcrumbs %}
            {% if crumb.last %}
                <li class="breadcrumb-item active" aria-current="page">{{ crumb.name }}</li>
            {% else %}
                <li class="breadcrumb-item">
                    <a href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
                </li>
            {% endif %}
        {% endfor %}
    </ol>
</nav>