using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using datos;

namespace gestor_articulos_web
{
    public partial class ListaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosDatos datos = new ArticulosDatos();   
            dgvArticulos.DataSource = datos.listarconSP();
            dgvArticulos.DataBind();

        }
    }
}