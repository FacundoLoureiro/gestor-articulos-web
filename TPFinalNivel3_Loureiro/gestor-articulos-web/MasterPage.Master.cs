using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using datos;
using dominio;

namespace gestor_articulos_web
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {      
        protected void Page_Load(object sender, EventArgs e)
        {
            imgAvatar.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";
            if (!(Page is Login || Page is Registro || Page is Error || Page is ListaProductos ))
            {
                if (SeguridadDatos.SesionActiva(Session["usuario"]))
                {
                    Usuario usuario = (Usuario)Session["usuario"];                   
                    if (!string.IsNullOrEmpty(usuario.UrlImagen))
                    {
                        imgAvatar.ImageUrl = "~/Images/" + usuario.UrlImagen;
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }
            }               
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx", false);
        }
    }
}