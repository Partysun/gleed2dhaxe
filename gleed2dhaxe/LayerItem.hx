package gleed2dhaxe;

import haxe.xml.Fast;


class LayerItem {

    public var properties:Dynamic;

    public function new() {}
        
    public static function FromXML(source:Fast):LayerItem {
        var layer:LayerItem = new LayerItem();
        switch(source.att.Type) {
            case "TextureItem":
                var properties = new TextureItemProperties();
                properties.name = source.att.Name;
                properties.isVisible = (source.att.Visible == "true") ? true : false;
                properties.position = Point.FromXML(source.node.Position);
                properties.scale = Point.FromXML(source.node.Scale);
                properties.rotation = Std.parseFloat(source.node.Rotation.innerData);
                properties.flipHorizontal = (source.node.FlipHorizontally.innerData == "true") ? true : false;
                properties.flipVertical = (source.node.FlipVertically.innerData == "true") ? true : false;
                properties.origin = Point.FromXML(source.node.Origin);
                properties.textureFilename = source.node.texture_filename.innerData;
                properties.tint = Color.FromXML(source.node.TintColor);
                //TODO: create from textureFilename asset name
                properties.assetName = TextureItemProperties.getFileName(properties.textureFilename);
                layer.properties = properties;
                //trace("TextureItem");
                //TODO
            case "PathItem":
                var properties = new PathItemProperties();
                properties.name = source.att.Name;
                properties.isVisible = (source.att.Visible == "true") ? true : false;
                properties.position = Point.FromXML(source.node.Position);
                properties.lineWidth = Std.parseInt(source.node.LineWidth.innerData);
                properties.lineColor = Color.FromXML(source.node.LineColor);
                properties.isPolygon = (source.node.IsPolygon.innerData == "true") ? true : false;
                properties.localPoints = ([for (local_point in source.node.LocalPoints.nodes.Vector2) Point.FromXML(local_point)]);
                properties.worldPoints = ([for (world_point in source.node.WorldPoints.nodes.Vector2) Point.FromXML(world_point)]);
                layer.properties = properties;
                //TODO
                //trace("PathItem");
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
        //trace("Create new LayerItem");
        #end
    }

}
