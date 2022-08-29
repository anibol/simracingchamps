using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/default.aspx", true);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}