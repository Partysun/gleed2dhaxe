package;

import haxe.unit.TestCase;

import gleed2dhaxe.Gleed2DMap;


class Gleed2DMapTest extends TestCase {

    var str: String;

    override public function setup() {
        str = "foo";

        //var fileData:String = sys.io.File.getContent("assets/");
    }

    public function testSetup() {
        assertEquals("foo", str);
    }

    public function testVERSION() {
        assertEquals("a23c6ed6b2", Gleed2DMap.VERSION); 
    }

    public function testsMapLoad() {
        assertTrue(true);
        //var content = haxe.Resource.getString("level");
        //var g:Gleed2D = new Gleed2D();
        //g.init(content);
        //trace(g.name);

        ////trace(Std.is(g.layers[0], G2DLayer));
        //for (layer in g.layers) {
            //trace(layer.name);
            //trace(layer.scroll.x + ", " + layer.scroll.x);
            //trace(layer.items.length);
        //} 
    }

}
