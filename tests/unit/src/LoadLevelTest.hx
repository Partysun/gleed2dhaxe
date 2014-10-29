package;

import haxe.unit.TestCase;
import haxe.xml.Fast;

import gleed2dhaxe.Level;
import gleed2dhaxe.LevelLoader;
import gleed2dhaxe.Layer;
import gleed2dhaxe.Color;
import gleed2dhaxe.LevelProperties;
import gleed2dhaxe.Point;
import gleed2dhaxe.LayerItem;
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
    }

    public function testTextureItem() {
        var source = "
            <Item xsi:type='TextureItem' Name='Texture_0058' Visible='true'>
                    <Position>
                        <X>512</X>
                        <Y>-320</Y>
                    </Position>
                    <CustomProperties />
                    <Rotation>0</Rotation>
                    <Scale>
                        <X>1</X>
                        <Y>1</Y>
                    </Scale>
                    <TintColor>
                        <R>255</R>
                        <G>255</G>
                        <B>255</B>
                        <A>255</A>
                        <PackedValue>4294967295</PackedValue>
                    </TintColor>
                    <FlipHorizontally>false</FlipHorizontally>
                    <FlipVertically>false</FlipVertically>
                    <texture_filename>Y:\\Glue Project\\Test Sprites\\sky.png</texture_filename>
                    <asset_name>Y:\\Glue Project\\Test Sprites\\sky</asset_name>
                    <Origin>
                        <X>512</X>
                        <Y>384</Y>
                    </Origin>
                </Item>
        ";
        source = StringTools.replace(source, "xsi:type", "Type");
        var source:Fast = new Fast(Xml.parse(source).firstElement());
        var layerItem:LayerItem = gleed2dhaxe.LayerItem.FromXML(source);
        assertEquals(source.att.Type, "TextureItem");
        assertEquals(layerItem.properties.name, "Texture_0058");
        assertEquals(layerItem.properties.isVisible, true);
        assertEquals(layerItem.properties.position.x, 512);
        assertEquals(layerItem.properties.position.y, -320);
        assertEquals(layerItem.properties.rotation, 0);
        assertEquals(layerItem.properties.scale.x, 1);
        assertEquals(layerItem.properties.scale.y, 1);
        assertEquals(layerItem.properties.tint.red, 255);
        assertEquals(layerItem.properties.flipHorizontal, false);
        assertEquals(layerItem.properties.flipVertical, false);
        assertEquals(layerItem.properties.textureFilename, "Y:\\Glue Project\\Test Sprites\\sky.png");
        assertEquals(layerItem.properties.assetName, "sky");
        assertEquals(layerItem.properties.origin.x, 512);
        assertEquals(layerItem.properties.origin.y, 384);
    }

    public function testPathItem() {
        var source = "
            <Item xsi:type='PathItem' Name='collision_1' Visible='true'>
                    <Position>
                        <X>0</X>
                        <Y>896</Y>
                    </Position>
                    <CustomProperties>
                        <Property Name='parametr1' Type='string' Description='parametrs description'>
                            <string>198919891989</string>
                        </Property>
                    </CustomProperties>
                    <LocalPoints>                        <Vector2>
                            <X>0</X>
                            <Y>0</Y>
                        </Vector2>
                        <Vector2>
                            <X>4608</X>
                            <Y>0</Y>
                        </Vector2>
                        <Vector2>
                            <X>4608</X>
                            <Y>-2240</Y>
                        </Vector2>
                        <Vector2>
                            <X>2560</X>
                            <Y>-2240</Y>
                        </Vector2>
                        <Vector2>
                            <X>2560</X>
                            <Y>-1344</Y>
                        </Vector2>
                        <Vector2>
                            <X>3456</X>
                            <Y>-1344</Y>
                        </Vector2>
                        <Vector2>
                            <X>3456</X>
                            <Y>-896</Y>
                        </Vector2>
                        <Vector2>
                            <X>0</X>
                            <Y>-896</Y>
                        </Vector2>
                        <Vector2>
                            <X>0</X>
                            <Y>0</Y>
                        </Vector2>
                    </LocalPoints>
                    <WorldPoints>
                        <Vector2>
                            <X>0</X>
                            <Y>896</Y>
                        </Vector2>
                        <Vector2>
                            <X>4608</X>
                            <Y>896</Y>
                        </Vector2>
                        <Vector2>
                            <X>4608</X>
                            <Y>-1344</Y>
                        </Vector2>
                        <Vector2>
                            <X>2560</X>
                            <Y>-1344</Y>
                        </Vector2>
                        <Vector2>
                            <X>2560</X>
                            <Y>-448</Y>
                        </Vector2>
                        <Vector2>
                            <X>3456</X>
                            <Y>-448</Y>
                        </Vector2>
                        <Vector2>
                            <X>3456</X>
                            <Y>0</Y>
                        </Vector2>
                        <Vector2>
                            <X>0</X>
                            <Y>0</Y>
                        </Vector2>
                        <Vector2>
                            <X>0</X>
                            <Y>896</Y>
                        </Vector2>
                    </WorldPoints>
                    <IsPolygon>false</IsPolygon>
                    <LineWidth>4</LineWidth>
                    <LineColor>
                        <R>192</R>
                        <G>0</G>
                        <B>192</B>
                        <A>145</A>
                        <PackedValue>2445279424</PackedValue>
                    </LineColor>
                </Item>
        ";
        source = StringTools.replace(source, "xsi:type", "Type");
        var source:Fast = new Fast(Xml.parse(source).firstElement());
        var layerItem:LayerItem = gleed2dhaxe.LayerItem.FromXML(source);
        assertEquals(source.att.Type, "PathItem");
        assertEquals(layerItem.properties.name, "collision_1");
        assertEquals(layerItem.properties.lineWidth, 4);
        assertEquals(layerItem.properties.lineColor.red, 192);
        assertEquals(layerItem.properties.lineColor.green, 0);
        assertEquals(layerItem.properties.isPolygon, false);
        assertEquals(layerItem.properties.localPoints.length, 9);
        assertEquals(layerItem.properties.worldPoints.length, 9);
        assertEquals(layerItem.properties.worldPoints[8].x, 0);
        assertEquals(layerItem.properties.worldPoints[8].y, 896);
        assertEquals(layerItem.properties.worldPoints[6].x, 3456);
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
