<div class="page-account container page">
    <div class="row">
        <div class="col-md-12">
            <div class="section-title bottom-0">
                <h1 class="title">{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta') | translate }}</h1>
                <hr class="line" />
            </div>
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
                    <input class="big-button big-product-related-button" type="submit" value="{{ (customer.password ? 'Cambiar contraseña' : 'Activar cuenta')  | translate }}" />
                </div>
            </div>
        </form>
    </div>
</div>