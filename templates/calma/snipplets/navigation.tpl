<ul class="no-bull">
	{% for item in navigation %}
		<li><a href="{{ item.url | default('#') }}" class="{{ item.current ? 'selected' : '' }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		{% snipplet "navigation.tpl" with navigation = item.subitems %}
		</li>
	{% endfor %}
</ul>
