{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
    <h1 class="title">{{ "Login" | translate }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <form id="login-form" action="" method="post">
            {% if not result.facebook and result.invalid %}
                <div class="error">{{ 'O email ou a senha estão errados. Por favor verifique.' | translate }}</div>
            {% elseif result.facebook and result.invalid %}
                <div class="error">{{ 'Ocorreu um problema fazendo login com Facebook.' | translate }}</div>
            {% endif %}
            {% if store_fb_app_id %}
                 <div class="span4">
                    <input class="submit_button facebook" type="button" value="{{ 'Facebook login' | translate }}" onclick="loginFacebook();" />
                </div>
                 <div class="span4 text-center">
                    <span class="badge">{{ 'ou' | translate }}</span>
                </div>
            {% endif %}
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="password">{{ 'Senha' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="password" name="password" />
                    <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ 'Esqueceu sua Senha?' | translate }}</a></small>
                </div>
            </div>
            <div class="button">
                <input type="submit" name="submit" value="{{ 'Login' | translate }}" />
            </div>
        </form>
    </div>
</div>
