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
    public partial class VerDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			try
			{
				if (!IsPostBack)
				{
                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "" && !IsPostBack)
                    {
                        ArticulosDatos datos = new ArticulosDatos();
                        Articulo seleccionado = (datos.listar(id))[0];
                        imgProducto.Src = seleccionado.ImagenUrl;
                        lblNombre.InnerText = seleccionado.Nombre;
                        lblDescripcion.InnerText = seleccionado.Descripcion;
                        lblMarca.InnerText = seleccionado.Marca.Descripcion;
                        lblCategoria.InnerText = seleccionado.Categoria.Descripcion;
                        lblPrecio.InnerText = seleccionado.Precio.ToString();

                    }
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