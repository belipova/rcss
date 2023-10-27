using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WpfRcss.Entities;

public class Employee
{
    [Key]
    public int EmployeeId { get; set; }
    public string EmployeeCode { get; set; }
    public string LastName { get; set; }
    public string FirstName { get; set; }
    public string MiddleName { get; set; }
    public DateTime DateOfBirth { get; set; }
    public string Position { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public string Email { get; set; }
    public string PhoneNumber { get; set; }

    public int? ImageId { get; set; }

    [ForeignKey("ImageId")]
    public Image? Image { get; set; }

    public int? CreatedByEmployeeId { get; set; }

    [ForeignKey("CreatedByEmployeeId")]
    public Employee? CreatedByEmployee { get; set; }

    public int UpdatedByEmployeeId { get; set; }

    [ForeignKey("UpdatedByEmployeeId")]
    public Employee? UpdatedByEmployee { get; set; }

    public int? StoreWorkedAtId { get; set; }

    [ForeignKey("StoreWorkedAtId")]
    public Store? StoreWorkedAt { get; set; }

    public int? HomeAddressId { get; set; }

    [ForeignKey("HomeAddressId")]
    public Address? HomeAddress { get; set; }
}