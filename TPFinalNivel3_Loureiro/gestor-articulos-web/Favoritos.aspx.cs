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
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Favorito> ListaFavoritos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = Session["usuario"] as Usuario;

            if (usuario != null)
            {
                int idUser = usuario.Id;

                FavoritosDatos datos = new FavoritosDatos();
                ListaFavoritos = datos.listarFavSP(idUser);

                if (!IsPostBack)
                {
                    repRepetidor.DataSource = ListaFavoritos;
                    repRepetidor.DataBind();
                }
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }
    }
    
}