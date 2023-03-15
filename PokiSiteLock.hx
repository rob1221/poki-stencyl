import com.stencyl.loader.SiteLock;

class PokiSiteLock extends SiteLock
{
	public function new()
	{
		super();
	}

	public override function checkSiteLock()
	{
		#if (js && !skipPoki)
		StencylPoki.pokiSDK = js.Syntax.code("PokiSDK");

		StencylPoki.pokiSDK.init().then((_) -> {
			trace("PokiSDK initialized");
			pokiSdkLoaded();
		}).catchError((_) -> {
			trace("Adblock enabled");
			StencylPoki.adBlock = true;
			pokiSdkLoaded();
		});
		#else
		pokiSdkLoaded();
		#end
	}

	public function pokiSdkLoaded()
	{
		//Is this right? Can we assume that if we got to this point, the sitelock check passed?
		locked = false;
		onComplete.dispatch();
	}
}