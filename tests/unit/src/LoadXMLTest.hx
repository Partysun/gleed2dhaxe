import haxe.unit.TestCase;


class LoadXMLTest extends TestCase {

    var str: String;

    override public function setup() {
        str = "foo";

        //var fileData:String = sys.io.File.getContent("assets/");
    }

    public function testSetup() {
        assertEquals("foo", str);
    }

}
