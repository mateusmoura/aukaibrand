{% if options %}
<span>{{"Vea las opciones de envío para su código postal abajo" | translate}}:</span>
<ul class="shipping-list">
	 {% for option in options %}
            <li>
                {% if not variant %}
                    <input id="shipping-{{ loop.index }}" class="shipping-method radio-button" data-price="{{ option.cost.value }}"
                           type="radio" value="{{ option.code }}" {% if loop.first %}checked="checked"{% endif %}
                           name="option"/>
                {% endif %}
                <label class="shipping-option" for="shipping-{{ loop.index }}">
                    <span class="col-md-3 col-sm-3 col-xs-3">
                        <img src="{{ option.img_code | shipping_logo }}"/>
                    </span>
                    <span class="col-md-9 col-sm-9 col-xs-9 shipping-method-name">{{ option.name }} - {{ option.cost }}</span>
                    <i class="fa fa-check"></i>
                </label>
                {% if option.suboptions is not empty %}
                    {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
                {% endif %}
            </li>
        {% endfor %}
</ul>
{% else %}
<span>{{"No hay costos de envío para el código postal dado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{zipcode}}"/>