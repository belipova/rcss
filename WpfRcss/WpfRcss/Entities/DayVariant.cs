using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class DayVariant
{
    public int DayVariantId { get; set; }
    public string VariantName { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public DateTime? CustomDate { get; set; }

    public int? CreatedByEmployeeId { get; set; }
    public int? UpdatedByEmployeeId { get; set; }

    [ForeignKey("CreatedByEmployeeId")]
    public Employee? CreatedByEmployee { get; set; }

    [ForeignKey("UpdatedByEmployeeId")]
    public Employee? UpdatedByEmployee { get; set; }
}