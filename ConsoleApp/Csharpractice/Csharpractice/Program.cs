abstract class Animal
{
    public abstract void Makesound();

    public void sleep()
    {
        Console.WriteLine("Animal is sleeping");
    }

}
class Dog : Animal
{
    public override void Makesound()
    {
        Console.WriteLine("Woof!");
    }
}
class Cat : Animal
{
  
    public override void Makesound()
    {
        Console.WriteLine("Meow!");
    }
}

class Program
{
    public static void Main(string[] args)
    {
        Animal dog = new Dog();
        Animal cat = new Cat();
        dog.Makesound();
        cat.Makesound();
    }
}