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
        
        public List<Articulo> ListaArticulos { get; set; }
        public bool FiltroAvanzadoHome { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FiltroAvanzadoHome = chkAvanzadoHome.Checked;
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
            int articuloId = int.Parse(((Button)sender).CommandArgument);
            Response.Redirect("VerDetalle.aspx?id=" + articuloId);
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

        protected void txtFiltroHome_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaProductos"];
            List<Articulo> listaFiltro = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltroHome.Text.ToUpper()));
            repRepetidor.DataSource = ListaArticulos;
            repRepetidor.DataBind();
        }

        protected void chkAvanzadoHome_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzadoHome = chkAvanzadoHome.Checked;
            txtFiltroHome.Enabled = !FiltroAvanzadoHome;
        }

        protected void btnBuscarHome_Click(object sender, EventArgs e)
        {
            try
            {
                ArticulosDatos datos = new ArticulosDatos();
                repRepetidor.DataSource = datos.filtrar(
                    ddlCampoHome.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text);
                repRepetidor.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void ddlCampoHome_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampoHome.SelectedItem.Value == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }
    }
}