using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class inicio : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (Session["org"]!=null && (bool)Session["org"]) Response.Redirect("../gestion/inicio.aspx");
               
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
                t.FillByIDUSUARIO(ds.V_INSCRIPCIONES, Guid.Parse(Session["idu"].ToString()));
                repPendientes.DataSource = ds.V_INSCRIPCIONES;
                repPendientes.DataBind();

                if (Request.QueryString["o"] != null)
                {
                    if (Request.QueryString["o"].ToString() == "1")
                    {
                        lblmsg.Visible = true;
                    }
                }
                if (Request.QueryString["e"] != null)
                {
                    if (Request.QueryString["e"].ToString() == "1")
                    {
                        lblmsg2.Visible = true;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string HayResultados(object idevento)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter te = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                if ((int)te.HayResultadosPublicados(int.Parse(idevento.ToString())) == 0)
                {
                    return "&nbsp;<a class='btn btn-xs btn-danger' href='cancelar_inscripcion.aspx?id=" + idevento.ToString() + "'>Cancelar Inscripción</a>";
                }
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}