{% if options %}
<ul class="shipping-list">
	{% for option in options %}
 	<li>
		<label for="shipping-{{loop.index}}" >
            {% if not variant %}
    	    <input id="shipping-{{loop.index}}" class="shipping-method" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" />
            {% endif %}  
            <span class="shipping-option">          
		    	<div class="ship-img"><img src="{{option.img_code | shipping_logo}}"/></div>
			    <div class="ship-text">
			    	<h4>{{option.cost}}</h4> 
			    	<span>{{option.name}}</span>
		    	</div>
		    	<i class="fa fa-check"></i>
	    	</span>
	    </label>
        {% if option.suboptions is not empty %}
            {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
        {% endif %}
    </li>
    {% endfor %}
</ul>
{% else %}
<span>{{"No hay costos de envío para el CEP dado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="cep" value="{{cep}}"/>