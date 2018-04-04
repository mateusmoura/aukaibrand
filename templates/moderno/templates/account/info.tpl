<div id="content" class="single">
    {% snipplet "breadcrumbs.tpl" %}
    <h1 class="title ssb">{{ "Mi Cuenta" | translate }}</h1>
    <div class="account-form-wrapper">
        <form action="" method="post">
            {% if result.errors.name %}
                <div class="error">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            {% if result.errors.email == 'exists' %}
                <div class="error">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="error">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="oh">
                <div class="span1">
                    <label for="name">{{ 'Nombre' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="name" id="name" value="{{ result.name | default(customer.name) }}" />
                </div>
            </div>
            <div class="oh">
                <div class="span1">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="span3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" />
                </div>
            </div>
            <div class="oh">
                <div class="span1">
                    <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" />
                </div>
            </div>
            
            <input class="submit_button" type="submit" value="{{ 'Guardar cambios' | translate }}" />
        </form>
    </div>
</div>
