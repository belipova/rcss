using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Distributor
{
    public int DistributorId { get; set; }
    public string Name { get; set; }
    public string Note { get; set; }

    public int? AddressId { get; set; }

    [ForeignKey("AddressId")]
    public Address? Address { get; set; }
}