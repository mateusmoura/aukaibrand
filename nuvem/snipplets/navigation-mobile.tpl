<nav class="nav__bar--mobile">
    <div class="nav__bar--mobile-close">
      <button type="button" class="btn btn-close">
        <i class="fas fa-times"></i>
      </button>
    </div>

    {% if languages | length > 1 %}
        <div class="options__language">
            <div class="languages">
                {% for language in languages %}
                    {% set class = language.active ? "active" : "" %}
                    <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                {% endfor %}
            </div>
        </div>
    {% endif %}

    <ul class="nav__bar--links ">
        {% for item in navigation %}
            {% if item.subitems %}
                <li class="nav__bar--has-dropdown ">
                    <a href="{{ item.url }}" class="nav__bar--link {{ item.current ? 'selected' : '' }}" {% if item.url | is_external %}target="_blank"{% endif %}>
                        {{ item.name }}
                    </a>

                    <ul class="nav__bar--dropdown">
                        <li class="nav__bar--dropdown-close">
                            <a href="" class="nav__bar--link"><i class="fas fa-long-arrow-alt-left"></i> Voltar</a>
                        </li>

                        {% snipplet "navigation-subitems.tpl" with navigation = item.subitems %}
                    </ul>
                </li>
            {% else %}
                <li class="nav__bar--is-link">
                    <a href="{{ item.url }}" class="nav__bar--link {{ item.current ? 'selected' : '' }}" {% if item.url | is_external %}target="_blank"{% endif %}>
                        {{ item.name }}
                    </a>
                </li>
            {% endif %}
        {% endfor %}
    </ul>
</nav>
