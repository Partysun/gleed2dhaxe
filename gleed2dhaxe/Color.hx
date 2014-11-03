package gleed2dhaxe;

import haxe.xml.Fast;


class Color
{
    public var red:Int;
	public var green:Int;
	public var blue:Int;
	public var alpha:Int;

    public function new(red:Int, green:Int, blue:Int, alpha:Int) {
        this.red = red;
        this.blue = blue;
        this.green = green;
        this.alpha = alpha;
    }

    public static function FromXML(source:Fast):Color {
        var red = Std.parseInt(source.node.R.innerData);
        var green = Std.parseInt(source.node.G.innerData);
        var blue = Std.parseInt(source.node.B.innerData);
        var alpha = Std.parseInt(source.node.A.innerData);
        return new Color(red, green, blue, alpha);
    }

    public function toString():String {
        return "(" + red + ", " + green + ", " + blue + ", " + alpha + ")";
    }
}
