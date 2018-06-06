<h6>Sobre nós</h6>

<ul>
    {% for item in menus["footer_sobre"]  %}
      <li><a href="{{ item.url }}">{{ item.name }}</a></li>
    {% endfor %}
</ul>