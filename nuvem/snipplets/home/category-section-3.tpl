{% for item in menus["home_section_3"]  %}
  <div class="col-12">
      <div class="section__image" style="background-image: url('{{ 'images/new/home/home-foto-003.jpeg' | static_url }}');">
          <a href="{{ item.url }}" class="section__link">
              <div class="section__text section__text--center section__text--border">
                  {{ item.name }}
              </div>
          </a>
      </div>
  </div>
{% endfor %}