import com.stencyl.loader.SiteLock;

class PokiSiteLock extends SiteLock
{
	public function new()
	{
		super();
	}

	public override function checkSiteLock()
	{
		#if (!skipPoki)
		StencylPoki.pokiSDK = untyped __js__ ("PokiSDK");

		untyped __js__
		('
			PokiSDK.init().then(
				() => {
		');
		
		trace("PokiSDK initialized");
		pokiSdkLoaded();
		
		untyped __js__
		('
			}   
			).catch(
				() => {
		');
		
		trace("Adblock enabled");
		StencylPoki.adBlock = true;
		pokiSdkLoaded();
		
		untyped __js__('});');
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