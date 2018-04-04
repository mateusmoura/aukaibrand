<div class="row-fluid">
    <div class="container account-container">
        <div class="headerBox-List">
            <div class="path">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
            <div class="titles">
                <h1>{{ "Mi cuenta" | translate }}</h1>
            </div>            
        </div>
        <div class="account-form-wrapper span6 offset3 sst">
            <form action="" method="post" class="form-horizontal">
                {% if result.errors.name %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
                {% endif %}
                {% if result.errors.address %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu dirección!' | translate }}</div>
                {% endif %}
                {% if result.errors.number %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu número!' | translate }}</div>
                {% endif %}
                {% if result.errors.floor %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu piso!' | translate }}</div>
                {% endif %}
                {% if result.errors.locality %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu localidad!' | translate }}</div>
                {% endif %}
                {% if result.errors.zipcode %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu código postal!' | translate }}</div>
                {% endif %}
                {% if result.errors.city %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu ciudad!' | translate }}</div>
                {% endif %}
                {% if result.errors.province %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu provincia!' | translate }}</div>
                {% endif %}
                {% if result.errors.country %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu país!' | translate }}</div>
                {% endif %}
                {% if result.errors.phone %}
                    <div class="alert alert-danger">{{ 'Debes ingresar tu teléfono!' | translate }}</div>
                {% endif %}
                <div class="control-group">
                    <label class="control-label" for="name">{{ 'Nombre' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="name" id="name" value="{{ result.name | default(address.name) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="address">{{ 'Dirección' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="address" id="address" value="{{ result.address | default(address.address) }}" />
                    </div>
                </div>
                {% if current_language.country == 'BR' %}
                    <div class="control-group">
                        <label class="control-label" for="number">{{ 'Número' | translate }}</label>
                        <div class="controls">
                            <input type="text" name="number" id="number" value="{{ result.number | default(address.number) }}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="floor">{{ 'Piso' | translate }}</label>
                        <div class="controls">
                            <input type="text" name="floor" id="floor" value="{{ result.floor | default(address.floor) }}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="locality">{{ 'Localidad' | translate }}</label>
                        <div class="controls">
                            <input type="text" name="locality" id="locality" value="{{ result.locality | default(address.locality) }}" />
                        </div>
                    </div>
                {% endif %}
                <div class="control-group">
                    <label class="control-label" for="zipcode">{{ 'Código Postal' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="zipcode" id="zipcode" value="{{ result.zipcode | default(address.zipcode) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="city">{{ 'Ciudad' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="city" id="city" value="{{ result.city | default(address.city) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="province">{{ 'Provincia' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="province" id="province" value="{{ result.province | default(address.province) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="country">{{ 'País' | translate }}</label>
                    <div class="controls">
                        <select name="country" id="country">{{ country_options }}</select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="phone">{{ 'Teléfono' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="phone" id="phone" value="{{ result.phone | default(address.phone) }}" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="submit_button send" type="submit" value="{{ 'Guardar cambios' | translate }}" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
