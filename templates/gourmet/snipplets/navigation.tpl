{% for item in navigation %}
    <li class="{{ item.current ? "active" : "" }}">
        {% if item.subitems %}
            <a class="toggle-submenu" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>
                {{ item.name }} <b class="caret"></b>
            </a>
            <div class="navbar-submenu toggle-submenu">
                {% for category in item.subitems %}
                    <ul>                
                        <li>
                            <h2>
                                <a href="{{ category.url }}" {% if category.url | is_external %}target="_blank"{% endif %}>{{ category.name }}</a>
                            </h2>
                        </li>
                        {% for subcategory in category.subitems %}
                            <li>
                                <a href="{{ subcategory.url }}" {% if subcategory.url | is_external %}target="_blank"{% endif %}>{{ subcategory.name }}</a>
                            </li>
                        {% endfor %}
                    </ul>
                {% endfor %}
            </div>
        {% else %}
            <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
        {% endif %}
    </li>
{% endfor %}