This is an extension for the Poki.com SDK for HTML5 games that can be used by any developers approved by Poki.  If not already involved with Poki, you can check this page for more information: https://developers.poki.com/

This version of the extension requires Stencyl b11186 or later.  If using older Stencyl builds, check out the forum post here: https://community.stencyl.com/index.php/topic,59367.0.html


**[Start/Stop Gameplay]**  
Use this block to tell Poki when gameplay has started and stopped.

**[Start Commercial Break and then...]**  
Show a standard ad and then the blocks inside the wrapper will be triggered when the ad either finishes or fails to show.  Ad rate throttling is done automatically on Poki's end.

**[Start Rewarded Break and then...]**  
Show a rewarded ad and then the blocks inside the wrapper will be triggered when the ad either finishes or fails to show.  If the embedded reward boolean is true inside the wrapper, then the ad was shown correctly and the player should be rewarded.

**[Ad Block Detected]**  
Returns true if an ad blocker was detected by Poki when starting.

**[Capture Error]**  
Send an error message that can be viewed on the Poki developer site.


For more info, refer to the Poki Developer Guide here: https://sdk.poki.com/index.html

While not a part of this extension, Poki games need to be scalable on their site.  To enable automatic scaling, go to Settings > Advanced > OpenFL Settings and paste <window resizable="true" /> into that box.  Your game resolution will also need to be in the 16:9 aspect ratio.

If there are issues with the extension let me know either on here, the Stencyl Discord, or the Stencyl channel in the Poki Discord.
