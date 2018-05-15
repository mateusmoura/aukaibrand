<div class="section__variantes">
  <!-- Color variants -->
  {% for variation in product.variations if variation.name in ['Color', 'Cor'] %}
  <div data-variant="{{ variation.name }}" class="product-color product-{{ variation.name }} variation_{{loop.index}} {% if quickshop%}hidden{% endif %}">
    <h4>
      {% if quickshop %}
        {# <div class="number">{{ loop.index }}</div> #}
        {{variation.name}}: 
      {% else %}
        {{variation.name}}: 
      {% endif %}
      {{ product.default_options[variation.id] }}
    </h4>

    <ul>
      {% for option in variation.options if option.custom_data %}
        <li>
          <a style="background: {{ option.custom_data }}" data-option="{{ option.id }}" class="btn btn-secondary btn-color btn-radius insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
            <span data-name="{{ option.name }}"></span>
            <i class="fas fa-check"></i>
          </a>
        </li>
      {% endfor %}
    </ul>
  </div>
  {% endfor %}

  <!-- Size variants -->
  {% for variation in product.variations if variation.name in ['Talle', 'Tamanho', 'Size'] %}
  <div data-variant="{{ variation.name }}" class="product-size product-{{ variation.name }} variation_{{loop.index}} {% if quickshop%}hidden{% endif %}">
    <h4>
      {% if quickshop %}
        {# <div class="number">{{ loop.index }}</div> #}
        {{variation.name}}: 
      {% else %}
        {{variation.name}}: 
      {% endif %}
      {{ product.default_options[variation.id] }}
    </h4>

    <ul>
      {% for option in variation.options if not option.custom_data %}
        <li>
          <a data-option="{{ option.id }}" class="btn btn-secondary btn-size btn-radius insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
            <span class="custom-variants" data-name="{{ option.name }}">{{ option.name }}</span>
          </a>
        </li>
      {% endfor %}
    </ul>
  </div>
  {% endfor %}


  <!-- custom variants -->
  {% for variation in product.variations %}
      <div class="span5 st ssb" {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}style="display: none"{% endif %}>
          <div class="attributeLine">
              <label class="variation-label" for="variation_{{loop.index}}">
                {% if quickshop %}
                  <div class="number">{{ loop.index }}</div>
                  <span>{{variation.name}}:</span>
                {% else %}
                  <span>{{variation.name}}: </span>
                {% endif %}
              </label>
              <select class="variation-option" name="variation[{{ variation.id }}]"
              {% if quickshop %}
                  onchange="LS.changeVariant(changeVariant, '#quick{{ product.id }} .productContainer')">
              {% else %}
                  onchange="LS.changeVariant(changeVariant, '.section-product__content')">
              {% endif %}
                  {% for option in variation.options %}
                      <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                  {% endfor %}
              </select>
          </div>
      </div>
  {% endfor %}
</div>
