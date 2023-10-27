using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WpfRcss.Entities;

public class ProductClassification
{
    [Key]
    public int ClassificationId { get; set; }
    public string ClassificationName { get; set; }
}