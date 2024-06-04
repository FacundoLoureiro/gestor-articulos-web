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
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarConsulta();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.Admin = (bool)datos.Lector["admin"];
                    //usuario.Id = datos.Lector.GetInt32(datos.Lector.GetOrdinal("Id"));                   
                    //usuario.Admin = datos.Lector.GetBoolean(datos.Lector.GetOrdinal("admin")) ? Admin.ADMIN : Admin.USUARIO;
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
    
    public int NuevoRegistro(Usuario nuevo)
    {
        AccesoDatos datos = new AccesoDatos();

        try
        {
            datos.setearProcedimiento("NuevoRegistro");
            datos.setearParametro("@email", nuevo.Email);
            datos.setearParametro("@pass", nuevo.Pass);
            return datos.ejecutarAccionScalar();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            datos.cerrarConexion();
        }

    }

    public void ActualizarUsuario(Usuario user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE USERS SET ImagenPerfil = @imagen WHERE Id = @id");
                datos.setearParametro("@imagen", user.UrlImagen);
                datos.setearParametro("@id", user.Id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally 
            {
                datos.cerrarConexion();
            }
        }
   }
}
