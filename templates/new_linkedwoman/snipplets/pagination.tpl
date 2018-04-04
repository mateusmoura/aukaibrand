{% if pages.numbers %}
	{% if pages.previous %}
        <a href="{{ pages.previous }}" class="nobutton"><</a>
    {% endif %}
    {% for page in pages.numbers %}
	 	{% if page.selected %}
	 		<span class="page-number selected">{{ page.number }}</span>
	 	{% else %}
	 		<a href="{{ page.url }}">{{ page.number }}</a>
	 	{% endif %}
	{% endfor %}
	{% if pages.next %}
		<a href="{{ pages.next }}">&gt;</a>
	{% endif %}
{% endif %}