<div class="page-account container page">
    <div class="row">
        <div class="col-md-12">
            <div class="section-title bottom-0">
                <h1 class="title">{{ "Iniciar sesión" | translate }}</h1>
                <hr class="line" />
            </div>
        </div>
    </div>
    <ul class="breadcrumb-custom">
        {% snipplet "breadcrumbs.tpl" %}
    </ul>
    <div class="account-form-wrapper span6 offset3 sst">
        <form id="login-form" action="" method="post" class="form-horizontal">
             {% if not result.facebook and result.invalid %}
                <div class="col-sm-offset-4 col-sm-5">
                    <div class="bg-danger c">{{ 'El email o la contraseña son incorrectos.' | translate }}</div>
                </div>
            {% elseif result.facebook and result.invalid %}
                <div class="col-sm-offset-4 col-sm-5">
                    <div class="bg-danger c">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
                </div>
            {% endif %}
            {% if store_fb_app_id %}
                 <div class="col-sm-offset-4 col-sm-5 c">
                    <i class="fa fa-facebook"></i>
                    <input class="big-button big-product-related-button facebook" type="button" value="Facebook Login" onclick="loginFacebook();" />
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="featurette-or-divider"></hr>
                </div>
            {% endif %}
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">{{ 'Email' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="password">{{ 'Contraseña' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" type="password" name="password" />
                    <div class="help-block"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-5">
                    <input class="big-button big-product-related-button" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
                </div>
            </div>
        </form>
    </div>
</div>