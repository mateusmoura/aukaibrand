{% for item in navigation %}
    {% if item.subitems %}
        <option value="{{ item.url }}" {% if item.current %}selected="selected"{% else %}{% endif %} >
            - - {{ item.name }}
        </option>
        {% snipplet "navigation-mobile4.tpl" with navigation = item.subitems %}
    {% else %}
        <option value="{{ item.url }}" {% if item.current %}selected="selected"{% else %}{% endif %} >
            - - {{ item.name }}
        </option>
    {% endif %}
{% endfor %}