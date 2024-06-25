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
    public partial class Default : System.Web.UI.Page
    {
        public bool VerDetalle { get; set; }
        public int ProductoDetalleId { get; set; }
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            VerDetalle = false;
            ProductoDetalleId = 0;
            ArticulosDatos datos = new ArticulosDatos();
            ListaArticulos = datos.listarconSP();
            if (!IsPostBack)
            {
                repRepetidor.DataSource = ListaArticulos;
                repRepetidor.DataBind();
            }
            
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            VerDetalle = true;
            ProductoDetalleId = int.Parse(((Button)sender).CommandArgument);
            repRepetidor.DataSource = ListaArticulos;
            repRepetidor.DataBind();
        }

        protected void btnAgregarFavorito_Click(object sender, EventArgs e)
        {
            Usuario usuario = Session["usuario"] as Usuario;

            if (usuario != null)
            {
                try
                {          
                    Button btn = (Button)sender;
                    int idArticulo = int.Parse(btn.CommandArgument);
                    Favorito favorito = new Favorito
                    {
                        IdUser = usuario.Id,
                        IdArticulo = idArticulo
                    };
                   
                    FavoritosDatos datos = new FavoritosDatos();
                    datos.altaFavSP(favorito);                   
                    Response.Redirect("Favoritos.aspx", false);
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx", false);
                }
            }
            else
            {               
                Response.Redirect("Login.aspx", false);
            }
        }
    }
}