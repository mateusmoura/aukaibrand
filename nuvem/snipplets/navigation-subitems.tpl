{% for item in navigation %}
  <li>
    <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="nav__bar--link {{ item.current ? 'selected' : '' }}">{{ item.name }}</a>
  </li>
{% endfor %}