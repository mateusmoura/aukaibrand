{% for item in menus["home_section_1"]  %}
  <div class="col-12">
      <div class="section__image" style="background-image: url('{% if loop.index == 1 %}{{ 'images/new/home/home-foto-001.jpg' | static_url }}{% else %}{{ 'images/new/produtos/section_4_home.jpg' | static_url }}{% endif %}');">
          <a href="{{ item.url }}" class="section__link">
              <div class="section__text">
                  <span>Shop</span>
                  {{ item.name }}
              </div>
          </a>
      </div>
  </div>
{% endfor %}