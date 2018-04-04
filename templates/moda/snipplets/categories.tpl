{% for category in categories %}
	<li>
		<a href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a>
		{% if settings.expand_subcategories %}
	        {% if category.subcategories %} 
				<ul>
				{% snipplet "categories.tpl" with categories = category.subcategories %}
				</ul>
			{% endif %}
		{% else %}
	        {% if category.active and category.subcategories %}
				<ul>
				{% snipplet "categories.tpl" with categories = category.subcategories %}
				</ul>
			{% endif %}
		{% endif %}
	</li>
{% endfor %}
