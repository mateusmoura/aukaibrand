<h6>{{ "Informações" | translate }}</h6>

<ul>
    {% for item in menus["footer_informacoes"]  %}
      <li><a href="{{ item.url }}">{{ item.name }}</a></li>
    {% endfor %}
</ul>