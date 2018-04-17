<div class="container">
    <div class="title-container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Mi cuenta" | translate }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        <form action="" method="post" class="col-sm-6 col-sm-offset-3 m-bottom">
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input class="form-control" type="text" name="name" id="name" value="{{ result.name | default(customer.name) }}" />
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" />
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-danger">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="alert alert-danger">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" />
            </div>
            <input class="btn btn-primary full-width-xs pull-right" type="submit" value="{{ 'Guardar cambios' | translate }}" />
        </form>
    </div>
</div>
