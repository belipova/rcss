using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Address
{
    public int AddressId { get; set; }
    public string Street1 { get; set; }
    public int? CountryId { get; set; }

    [ForeignKey("CountryId")]
    public Country? Country { get; set; }
    public int? CityId { get; set; }

    [ForeignKey("CityId")]
    public City? City { get; set; }
}