<div class="count">
    <div class="produc-count">
        Items: {{ "{1}" | translate(cart.items_count ) }}
    </div>
    <div class="sub-acces">
        <div class="subtotal">
            Subtotal: {{ cart.total | money }}
        </div>
        <div class="acceso">
            Visualizar Minha Cestinha
        </div>
    </div>
</div>