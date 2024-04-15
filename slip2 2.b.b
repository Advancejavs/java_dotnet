using System;

// Base class Department
class Department
{
    public string Name { get; set; }
    public string Location { get; set; }

    // Constructor
    public Department(string name, string location)
    {
        Name = name;
        Location = location;
    }

    // Method to display department details
    public virtual void Display()
    {
        Console.WriteLine($"Department: {Name}");
        Console.WriteLine($"Location: {Location}");
    }
}

// Derived class Sales
class Sales : Department
{
    public int SalesPersonCount { get; set; }

    // Constructor
    public Sales(string name, string location, int salesPersonCount) : base(name, location)
    {
        SalesPersonCount = salesPersonCount;
    }

    // Method to display sales department details
    public override void Display()
    {
        base.Display();
        Console.WriteLine($"Salesperson Count: {SalesPersonCount}");
    }
}

// Derived class HumanResource
class HumanResource : Department
{
    public int EmployeeCount { get; set; }

    // Constructor
    public HumanResource(string name, string location, int employeeCount) : base(name, location)
    {
        EmployeeCount = employeeCount;
    }

    // Method to display human resource department details
    public override void Display()
    {
        base.Display();
        Console.WriteLine($"Employee Count: {EmployeeCount}");
    }
}

class Program
{
    static void Main(string[] args)
    {
        // Accept details for Sales department
        Console.WriteLine("Enter details for Sales department:");
        Console.Write("Name: ");
        string salesName = Console.ReadLine();
        Console.Write("Location: ");
        string salesLocation = Console.ReadLine();
        Console.Write("Salesperson Count: ");
        int salesPersonCount = Convert.ToInt32(Console.ReadLine());

        // Create Sales object
        Sales salesDept = new Sales(salesName, salesLocation, salesPersonCount);

        // Accept details for Human Resource department
        Console.WriteLine("\nEnter details for Human Resource department:");
        Console.Write("Name: ");
        string hrName = Console.ReadLine();
        Console.Write("Location: ");
        string hrLocation = Console.ReadLine();
        Console.Write("Employee Count: ");
        int employeeCount = Convert.ToInt32(Console.ReadLine());

        // Create HumanResource object
        HumanResource hrDept = new HumanResource(hrName, hrLocation, employeeCount);

        // Display department details
        Console.WriteLine("\nSales Department Details:");
        salesDept.Display();

        Console.WriteLine("\nHuman Resource Department Details:");
        hrDept.Display();

        Console.ReadLine(); // To keep the console window open
    }
}
