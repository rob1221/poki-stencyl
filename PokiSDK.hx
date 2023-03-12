typedef PokiSDK = {
	#if js
	function init():Dynamic;
	function gameplayStart():Void;
	function gameplayStop():Void;
	function commercialBreak():Dynamic;
	function rewardedBreak():Dynamic;
	function captureError(error:String):Void;
	#end
}
