package;

import gleed2dhaxe.LevelLoader;
import gleed2dhaxe.LayerItem;
import gleed2dhaxe.Level;
import gleed2dhaxe.TextureItemProperties;
import gleed2dhaxe.Point;
import openfl.display.FPS;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.Lib;
import flash.text.TextField;
import openfl.Assets;
import flash.events.KeyboardEvent;
import flash.events.Event;
import flash.ui.Keyboard;
import flash.geom.Matrix;
import flash.geom.Rectangle;


class LevelStateTest extends Sprite {

    private var levelObject:Sprite;

    private var movingDown:Bool;
    private var movingLeft:Bool;
    private var movingRight:Bool;
    private var movingUp:Bool;

    public function new() {
        super();
        
        addChild(new FPS());

        var textField = new TextField ();
		
		textField.selectable = false;
		textField.width = 200;

		textField.x = 10;
		textField.y = 45;
		textField.text = "Version: " + LevelLoader.VERSION;

        var source_level = Assets.getText("assets/level_sample.xml");
        var loader:LevelLoader = new LevelLoader();
        var level:Level = loader.load(source_level);

        levelObject = new Sprite();

        for (layer in level.layers) {
            var layerObject:Sprite = new Sprite();
            for (item in layer.items) {
                if (Std.instance(item.properties, TextureItemProperties) != null) {
                    layerObject.addChild(getSprite(item));
                }
            }
            levelObject.addChild(layerObject);
        }
		
        
		addChild(textField);
        levelObject.scaleX = 0.15;
        levelObject.scaleY = 0.15;
        addChild(levelObject);
        stage.addEventListener (KeyboardEvent.KEY_DOWN, stage_onKeyDown);
        stage.addEventListener (KeyboardEvent.KEY_UP, stage_onKeyUp);
        stage.addEventListener (Event.ENTER_FRAME, this_onEnterFrame);

        //Lib.current.addEventListener(Event.ENTER_FRAME, render);
    }

    public function getSprite(item: LayerItem):Sprite {
        var sprite:Sprite = new Sprite(); 
        sprite.x = item.properties.position.x;
        sprite.y = item.properties.position.y;
        //sprite.rotation = item.properties.rotation * 180/Math.PI;
        sprite.graphics.clear();
        sprite.graphics.lineStyle(1, 0xff0000);
        //inline function line(x1, y1, x2, y2) {
            //sprite.graphics.moveTo(x1, y1);
            //sprite.graphics.lineTo(x2, y2);
        //}

        var bitmap = new Bitmap (Assets.getBitmapData ("assets/" + item.properties.assetName));
        var pivot = new Point(item.properties.origin.x, item.properties.origin.y);
        var m:Matrix = sprite.transform.matrix.clone(); //cloning might not be necessary
        m.invert(); //take us to the parent coordinate system
        m.translate(-pivot.x, -pivot.y);
        //m.rotate(item.properties.rotation * 180/Math.PI); //rotate around the pivot - in radians IIRC
        m.rotate(item.properties.rotation); //rotate around the pivot - in radians IIRC
        m.translate(pivot.x, pivot.y); //move the pivot to (0, 0)
        m.concat(sprite.transform.matrix); //take us back to the child coordinate system
        sprite.transform.matrix = m; //apply and pray!

        sprite.addChild(bitmap);
        sprite.graphics.drawRect (0, 0, bitmap.width, bitmap.height);
        sprite.scaleX = item.properties.scale.x;
        sprite.scaleY = item.properties.scale.y;

        // Get the matrix of the object  
        //var matrix:Matrix = bitmap.transform.matrix; 

        //// Get the rect of the object (to know the dimension) 
        //var rect:Rectangle = bitmap.getBounds(sprite); 

        //// Translating the desired reference point (in this case, center)
        //matrix.translate(- (rect.left + (rect.width/2)), - (rect.top + (rect.height/2))); 

        //// Rotation (note: the parameter is in radian) 
        //matrix.rotate((90/180)*Math.PI); 

        //// Translating the object back to the original position.
        //matrix.translate(rect.left + (rect.width/2), rect.top + (rect.height/2)); 
        //bitmap.x = (stage.stageWidth - bitmap.width) / 2;
        //bitmap.y = (stage.stageHeight - bitmap.height) / 2;
        return sprite;
    }


    private function stage_onKeyDown (event:KeyboardEvent):Void {
        
        switch (event.keyCode) {
            
            case Keyboard.DOWN: movingDown = true;
            case Keyboard.LEFT: movingLeft = true;
            case Keyboard.RIGHT: movingRight = true;
            case Keyboard.UP: movingUp = true;
            
        }
        
    }
    
    
    private function stage_onKeyUp (event:KeyboardEvent):Void {
        
        switch (event.keyCode) {
            
            case Keyboard.DOWN: movingDown = false;
            case Keyboard.LEFT: movingLeft = false;
            case Keyboard.RIGHT: movingRight = false;
            case Keyboard.UP: movingUp = false;
            
        }
        
    }

    private function this_onEnterFrame (event:Event):Void {
        
        if (movingDown) {
            
            levelObject.y += 5;
            
        }
        
        if (movingLeft) {
            
            levelObject.x -= 5;
            
        }
        
        if (movingRight) {
            
            levelObject.x += 5;
            
        }
        
        if (movingUp) {
            
            levelObject.y -= 5;
            
        }
        
    }
    

    //public function render(e:Event):Void {
        //var delta = (haxe.Timer.stamp() - lastTime) / 3;
        //lastTime = haxe.Timer.stamp();
        ////state.update(delta);
    //}

}
