using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class ausencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    Models.EventosCN cn = new Models.EventosCN();
                    if (cn.EstaInscrito(Session["idu"].ToString(), int.Parse(Request.QueryString["id"].ToString())))
                    {
                        DL.EventosDS.EVENTOSRow ev = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                        cn.SendNotificacion(Session["usr"].ToString(), cn.DameEmailUsuario(ev.IDUSUARIO.ToString()), Session["NombrePersona"].ToString(), "Notificación de ausencia por parte de " + Session["NombrePersona"].ToString() + " participante del evento " + ev.EVENTO + "<p>Observaciones:" + tMotivo.Text + "</p>" );
                        Response.Redirect("inicio.aspx?o=1", false);
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}