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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty( txtUsuario.Text ))
            {
                string sql = String.Format("SELECT * FROM usuariosSet WHERE NickUsuario='{0}' AND ClaveUsuario='{1}'",txtUsuario.Text.Trim(), txtPassword.Text.Trim());
                Conexiones conexion = new Conexiones();
                DataSet dataSet=  conexion.Ejecutar(sql);
                int filas = dataSet.Tables[0].Rows.Count;
                string mensaje = "";
                if (filas == 1)
                {
                    mensaje = "ACCESO CONCEDIDO.";
                    if (Convert.ToByte( dataSet.Tables[0].Rows[0]["Administrador"]) == 1)
                    {
                        Application.Lock();
                        Application["usuario"] = "admin";
                        Application["tipoUsuario"] = "admin";
                        Application.UnLock();
                    }
                    else
                    {
                        Application.Lock();
                        Application["usuario"] = dataSet.Tables[0].Rows[0]["NombreUsuario"].ToString();
                        Application["tipoUsuario"] = "registrado";
                        Application.UnLock();
                    }
                    //Response.Write("<script laguage=javascript> alert('cambio " + Application["usuario"] + "');</script>");
                    mensaje = "Bienvenido " + Application["usuario"];
                    Application["bienvenido"]= mensaje;
                    Application["comentario"]="";
                    Application["imagen"]= dataSet.Tables[0].Rows[0]["foto"].ToString();
                    Application["opcion"]="CERRAR SESION";
                }
                else
                {
                    mensaje = "ERROR DE ACCESO.";
                }
                
                Response.Write("<script> alert('" + mensaje + "');</script>");
                Response.Redirect("Inicio.aspx");
                

            }
        }
        protected void cerrarSesion()
        {
            Application.Lock();
            Application["usuario"] = "todos";
            Application.UnLock();
            Response.Redirect("Inicio.aspx");
        }
    }
}