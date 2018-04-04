{% if options %}
<span>{{"Vea las opciones de envío para su código postal abajo" | translate}}:</span>
<ul class="shipping-list">
	{% for option in options %}
 	<li>
		<label>
	    	<input class="shipping-method" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" />
	    	<span><img src="{{option.img_code | shipping_logo}}">{{option.name}} - {{option.cost}}</span>
	    </label>
    </li>
    {% endfor %}
</ul>
{% else %}
<span>{{"No hay costos de envío para el código postal dado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{cep}}"/>