using System.Collections.Generic;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Store
{
    public int StoreId { get; set; }
    public string StoreName { get; set; }
    public string Phone { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public int? LogoId { get; set; }

    [ForeignKey("LogoId")]
    public Image? Logo { get; set; }

    public int? CountryId { get; set; }

    [ForeignKey("CountryId")]
    public Country? Country { get; set; }

    public int? AddressId { get; set; }

    [ForeignKey("AddressId")]
    public Address? Address { get; set; }
}