using System.ComponentModel.DataAnnotations;

namespace InventorySystem.Application.DTOs;

public class ProductDto
{
    public int Id { get; set; }
    [Required(ErrorMessage = "El nombre es obligatorio.")]
    public string Name { get; set; } = string.Empty;

    [Range(0.01, double.MaxValue, ErrorMessage = "El precio debe ser mayor a 0.")]
    public decimal Price { get; set; }

    public string Description { get; set; } = string.Empty;

    [Range(0, int.MaxValue, ErrorMessage = "El stock no puede ser negativo.")]
    public int Stock { get; set; }
    public string Status { get; set; } = string.Empty;
}