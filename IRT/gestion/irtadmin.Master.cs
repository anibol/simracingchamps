using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class irtadmin : System.Web.UI.MasterPage
    {
        public bool esorg = false;
        public string usuario = "", fechaalta="";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!(bool)Session["org"]) Response.Redirect("../driver/inicio.aspx");
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