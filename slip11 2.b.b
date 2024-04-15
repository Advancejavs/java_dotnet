using System;

// Base class Fruit
class Fruit
{
    protected int count;

    // Constructor
    public Fruit(int count)
    {
        this.count = count;
    }

    // Method to get count of fruits
    public int GetCount()
    {
        return count;
    }
}

// Derived class Apples
class Apples : Fruit
{
    public Apples(int count) : base(count)
    {
    }
}

// Derived class Mangoes
class Mangoes : Fruit
{
    public Mangoes(int count) : base(count)
    {
    }
}

// Main class
class Program
{
    static void Main(string[] args)
    {
        // Create instances of Apples and Mangoes
        Apples apples = new Apples(10);
        Mangoes mangoes = new Mangoes(5);

        // Calculate total number of fruits
        int totalFruits = apples.GetCount() + mangoes.GetCount();

        // Display total number of fruits
        Console.WriteLine("Total number of fruits in the basket: " + totalFruits);
    }
}
