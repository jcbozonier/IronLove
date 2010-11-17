using System;

public class Foo
{
  public static void Main(params string[] args)
  {
    var bar = new Bar();
    Console.WriteLine(bar.GetValue());
  }
}