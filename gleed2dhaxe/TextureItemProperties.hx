package gleed2dhaxe;


class TextureItemProperties extends ItemProperties
{
    public var tint:Color;
    public var rotation:Float;
    public var scale:Point;
    public var flipHorizontal:Bool;
    public var flipVertical:Bool;
    public var origin:Point;
    public var textureFilename:String;
    public var assetName:String;

    public function new() {
        super();
    }
}
