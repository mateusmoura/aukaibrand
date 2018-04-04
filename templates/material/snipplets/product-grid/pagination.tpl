{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{#  This will replace the standard pagination if infinite scrolling is active  #}
{% if settings.infinite_scrolling and not pages.is_last and products%}
    <div class="load-more-container clear-both m-bottom text-center col-xs-12 col-sm-12 {% if template == 'category' and show_sidebar %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% else %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% endif %}">
        <a id="loadMoreBtn" class="btn btn-info btn-block m-top m-bottom">
        	<span>{{ 'Mostrar más productos' | t }}</span>
		    <div class="spinner loadingSpin pull-right">
		        <div class="spinnerContainer active common full-height full-width">
		            <div class="spinner-layer layer-1 common full-height full-width p-absolute">
		                <div class="circle-clipper left common">
		                    <div class="circle common"></div>
		                </div><div class="gap-patch common full-height"><div class="circle common"></div></div><div class="circle-clipper right common full-height"><div class="circle common full-height"></div>
		                </div>
		            </div>
		        </div>
		    </div>
        </a>
    </div>
{% endif %}
{# Standard pagination #}
<div class="pagination-container text-center clear-both m-bottom">
    <ul class='pagination'>
		{% if pages.numbers %}
			{% if pages.previous %}
				<li>
		        	<a href="{{ pages.previous }}" aria-label="Previous" class="arrow">
		        		<span aria-hidden="true"><i class="material-icons">&#xE314;</i></span>
		        	</a>
	        	</li>
		    {% endif %}
		    {% for page in pages.numbers %}
			 	{% if page.selected %}
				 	<li class="active">
				 		<a>{{ page.number }}</a>
				 	</li>
			 	{% else %}
			 		<li>
			 			<a href="{{ page.url }}">{{ page.number }}</a>
			 		</li>
			 	{% endif %}
			{% endfor %}
			{% if pages.next %}
				<li>
			      <a href="{{ pages.next }}" aria-label="Next" class="arrow">
			        <span aria-hidden="true"><i class="material-icons">&#xE315;</i></span>
			      </a>
			    </li>
			{% endif %}
		{% endif %}
    </ul>
</div>

