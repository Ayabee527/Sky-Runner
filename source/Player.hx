package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.effects.FlxTrail;

class Player extends FlxSprite
{
	var gravity:Float = 600;
	var vel:Float = 400;

	public var trail:FlxTrail;

	override public function new(x:Float = 100, y:Float = 100)
	{
		super(x, y);

		makeGraphic(16, 24);

		acceleration.y = gravity;
		drag.y = 3 * gravity / 2;
		drag.x = 3 * vel / 2;
		maxVelocity.y = vel;
		maxVelocity.x = vel / 2;

		trail = new FlxTrail(this, null, 15, 0, 0.6, 0.1);
	}

	function move()
	{
		var up = FlxG.keys.anyJustPressed([UP, W, SPACE]);
		var left = FlxG.keys.anyPressed([A, LEFT]);
		var right = FlxG.keys.anyPressed([D, RIGHT]);
		var down = FlxG.keys.anyPressed([S, DOWN]);

		if (up)
		{
			velocity.y = -gravity / 2;
		}
		else if (down)
		{
			velocity.y = gravity;
		}

		if (left)
		{
			acceleration.x = -vel;
		}
		else if (right)
		{
			acceleration.x = vel;
		}
		else
		{
			acceleration.x = 0;
		}
	}

	override function update(elapsed:Float)
	{
		move();

		super.update(elapsed);
	}
}
