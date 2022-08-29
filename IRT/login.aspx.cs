using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class login : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["del"]!=null && !IsPostBack)
            {
                lblmsg.InnerText = Resources.Global.cuentaeliminada;
                panMensaje.Visible = true;
            }
        }

        protected void bEntrar_Click(object sender, EventArgs e)
        {
            if (tUsuario.Text != "" && tPass.Text != "")
            {
                try
                {
                    //string sb = "";
                    DL.UsuariosDS sds = new DL.UsuariosDS();
                    DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                    //string pass = BL.Functions.Encrypt(tPass.Text);
                  
                    t.FillByIDUSUARIOPASS(sds.USUARIOS, tUsuario.Text, cn.Encrypt(tPass.Text));
                    if (sds.USUARIOS.Count > 0)
                    {
                        Session.Add("super", (tUsuario.Text == "admin@simracingchamps.net"));
                        Session.Add("usr", tUsuario.Text);
                        Session.Add("idu", sds.USUARIOS[0].IDUSUARIO.ToString());
                        Session.Add("NombrePersona", sds.USUARIOS[0].NOMBRE + " " + sds.USUARIOS[0].APELLIDOS);
                        Session.Add("fechaalta", sds.USUARIOS[0].FECHAALTA.Year.ToString());
                        if (!sds.USUARIOS[0].IsALIASNull())
                            Session.Add("Usuario", sds.USUARIOS[0].ALIAS);
                        else
                            Session.Add("Usuario", "");
                        if (!sds.USUARIOS[0].IsAVATARNull() && sds.USUARIOS[0].AVATAR != "" &&  sds.USUARIOS[0].AVATAR != "isracetime_user.jpg")
                            Session.Add("Avatar", "../Content/img/avatar/" + sds.USUARIOS[0].IDUSUARIO.ToString() + "/" + sds.USUARIOS[0].AVATAR);
                        else
                            Session.Add("Avatar", "../Content/img/avatar/isracetime_user.jpg");
                        if (!sds.USUARIOS[0].IsAVATAREQUIPONull() && sds.USUARIOS[0].AVATAREQUIPO != "" && sds.USUARIOS[0].AVATAREQUIPO != "")
                            Session.Add("AvatarEquipo", "../Content/img/avatar/" + sds.USUARIOS[0].IDUSUARIO.ToString() + "/" + sds.USUARIOS[0].AVATAREQUIPO);
                        else
                            Session.Add("AvatarEquipo", "");
                        if (!sds.USUARIOS[0].IsJEFENull() && sds.USUARIOS[0].JEFE)
                            Session.Add("Jefe", "1");
                        else
                            Session.Add("Jefe", "0");


                        Session.Add("logged", true);
                        FormsAuthentication.SetAuthCookie(sds.USUARIOS[0].IDUSUARIO.ToString(), true);
                        if (!sds.USUARIOS[0].IsORGNull() && sds.USUARIOS[0].ORG)
                        {
                            Session.Add("org", true);
                            Response.Redirect("~/gestion/inicio.aspx", false);
                        }
                        else
                        {
                            Session.Add("org", false);
                            Response.Redirect("~/driver/inicio.aspx", false);
                        }
                    }
                    else
                    {
                        // sb = "Datos de acceso incorrectos";
                        lblmsg.InnerText = Resources.Global.login;
                        panMensaje.Visible = true;
                    }
                }
                catch (Exception)
                {
                    //BL.Functions.SendError(ex.ToString());
                    lblmsg.InnerText = Resources.Global.login;
                    panMensaje.Visible = true;
                }
            }
        }
    }
}