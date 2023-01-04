using System;
using System.Collections.Generic;

namespace productosDeTienda.Models
{
    public partial class Producto
    {
        public long IdProduct { get; set; }
        public string? Nombre { get; set; }
        public string? Marca { get; set; }
        public string? Categoria { get; set; }
        public decimal? Precio { get; set; }
        public string? Foto { get; set; }
        public string? Descripcion { get; set; }
    }
}
