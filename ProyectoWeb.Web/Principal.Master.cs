using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProyectoWeb.Infraestructura;
using System.Data;
using System.Web.Services;

namespace ProyectoWeb.Web
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            CrearMenu();
        }

        public void CrearMenu()
        {
            string sql = String.Format("SELECT * FROM MenusSet WHERE TipoUsuario='{0}'; SELECT * FROM SubMenuSet WHERE TipoUsuario='{1}'", Application["usuario"], Application["usuario"]);

            //Response.Write("<script laguage=javascript> alert('Carga de pagina: " + Application["usuario"] + "');</script>");

            Conexiones conexion = new Conexiones();
            DataSet dataSet = conexion.Ejecutar(sql);
            dataSet.Relations.Add("ChildRows", 
                dataSet.Tables[0].Columns["IdMenu"], 
                dataSet.Tables[1].Columns["IdMenu"]);

            Menu1.Items.Clear();

            foreach (DataRow nivel1Menu in dataSet.Tables[0].Rows )
            {
                MenuItem menu = new MenuItem();
                menu.Text = nivel1Menu["NombreMenu"].ToString();
                menu.NavigateUrl = nivel1Menu["NombreMenu"].ToString() + ".aspx";

                DataRow[] nivel2Menus = nivel1Menu.GetChildRows("ChildRows");
                foreach (DataRow nivel2Menu in nivel2Menus )
                {
                    MenuItem subMenu = new MenuItem();
                    subMenu.Text = nivel2Menu["NombreSubMenu"].ToString();
                    subMenu.NavigateUrl = nivel2Menu["NombreSubMenu"].ToString() + ".aspx";
                    menu.ChildItems.Add(subMenu);
                }
                Menu1.Items.Add(menu);
            }
        }
    }
}