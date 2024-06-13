using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace datos
{
    public static class SeguridadDatos
    {
        public static bool SesionActiva (object user)
        {
            if (user is Usuario usuario && usuario.Id != 0)
            {
                return true;
            }
            return false;
        }
        public static bool esAdmin(object user)
        {
            return user is Usuario usuario && usuario.Admin;
        }
    }
}
