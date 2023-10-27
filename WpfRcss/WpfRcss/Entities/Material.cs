using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Material
{
    public int MaterialId { get; set; }
    public string Title { get; set; }

    public int? ColorId { get; set; }

    [ForeignKey("ColorId")]
    public Color? Color { get; set; }
}