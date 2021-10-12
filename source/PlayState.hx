package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	var player:Player;

	override public function create()
	{
		super.create();

		player = new Player();
		add(player);
		add(player.trail);
	}

	override public function update(elapsed:Float)
	{
		FlxSpriteUtil.bound(player, 0, FlxG.width, 0, FlxG.height);

		super.update(elapsed);
	}
}
