﻿using System;
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
                Usuario usuario = new Usuario
                {
                    Email = txtEmailRegistro.Text,
                    Pass = txtPassRegistro.Text
                };
                UsuarioDatos usuarioDatos = new UsuarioDatos();
                int id = usuarioDatos.NuevoRegistro(usuario);

                Response.Redirect("MiPerfil.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}