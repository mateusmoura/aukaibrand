{% for item in navigation %}
	{% if item.subitems %}
	    <li class="with-subitems p-relative {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}">
			 <a href="{{ item.url }}" class="dropdown-toggle-button"  {% if item.url | is_external %}target="_blank"{% endif %} >
			    <span>{{ item.name }}</span>
			    <i class="fa fa-chevron-down"></i>
			 </a>
			<ul class="dropdown-menu p-none">			
			{% if item.name in ['Product','Productos','Produtos'] %}
				<li>
			        <a href="{{ store.products_url }}">
			            <span>{{ 'Todos los productos' | translate }}</span>
			        </a>
     			</li>
			{% endif %}
				{% snipplet "navigation/navigation.tpl" with navigation = item.subitems %}
			</ul>
		</li>
	{% else %}
		 <li class="{{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}">
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>
				<span>{{ item.name }}</span>
			</a>
		</li>
	{% endif %}
{% endfor %}

