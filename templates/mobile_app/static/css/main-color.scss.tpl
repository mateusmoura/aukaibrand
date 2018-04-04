$primary: #0AB1CA;
$contrast: white;
$grey:rgb(132, 132, 132);
 
$primary-darker: darken( $primary, 5% ); 

$opac1: 0.1;
$opac2: 0.2;
$opac4: 0.4;
$opac6: 0.6;
$opac8: 0.8;


.btn.btn-secondary{
    background: $primary;
}
.main-bg-color{
   background: $primary; 
}
.main-fg-color{
   color: $primary; 
}
.main-bg-color-darker{
   background: $primary-darker; 
}
.contrast-bg-color{
  background: white;
}
.contrast-fg-color{
  color: white;  
}
.grey-bg-color{
   color: rgb(132, 132, 132); 
}
.btn.btn-tertiary, .account-btn a{
  color: $primary;
  border: 2px solid $primary;
}
.btn.btn-tertiary a, .account-btn a{
  color: $primary;
}
.descriptioncolContent .installments strong, .max_installments strong{
  color: $primary;	
}
#shoppingCartPage #shipping-calculator .shipping-option i{
  color:$primary;
}
#shoppingCartPage #shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border:2px solid $primary;
 }
 .nav-tabs > li.active a, 
 .paradeiser .anchor-selected,
 .mobile-dropdown.dropdown-selected i,
 #ls_cart_widget .cart-summary #cart-widget-container:hover .fa-shopping-cart,
 #ls_cart_widget .cart-summary #cart-widget-container:hover{
  color:$primary;
}
@media (max-width: 990px){
#auth a{
   color:$primary; 
}
}