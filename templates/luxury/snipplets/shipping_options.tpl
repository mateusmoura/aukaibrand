{% if options %}
<ul class="shipping-list">
	{% for option in options %}
 	<li>
	    <input id="shipping-{{loop.index}}" class="shipping-method radio-button" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" />
		<label class="shipping-option" for="shipping-{{loop.index}}">          
	    	<div class="span3 text-left"><img src="{{option.img_code | shipping_logo}}"/></div>
		    <div class="span8">
		    	<h4>{{option.cost}}</h4> 
		    	<span>{{option.name}}</span>
	    	</div>
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