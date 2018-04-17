{% for item in navigation %}
    {% if item.subitems %}
    <li>
      <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="site-nav__link">
        {{ item.name }}
        <span class="desktop-nav-arrow arrow"><i class="fa fa-angle-right fa-lg"></i></span>
      </a>
      <ul class="site-nav__dropdown">
        {% snipplet "navigation/navigation.tpl" with navigation = item.subitems %}
      </ul>
    {% else %}
    <li class="site-nav--has-dropdown {{ item.current ? 'site-nav--active' : '' }} {{ loop.first ? 'first' : '' }}">
      <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="site-nav__link">{{ item.name }}</a>
    {% endif %}
    </li>
{% endfor %}