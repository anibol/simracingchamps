using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class resultados : System.Web.UI.Page
    {
        public string result = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Models.EventosCN cn = new Models.EventosCN();
            try
            {
                if (cn.EstaInscrito(Session["idu"].ToString(), int.Parse(Request.QueryString["id"].ToString())))
                    result = cn.ResultadosFinal(int.Parse(Request.QueryString["id"].ToString()));
                else
                    Response.Redirect("inicio.aspx", true);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}