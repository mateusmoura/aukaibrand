<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
    <ul class="breadcrumb list-inline" itemprop="breadcrumb">
		<li>
			<a class="breadcrumb-crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
		</li>
        {% if template == 'cart' %}
        <li>
            <span class="breadcrumb-divider">></span>
            <span class="breadcrumb-crumb"><strong>{{ "Carrito de Compras" | translate }}</strong></span>
        </li>
        {% elseif template == 'page' %}
        <li>
            <span class="breadcrumb-divider">></span>
            <span class="breadcrumb-crumb"><strong>{{ page.name }}</strong></span>
        </li>
        {% elseif template == 'search' %}
        <li>
            <span class="breadcrumb-divider">></span>
            <span class="breadcrumb-crumb"><strong>{{ "Resultados de búsqueda" | translate }}</strong></span>
        </li>
        {% endif %}
		{% for crumb in breadcrumbs %}
		<li>
			<span class="breadcrumb-divider">></span>
			{% if crumb.last %}
			<span class="breadcrumb-crumb"><strong>{{ crumb.name }}</strong></span>
			{% else %}
			<a class="breadcrumb-crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
			{% endif %}
		</li>
		{% endfor %}
    </ul>
    
</div>
