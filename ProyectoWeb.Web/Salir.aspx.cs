using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoWeb.Web
{
    public partial class Salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application.Lock();
            Application["usuario"] = "todos";
            Application["tipoUsuario"] = "todos";
            Application["empresa"] = "JAVIPELL";
            Application["bienvenido"] = "DISEÑO ELEGANTE";
            Application["comentario"] = "Con la plantilla de sitio web adecuada, excelente y receptiva, podrá atraer visitantes y aumentar sus ventas. Este es un tema elegante diseñado para usos múltiples.";
            Application["opcion"] = "";
            Application["imagen"] = "";
            Application["destino"] = "#";
            Application.UnLock();
            Response.Redirect("Inicio.aspx");
        }
    }
}