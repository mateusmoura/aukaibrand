$base-text-color: {{ settings.text_color }};

#shoppingCartPage .cart-contents .productrow {
    border-bottom: 1px solid;
    border-color: rgba($base-text-color, .2 );
}

#shoppingCartPage .cart-contents .firstrow {
    border-bottom: 1px solid $base-text-color;
}

#shoppingCartPage .cart-contents .totals-container {
    border-bottom: 1px solid rgba($base-text-color, .7 );
    background: rgba($base-text-color, .2 );
}

/* FILTERS & CATEGORIES */
a.category-back {
    color: $base-text-color;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}