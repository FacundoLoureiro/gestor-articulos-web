﻿using System;
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
            //if (SeguridadDatos.SesionActiva(Session["usuario"]))
            //   Response.Redirect("Login.aspx", false);
            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                if (usuario != null && !string.IsNullOrEmpty(usuario.UrlImagen))
                {
                    imgNuevoPerfil.ImageUrl = "~/Images/" + usuario.UrlImagen;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioDatos datos = new UsuarioDatos();               
                Usuario usuario = (Usuario)Session["usuario"];
                if (txtImagen.PostedFile.FileName != "") 
                { 
                    string ruta = Server.MapPath("./Images/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuario.Id + ".jpg");
                    usuario.UrlImagen = "perfil-" + usuario.Id + ".jpg";
                }

                datos.ActualizarUsuario(usuario);
                imgNuevoPerfil.ImageUrl = "~/Images/" + usuario.UrlImagen;
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/Images/" + usuario.UrlImagen;
            }
            catch ( Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}