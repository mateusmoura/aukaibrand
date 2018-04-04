{% set show_help = not has_products %}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{#  **** Newsletter Popup ****  #}

{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}

{#  **** If home has no content and is empty shows the content below ****  #}

{% set show_help = not (settings.slider | length) and not ("banner-home.jpg" | has_custom_image) and (not has_products or not sections.primary.products) %}

{#  **** Home Logo ****  #}

{% include 'snipplets/home/home-logo.tpl' %}


{% if show_help %}
	{% include 'snipplets/defaults/show_help.tpl' %}
{% else %}

	{# **** Welcome Message *** #}
	{% if settings.welcome_message %}
	    {% snipplet "home/welcome-message.tpl" %}
	{% endif %}

	{#  **** Home Slider ****  #}

	{% include 'snipplets/home/home-slider.tpl' %}
	
	{# *** Products Slider *** #}
	{% if sections.slider.products %}
		{% snipplet "home/home-products-slider.tpl" %}
	{% endif %}

	{#  **** Primary Products Grid ****  #}

	{% if sections.primary.products %}
		{% if categories %}
	     	{% include 'snipplets/home/home-categories.tpl' %}
		{% endif %}
	    {% include 'snipplets/home/primary-products.tpl' %}
	{% endif %} 

	{#  **** Facebook and Twitter widgets ****  #}
	{% if (settings.show_footer_fb_like_box and store.facebook) or settings.twitter_widget %}
	   {% include 'snipplets/home/social-widgets.tpl' %}  
	{% endif %}

	{#  **** Banners ****  #}

	{% if "banner-home.jpg" | has_custom_image %}
		{% include 'snipplets/banners/banner-home.tpl' %}  
	{% endif %}

{% endif %}

