package gleed2dhaxe;

import haxe.xml.Fast;


class Gleed2DMapLoader {

    public function new() {}

	public function load(source:String):Gleed2DMap {
	    var map:Gleed2DMap = new Gleed2DMap();
		try {
            source = StringTools.replace(source, "xsi:type", "Type");
            var fast:Fast = new Fast(Xml.parse(source).firstElement());
            map = buildMap(map, fast);
			//Array<Element> layers = root.getChildrenByName("Layers").get(0)
					//.getChildrenByName("Layer");
			//System.out.println(layers.size);
			//for (Element ele : layers) {
				//MapLayer mapLayer = new MapLayer();
				//map.addMapLayer(mapLayer);
				//processLayer(ele, mapLayer);
			//}
		} catch (e:Dynamic) {
			trace(e + "");
		}
        return map;
	}

    private function buildMap(map:Gleed2DMap, source:Fast):Gleed2DMap {
        map.name = source.att.Name;
		map.isVisible = (source.att.Visible == "true") ? true : false;
        return map;
    }
}
