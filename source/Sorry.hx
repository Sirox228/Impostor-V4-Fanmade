package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class Sorry extends MusicBeatState
{
	var sorry:FlxText;
	override function create()
	{
		#if desktop
		DiscordClient.changePresence("Sorry", null);
		#end
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		sorry = new FlxText(0, 0, FlxG.width,
			"Sorry\n
			I'm Merphi, I don't own all the art and songs\n
			I just tried to recreate a mod that will be out soon\n
			All rights to songs, art, etc. belong to Team Funktastic\n
			I spent over 300 hours of my time recreating the Impostor V4\n
			If you want to download the source code, then press B\n
			(Note from sirox) if you want to download source code of this port, press Y\n
			If you want to play the mod, then press A\n
			I hope you understand and enjoy what i did",
			32);
		sorry.setFormat("", 32, FlxColor.WHITE, CENTER);
		sorry.screenCenter(Y);
		add(sorry);
		#if mobileC
        addVirtualPad(NONE, A_B_Y);
        #end
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT) {
			FlxG.sound.play(Paths.sound('sus'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (controls.BACK) {
			CoolUtil.browserLoad('https://github.com/MerphiG/Impostor-V4-Fanmade');
		}
		if (controls.RESET) {
			CoolUtil.browserLoad('https://github.com/Sirox228/Impostor-V4-Fanmade');
		}
		super.update(elapsed);
	}
}
