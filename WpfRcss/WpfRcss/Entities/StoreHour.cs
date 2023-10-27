using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class StoreHour
{
    public int StoreHourId { get; set; }
    public TimeSpan StartTime { get; set; }
    public TimeSpan EndTime { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }

    public int? CreatedByEmployeeId { get; set; }

    [ForeignKey("CreatedByEmployeeId")]
    public Employee? CreatedByEmployee { get; set; }

    public int? DayVariantId { get; set; }

    [ForeignKey("DayVariantId")]
    public DayVariant? DayVariant { get; set; }

    public int? StoreId { get; set; }

    [ForeignKey("StoreId")]
    public Store? Store { get; set; }

    public int? UpdatedByEmployeeId { get; set; }

    [ForeignKey("UpdatedByEmployeeId")]
    public Employee? UpdatedByEmployee { get; set; }
}