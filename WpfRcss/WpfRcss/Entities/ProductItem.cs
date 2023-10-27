using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class ProductItem
{
    public int ProductItemId { get; set; }
    public int? ItemId { get; set; }

    [ForeignKey("ItemId")]
    public Item? Item { get; set; }
}