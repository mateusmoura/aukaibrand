{% snipplet "banner_products.tpl" %}
<div class="container">
    <div class="contenido">
        <div class="page-account container page">
            <div class="headerBox-Page row">
                <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
                <div class="headerBox-Page">
                    <h1>{{ "Cambiar Contraseña" | translate }}</h1>
                </div>
            </div>
            <div class="account-form-wrapper span6 offset3">
                <p class="st ssb">{{ 'Te enviaremos un email para que puedas cambiar tu contraseña.' | translate }}</p>
                <form action="" method="post" class="form-horizontal">
                    {% if failure %}
                        <div class="bg-danger">{{ 'No existe ningún cliente con el email ingresado.' | translate }}</div>
                    {% elseif success %}
                        <div class="bg-success">{{ 'Te enviamos un email a {1}' | translate(email) }}</div>
                    {% endif %}
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="email">{{ 'Email' | translate }}</label>
                        <div class="col-sm-5">
                            <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-5">
                            <button class="btn-lg agregar" type="submit">{{ 'Enviar email' | translate }}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>