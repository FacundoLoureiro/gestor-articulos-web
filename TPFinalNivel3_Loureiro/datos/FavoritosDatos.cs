using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace datos
{
    public class FavoritosDatos
    {
        public List<Favorito> listarFavSP( int idUser)
        {
            List<Favorito> lista = new List<Favorito>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("storedFavListar");
                datos.setearParametro("@idUser", idUser);
                datos.ejecutarConsulta();
                while (datos.Lector.Read())
                {
                    Favorito fav = new Favorito();
                    fav.Id = (int)datos.Lector["Id"];                    
                    fav.Codigo = (string)datos.Lector["Codigo"];
                    fav.Nombre = (string)datos.Lector["Nombre"];
                    fav.Descripcion = (string)datos.Lector["Descripcion"];
                    fav.Marca = new Marcas();
                    fav.Marca.Id = (int)datos.Lector["IdMarca"];
                    fav.Marca.Descripcion = (string)datos.Lector["Marca"];
                    fav.Categoria = new Categorias();
                    fav.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    fav.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                        fav.ImagenUrl = (string)datos.Lector["ImagenUrl"];

                    fav.Precio = (decimal)datos.Lector["Precio"];

                    lista.Add(fav);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void altaFavSP(Favorito favorito)
        {
            
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("storedAltaFavoritos");
                datos.setearParametro("@Id", favorito.Id);
                datos.setearParametro("@IdUser", favorito.IdUser);
                datos.setearParametro("@IdArticulo", favorito.IdArticulo);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
  }
}
