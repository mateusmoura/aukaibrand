<div id="header" class="clear">
	<div id="navigate">
		{% if has_logo %}
			<div id="logo">
				{{ store.logo | img_tag | a_tag(store.url) }}
			</div>
		{% else %}
			<h3>{{ store.name | a_tag(store.url) }}</h3>
		{% endif %}
		<div id="nav">
			<ul>
				{% for item in navigation %}
					<li{% if loop.last %} class="end"{% endif %}>
						<a href="{{ item.url }}"{% if item.current %} class="active"{% endif %} {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
					</li>
				{% endfor %}
			</ul>
		</div>
	</div>

    {% if not store.is_catalog %}
	<div id="items">
		<h2>{{ cart.items_count }}</h2><div></div>
		<p>{% if cart.items_count == 1 %}{{"Producto" | translate }}{% else %}{{"Productos" | translate }}{% endif %} {{"en" | translate }} <a href="{{store.cart_url}}">{{"tu carrito" | translate }}</a> &rarr;</p>
	</div>
    {% endif %}

	{% if languages | length > 1 %}	
	<div class="languages">
		{% for language in languages %}
			{% set class = language.active ? "active" : "" %}
			<a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
		{% endfor %}
	</div>
	{% endif %}
</div>
