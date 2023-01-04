using productosDeTienda.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace apiTienda.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : Controller
    {
        private readonly tiendaContext _dbcontext;

        public ProductosController(tiendaContext context)
        {
            _dbcontext = context;
        }

        [HttpGet]
        [Route("ListaProductos")]
        public async Task<IActionResult> ListaProductos()
        {
            List<Producto> ListaProductos = await _dbcontext.Productos.OrderByDescending(c => c.IdProduct).ToListAsync();

            return StatusCode(StatusCodes.Status200OK, ListaProductos);
        }



    }
}
