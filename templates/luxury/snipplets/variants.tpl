<div class="fancyContainer product">
  <div class="row-fluid">

  <!-- Color and size variants -->
  {% for variation in product.variations if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'] %}
        <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} row-fluid">
          <label  class="variation-label sl" for="variation_{{loop.index}}">
            {% if quickshop %}
              <div class="number">{{ loop.index }}</div>
              <span>{{variation.name}}:</span>
            {% else %}
              <span>{{variation.name}}: </span>
            {% endif %}
            <strong>{{ product.default_options[variation.id] }}</strong>
          </label>
          {% for option in variation.options if option.custom_data %}
              <a data-option="{{ option.id }}" class="insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
                  <span style="background: {{ option.custom_data }}" data-name="{{ option.name }}"></span>
                </a>
          {% endfor %}
          {% for option in variation.options if not option.custom_data %}
              <a data-option="{{ option.id }}" class="insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
                  <span class="custom-variants" data-name="{{ option.name }}">{{ option.name }}</span>
                </a>
          {% endfor %}
        </div>
        <hr class="st sb"/>
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
                    onchange="LS.changeVariant(changeVariant, '#single-product-container')">
                {% endif %}
                    {% for option in variation.options %}
                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                    {% endfor %}
                </select>
            </div>
        </div>
    {% endfor %}
  </div>
</div>
