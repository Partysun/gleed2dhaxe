package gleed2dhaxe;


class PathItemProperties extends ItemProperties
{
    public var isPolygon:Bool;
    public var lineWidth:Int;
    public var lineColor:Color;
    public var localPoints:Array<Point>;
    public var worldPoints:Array<Point>;
        
    public function new() {
        super();
    }
}
