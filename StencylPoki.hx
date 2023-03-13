import com.stencyl.Extension;

class StencylPoki extends Extension
{
	public static var pokiSDK:PokiSDK;
	public static var stopped:Bool = true;
	public static var adBlock:Bool = false;

	public function new()
	{
		super();
	}

	public override function initialize()
	{
		#if (js && !skipPoki)
		pokiSDK.gameLoadingFinished();
		#end
	}

	#if (js && !skipPoki)
	public static function gameplayStart()
	{
		if (!stopped)
		{
			trace("Gameplay already started.");
			return;
		}
		pokiSDK.gameplayStart();
		stopped = false;
	}
	
	public static function gameplayStop()
	{
		if (stopped)
		{
			trace("Gameplay already stopped.");
			return;
		}
		pokiSDK.gameplayStop();
		stopped = true;
	}
	
	public static function commercialBreak(callbackFn:Void->Void)
	{
		pokiSDK.commercialBreak().then(
			function(_) {
				if (callbackFn == null)
				{
					trace("Commercial Break finished");
				}
				else
				{
					callbackFn();
				}
			}
		);
	}
	
	public static function rewardedBreak(callbackFn:Bool->Void)
	{
		pokiSDK.rewardedBreak().then(
			function(withReward:Bool) {
				if (callbackFn == null)
				{
					trace('Show reward = $withReward');
				}
				else
				{
					callbackFn(withReward);
				}
			}
		);
	}
	
	public static function happyTime(intensity:Float)
	{
		// Happy time was deprecated by Poki.
	}
	
	public static function captureError(error:String)
	{
		pokiSDK.captureError(error);
	}
	
	#else
	// avoids compilation errors on non-HTML5 platforms
	public static function gameplayStart(){};
	public static function gameplayStop(){};
	public static function happyTime(intensity:Float){};
	public static function captureError(error:String){};
	
	public static function commercialBreak(callbackFn:Void->Void)
	{
		if (callbackFn != null)
		{
			callbackFn();
		}
	}
	
	public static function rewardedBreak(callbackFn:Bool->Void)
	{
		if (callbackFn != null)
		{
			callbackFn(true);
		}
	}
	#end
}