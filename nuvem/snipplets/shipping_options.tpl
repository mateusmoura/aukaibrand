{% if options %}
<ul class="shipping-list radio-button-container">
	{% for option in options %}
 	<li class="radio-button-item">
		<label class="radio-button" for="shipping-{{loop.index}}">
	    	<input id="shipping-{{loop.index}}" class="js-shipping-method shipping-method" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" style="display:none" />
	    	<span class="shipping-option row-fluid radio-button-content">
		    	<span class="radio-button-label d-inline-block">
		    		<img class="radio-button-img" src="{{option.img_code | shipping_logo}}"/>
		    		<span class="option-name radio-button-text d-inline-block text-left">{{option.name}} - <strong>{{option.cost}}</strong>
		    			{% if option.suboptions is not empty %}
				            {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
				        {% endif %}
		    		</span>
		        	{% if option.warning['enable'] %}
			            <div class="alert alert-warning pull-right m-top m-bottom-none">
			              <p>{{ option.warning['message'] }}</p>
			            </div>
		          	{% endif %}
			    </span>
			    <span class="radio-button-icons">
	    			<i class="fa fa-check checked"></i>
		    	</span>
	    	</span>
	    </label>
        
    </li>
    {% endfor %}
</ul>
<div style="clear: both;"></div>
{% else %}
<span>{{"No hay costos de envío para el código postal dado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{zipcode}}"/>
