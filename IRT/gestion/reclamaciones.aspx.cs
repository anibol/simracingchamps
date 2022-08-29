using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class reclamaciones : System.Web.UI.Page
    {
        public string campeonato = "";
        DL.ReclamacionesDS.EVENTOS_RECLAMACIONESRow f;
        DL.ReclamacionesDS ds = new DL.ReclamacionesDS();
        Models.ReclamacionesCN cn = new Models.ReclamacionesCN();
        Models.EventosCN ecn = new Models.EventosCN();
        DL.ReclamacionesDSTableAdapters.V_RECLAMACIONES_ORGTableAdapter t = new DL.ReclamacionesDSTableAdapters.V_RECLAMACIONES_ORGTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    campeonato = ": " + ecn.Campeonato(int.Parse(Request.QueryString["id"].ToString()));
                    t.Fill(ds.V_RECLAMACIONES_ORG, int.Parse(Request.QueryString["id"].ToString()), Guid.Parse(Session["idu"].ToString()));
                    repDatos.DataSource = ds;
                    repDatos.DataMember = "V_RECLAMACIONES_ORG";
                    repDatos.DataBind();
                }


            }
            catch (Exception ex)
            {
                Response.Redirect("inicio.aspx", false);
            }
        }
    }
}