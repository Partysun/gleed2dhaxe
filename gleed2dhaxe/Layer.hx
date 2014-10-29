package gleed2dhaxe;

import haxe.xml.Fast;


class Layer {

    public var properties:LayerProperties;
    public var items:Array<LayerItem>;

    public function new(source:Fast) {
        properties = new LayerProperties();
        properties.name = source.att.Name;
        properties.isVisible = (source.att.Visible == "true") ? true : false;
        properties.scrollFactor = Point.FromXML(source.node.ScrollSpeed);

        items = ([for (item in source.node.Items.nodes.Item) LayerItem.FromXML(item)]);
    
        #if debug
        trace("Create new Layer");
        #end
    }

}
