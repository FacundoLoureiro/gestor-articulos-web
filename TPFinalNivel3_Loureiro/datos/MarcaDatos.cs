using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace datos
{
    public class MarcaDatos
    {
        public List<Marcas> listar()
        {
            List<Marcas> lista = new List<Marcas>();
            AccesoDatos acceso = new AccesoDatos();
            try
            {

                acceso.setearConsulta("SELECT Id, Descripcion FROM MARCAS");
                acceso.ejecutarConsulta();


                while (acceso.Lector.Read())
                {
                    Marcas aux = new Marcas();
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
