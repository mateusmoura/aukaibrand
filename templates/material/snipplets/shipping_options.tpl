{% if options %}
<span>{{"Vea las opciones de envío para su código postal abajo" | translate}}:</span>
<ul class="list-unstyled shipping-list">
    {% for option in options %}
    <li class="row m-half-top">
        <label for="shipping-{{loop.index}}" class="container-fluid">
            <input id="shipping-{{loop.index}}" class="shipping-method" data-price="{{option.cost.value}}" type="radio" value="{{option.code}}" {% if loop.first %}checked="checked"{% endif %} name="option" style="display:none" />
                <div class="shipping-option p-relative p-half-top p-half-bottom container-fluid">
                    <div class="row">
                        <i class="fa fa-check d-none p-absolute"></i>
                        <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
                            <img src="{{option.img_code | shipping_logo}}" class="img-responsive"/>
                        </div>
                        <p class="option-name col-xs-9 col-sm-9 col-md-8 col-lg-8 text-left">{{option.name}} - <strong>{{option.cost}}</strong></p>
                    </div>
                </div> 
        </label>
        {% if option.suboptions is not empty %}
            {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
        {% endif %}
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
