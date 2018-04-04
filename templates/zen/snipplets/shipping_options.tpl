{% if options %}
<span>{{"Vea las opciones de envío para su código postal abajo" | translate}}:</span>
<ul class="shipping-list">
	{% for option in options %}
 	<li>
		<label for="shipping-{{loop.index}}">
            {% if not variant %}
	    	    <input id="shipping-{{loop.index}}" class="shipping-method" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" style="display:none" />
	    	{% endif %}
           <span class="shipping-option"><img src="{{option.img_code | shipping_logo}}"/><p class="option-name">{{option.name}} - <strong>{{option.cost}}</strong></p><i class="fa fa-check"></i></span>
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
