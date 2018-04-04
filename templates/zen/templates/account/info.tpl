<div class="page-content">
    <div class="headerBox-Page">
        <h1>{{ "Mi cuenta" | translate }}</h1>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="container-fluid">
        <div class="account-form-wrapper span7 offset4">
            <form action="" method="post" class="contact_form">
                {% if result.errors.name %}
                    <div class="st error c">{{ 'Debes ingresar tu nombre!' | translate }}</div>
                {% endif %}
                {% if result.errors.email == 'exists' %}
                    <div class="st error c">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
                {% elseif result.errors.email %}
                    <div class="st error c">{{ 'Debes ingresar un email válido!' | translate }}</div>
                {% endif %}
                <div class="field">
                    <div class="span1">
                        <label for="name">{{ 'Nombre' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input type="text" name="name" id="name" value="{{ result.name | default(customer.name) }}" />
                    </div>
                </div>
                <div class="field">
                    <div class="span1">
                        <label for="email">{{ 'Email' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" />
                    </div>
                </div>
                <div class="field">
                    <div class="span1">
                        <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" />
                    </div>
                </div>
                <input class="submit_button" type="submit" value="{{ 'Guardar Cambios' | translate }}" />
            </form>
        </div>
    </div>
</div>
