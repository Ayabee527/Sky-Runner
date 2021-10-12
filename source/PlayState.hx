package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	var player:Player;
	var platform:Block;

	override public function create()
	{
		super.create();

		player = new Player();
		add(player);
		add(player.trail);
	}

	function jump()
	{
		var up = FlxG.keys.anyJustPressed([UP, W, SPACE]);

		if (up)
		{
			player.velocity.y = -player.gravity / 2;
		}
	}

	override public function update(elapsed:Float)
	{
		FlxSpriteUtil.screenWrap(player);

		if (FlxG.keys.justPressed.X)
		{
			platform = new Block(player.x - 2, player.y + player.height, Std.int(player.width + 4), 2);
			add(platform);
			player.acceleration.set(0, player.acceleration.y);
		}
		if (FlxG.keys.pressed.X)
		{
			FlxG.collide(player, platform);
		}
		if (FlxG.keys.justReleased.X)
		{
			remove(platform);
		}

		if (player.isTouching(FlxObject.FLOOR))
			jump();

		super.update(elapsed);
	}
}
