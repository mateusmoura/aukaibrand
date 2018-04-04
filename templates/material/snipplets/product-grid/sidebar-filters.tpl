{% set default_lang = current_language.lang %}
{% set filter_colors = insta_colors|length > 0 %}
{% set filter_more_colors = other_colors|length > 0 %}
{% set filter_sizes = size_properties_values|length > 0 %}
{% set filter_other = variants_properties|length > 0 %}

{% if default_lang == 'pt' %}
    {% set color_name = 'Cor' %}
    {% set size_name = 'Tamanho' %}
{% endif %}
{% if default_lang == 'es' %}
    {% set color_name = 'Color' %}
    {% set size_name = 'Talle' %}
{% endif %}
{% if default_lang == 'en' %}
    {% set color_name = 'Color' %}
    {% set size_name = 'Size' %}
{% endif %}

<div id="filters-column">   
    <div id="toggle-filters"> 
        {% if filter_colors %}
            <div class="filter-container m-bottom">
                <h4>{{ 'Color' | translate }}</h4>
                {% for name,color in insta_colors %}
                    <button type="button"
                            class="color-filter btn btn-default"
                            style="background-color: {{ color[name] }};"
                            title="{{ name }}"
                            onclick="LS.urlAddParam('{{ color_name|replace("'","%27") }}', '{{ name|replace("'","%27") }}');">
                    </button>
                {% endfor %}
            </div>
        {% endif %}
        {% if filter_more_colors %}
            <div class="filter-container m-bottom">
                {% if filter_colors %}
                    <h4>{{ 'Más colores' | translate }}</h4>
                {% else %}
                    <h4>{{ 'Color' | translate }}</h4>
                {% endif %}
                {% for color in other_colors %}
                    <button type="button"
                            class="size-filter btn btn-default m-half-bottom m-half-right"
                            onclick="LS.urlAddParam('{{ color_name|replace("'","%27") }}', '{{ color|replace("'","%27") }}');">{{ color }}
                    </button>
                {% endfor %}
            </div>
        {% endif %}
        {% if filter_sizes %}
            <div class="filter-container m-bottom">
                <h4>{{ 'Talle' | translate }}</h4>
                {% for size in size_properties_values %}
                    <button type="button"
                            class="size-filter btn btn-default m-half-bottom m-half-right"
                            onclick="LS.urlAddParam('{{ size_name|replace("'","%27") }}', '{{ size|replace("'","%27") }}');">{{ size }}
                    </button>
                {% endfor %}
            </div>
        {% endif %}

        {% for variants_property in variants_properties %}
            {% if filter_other %}
                <div class="filter-container m-bottom">
                    <h4>{{ variants_property }}</h4>
                    {% for value in variants_properties_values[variants_property] %}
                        <button type="button"
                                class="other-filter btn btn-default m-half-bottom m-half-right"
                                onclick="LS.urlAddParam('{{ variants_property|replace("'","%27") }}', '{{ value|replace("'","%27") }}');">{{value}}
                        </button>
                    {% endfor %}
                </div>
            {% endif %}
        {% endfor %}
    </div>
</div>