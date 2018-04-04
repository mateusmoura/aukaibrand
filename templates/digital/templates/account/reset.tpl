{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
    <h1 class="title">{{ "Mudar Minha Senha" | translate }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <p class="st c">{{ 'Será enviado um email para que você possa alterar a sua senha.' | translate }}</p>
        <form action="" method="post">
            {% if failure %}
                <div class="error">{{ 'Não existe nenhum cliente cadastrado com o email informado.' | translate }}</div>
            {% elseif success %}
                <div class="success">{{ 'Enviamos um email para {1}' | translate(email) }}</div>
            {% endif %}
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" />
                </div>
            </div>
            <div class="button">
                <input type="submit" name="submit" value="{{ 'Enviar email' | translate }}" />
            </div>
        </form>
    </div>
</div>
