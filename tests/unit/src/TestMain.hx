import haxe.unit.TestRunner;

class TestMain
{
    public static function main ()
    {
        var runner = new TestRunner();

        // Register all our test cases
        runner.add(new LoadXMLTest());
        runner.add(new Gleed2DMapTest());

        // Run them and and exit with the right return code
        var success = runner.run();
    }
}
