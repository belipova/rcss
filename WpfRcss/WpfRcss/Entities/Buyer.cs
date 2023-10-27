using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Buyer
{
    public int BuyerId { get; set; }
    
    public string PhoneNumber { get; set; }
    public string Email { get; set; }
    public string FirstName { get; set; }
    public string MiddleName { get; set; }
    public string LastName { get; set; }
    public int? PhotoId { get; set; }

    [ForeignKey("PhotoId")]
    public Image? Photo { get; set; }

    public int? AddressId { get; set; }

    [ForeignKey("AddressId")]
    public Address? Address { get; set; }
}