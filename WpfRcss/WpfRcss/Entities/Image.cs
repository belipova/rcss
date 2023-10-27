using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Image
{
    public int ImageId { get; set; }
    public Guid ImageGuid { get; set; }
    public string Path { get; set; }
    public DateTime? CreatedAt { get; set; }

    public int? CreatedByEmployeeId { get; set; }

    [ForeignKey("CreatedByEmployeeId")]
    public Employee? CreatedByEmployee { get; set; }
}