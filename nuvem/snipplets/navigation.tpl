<nav class="nav__bar">
  <ul class="nav__bar--links">
    {% for item in navigation %}
      {% if item.subitems %}
        <li class="nav__bar--has-dropdown">
          <a href="{{ item.url }}" class="nav__bar--link {{ item.current ? 'selected' : '' }}" {% if item.url | is_external %}target="_blank"{% endif %}>
            {{ item.name }}
          </a>

          <ul class="nav__bar--dropdown">
            {% snipplet "navigation-subitems.tpl" with navigation = item.subitems %}
          </ul>
        </li>
      {% else %}
        <li class="nav__bar--is-link">
          <a href="{{ item.url }}" class="nav__bar--link {{ item.current ? 'selected' : '' }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
        </li>
      {% endif %}
  {% endfor %}
  </ul>
</nav>