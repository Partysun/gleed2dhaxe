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
                properties.customProperties = ([for (custom_property in source.node.CustomProperties.nodes.Property) CustomProperty.FromXML(custom_property)]);

                properties.scale = Point.FromXML(source.node.Scale);
                properties.rotation = Std.parseFloat(source.node.Rotation.innerData);
                properties.flipHorizontal = (source.node.FlipHorizontally.innerData == "true") ? true : false;
                properties.flipVertical = (source.node.FlipVertically.innerData == "true") ? true : false;
                properties.origin = Point.FromXML(source.node.Origin);
                properties.textureFilename = source.node.texture_filename.innerData;
                properties.tint = Color.FromXML(source.node.TintColor);
                properties.assetName = TextureItemProperties.getFileName(properties.textureFilename);
                layer.properties = properties;
            case "PathItem":
                var properties = new PathItemProperties();
                properties.name = source.att.Name;
                properties.isVisible = (source.att.Visible == "true") ? true : false;
                properties.position = Point.FromXML(source.node.Position);
                properties.customProperties = ([for (custom_property in source.node.CustomProperties.nodes.Property) CustomProperty.FromXML(custom_property)]);

                properties.lineWidth = Std.parseInt(source.node.LineWidth.innerData);
                properties.lineColor = Color.FromXML(source.node.LineColor);
                properties.isPolygon = (source.node.IsPolygon.innerData == "true") ? true : false;
                properties.localPoints = ([for (local_point in source.node.LocalPoints.nodes.Vector2) Point.FromXML(local_point)]);
                properties.worldPoints = ([for (world_point in source.node.WorldPoints.nodes.Vector2) Point.FromXML(world_point)]);
                layer.properties = properties;
            case "CircleItem":
                var properties = new CircleItemProperties();
                properties.name = source.att.Name;
                properties.isVisible = (source.att.Visible == "true") ? true : false;
                properties.position = Point.FromXML(source.node.Position);
                properties.customProperties = ([for (custom_property in source.node.CustomProperties.nodes.Property) CustomProperty.FromXML(custom_property)]);

                properties.radius = Std.parseFloat(source.node.Radius.innerData);
                properties.fillColor = Color.FromXML(source.node.FillColor);
                layer.properties = properties;
            case "RectangleItem":
                var properties = new RectangleItemProperties();
                properties.name = source.att.Name;
                properties.isVisible = (source.att.Visible == "true") ? true : false;
                properties.position = Point.FromXML(source.node.Position);
                properties.customProperties = ([for (custom_property in source.node.CustomProperties.nodes.Property) CustomProperty.FromXML(custom_property)]);

                properties.width = Std.parseFloat(source.node.Width.innerData);
                properties.height = Std.parseFloat(source.node.Height.innerData);
                properties.fillColor = Color.FromXML(source.node.FillColor);
                layer.properties = properties;
            default:
                trace("Error");
        }
        return layer;
        #if debug
        //trace("Create new LayerItem");
        #end
    }

}
