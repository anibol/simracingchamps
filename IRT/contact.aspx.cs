using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack)
                {
                    Models.EventosCN cn = new Models.EventosCN();
                    //string email = String.Format("{0}", Request.Form["email"]);
                    //string nombre = String.Format("{0}", Request.Form["name"]);
                    //string mensaje = String.Format("{0}", Request.Form["message"]);
                    cn.SendContacto(email.Value, name.Value, message.Value);
                    lblmsg.Text = Resources.Global.contacto;
                    lblmsg.Visible = true;
                    Response.Redirect("gracias.aspx", true);
                }
            }
            catch (Exception)
            {
            }
            
        }
    }
}