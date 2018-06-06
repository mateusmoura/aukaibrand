{% for item in menus["home_section_2"]  %}
  <div class="col-12">
      <div class="section__image" style="background-image: url('{{ 'images/new/home/home-foto-002.jpg' | static_url }}');">
          <a href="{{ item.url }}" class="section__link">
              <div class="section__text">
                  {{ item.name }}
              </div>
          </a>
      </div>
  </div>
{% endfor %}