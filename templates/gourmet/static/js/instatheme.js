window.tiendaNubeInstaTheme = (function($) {
	return {
		waitFor: function() {
			return [];
		},
		handlers: function(instaElements) {
			return {
				logo: new instaElements.Logo({
					$storeName: $('.no-logo'),
					$logo: $('.logo-wrapper')
				})
			};
		}
	};
})(jQuery);