<div class="row-fluid">
    <div class="container">
        <div class="headerBox-List">
            <div class="span8">
                <h1>{{ "Mi cuenta" | translate }}</h1>
            </div>
            <div class="span4 breadcrumbs-wrapper">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="account-form-wrapper span5 offset3 sst">
            <form action="" method="post" class="form-horizontal">
                {% if result.errors.name %}
                    <div class="st alert alert-error c">{{ 'Debes ingresar tu nombre!' | translate }}</div>
                {% endif %}
                {% if result.errors.email == 'exists' %}
                    <div class="st alert alert-error c">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
                {% elseif result.errors.email %}
                    <div class="st alert alert-error c">{{ 'Debes ingresar un email válido!' | translate }}</div>
                {% endif %}
                <div class="control-group">
                    <label class="control-label" for="name">{{ 'Nombre' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="name" id="name" value="{{ result.name | default(customer.name) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                    <div class="controls">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="submit_button" type="submit" value="{{ 'Guardar cambios' | translate }}" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
