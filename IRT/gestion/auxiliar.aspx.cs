using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class auxiliar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string sb = "";
                if (Session["logged"] == null)
                {
                    if (Request.Form.Count == 2)
                    {
                        DL.UsuariosDS sds = new DL.UsuariosDS();
                        DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                        //string pass = BL.Functions.Encrypt(tPass.Text);
                        t.FillByIDUSUARIOPASS(sds.USUARIOS, Request.Form["u"].ToString(), Request.Form["p"].ToString());
                        if (sds.USUARIOS.Count > 0)
                        {
                            Session.Add("IdUsuario", sds.USUARIOS[0].IDUSUARIO.ToString());
                            Session.Add("NombrePersona", sds.USUARIOS[0].NOMBRE + " " + sds.USUARIOS[0].NOMBRE);
                            Session.Add("Usuario", sds.USUARIOS[0].ALIAS);
                            Session.Add("Avatar", sds.USUARIOS[0].AVATAR);
                            Session.Add("logged", true);
                            FormsAuthentication.SetAuthCookie(sds.USUARIOS[0].IDUSUARIO.ToString(), true);
                            sb = "0";
                        }
                        else
                        {
                          sb = "Datos de acceso incorrectos";
                        }
                    }
                }
                else
                {
                    if (Session.IsNewSession)
                        sb = "XXX";
                    else
                    {
                    }
                }

                Response.Clear();
                Response.CacheControl = "no-cache";
                Response.ContentType = "text/html";
                Response.Write(sb.ToString());
            }
            catch (Exception)
            {
                Response.Clear();
                Response.CacheControl = "no-cache";
                Response.ContentType = "text/html";
                Response.Write("0");
            }
        }
    }
}