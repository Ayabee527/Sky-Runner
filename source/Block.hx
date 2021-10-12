package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Block extends FlxSprite
{
	override public function new(x:Float, y:Float, w:Int, h:Int)
	{
		super(x, y);
		makeGraphic(w, h, FlxColor.CYAN);
		immovable = true;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
