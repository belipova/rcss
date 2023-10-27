using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using WpfRcss.Entities;

namespace WpfRcss;

public class RcssDbContext : DbContext
{
    public DbSet<City> Cities { get; set; }
    public DbSet<Address> Addresses { get; set; }
    public DbSet<Buyer> Buyers { get; set; }
    public DbSet<Color> Colors { get; set; }
    public DbSet<Country> Countries { get; set; }
    public DbSet<DayVariant> DayVariants { get; set; }
    public DbSet<Distributor> Distributors { get; set; }
    public DbSet<Employee> Employees { get; set; }
    public DbSet<Image> Images { get; set; }
    public DbSet<Item> Items { get; set; }
    public DbSet<Material> Materials { get; set; }
    public DbSet<PaymentType> PaymentTypes { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<ProductClassification> ProductClassifications { get; set; }
    public DbSet<ProductItem> ProductItems { get; set; }
    public DbSet<ProductTransaction> ProductTransactions { get; set; }
    public DbSet<ProductTransactionInfo> ProductTransactionInfos { get; set; }
    public DbSet<Receipt> Receipts { get; set; }
    public DbSet<Store> Stores { get; set; }
    public DbSet<StoreHour> StoreHours { get; set; }
    public DbSet<TransactionType> TransactionTypes { get; set; }

    public RcssDbContext()
    {
        Database.EnsureCreated();
    }



    public RcssDbContext(DbContextOptions options) : base(options)
    {
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseMySql(
            "server=localhost;user=root;password=pass12ert09jhh;database=rcss2;",
            new MySqlServerVersion(new Version(8, 0, 11))
        );
    }

    public List<string> GetTableNames() => GetType()
        .GetProperties()
        .Where(p => p.PropertyType.IsGenericType && p.PropertyType.GetGenericTypeDefinition() == typeof(DbSet<>))
        .Select(p => p.Name)
        .ToList();

    public Type GetTypeByName(string name) => GetType()
        .GetProperties()
        .Where(p => p.PropertyType.IsGenericType && p.PropertyType.GetGenericTypeDefinition() == typeof(DbSet<>))
        .FirstOrDefault(x => x.Name.Equals(name, StringComparison.InvariantCultureIgnoreCase)).PropertyType;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Configure the one-to-one relationship between CreatedByEmployee and UpdatedByEmployee
        modelBuilder.Entity<Employee>()
            .HasOne(e => e.CreatedByEmployee)
            .WithOne()
            .HasForeignKey<Employee>(e => e.EmployeeId) // Specify the foreign key property
            .IsRequired(false); // You can set this as needed

        modelBuilder.Entity<Employee>()
            .HasOne(e => e.UpdatedByEmployee)
            .WithOne()
            .HasForeignKey<Employee>(e => e.EmployeeId) // Specify the foreign key property
            .IsRequired(false); // You can set this as needed

        // Other entity configurations

        base.OnModelCreating(modelBuilder);
    }
}