using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProyectoWeb.Infraestructura.Datos;
using ProyectoWeb.Infraestructura;

namespace ProyectoWeb.Web
{
    public partial class GestionEntrevistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string GuardarEntrevista(string idEntrevista, string fechaPasada, string horaPasada, string nombre, string apellidos, string dni, string telefono, Int16 asiste, Int16 valoracion)
        {
            string resultado = string.Empty;
            Entrevistas entrevista = new Entrevistas();
            entrevista.Nombre = nombre;
            entrevista.Apellidos = apellidos;
            entrevista.Dni = dni;
            entrevista.Asiste = Convert.ToInt16(asiste);
            entrevista.Valoracion = Convert.ToInt16(valoracion);
            entrevista.Telefono = telefono;

            // convertir fecha y hora 01/12/2014 14:32
            string año = fechaPasada.Substring(6, 4);
            string mes = fechaPasada.Substring(3, 2);
            string dia = fechaPasada.Substring(0, 2);
            string hora = horaPasada.Substring(0, 2);
            string minuto = horaPasada.Substring(3, 2);

            entrevista.Fecha = new DateTime(int.Parse(año), int.Parse(mes), int.Parse(dia), int.Parse(hora), int.Parse(minuto), 0);

            if (idEntrevista == "-1")
            {
                resultado = EntrevistasDLL.Guardar(entrevista);
            }
            else
            {
                resultado = EntrevistasDLL.Actualizar(entrevista);
            }

            return resultado;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Int16 asiste = 0;
            if (ckAsiste.Checked)
            {
                asiste = 1;
            }

            string cadena = "nombre: " + txtNombre.Text
                + " apellidos: " + txtApellidos.Text
                + " dni: " + txtDni.Text
                + " telefono: " + txtTelefono.Text
                + " asiste: " + asiste 
                + " valoracion: " + txtValoracion.Text
                + " fecha: " + txtFecha2.SelectedDate
                + " hora: " + txtHora.Text;

            Response.Write(s: "<script laguage=javascript> alert('"
                + cadena
                + "');</script>");
            
            string resultado = GuardarEntrevista("-1", Convert.ToString( txtFecha2.SelectedDate), txtHora.Text, txtNombre.Text, txtApellidos.Text, txtDni.Text, txtTelefono.Text, asiste, Convert.ToInt16(txtValoracion.Text) );

            Response.Write(s: "<script laguage=javascript> alert('"
                + resultado
                + "');</script>");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (txtFecha2.Visible)
            {
                txtFecha2.Visible = false;
            }
            else
            {
                txtFecha2.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            txtHora.Text = Convert.ToString( DateTime.Now).Substring(10,5);
        }
    }
}