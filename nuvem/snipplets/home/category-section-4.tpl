{% for item in menus["home_section_4"]  %}
  <div class="col-12">
      <div class="section__image" style="background-image: url('{{ 'images/new/home/home-foto-004.jpg' | static_url }}');">
          <a href="{{ item.url }}" class="section__link">
              <div class="section__text">
                <span>Shop</span>
                {{ item.name }}
              </div>
          </a>
      </div>
  </div>
{% endfor %}