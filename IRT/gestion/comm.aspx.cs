using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace IRT.gestion
{
    public partial class comm : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession)
                    Response.Redirect("salir.aspx", false);
                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        if (!cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) && !(bool)Session["super"])
                            Response.Redirect("inicio.aspx", false);
                    }
                }
            }
            catch (Exception)
            {
            }

        }

        protected void bSend_Click(object sender, EventArgs e)
        {
            try
            {
                lblmsg.Text = "";
                DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));

                DL.UsuariosDS dsu = new DL.UsuariosDS();
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter tu = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                tu.FillByIDU(dsu.USUARIOS, Guid.Parse(Session["idu"].ToString()));

                DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter t = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
                DL.EventosDS ds = new DL.EventosDS();
                t.Fill(ds.V_INSCRIPCIONES, int.Parse(Request.QueryString["id"].ToString()));
                string aux = "";
                SmtpClient sc = new SmtpClient();
                string servidor = "MAIL5001.SmarterASP.NET";
                sc.Host = servidor;
                sc.Timeout = 120;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential("informacion@simracingchamps.net", "Nico6Vera1_");
                sc.EnableSsl = false;
                //foreach (DL.EventosDS.V_INSCRIPCIONESRow fila in ds.V_INSCRIPCIONES)
               
                    foreach (DL.EventosDS.V_INSCRIPCIONESRow fila in ds.V_INSCRIPCIONES)
                    {
                        aux = cn.SendComm(dsu.USUARIOS[0].USUARIO, fila.USUARIO, evento.EVENTO, dsu.USUARIOS[0].NOMBRE, tMensaje.Text, tTitulo.Text, sc);
                        // System.Threading.Thread.Sleep(5000);
                        lblmsg.Text += aux + "<br>";
                    }
                

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}