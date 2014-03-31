// Doesn't actually work.  If we want to deal with this, we need to find a replacement for $.browser
// if($.browser.mozilla||$.browser.opera)
// 	(function(){
// 	window.addEventListener('pageshow', PageShowHandler, false);
// 	window.addEventListener('unload', UnloadHandler, false);
// 		function PageShowHandler() {
// 				window.addEventListener('unload', UnloadHandler, false);
// 		}
// 		function UnloadHandler() {
// 				window.removeEventListener('beforeunload', UnloadHandler, false);
// 		}
// })()