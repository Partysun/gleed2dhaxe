package gleed2dhaxe;

import haxe.xml.Fast;


class Point
{
    public var x:Float;
    public var y:Float;

    public function new(x: Float, y:Float) {
        this.x = x; 
        this.y = y;
    }

    public static function FromXML(source:Fast):Point {
        var x = Std.parseFloat(source.node.X.innerData);
        var y = Std.parseFloat(source.node.Y.innerData);
        return new Point(x, y);
    }

    public function toString():String {
        return "(" + this.x + ", " + this.y + ")";
    }
}
