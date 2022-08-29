using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class widgets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                litWidget.Text = Server.HtmlEncode("<script language=\"javascript\" src=\"http://simracingchamps.net/visor.aspx?id=" + Request.QueryString["id"].ToString() + "&t=1\" charset=\"iso-8859-1\"></script>" +
                      "<div style=\"font-size: 0.8em;line-height: 1em;background: #000;color: #fff;margin: 0 auto;padding: 3px 0px 3px 0px;width:100%;text-align:center;font-family: Tahoma, Geneva, Verdana, sans-serif\"><a target=\"_blank\" style=\"color:white;text-decoration:none;\" href=\"http://SimRacingChamps.net\">SimRacingChamps.net</a></div>");

                litWidgetSimple.Text = Server.HtmlEncode("<script language=\"javascript\" src=\"http://simracingchamps.net/visor.aspx?id=" + Request.QueryString["id"].ToString() + "\" charset=\"iso-8859-1\"></script>" +
                "<div style=\"font-size: 0.8em;line-height: 1em;background: #000;color: #fff;margin: 0 auto;padding: 3px 0px 3px 0px;width:100%;text-align:center;font-family: Tahoma, Geneva, Verdana, sans-serif\"><a target=\"_blank\" style=\"color:white;text-decoration:none;\" href=\"http://SimRacingChamps.net\">SimRacingChamps.net</a></div>");

            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx",false);
            }
        }
    }
}