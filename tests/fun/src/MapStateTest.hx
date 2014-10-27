package;

import gleed2dhaxe.Gleed2DMap;
import openfl.display.FPS;
import flash.display.Sprite;
import flash.Lib;
import flash.text.TextField;


class MapStateTest extends Sprite {

    public function new() {
        super();
        
        addChild(new FPS());

        var textField = new TextField ();
		
		textField.selectable = false;
		textField.width = 200;

		textField.x = 10;
		textField.y = 45;
		textField.text = "Version: " + gleed2dhaxe.Gleed2DMap.VERSION;
		
		addChild(textField);

        //Lib.current.addEventListener(Event.ENTER_FRAME, render);
    }

    //public function render(e:Event):Void {
        //var delta = (haxe.Timer.stamp() - lastTime) / 3;
        //lastTime = haxe.Timer.stamp();
        ////state.update(delta);
    //}

}
