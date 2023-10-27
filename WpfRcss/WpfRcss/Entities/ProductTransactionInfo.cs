using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class ProductTransactionInfo
{
    public int ProductTransactionInfoId { get; set; }
    public int? Quantity { get; set; }
    public decimal? PricePerItem { get; set; }

    public int? ProductId { get; set; }

    [ForeignKey("ProductId")]
    public Product? Product { get; set; }

    public int? TransactionId { get; set; }

    [ForeignKey("TransactionId")]
    public ProductTransaction? Transaction { get; set; }
}