using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ProyectoWeb.Infraestructura.Datos;
using System.Data;

namespace ProyectoWeb.Infraestructura
{
    public static class EntrevistasDLL
    {

        public static string Actualizar(this Entrevistas entrevista)
        {
            string resultado = String.Empty;
            
            try
            {
                ProyectoWebContainer ctx = new ProyectoWebContainer();
                var consulta = (from cl in ctx.EntrevistasSet
                                where cl.IdEntrevista == entrevista.IdEntrevista
                                select cl).Single<Entrevistas>();
                resultado = "sql: " + consulta;
                if (consulta != null)
                {
                    ctx.Entry(consulta).CurrentValues.SetValues(entrevista);
                    ctx.SaveChanges();
                }
                resultado = "";
            }
            catch (Exception ex)
            {
                resultado += "\nError, " + ex.Message;
            }
            return resultado;
        }

        public static string Guardar(this Entrevistas entrevista)
        {
            string resultado = String.Empty;
            
            try
            {
                ProyectoWebContainer ctx = new ProyectoWebContainer();
                ctx.EntrevistasSet.Add(entrevista);
                ctx.SaveChanges();
            }
            catch (Exception ex)
            {
                resultado = "Error, " + ex.Message+" inner "+ ex.InnerException;
            }
            return resultado;
        }

        public static string Eliminar(this Entrevistas entrevista)
        {
            string resultado = String.Empty;
            try
            {
                var bd = new ProyectoWebContainer();
                var consulta = (from e in bd.EntrevistasSet
                                where e.IdEntrevista == entrevista.IdEntrevista
                                select e);
                if (consulta != null && consulta.Any())
                {
                    foreach (Entrevistas t in consulta)
                    {
                        bd.EntrevistasSet.Remove(t);
                    }
                    bd.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                resultado = "Error, " + ex.Message;
            }
            return resultado;
        }
    
    }
}
