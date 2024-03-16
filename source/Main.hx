package;

import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.FlxAssets.FlxShader;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, PlayState));
		final shader = new PixelPerfectShader();
		FlxG.game.setFilters([new ShaderFilter(shader)]);
		FlxG.game.stage.quality = StageQuality.LOW;
		FlxG.resizeWindow(640, 360);
		// FlxG.fullscreen = true;
	}
}

private class PixelPerfectShader extends FlxShader
{
	@:glFragmentSource('
	#pragma header
	
	uniform vec2 screenSize;
	void main()
	{
		gl_FragColor = flixel_texture2D(bitmap, floor(openfl_TextureCoordv * screenSize)/screenSize);
	}
	')
	public function new()
	{
		super();
		screenSize.value = [ FlxG.width*2, FlxG.height*2 ];
	}
}