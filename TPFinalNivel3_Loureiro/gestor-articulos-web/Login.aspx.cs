using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using datos;

namespace gestor_articulos_web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioDatos datos = new UsuarioDatos();
            try
            {
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPassword.Text;
                if (datos.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    System.Diagnostics.Debug.WriteLine("Inicio de sesión exitoso. Redirigiendo a MiPerfil.aspx...");
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    Session.Add("error", "email o pass incorrecta");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }
    }
}