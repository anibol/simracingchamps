using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class _default_old : System.Web.UI.Page
    {
        
        Models.EventosDS ds = new Models.EventosDS();
        Models.EventosDSTableAdapters.V_EVENTOSTableAdapter  t = new Models.EventosDSTableAdapters.V_EVENTOSTableAdapter();
        Models.EventosDSTableAdapters.V_ETAPASTableAdapter ve = new Models.EventosDSTableAdapters.V_ETAPASTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                t.Fill(ds.V_EVENTOS);
                repEventos.DataSource = ds;
                repEventos.DataMember = "V_EVENTOS";
                repEventos.DataBind();
                ve.FillByProximasCarreras(ds.V_ETAPAS);
                repProxCarreras.DataSource = ds;
                repProxCarreras.DataMember = "V_ETAPAS";
                repProxCarreras.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string DameDuracion(object vueltas, object tiempo)
        {
            try
            {
                if (vueltas.ToString() == "0")
                    return tiempo.ToString() + " minutos";
                else
                    return vueltas.ToString() + " vueltas";

            }
            catch (Exception)
            {
                return "No especificado";
            }
        }

        public string DameSetup(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return "Fixed";
                else
                    return "Open";
            }
            catch (Exception)
            {
                return "Fixed";
            }
        }

        public string DameBandera(object sender)
        {
            try
            {
                return "<img src='Content/img/flags/" + sender.ToString().Trim() + ".png'>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameMes(object sender)
        {
            try
            {
                return DateTime.Parse(sender.ToString()).ToShortMonthName();
            }
            catch (Exception)
            {
                return "mes";
            }
        }

    }

    static class DateTimeExtensions
    {
        public static string ToMonthName(this DateTime dateTime)
        {
            return CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(dateTime.Month);
        }

        public static string ToShortMonthName(this DateTime dateTime)
        {
            return CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(dateTime.Month);
        }
    }
}