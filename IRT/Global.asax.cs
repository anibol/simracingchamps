using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace IRT
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
           
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // excpt is the exception thrown
            // The exception that really happened is retrieved through the GetBaseException() method
            // because the exception returned by the GetLastError() is a HttpException
            try
            {
                string datos = "";
                if (Session["usr"] != null)
                    datos = "Usuario: " + Session["usr"].ToString();
                if (Session["idu"] != null)
                    datos += "IDU: " + Session["idu"].ToString();
                Exception excpt = Server.GetLastError().GetBaseException();
                Models.EventosCN cn = new Models.EventosCN();
                cn.SendError(datos + ": " + excpt.ToString());
            }
            catch (Exception)
            {

            }
            
        }

    }
}