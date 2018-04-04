<div id="contact-page" class="container">	
    {% snipplet "page-header.tpl" with page_header_title =  "Contacto" | translate  %}
    <div class="row">
        <div class="contact-info-container col-xs-12 col-sm-12 col-md-6 col-lg-6 m-top">
            {% include 'snipplets/contact/contact-info.tpl' %}
        </div>   
        <div class="contact-form-container col-xs-12 col-sm-12 col-md-6 col-lg-6 m-top">
            {% include 'snipplets/contact/contact-form.tpl' %}
        </div>
    </div>
</div>

{#  **** Banners ****  #}

{% if "banner-contact.jpg" | has_custom_image %}
    {% include 'snipplets/banners/banner-contact.tpl' %}  
{% endif %}
