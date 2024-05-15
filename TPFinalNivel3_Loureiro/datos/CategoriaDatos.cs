using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace datos
{
    public class CategoriaDatos
    {
        public List<Categorias> listar()
        {
            List<Categorias> lista = new List<Categorias>();
            AccesoDatos acceso = new AccesoDatos();
            try
            {

                acceso.setearConsulta("SELECT Id, Descripcion FROM CATEGORIAS");
                acceso.ejecutarConsulta();


                while (acceso.Lector.Read())
                {
                    Categorias aux = new Categorias();
                    aux.Id = (int)acceso.Lector["Id"];
                    aux.Descripcion = (string)acceso.Lector["Descripcion"];

                    lista.Add(aux);

                }


                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                acceso.cerrarConexion();
            }


        }


    }
}
