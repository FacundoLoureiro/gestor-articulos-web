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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void btnRegistro_Click1(object sender, EventArgs e)
        {
            try
            {
                Registros registro = new Registros();
                RegistroDatos registroDatos = new RegistroDatos();
                registro.Email = txtEmaiRegistro.Text;
                registro.Pass = txtPassRegistro.Text;
                int id = registroDatos.NuevoRegistro(registro);

                Response.Redirect("ListaProductos.aspx", false);
            }
            catch (Exception)
            {

                Session.Add("Error.aspx", "Error");
            }
        }
    }
}