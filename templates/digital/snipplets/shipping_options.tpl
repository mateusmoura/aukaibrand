{% if options %}
<span>{{ "Veja os valores para o seu CEP abaixo" | translate}}:</span>
<ul class="shipping-list">
	{% for option in options %}
 	<li>
		<label for="shipping-{{loop.index}}">
            {% if not variant %}
	    	    <input id="shipping-{{loop.index}}" class="shipping-method" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" />
	    	{% endif %}
            <span><img src="{{option.img_code | shipping_logo}}"/>{{option.name}} - {{option.cost}}</span>
	    </label>
    </li>
    {% endfor %}
</ul>
{% else %}
<span>{{ "Não há frete disponível para o CEP informado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{zipcode}}"/>