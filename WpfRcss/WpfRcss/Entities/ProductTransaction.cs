using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class ProductTransaction
{
    [Key]
    public int TransactionId { get; set; }
    public DateTime TransactionDate { get; set; }
    public string Note { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public decimal Price { get; set; }

    public int? TransactionTypeId { get; set; }

    [ForeignKey("TransactionTypeId")]
    public TransactionType? TransactionType { get; set; }

    public int? StoreId { get; set; }

    [ForeignKey("StoreId")]
    public Store? Store { get; set; }

    public int? EmployeePerformedTransactionEmployeeId { get; set; }

    [ForeignKey("EmployeePerformedTransactionEmployeeId")]
    public Employee? EmployeePerformedTransactionEmployee { get; set; }

    public int? CreatedByEmployeeId { get; set; }

    [ForeignKey("CreatedByEmployeeId")]
    public Employee? CreatedByEmployee { get; set; }

    public int? UpdatedByEmployeeId { get; set; }

    [ForeignKey("UpdatedByEmployeeId")]
    public Employee? UpdatedByEmployee { get; set; }

    public int? BuyerId { get; set; }

    [ForeignKey("BuyerId")]
    public Buyer? Buyer { get; set; }
}