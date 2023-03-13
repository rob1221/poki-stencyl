#if js
import js.lib.Promise;
#end

typedef PokiSDK = {
	#if js
	function init():Promise<Void>;
	function gameLoadingFinished():Void;
	function gameplayStart():Void;
	function gameplayStop():Void;
	function commercialBreak():Promise<Void>;
	function rewardedBreak():Promise<Bool>;
	function captureError(error:String):Void;
	#end
}
