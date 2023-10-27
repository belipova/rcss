using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Receipt
{
    public int ReceiptId { get; set; }
    public string Path { get; set; }

    public int? TransactionId { get; set; }

    [ForeignKey("TransactionId")]
    public ProductTransaction? Transaction { get; set; }

}