using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class borrar : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    if (Request.QueryString["del"]==null)
                        Response.Redirect("inicio.aspx", false);
                    if (!cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                        Response.Redirect("inicio.aspx", false);
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                if ((int)t.BorrarID(int.Parse(Request.QueryString["del"].ToString()))>0)
                    Response.Redirect("circuitos.aspx?id=" + Request.QueryString["id"].ToString() + "&o=0", false);
                else
                    Response.Redirect("circuitos.aspx?id=" + Request.QueryString["id"].ToString() + "&e=0", false);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}