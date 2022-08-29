using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace IRT.driver
{
    public partial class salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            if (Request.QueryString["del"]==null)
                Response.Redirect("~/default.aspx", true);
            else
                Response.Redirect("~/login.aspx?del=1", true);
        }
    }
}