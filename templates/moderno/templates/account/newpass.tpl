<div id="content" class="single">
    {% snipplet "breadcrumbs.tpl" %}
    <h1 class="title ssb">{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta') | translate }}</h1>
    <div class="account-form-wrapper">
        <form action="" method="post">
            {% if failure %}
                <div class="st error c">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password" id="password" />
                </div>
            </div>
            <div class="field">
                <div class="span1">
                    <label for="password_confirm">{{ 'Confirmar Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password_confirm" id="password_confirm" />
                </div>
            </div>

            <input class="submit_button" type="submit" value="{{ (customer.password ? 'Cambiar contraseña' : 'Activar cuenta')  | translate }}" />
        </form>
    </div>
</div>
