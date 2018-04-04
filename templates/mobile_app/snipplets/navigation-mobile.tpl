{% for item in categories %}
        {% if item.subitems %}
         <li class="with-subitems">
            <a class="dropdown-anchor" href="{{ item.url }}">
                {{ item.name }}
            </a>
            <span class="mobile-dropdown"><i class="fa fa-chevron-down"></i></span>
            <ul class="accordion">
                {% snipplet "navigation-mobile.tpl" with categories = item.subitems %}
            </ul>
        </li>
        {% else %}
        <li>
            <a href="{{ item.url }}">{{ item.name }}</a>
        </li>
        {% endif %}
{% endfor %}
