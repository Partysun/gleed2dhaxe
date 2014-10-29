package gleed2dhaxe;

import haxe.xml.Fast;


class LevelLoader {

    //last commit message in Gleed2d Source
    public static var VERSION:String = "a23c6ed6b2";

    public function new() {}

	public function load(source:String):Level {
	    var level:Level = null;
		try {
            source = StringTools.replace(source, "xsi:type", "Type");
            var fast:Fast = new Fast(Xml.parse(source).firstElement());
            level = new Level(fast);
		} catch (e:Dynamic) {
			trace(e + "");
		}
        return level;
	}

    //private function buildMap(map:Gleed2DMap, source:Fast):Gleed2DMap {
        //map = buildBasic(map, source);
        //map = buildEntity(map, source);

        ////map.layers = new Array<MapLayer>;
        //var count = 0;
        //for (layer in source.node.Layers.nodes.Layer) {
            //count ++;
            ////var newLayer:G2DLayer = new G2DLayerImpl();
            ////buildBasic( layer, newLayer );
            ////newLayer.scroll = createPoint(layer.node.ScrollSpeed);
            ////buildItems(layer, newLayer);
            ////map.layers.push(newLayer);
        //}
        //trace(count);

        ////Array<Element> layers = root.getChildrenByName("Layers").get(0)
                    ////.getChildrenByName("Layer");
            ////System.out.println(layers.size);
            ////for (Element ele : layers) {
                ////MapLayer mapLayer = new MapLayer();
                ////map.addMapLayer(mapLayer);
                ////processLayer(ele, mapLayer);
            ////}
        //return map;
    //}

    //private function buildBasic(target:Dynamic, source:Fast):Dynamic
	//{
		//target.name = source.att.Name;
		//target.isVisible = (source.att.Visible == "true") ? true : false;
        //return target;
	//}
	
    //private function buildEntity(target:Dynamic, source:Fast):Dynamic
    //{
        //target.properties = new Array<CustomProperty>();
        //for ( prop in source.node.CustomProperties.nodes.Property )
        //{
            //var newProp:CustomProperty = new CustomProperty();
            //newProp.name = prop.att.Name;
            //newProp.description = prop.att.Description;
            //switch (prop.att.Type)
            //{
                //case "bool":
                    //newProp.type = PropertyType.Bool;
                    //newProp.value= (prop.node.boolean.innerData == "true") ? true : false;
                //case "string":
                    //newProp.type = PropertyType.String;
                    //newProp.value = prop.node.string.innerData;
                //case "Vector2":
                    //newProp.type = PropertyType.Point;
                    //newProp.value = createPoint(prop.node.Vector2);
                //case "Color":
                    //newProp.type = PropertyType.Color;
                    //newProp.value = createColor(prop.node.Color);
                ////case "Item":
                    ////newProp.type = PropertyType.ItemProperty;
                    ////newProp.value = prop.innerData;
            //}
            //target.properties.push(newProp);
        //}
        //return target;
    //}

    //private function createPoint(source:Fast):Point {
        //return {
            //x:Std.parseFloat(source.node.X.innerData),
            //y:Std.parseFloat(source.node.Y.innerData)
        //};
    //}
    
    //private function createColor(source:Fast):Color {
        //return {
            //red: Std.parseInt(source.node.R.innerData),
            //green: Std.parseInt(source.node.G.innerData),
            //blue: Std.parseInt(source.node.B.innerData),
            //alpha: Std.parseInt(source.node.A.innerData)
        //}
    //}
}
