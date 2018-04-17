<div class="js-variants-container product-variants">
  {# Color and size variants #}
  {% for variation in product.variations if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'] %}
    <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} row-fluid variant-container btn-variant-container">
      <label class="variant-label" for="variation_{{loop.index}}">
        <span>{{variation.name}}: </span>
        <span class="js-insta-variation-label variant-label-property">{{ product.default_options[variation.id] }}</span>
      </label>
      <div class="full-width">
        {% for option in variation.options if option.custom_data %}
          <a data-option="{{ option.id }}" class="js-insta-variations btn-variant {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
            <span class="btn-variant-content" style="background: {{ option.custom_data }}" data-name="{{ option.name }}"></span>
          </a>
        {% endfor %}
        {% for option in variation.options if not option.custom_data %}
          <a data-option="{{ option.id }}" class="js-insta-variations btn-variant btn-variant-custom {{ variation.name }} {% if product.default_options[variation.id] == option.id %}selected{% endif %}">
            <span class="btn-variant-content" data-name="{{ option.name }}">{{ option.name }}</span>
          </a>
        {% endfor %}
      </div>
    </div>
  {% endfor %}
  <!-- custom variants -->
  {% for variation in product.variations %}
    <div class="js-mobile-variations-container {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%} m-none {% endif %}">
      <div class="desktop-product-variation variant-container hidden-xs {% if product.variations >= 2 %} col-md-4 col-sm-4 {% else %} col-md-6 col-sm-6 {% endif %} col-xs-12" {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}style="display: none"{% endif %}>
        <label class="variant-label" for="variation_{{loop.index}}">
          {{variation.name}}:
        </label>
        <div class="select-container">
          {% if variation.options | length > 1 %}
            <select class="js-refresh-installment-data js-variation-option variant-select form-control select" id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#single-product')">
            {% for option in variation.options %}
                <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
            {% endfor %}
            </select>
          {% else %}
            <p>{{ variation.options[0].name }}</p>
            <input type="hidden" name="variation[{{ variation.id }}]" value="{{variation.options[0].id}}">
          {% endif %}
        </div>
      </div>
      {% if not(variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'])%}
        <div class="js-mobile-vars mobile-vars visible-xs">
          <a href="javascript:void(0)" class="js-mobile-vars-btn btn-modal-xs-right" id="{{variation.name}}" style="{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
              <p class="text-wrap m-none">{{variation.name}}:</p>
              <span class="js-mobile-vars-selected-label text-primary text-wrap">{{ product.default_options[variation.id] }}</span>
              <div class="btn-modal-xs-right-icon">
                {% include "snipplets/svg/angle-right.tpl" %}
              </div>  
          </a>
          <div class="js-mobile-vars-panel modal-xs modal-xs-right panel-mobile-variant modal-xs-right-out" data-custom="{{variation.name}}" style="{% if quickshop %}top: 60px;{% endif %}{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
            <a class="js-close-panel modal-xs-header">
              <i class="fa fa-angle-left fa-angle-left fa-2x modal-xs-header-icon"></i>
              <span class="modal-xs-header-text modal-xs-right-header-text">{{variation.name}}</span>
            </a>
          {% for option in variation.options %}
            <a href="javascript:void(0)" class="js-mobile-vars-property modal-xs-list-item" data-option="{{ option.id }}">
              <div class="modal-xs-radio-icon-container">
                <span class="m-right-half modal-xs-radio-icon">
                  <i class="fa fa-check" aria-hidden="true"></i>
                </span>
                </div>
              <div class="modal-xs-radio-text">
                {{ option.name }}
              </div>
            </a>
          {% endfor %}
          </div>
        </div>
      {% endif %}
    </div>
  {% endfor %}
</div>
