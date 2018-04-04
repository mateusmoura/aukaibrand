{% for category in categories %}
	<li>
		<a href="{{ category.url | default('#') }}" title="{{ category.name }}">{{ category.name }}</a>
		{% if category.subitems %}
			<ul>
			{% snipplet "categories.tpl" with categories = category.subitems %}
			</ul>
		{% endif %}
	</li>
{% endfor %}
