package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MainMenu extends FlxState
{
	override public function create()
	{
		super.create();

		add(text(['Sky', 'Runner'], FlxColor.CYAN, FlxColor.BLUE, 32, FlxG.height / 4));
	}

	public static function text(texts:Array<String>, col:FlxColor = FlxColor.WHITE, shadCol:FlxColor = FlxColor.GRAY, size:Int = 24, initY:Float = 150)
	{
		var group = new FlxTypedGroup<FlxText>();

		var last = new FlxText(0, 0, 0, " ", size);
		last.x = (FlxG.width / 2) - (last.width / 2);
		last.y = initY - (last.height / 2);
		group.add(last);

		for (word in texts)
		{
			var t = new FlxText(0, 0, 0, word, size);
			t.x = (FlxG.width / 2) - (t.width / 2);
			t.y = (last.y + last.height) - (t.height / 2) + 15;
			t.color = col;
			t.setBorderStyle(FlxTextBorderStyle.SHADOW, shadCol, size / 4);
			group.add(t);
			last = t;
		}

		return group;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
