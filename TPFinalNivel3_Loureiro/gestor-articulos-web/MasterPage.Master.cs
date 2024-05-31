using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using datos;

namespace gestor_articulos_web
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(Page is Login))
            {
                if (SeguridadDatos.SesionActiva(Session["usuario"]))
                    Response.Redirect("Login.aspx", false);
            }           
        }
    }
}