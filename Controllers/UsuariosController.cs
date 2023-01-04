using productosDeTienda.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace apiTienda.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : Controller
    {
        private readonly tiendaContext _dbcontext;

        public UsuariosController(tiendaContext context)
        {
            _dbcontext = context;
        }

        [HttpGet]
        [Route("ListaEmail")]
        public async Task<IActionResult> ListaEmail()
        {
            List<Usuario> ListaEmail = await _dbcontext.Usuarios.OrderByDescending(c => c.Email).ToListAsync();

            return StatusCode(StatusCodes.Status200OK, ListaEmail);
        }

        [HttpGet("{email}/{password}")]        
        public ActionResult<List<Usuario>> GetIniciarSesion(string email, string password)
        {
            var usuarios = _dbcontext.Usuarios.Where(usuario => usuario.Email.Equals(email) && usuario.Clave.Equals(password)).ToList();

            if (usuarios == null)
            {
                return NotFound();
            }

            return usuarios;
        }
    }
}
