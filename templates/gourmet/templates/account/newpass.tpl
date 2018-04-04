{% snipplet "banner_products.tpl" %}
<div class="container">
    <div class="contenido">
        <div class="page-account container page">
            <div class="headerBox-Page row">
                <div class="headerBox-Page">
                    <h1>{{ (customer.password ? 'Cambiar Contraseña' : 'Activar Cuenta') | translate }}</h1>
                </div>
            </div>
            <div class="account-form-wrapper span6 offset3 sst">
                <form action="" method="post" class="form-horizontal">
                    {% if failure %}
                        <div class="bg-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
                    {% endif %}
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="password">{{ 'Contraseña' | translate }}</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="password" name="password" id="password" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="password_confirm">{{ 'Confirmar Contraseña' | translate }}</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="password" name="password_confirm" id="password_confirm" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-5">
                            <button class="btn-lg agregar" type="submit">{{ (customer.password ? 'Cambiar contraseña' : 'Activar cuenta')  | translate }}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>