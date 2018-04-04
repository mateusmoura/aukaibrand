<div class="container">
    <div class="page-header-container container">
        <div class="col-md-8 col-sm-12 col-xs-12 page-header">
            <h1>{{ "Mi cuenta" | translate }}</h1>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-xs hidden-sm">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
    <div class="account-form-wrapper float-none div-center col-md-6 col-sm-11 col-xs-11 margin-top-x2 margin-bottom-x2">
        <form action="" method="post" class="form-horizontal">
            {% if result.errors.name %}
                <div class="alert alert-error">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-error">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="alert alert-error">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input type="text" name="name" id="name" class="form-control" value="{{ result.name | default(customer.name) }}" />
            </div>
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocorrect="off" autocapitalize="off" class="form-control" type="email" name="email" value="{{ result.email | default(customer.email) }}" />
            </div>
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <input type="text" name="phone" id="phone" class="form-control" value="{{ result.phone | default(customer.phone) }}" />
            </div>
            <div class="form-group">
                <input class="btn btn-secondary col-md-12 col-sm-12 col-xs-12" type="submit" value="{{ 'Guardar cambios' | translate }}" />
            </div>
        </form>
    </div>
</div>
