using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProyectoWeb.Infraestructura;
using System.Data;

namespace ProyectoWeb.Web
{
    public partial class GestionUsuarios : System.Web.UI.Page
    {
        public static int idUsuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //LecturaDatos();
        }
        protected void LecturaDatos()
        {
            Conexiones conexion = new Conexiones();
            string sql = "SELECT * FROM usuariosSet";
            DataSet dataset = conexion.Ejecutar(sql);
            idUsuario = Convert.ToInt16( dataset.Tables[0].Rows[0]["IdUsuario"].ToString());
            Image1.ImageUrl = dataset.Tables[0].Rows[0]["Foto"].ToString();
            /*txtNombreUsuario.Text = dataset.Tables[0].Rows[0]["NombreUsuario"].ToString();
            txtNickUsuario.Text = dataset.Tables[0].Rows[0]["NickUsuario"].ToString();
            txtClaveUsuario.Text = dataset.Tables[0].Rows[0]["ClaveUsuario"].ToString();
            txtAdministrador.Text = dataset.Tables[0].Rows[0]["Administrador"].ToString();
            txtFoto.Text = dataset.Tables[0].Rows[0]["Foto"].ToString();*/
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
          
        }

    }
}