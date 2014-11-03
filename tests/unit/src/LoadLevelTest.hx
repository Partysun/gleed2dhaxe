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
    var level:Level;

    override public function setup() {
        str = "foo";

        var loader:LevelLoader = new LevelLoader();
        var source = haxe.Resource.getString("map");
        level = loader.load(source);
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
        var source = " 
                <Item xsi:type='TextureItem' Name='Texture_0030' Visible='true'>
                    <Position>
                        <X>448</X>
                        <Y>-768</Y>
                    </Position>
                    <CustomProperties>
                        <Property Name='islarge' Type='bool' Description='The Biggest Tree'>
                            <boolean>true</boolean>
                        </Property>
                        <Property Name='hello' Type='string' Description=''>
                            <string>world</string>
                        </Property>
                        <Property Name='Check' Type='point' Description=''>
                            <point>
                                <X>0.693748534</X>
                                <Y>0.693748534</Y>
                            </point>
                        </Property>
                    </CustomProperties>
                    <Rotation>0</Rotation>
                    <Scale>
                        <X>0.693748534</X>
                        <Y>0.693748534</Y>
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
                    <texture_filename>Y:\\Glue Project\\Test Sprites\tree.png</texture_filename>
                    <asset_name>Y:\\Glue Project\\Test Sprites\tree</asset_name>
                    <Origin>
                        <X>951</X>
                        <Y>1152</Y>
                    </Origin>
                </Item>
        ";

        source = StringTools.replace(source, "xsi:type", "Type");
        var source:Fast = new Fast(Xml.parse(source).firstElement());
        var layerItem:LayerItem = gleed2dhaxe.LayerItem.FromXML(source);
        assertEquals(source.att.Type, "TextureItem");
        assertEquals(layerItem.properties.name, "Texture_0030");
        assertEquals(layerItem.properties.customProperties.length, 3);
        assertEquals(layerItem.properties.customProperties[0].name, 'islarge');
        assertEquals(layerItem.properties.customProperties[0].type, Bool);
        assertEquals(layerItem.properties.customProperties[0].description, "The Biggest Tree");
        assertEquals(layerItem.properties.customProperties[0].value, true);
        assertEquals(layerItem.properties.customProperties[1].value, "world");
        assertEquals(layerItem.properties.customProperties[2].value.x, 0.693748534);
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

    public function testRectangleItem() {
        var source = " 
            <Item xsi:type='RectangleItem' Name='Rectangle_7523' Visible='true'>
                    <Position>
                        <X>-14464</X>
                        <Y>-20992</Y>
                    </Position>
                    <CustomProperties />
                    <Width>1280</Width>
                    <Height>11904</Height>
                    <FillColor>
                        <R>0</R>
                        <G>0</G>
                        <B>255</B>
                        <A>145</A>
                        <PackedValue>2432696575</PackedValue>
                    </FillColor>
                </Item>
        ";
        source = StringTools.replace(source, "xsi:type", "Type");
        var source:Fast = new Fast(Xml.parse(source).firstElement());
        var layerItem:LayerItem = gleed2dhaxe.LayerItem.FromXML(source);
        assertEquals(source.att.Type, "RectangleItem");
        assertEquals(layerItem.properties.name, "Rectangle_7523");
        assertEquals(layerItem.properties.isVisible, true);
        assertEquals(layerItem.properties.fillColor.red, 0);
        assertEquals(layerItem.properties.fillColor.green, 0);
        assertEquals(layerItem.properties.fillColor.blue, 255);
        assertEquals(layerItem.properties.fillColor.alpha, 145);
        assertEquals(layerItem.properties.width, 1280);
        assertEquals(layerItem.properties.height, 11904);
    }

    public function testCircleItem() {
        var source = " 
            <Item xsi:type='CircleItem' Name='Circle_67' Visible='true'>
                    <Position>
                        <X>464</X>
                        <Y>992</Y>
                    </Position>
                    <CustomProperties />
                    <Radius>80</Radius>
                    <FillColor>
                        <R>0</R>
                        <G>0</G>
                        <B>255</B>
                        <A>145</A>
                        <PackedValue>2432696575</PackedValue>
                    </FillColor>
                </Item>
        ";
        source = StringTools.replace(source, "xsi:type", "Type");
        var source:Fast = new Fast(Xml.parse(source).firstElement());
        var layerItem:LayerItem = gleed2dhaxe.LayerItem.FromXML(source);
        assertEquals(source.att.Type, "CircleItem");
        assertEquals(layerItem.properties.name, "Circle_67");
        assertEquals(layerItem.properties.isVisible, true);
        assertEquals(layerItem.properties.fillColor.red, 0);
        assertEquals(layerItem.properties.fillColor.green, 0);
        assertEquals(layerItem.properties.fillColor.blue, 255);
        assertEquals(layerItem.properties.fillColor.alpha, 145);
        assertEquals(layerItem.properties.radius, 80);
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
        assertEquals(layerItem.properties.assetName, "sky.png");
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

    public function testColor() {
        var xml = Xml.parse("
            <FillColor>
                <R>0</R>
                <G>0</G>
                <B>255</B>
                <A>145</A>
                <PackedValue>2432696575</PackedValue>
            </FillColor>
        ");
        var source:Fast = new Fast(xml.firstElement());
        var color:Color = gleed2dhaxe.Color.FromXML(source);
        assertEquals(color.red, 0);
        assertEquals(color.green, 0);
        assertEquals(color.blue, 255);
        assertEquals(color.alpha, 145);
    }
}
