package gleed2dhaxe;


class ItemProperties
{
    public var name:String;
    public var id:Int;
    public var isVisible:Bool;
    // The item's position in world space.
    public var position:Point;

    // A Dictionary containing any user-defined Properties.
    public var customProperties:Array<CustomProperty> = new Array<CustomProperty>();

    public function new() {}

    public function toString():String {
        return name;
    }
}
