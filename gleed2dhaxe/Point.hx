package gleed2dhaxe;

import haxe.xml.Fast;


/**
Point class
**/
class Point
{
    public var x:Float;
    public var y:Float;

    public function new(source:Fast) {
        this.x = Std.parseFloat(source.node.X.innerData);
        this.y = Std.parseFloat(source.node.Y.innerData);
    }

    public function toString():String {
        return "(" + this.x + ", " + this.y + ")";
    }
}
