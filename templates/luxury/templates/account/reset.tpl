<div class="row-fluid">
    <div class="container">
        <div class="headerBox-List">
            <div class="span8">
                <h1>{{ "Cambiar Contraseña" | translate }}</h1>
            </div>
            <div class="span4 breadcrumbs-wrapper">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="account-form-wrapper span6 offset3">
            <p class="st ssb">{{ 'Te enviaremos un email para que puedas cambiar tu contraseña.' | translate }}</p>
            <form action="" method="post" class="form-horizontal">
                {% if failure %}
                    <div class="st alert alert-error">{{ 'No existe ningún cliente con el email ingresado.' | translate }}</div>
                {% elseif success %}
                    <div class="st alert alert-success">{{ 'Te enviamos un email a {1}' | translate(email) }}</div>
                {% endif %}
                <div class="control-group">
                    <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                    <div class="controls">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="submit_button" type="submit" value="{{ 'Enviar email' | translate }}" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
