using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore;
using System;

namespace WpfRcss;

public class RcssDbContextFactory : IDesignTimeDbContextFactory<RcssDbContext>
{
    public RcssDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<RcssDbContext>();
        optionsBuilder.UseMySql("server=localhost;user=root;password=pass12ert09jhh;database=rcss2;",
            new MySqlServerVersion(new Version(8, 0, 11)));
        return new RcssDbContext(optionsBuilder.Options);
    }
}