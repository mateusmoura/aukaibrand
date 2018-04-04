<ul {% if not level %}class="dropdown-menu" role="menu"{% endif %}>
    {% for item in navigation %}
        {% if item.subitems %}
            <li class="{% if item.current %}active{% endif %}">
                <a href="{{ item.url }}">{{ '- ' | repeat(level) }}{{ item.name }}</a>
                {% snipplet "navigation-mobile.tpl" with navigation = item.subitems, level = level + 1 %}
            </li>
        {% else %}
            <li class="{% if item.current %}active{% endif %}">
                <a href="{{ item.url }}">{{ '- ' | repeat(level) }}{{ item.name }}</a>
            </li>
        {% endif %}
    {% endfor %}
</ul>