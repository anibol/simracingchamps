using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class cancelar_inscripcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void bCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"]!=null)
                {
                    Models.EventosCN cn = new Models.EventosCN();
                    if (cn.EstaInscrito(Session["idu"].ToString(), int.Parse(Request.QueryString["id"].ToString())))
                    {
                        
                        DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONESTableAdapter();
                        if (t.BorrarIdUsuarioEvento(Guid.Parse(Session["idu"].ToString()), int.Parse(Request.QueryString["id"].ToString()))>0)
                        {
                            DL.EventosDS.EVENTOSRow ev = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                            cn.SendNotificacion(Session["usr"].ToString(), cn.DameEmailUsuario(ev.IDUSUARIO.ToString()), Session["NombrePersona"].ToString(), Session["NombrePersona"].ToString() + " participante del evento " + ev.EVENTO + " ha cancelado su inscripción");
                            Response.Redirect("inicio.aspx?o=1", false);
                        }
                        else
                            Response.Redirect("inicio.aspx?e=1", false);
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