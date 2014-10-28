package gleed2dhaxe;


class CustomProperty
{
    public var name:String;
    public var value:Dynamic;
    public var type:PropertyType;
    public var description:String;
  
    public function new(name:String, value:Dynamic, type:PropertyType, description:String)
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
}

enum PropertyType {
	String;
	Bool;
	Point;
	Color;
	ItemProperty;
}
