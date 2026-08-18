public class Polymorphism
{

    public static void PolyMethod()
    {
        Integer a = 10;
        Integer b = 20;
        Integer c = a + b;
        System.debug(c);
    }
    public static void PolyMethod(Integer a)
    {
        Integer b = 40;
        Integer C = a + b;
        System.debug(c);
    }
 	public static void PolyMethod(Integer a , Integer b)
    {
        Integer c = a + b;
        System.debug(c);
    }
}

//Execution:

//MethodOverLoadingDemo.PolyMethod();
//MethodOverLoadingDemo.PolyMethod(20);
//MethodOverLoadingDemo.PolyMethod(20,30);
