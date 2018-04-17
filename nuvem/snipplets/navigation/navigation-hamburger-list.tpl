{% for item in navigation %}
    {% if not item.isRootCategory and not item.isHomePage  %}
	    {% if item.subitems %}
	    	<li class="hamburger-panel-item item-with-subitems p-relative">
	    		<div class="js-hamburger-panel-toggle-accordion">
		            <a class="hamburger-panel-link p-right-double" href="{{ item.url }}">
		                {{ item.name }}
		            </a>
		             <span class="hamburger-panel-arrow js-toggle-page-accordion"><i class="fa fa-lg fa-chevron-down p-all-half hamburger-panel-arrow-icon"></i></span> 
		         </div>
 				<ul class="js-pages-accordion hamburger-panel-accordion hamburger-panel-list" style="display:none;">
					{% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems %}
				</ul>
			</li>
		{% else %}
			 <li class="hamburger-panel-item">
	            <a class="hamburger-panel-link" href="{{ item.url }}">
	                {{ item.name }}</a>
	         </li>
		{% endif %}
    {% endif %}
{% endfor %}
