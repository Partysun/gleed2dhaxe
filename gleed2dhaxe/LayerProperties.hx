package gleed2dhaxe;


class LayerProperties extends ItemProperties
{
    //The Scroll Factor relative to the main camera. The x and y components are 
    //interpreted as factors, so (1;1) means the same scrolling speed as the main camera.
    //Enables parallax scrolling.
    public var scrollFactor:Point;

    public function new() {
        super();
    }
}
