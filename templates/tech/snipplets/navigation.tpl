{% for item in navigation %}
    <li class="{{ item.current ? 'active' : '' }}">
        <a href="{{ item.url | default('#') }}" {% if item.url | is_external %}target="_blank"{% endif %}> {{ item.name }}</a>
        {% if item.subitems %}
            <ul class="sf-menud" id="sf-menud">
                {% snipplet "navigation.tpl" with navigation = item.subitems %}
            </ul>
        {% endif %}
    </li>
{% endfor %}