using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class driver : System.Web.UI.MasterPage
    {
        public string usuario = "", fechaalta = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if ((bool)Session["org"]) Response.Redirect("../gestion/inicio.aspx");
                usuario = Session["NombrePersona"].ToString();
                fechaalta = Session["fechaalta"].ToString();
            }
            catch (Exception)
            {
                Response.Redirect("salir.aspx");
            }
        }
    }
}