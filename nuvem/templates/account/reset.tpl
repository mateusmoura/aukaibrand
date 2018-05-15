<section class="section-reset">
    <div class="container-fluid">
        {% snipplet "breadcrumbs.tpl" %}
    </div>

    <div class="container">
        <div class="row">
            <div class="section-reset__form">
                <form action="" method="post" class="form-horizontal">
                    <h1>
                        {{ "Cambiar Contraseña" | translate }}

                        <small class="text-muted">{{ 'Te enviaremos un email para que puedas cambiar tu contraseña.' | translate }}</small>
                    </h1>

                    {% if failure %}
                        <div class="col-12">
                            <div class="alert alert-danger" role="alert">{{ 'No existe ningún cliente con el email ingresado.' | translate }}</div>
                        </div>
                    {% elseif success %}
                        <div class="col-12">
                            <div class="alert alert-success" role="alert">{{ 'Te enviamos un email a {1}' | translate(email) }}</div>
                        </div>
                    {% endif %}
                    <div class="col-12">
                        <div class="form-group">
                            <label for="email">{{ 'Email' | translate }}</label>
                            <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" />
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="control-group">
                            <button type="submit" class="btn btn-dark btn-block">{{ 'Enviar email' | translate }}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


{#

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

#}
