package gleed2dhaxe;

import haxe.xml.Fast;


class CustomProperty
{
    public var name:String;
    public var value:Dynamic;
    public var type:PropertyType;
    public var description:String;
  
    public function new(?name:String, ?value:Dynamic, ?type:PropertyType, ?description:String)
    {
        this.name = name;
        this.value = value;
        this.type = type;
        this.description = description;
    }

    public function clone():CustomProperty
    {
        return new CustomProperty(name, value, type, description);
    }

    public static function FromXML(source:Fast):CustomProperty {
        var property:CustomProperty = new CustomProperty();
        property.name = source.att.Name;
        property.type = createType(source.att.Type);
        property.description = source.att.Description;
        switch(property.type){
          case Bool: 
              property.value = (source.node.boolean.innerData == "true") ? true : false;
          case String:
              property.value = source.node.string.innerData;
          case Point:
              property.value = gleed2dhaxe.Point.FromXML(source.node.point);
          case Color:
              property.value = gleed2dhaxe.Color.FromXML(source.node.point);
        }
        return property;
    }

    public static function createType(type_str:String):PropertyType {
        var type:PropertyType = String;
        switch(type_str){
            case "bool": type = Bool;
            case "string": type = String;
            case "point": type = Point;
            case "color": type = Color;
        } 
        return type;
    }

}

enum PropertyType {
	String;
	Bool;
	Point;
	Color;
    //TODO: Create LinkedItem
	//Item;
}
