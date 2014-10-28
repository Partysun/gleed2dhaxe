package gleed2dhaxe;

import haxe.xml.Fast;


class LayerItem {

    public var properties:Dynamic;

    public function new() {}
        
    public static function FromXml(source:Fast):LayerItem {
        var layer:LayerItem = new LayerItem();
        switch(source.att.Type) {
            case "TextureItem":
                var properties = new TextureItemProperties();
                properties.name = source.att.Name;
                properties.isVisible = (source.att.Visible == "true") ? true : false;
                properties.scale = new Point(source.node.Scale);
                properties.rotation = Std.parseFloat(source.node.Rotation.innerData);
                properties.flipHorizontal = (source.node.FlipHorizontally.innerData == "true") ? true : false;
                properties.flipVertical = (source.node.FlipVertically.innerData == "true") ? true : false;
                properties.origin = new Point(source.node.Origin);
                properties.textureFilename = source.node.texture_filename.innerData;
                //TODO: create from textureFilename asset name
                //properties.assetName = source.node.texture_filename.innerData;
                layer.properties = properties;
                trace("TextureItem");
                //TODO
            case "PathItem":
                //TODO
                trace("PathItem");
            case "CircleItem":
                //TODO
                trace("CircleItem");
            case "RectangleItem":
                //TODO
                trace("RectangleItem");
            default:
                trace("Error");
        }
        return layer;
        #if debug
        trace("Create new LayerItem");
        #end
    }

}
