package gleed2dhaxe;


class TextureItemProperties extends ItemProperties
{
    public var tint:Color;
    public var rotation:Float;
    public var scale:Point;
    public var flipHorizontal:Bool;
    public var flipVertical:Bool;
    // The item's origin relative to the upper left corner of the texture.
    // Usually the middle of the texture.
    // Used for placing and rotating the texture when drawn.
    public var origin:Point;
    public var textureFilename:String;
    public var assetName:String;

    public function new() {
        super();
    }

    //TODO: create FromXML behavior

    public static function getFileName (path:String):String {
        var slash = path.lastIndexOf("/") == 0 ? path.lastIndexOf("/") : path.lastIndexOf("\\");
        if (slash >= 0) {
            path = path.substr(slash + 1);
        }
        //return removeFileExtension(path);
        return path;
    }

    public static function removeFileExtension (fileName:String):String {
        var dot = fileName.lastIndexOf(".");
        return (dot > 0) ? fileName.substr(0, dot) : fileName;
    }
}
