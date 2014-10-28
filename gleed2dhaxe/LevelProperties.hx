package gleed2dhaxe;


class LevelProperties extends ItemProperty
{
    public var contentRootFolder:String;
    public var nextItemNumber:Int;
    public var cameraPosition:Point;
    public var version:String;

    public function new (name:String, ?isVisible:Bool=true) {
        super();
        this.name = name;
        this.isVisible = isVisible;
    }
}
