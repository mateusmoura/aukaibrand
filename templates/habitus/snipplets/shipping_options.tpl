{% if options %}
    <p>{{ "Vea las opciones de envío para su código postal abajo" | translate }}:</p>
    <ul class="shipping-list list-unstyled">
        {% for option in options %}
            <li>
                <input id="shipping-{{ loop.index }}" class="shipping-method radio-button" data-price="{{ option.cost.value }}"
                           type="radio" value="{{ option.code }}" {% if loop.first %}checked="checked"{% endif %}
                           name="option"/>
                <label class="shipping-option" for="shipping-{{ loop.index }}">
                    <span class="col-md-3 col-sm-3 col-xs-3">
                        <img src="{{ option.img_code | shipping_logo }}"/>
                    </span>
                    <span class="col-md-8 col-sm-8 col-xs-8 shipping-method-name">{{ option.name }} - {{ option.cost }}</span>
                    <i class="fa fa-check"></i>
                </label>
                {% if option.suboptions is not empty %}
                    {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
                {% endif %}
            </li>
        {% endfor %}
    </ul>
    <div style="clear: both;"></div>
{% else %}
    <span>{{ "No hay costos de envío para el código postal dado." | translate }}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{ zipcode }}"/>