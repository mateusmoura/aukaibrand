{#
<div class="row-fluid">
	<div class="container">
        <div class="headerBox-Page">
            <div class="span12">
                <h1>{{ page.name }}</h1>
            </div>
        </div>
	</div>
</div>
#}


<div class="page-{{ page.id }}">
    {% if (page.id == "228742") or (page.id == "228955") or (page.id == "228956") or (page.id == "228957") or (page.id == "228958") or (page.id == "228959") %}
        <div class="page-institutional">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="page-institutional__title">
                            <h1>{{ page.name }}</h1>
                        </div>

                        <div class="page-institutional__content">
                            {{ page.content }}
                        </div>
                        
                    </div>

                    <div class="col-12">
                        <div class="page-institutional__sidebar">
                            {% snipplet "institutional/menu.tpl" %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {% else %}
        {{ page.content }}
    {% endif %}
</div>

{#
<div class="row-fluid">
	<div class="container" id="content-page">
        
        {% if "foto-nosotros.jpg" | has_custom_image %}
            <div class="span6">
                {% if settings.foto_nosotros_url != '' %}
                    {{ "foto-nosotros.jpg" | static_url | img_tag | a_tag(settings.foto_nosotros_url) }}
                {% else %}
                    {{ "foto-nosotros.jpg" | static_url | img_tag }}
                {% endif %}
            </div>
            <div class="span6">
            	<div class="user-content">
            		{{ page.content }}
                </div>
            </div>
        {% else %}
        <div class="span8 offset2">
            <div class="user-content">
                {{ page.content }}
            </div>
		</div>
        {% endif %}

        
    </div>
</div>
#}