{% if pages.previous %}
	<a href="{{ pages.previous }}">&laquo; {{ "Anterior" | translate }}</a>
{% endif %}
{% for page in pages.numbers %}
 	{% if page.selected %}
 		<strong>{{ page.number }}</strong>
 	{% else %}
 		<a href="{{ page.url }}">{{ page.number }}</a>
 	{% endif %}
{% endfor %}
{% if pages.next %}
	<a href="{{ pages.next }}">{{ "Siguiente" | translate }} &raquo;</a>
{% endif %}