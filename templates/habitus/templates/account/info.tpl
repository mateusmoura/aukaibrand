<div class="page-account container page">
    <div class="headerBox-Page row">
        <div class="col-md-8 col-sm-8 col-xs-12">
            <h1>{{ "Mi cuenta" | translate }}</h1>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
    <hr class="featurette-divider">
    <div class="account-form-wrapper span5 offset3 sst">
        <form action="" method="post" class="form-horizontal">
            {% if result.errors.name %}
                <div class="bg-danger c">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            {% if result.errors.email == 'exists' %}
                <div class="bg-danger c">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="bg-danger c">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label class="control-label col-sm-4" for="name">{{ 'Nombre' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="name" id="name" value="{{ result.name | default(customer.name) }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">{{ 'Email' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-5">
                    <input class="btn btn-primary btn-lg" type="submit" value="{{ 'Guardar Cambios' | translate }}" />
                </div>
            </div>
        </form>
    </div>
</div>