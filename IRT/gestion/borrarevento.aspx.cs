using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class borrarevento : System.Web.UI.Page
    {
        Models.EventosCN ecn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] == null || !ecn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()))
                {
                    Response.Redirect("inicio.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx",false);
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
      
                if (Request.QueryString["id"] != null && ecn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()))
                {
                    DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                    if (ecn.BorraEvento(int.Parse(Request.QueryString["id"].ToString())))
                        Response.Redirect("inicio.aspx?o=o0", false);
                    else
                        Response.Redirect("inicio.aspx?e=e1");
                }
                else
                    Response.Redirect("inicio.aspx");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}