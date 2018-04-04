window.tiendaNubeInstaTheme = (function($) {
	return {
		waitFor: function() {
			return [window.homeSlider];
		},
		handlers: function(instaElements) {
			return {
				logo: new instaElements.Logo({
					$storeName: $('#no-logo-wrapper'),
					$logo: $('.logo.img')
				}),
				slider: new instaElements.Slider(window.homeSlider),
				slider_auto: new instaElements.AutoSliderCheckbox({
					slider: 'slider'
				})
			};
		}
	};
})(jQuery);