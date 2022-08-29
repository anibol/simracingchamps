using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class irt : System.Web.UI.MasterPage
    {
        public bool esorg = false;
        public string usuario = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                usuario = Session["usuario"].ToString();
            }
            catch (Exception)
            {
            }
        }
    }
}