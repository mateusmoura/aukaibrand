{% for item in menus["footer_jorney"]  %}
  <a href="{{ item.url }}">{{ item.name }} <i class="fas fa-long-arrow-alt-right"></i></a>
{% endfor %}