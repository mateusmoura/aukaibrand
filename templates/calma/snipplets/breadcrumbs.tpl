{% for crumb in breadcrumbs %}
	&raquo;
	{% if crumb.last %}
		<strong>{{ crumb.name }}</strong>
	{% else %}
		<a href="{{ crumb.url }}">{{ crumb.name }}</a>
	{% endif %}
{% endfor %}
