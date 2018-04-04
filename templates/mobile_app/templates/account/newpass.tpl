<div class="row-fluid">
    <div class="container">
        <div class="page-header-container container">
            <div class="col-md-8 col-sm-12 col-xs-12 page-header">
                <h1>{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta') | translate }}</h1>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-phone hidden-tablet">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="account-form-wrapper span6 offset3 sst">
            <form action="" method="post" class="form-horizontal">
                {% if failure %}
                    <div class="st alert alert-error">{{ 'Las contraseñas no coinciden.' | translate }}</div>
                {% endif %}
                <div class="control-group">
                    <label class="control-label" for="password">{{ 'Contraseña' | translate }}</label>
                    <div class="controls">
                        <input type="password" name="password" id="password" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password_confirm">{{ 'Confirmar Contraseña' | translate }}</label>
                    <div class="controls">
                        <input type="password" name="password_confirm" id="password_confirm" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="submit_button" type="submit" value="{{ (customer.password ? 'Cambiar contraseña' : 'Activar cuenta')  | translate }}" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
