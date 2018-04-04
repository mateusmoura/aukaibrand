{% paginate by 12 %}
{% set default_lang = current_language.lang %}
{% set filter_colors = insta_colors|length > 0 %}
{% set filter_more_colors = other_colors|length > 0 %}
{% set filter_sizes = size_properties_values|length > 0 %}
{% set filter_other = variants_properties|length > 0 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<div id="category-page">
    <div class="container">        
        {% if products %}
            <div class="page-header-container container">
                <div class="col-md-8 col-sm-12 col-xs-12 page-header">
                    <h1>{{ category.name }}</h1>
                </div>
                {% if category.id != 0 %}
                <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-phone hidden-tablet">
                    {% snipplet "breadcrumbs.tpl" %}
                </div>
                {% endif %}
            </div>
        {% endif %}   
        {% if products %}
            <div class="container row">
                {% if categories or variants_properties or filter_colors or filter_sizes %}
                    {% snipplet 'sidebar.tpl' %}
                {% endif %}
                <div class="category-body {% if categories or variants_properties or filter_colors or filter_sizes %}col-md-10 col-sm-10 {% else %}col-md-12 col-sm-12 {% endif %}col-xs-12">
                     <div class="col-md-4 col-sm-9 col-xs-9 sort-by-container">
                        {% snipplet 'sort_by.tpl' %}
                    </div>
                    <div class="col-sm-3 col-xs-3 change-grid main-bg-color">
                        <i class="fa fa-th-large"></i>
                        <i class="fa fa-square"></i>
                    </div>
                    <div class="product-table col-md-12 col-sm-12 col-xs-12">
                        {% snipplet "product_grid.tpl" %}
                    </div>
                    {% if not pages.is_last and products%}
                        <div class="col-md-12 col-xs-12 text-center loadMoreContainer margin-bottom-x2">
                            <a id="loadMoreBtn" class="btn btn-secondary col-md-6 col-sm-12 col-xs-12 float-none"><i class="fa fa-cog fa-spin loadingSpin"></i>{{ 'Mostrar más productos' | t }}</a>
                        </div>
                    {% endif %}
                    <div class="crumbPaginationContainer bottom">
                        <div class='pagination'>
                            {% snipplet "pagination.tpl" %}
                        </div>
                    </div>
                </div>
            </div>
        {% else %} 
            <div class="row">
                <div class="container">
                    <div class="error-box empty-store">
                        <p>{{ "Todavía no publicamos ningún producto" | translate }}</p>
                        <h1 class="main-fg-color">{{ "Volvé pronto para conocer nuestras ofertas" | translate }}</h1>
                        <h1>{{ "Muchas gracias" | translate }}</h1>
                    </div>
                </div>
            </div> 
        {% endif %} 
        </div>
    </div>
</div>

