using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Product
{
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public decimal PriceUsd { get; set; }
    public int Quantity { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public DateTime? ExpirationDate { get; set; }

    public int? ClassificationId { get; set; }

    [ForeignKey("ClassificationId")]
    public ProductClassification? Classification { get; set; }

    public int? CreatedByEmployeeId { get; set; }

    [ForeignKey("CreatedByEmployeeId")]
    public Employee? CreatedByEmployee { get; set; }

    public int? UpdatedByEmployeeId { get; set; }

    [ForeignKey("UpdatedByEmployeeId")]
    public Employee? UpdatedByEmployee { get; set; }

    public int? DistributorId { get; set; }

    [ForeignKey("DistributorId")]
    public Distributor? Distributor { get; set; }
}