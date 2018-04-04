<div class="row-fluid">
    <div class="container account-container">
        <div class="headerBox-List">
            <div class="path">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
            <div class="titles">
                <h1>{{ 'Cambiar Contraseña' | translate }}</h1>
            </div>
        </div>

        <div class="account-form-wrapper span6 offset3">
            <form action="" method="post" class="form-horizontal">
                {% if failure %}
                    <div class="st alert alert-error">{{ 'No existe ningún cliente con el email ingresado.' | translate }}</div>
                {% elseif success %}
                    <div class="st alert alert-success">{{ 'Te enviamos un email a {1}' | translate(email) }}</div>
                {% endif %}
                <p class="st ssb">{{ 'Te enviaremos un email para que puedas cambiar tu contraseña.' | translate }}</p>

                <div class="control-group">
                    <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                    <div class="controls">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="submit_button send" type="submit" value="{{ 'Enviar email' | translate }}" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
