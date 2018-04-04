{% for item in navigation %}
    <li class="{{ item.current ? 'active' : '' }}">
        {% if item.subitems %}
            <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>
                {{ item.name }}
                <i class="arrow fa fa-chevron-{% if level %}right{% else %}down{% endif %}"></i>
            </a>
            <ul>
                {% snipplet "navigation.tpl" with navigation = item.subitems, level = level + 1 %}
            </ul>
        {% else %}
            <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
        {% endif %}
    </li>
{% endfor %}