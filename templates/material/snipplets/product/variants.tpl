<div class="product">
  <!-- Color and size variants -->
  {% for variation in product.variations if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'] %}
        <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} {% if quickshop or not settings.show_description_bottom %}text-left{% else %}text-center{% endif %} text-center-xs m-half-bottom">
          <label  class="variation-label" for="variation_{{loop.index}}">
              <span>{{variation.name}}: </span>
            <strong>{{ product.default_options[variation.id] }}</strong>
          </label>
          <div class="insta-variations-container {% if quickshop or not settings.show_description_bottom %}text-left{% else %}text-center{% endif %} text-center-xs">
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
        </div>
    {% endfor %}
    <!-- custom variants -->
    {% for variation in product.variations %}
      <div class="row">
        <div class="form-group text-left col-xs-12 col-sm-12 {% if quickshop or not settings.show_description_bottom %}col-md-8 col-lg-8{% else %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% endif %}" {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}style="display:none";{% endif %}>
              <label class="variation-label" for="variation_{{loop.index}}">
                  <span>{{variation.name}}: </span>
              </label>
               <select class="variation-option form-control" name="variation[{{ variation.id }}]"
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
