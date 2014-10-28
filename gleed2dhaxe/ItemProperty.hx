package gleed2dhaxe;


class ItemProperty 
{
    public var name:String;
    @:isVar public var id(get, set):Int;
    public var isVisible:Bool;
    // The item's position in world space.
    public var position:Point;

    // A Dictionary containing any user-defined Properties.
    //var customProperties:Array<CustomPropertie>;

    public function new() {}

    function get_id() {
        return this.id; 
    }

    function set_id(id:Int) {
        return this.id = id;
    }

    public function toString():String {
        return name;
    }
}
