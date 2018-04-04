$(document).ready(function() {
	//Navigation sizer
	var navHeight = parseInt($("#nav").css('height', 'auto').height());
	var fontSize = parseInt($("#nav li").css('font-size'));
	
	while (navHeight > 70 && fontSize > 0){ 
		$("#nav li").css('font-size', --fontSize);
		navHeight = parseInt($("#nav").height());
	}
});