package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{

	var sprite:FlxSprite;
	override public function create():Void
	{
		super.create();

		sprite = new FlxSprite(FlxG.width * 0.5 - 8, FlxG.height * 0.5 - 8);
		sprite.makeGraphic(16, 16, FlxColor.GREEN);
		sprite.angularVelocity = 40;
		add(sprite);
	}

	var move:Bool = true;
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.M)
		{
			move = !move;
		}

		if(!move)
		{
			sprite.angularVelocity = 0;
		}
		else
		{
			sprite.angularVelocity = 40;
		}
	}
}
