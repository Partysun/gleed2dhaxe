package;

import haxe.unit.TestCase;

import gleed2dhaxe.Gleed2DMap;
import gleed2dhaxe.Gleed2DMapLoader;
import gleed2dhaxe.Color;
import gleed2dhaxe.LevelProperties;
import gleed2dhaxe.Point;
import gleed2dhaxe.CustomProperty;
using gleed2dhaxe.CustomProperty;


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

    public function testCustomProperties() {
        var cp = new CustomProperty("box2d", "static", String, "static");
        assertEquals(cp.name, "box2d");
        assertEquals(cp.value, "static");
        assertEquals(cp.type, String);
        assertEquals(cp.description, "static");

        cp = new CustomProperty("likeBoss", true, Bool, "It's a super star Boss!");
        assertEquals(cp.type, Bool);

        cp = new CustomProperty("teleport", { x : 20, y : 30 }, Point, "Teleport!");
        assertEquals(cp.type, Point);
        assertEquals(cp.value.x, 20);
        assertEquals(cp.value.y, 30);

        var color:Color = {red:255, green:255, blue:255, alpha:255};
        cp = new CustomProperty(",mlovely color", color, Color, "Like a gentleman...");
        assertEquals(cp.type, Color);
        assertEquals(cp.value.red, color.red);
        assertEquals(cp.value.alpha, color.alpha);

        //cp = new CustomProperty("lovely color", color, IItemPropertie, "Like a gentleman...");
        //assertEquals(cp.type, IItemPropertie);
    }

    public function testLevelProperties() {
        var lp = new LevelProperties("Level1", false);
        lp.version = "1.3.0.0";
        lp.nextItemNumber = 72;
        var point:Point = {x:0.0, y:0.0};
        lp.cameraPosition = {x: 0.0, y:0.0};
        lp.contentRootFolder = "C:/";
        assertFalse(lp.isVisible);
        assertEquals(lp.version, "1.3.0.0");
        assertEquals(lp.nextItemNumber, 72);
        assertEquals(lp.cameraPosition.x, point.x);
        assertEquals(lp.cameraPosition.y, point.y);
        assertEquals(lp.contentRootFolder, "C:/");
    }

    public function testsMapLoad() {
        var loader:Gleed2DMapLoader = new Gleed2DMapLoader();
        var source = haxe.Resource.getString("map");
        var map:Gleed2DMap = loader.load(source);
        assertEquals(map.name, "Level1");
        assertTrue(map.isVisible);
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
