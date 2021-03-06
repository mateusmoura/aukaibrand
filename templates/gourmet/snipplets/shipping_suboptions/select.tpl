{% set selected_option = loop.first or cart.shipping_option == option.name %}
<div class="shipping-suboption col-xs-12 col-sm-12 col-md-12 col-lg-12 {{suboptions.name}}" {% if not selected_option %}style="display:none;"{% endif %}>
    {% if suboptions.options %}
        <select class="form-control {% if selected_option and suboptions.required %}required{% endif %}" name="{{suboptions.name}}">
            <option {% if not suboptions.selected %}selected{% endif %} disabled>{{ suboptions.default_option | translate }}</option>
            {% for option in suboptions.options %}
                <option value="{{option.value}}">{{ option.name }}</option>
            {% endfor %}
        </select>
    {% else %}
        <input type="hidden" name="{{suboptions.name}}"/>
        <div>{{ suboptions.no_options_message | translate }}</div>
    {% endif %}
</div>