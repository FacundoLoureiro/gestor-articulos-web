using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace datos
{
    public class UsuarioDatos
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Id, email, pass, admin FROM USERS WHERE email = @email AND pass = @pass");
                datos.setearParametro("@email", usuario.User);
                datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarConsulta();
                while (datos.Lector.Read())
                {
                    usuario.Id = datos.Lector.GetInt32(datos.Lector.GetOrdinal("Id"));                   
                    usuario.TipoUsuario = datos.Lector.GetBoolean(datos.Lector.GetOrdinal("admin")) ? TipoUsuario.ADMIN : TipoUsuario.USUARIO;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally{
                datos.cerrarConexion();
            }
        }
    }
}
