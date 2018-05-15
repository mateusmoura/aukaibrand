<section class="section-login">
    <div class="container-fluid">
        {% snipplet "breadcrumbs.tpl" %}
    </div>

    <div class="container">
        <div class="row">
            <div class="section-login__form">
                <form id="login-form" action="" method="post" class="form-horizontal">
                    <h1>{{ "Login" | translate }}</h1>

                    {% if not result.facebook and result.invalid %}
                        <div class="col-12">
                            <div class="alert alert-danger" role="alert">{{ 'El email o la contraseña son incorrectos.' | translate }}</div>
                        </div>
                    {% elseif result.facebook and result.invalid %}
                        <div class="col-12">
                            <div class="alert alert-danger" role="alert">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
                        </div>
                    {% endif %}
                    {% if store_fb_app_id %}
                        <div class="col-12">
                            <i class="fa fa-facebook"></i>
                            <input class="button facebook" type="button" value="Facebook Login" onclick="loginFacebook();" />
                            <span class="badge">{{ 'o' | translate }}</span>
                            <hr class="featurette-or-divider"></hr>
                        </div>
                    {% endif %}
                    <div class="col-12">
                        <div class="form-group">
                            <label for="email">{{ 'Email' | translate }}</label>
                            <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label for="password">{{ 'Contraseña' | translate }}</label>
                            <input class="form-control" placeholder="{{ 'Contraseña' | translate }}" type="password" name="password" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="control-group">
                            <button type="submit" class="btn btn-dark btn-block">{{ 'Iniciar sesión' | translate }}</button>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="actions">
                            <a class="btn btn-link" href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a>
                            <span>{{ 'Ainda não tem uma conta?' | translate }} <a class="btn btn-link" href="{{ store.customer_register_url }}">{{ 'Cadastrar' | translate }}</a></span>
                            <a class="btn btn-link" href="/">{{ 'Continuar comprando' | translate }}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

