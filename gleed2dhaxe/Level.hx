package gleed2dhaxe;

import haxe.xml.Fast;


class Level {

    public var properties:LevelProperties;
    // Layers within level
    public var layers:Array<Layer>;
    
    public function new(source:Fast) {
        properties = new LevelProperties();
        properties.name = source.att.Name;
        properties.isVisible = (source.att.Visible == "true") ? true : false;

        layers = ([for (layer in source.node.Layers.nodes.Layer) new Layer(layer)]);
        
        #if debug
        trace("Create new Level");
        #end
    }

}
