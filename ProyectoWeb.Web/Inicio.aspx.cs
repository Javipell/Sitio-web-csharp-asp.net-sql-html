using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoWeb.Web
{
    public partial class Inicio1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblBienvenido.Text = Application["bienvenido"].ToString();
            lblComentario.Text = Application["comentario"].ToString();
            Image1.ImageUrl = Application["imagen"].ToString();
            lblDestino.Text = Application["opcion"].ToString();
        }
    }
}