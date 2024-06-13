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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (SeguridadDatos.SesionActiva(Session["usuario"]))
                    {
                        Usuario usuarioActual = (Usuario)Session["usuario"];
                        txtEmail.Text = usuarioActual.Email;
                        txtEmail.ReadOnly = true;
                        txtNombre.Text = usuarioActual.Nombre;
                        txtApellido.Text = usuarioActual.Apellido;
                        if (!string.IsNullOrEmpty(usuarioActual.UrlImagen))
                        {
                            imgNuevoPerfil.ImageUrl = "~/Images/" + usuarioActual.UrlImagen;
                        }
                    }
                    else
                    {
                        Response.Redirect("Login.aspx",false);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario"] != null)
                {
                    UsuarioDatos datos = new UsuarioDatos();
                    Usuario usuarioActual = (Usuario)Session["usuario"];
                    if (txtImagen.PostedFile.FileName != "")
                    {
                        string ruta = Server.MapPath("./Images/");
                        txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuarioActual.Id + ".jpg");
                        usuarioActual.UrlImagen = "perfil-" + usuarioActual.Id + ".jpg";
                    }

                    usuarioActual.Nombre = txtNombre.Text;
                    usuarioActual.Apellido = txtApellido.Text;

                    datos.ActualizarUsuario(usuarioActual);
                    imgNuevoPerfil.ImageUrl = "~/Images/" + usuarioActual.UrlImagen;
                    Image img = (Image)Master.FindControl("imgAvatar");
                    img.ImageUrl = "~/Images/" + usuarioActual.UrlImagen;
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}
