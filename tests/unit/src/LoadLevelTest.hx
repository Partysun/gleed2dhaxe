package;

import haxe.unit.TestCase;
import haxe.xml.Fast;

import gleed2dhaxe.Level;
import gleed2dhaxe.LevelLoader;
import gleed2dhaxe.Layer;
import gleed2dhaxe.Color;
import gleed2dhaxe.LevelProperties;
import gleed2dhaxe.Point;
import gleed2dhaxe.CustomProperty;
using gleed2dhaxe.CustomProperty;


class LoadLevelTest extends TestCase {

    var str: String;

    override public function setup() {
        str = "foo";

        //var fileData:String = sys.io.File.getContent("assets/");
    }

    public function testSetup() {
        assertEquals("foo", str);
    }

    public function testVERSION() {
        assertEquals("a23c6ed6b2", LevelLoader.VERSION); 
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

        var color:Color = new Color(255, 255, 255, 255);
        cp = new CustomProperty(",mlovely color", color, Color, "Like a gentleman...");
        assertEquals(cp.type, Color);
        assertEquals(cp.value.red, color.red);
        assertEquals(cp.value.alpha, color.alpha);

        //cp = new CustomProperty("lovely color", color, IItemPropertie, "Like a gentleman...");
        //assertEquals(cp.type, IItemPropertie);
    }

    //public function testLevelProperties() {
        //var lp = new LevelProperties();
        //lp.name = "Level1";
        //lp.isVisible = false;
        //lp.version = "1.3.0.0";
        //lp.nextItemNumber = 72;
        ////var point:Point = new Point{x:0.0, y:0.0};
        ////lp.cameraPosition = {x: 0.0, y:0.0};
        ////lp.contentRootFolder = "C:/";
        ////assertFalse(lp.isVisible);
        ////assertEquals(lp.version, "1.3.0.0");
        ////assertEquals(lp.nextItemNumber, 72);
        ////assertEquals(lp.cameraPosition.x, point.x);
        ////assertEquals(lp.cameraPosition.y, point.y);
        ////assertEquals(lp.contentRootFolder, "C:/");
    //}

    public function testLoadLevel() {
        var loader:LevelLoader = new LevelLoader();
        var source = haxe.Resource.getString("map");
        var level:Level = loader.load(source);
        assertEquals(level.properties.name, "Level1");
        assertTrue(level.properties.isVisible);
        assertEquals(level.layers[0].properties.name, "layer_sky");
        assertEquals(level.layers[0].properties.scrollFactor.x, 1);
        assertEquals(level.layers[0].properties.scrollFactor.y, 1);
        assertEquals(level.layers[0].items[0].properties.scale.x, 1);
        assertEquals(level.layers[0].items[0].properties.name, "Texture_0058");
        assertEquals(level.layers[0].items[0].properties.rotation, 0.0);
        assertEquals(level.layers[0].items[0].properties.flipHorizontal, false);
        assertEquals(level.layers[0].items[0].properties.flipVertical, false);
        assertEquals(level.layers[0].items[0].properties.textureFilename, "Y:\\Glue Project\\Test Sprites\\sky.png");
        assertEquals(level.layers[0].items[0].properties.tint.red, 255);
        assertEquals(level.layers[0].items[0].properties.position.x, 512);
        assertEquals(level.layers[0].items[0].properties.position.y, -320);
        //if (level.layers[0].items[0].item.att.Type == "TextureItem") {
                //buildTextureItem(item, i);
            //}
    }

    public function testPoint() {
        var xml = Xml.parse("
            <ScrollSpeed>
                <X>1</X>
                <Y>1</Y>
            </ScrollSpeed>
        ");
        var source:Fast = new Fast(xml.firstElement());
        var point:Point = gleed2dhaxe.Point.FromXML(source);
        assertEquals(point.x, 1);
        assertEquals(point.y, 1);
    }

}
