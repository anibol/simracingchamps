using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class borrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                if ((int)t.SemiBorra(Guid.Parse(Session["idu"].ToString())) > 0)
                    Response.Redirect("salir.aspx?del=1");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}