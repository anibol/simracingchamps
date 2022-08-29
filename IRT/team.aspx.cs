using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class team : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        public string nombre = "", social = "", miembro = "", jefeequipo = "", avatar = "", logoequipo = "", info="", fundacion="";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DL.UsuariosDS DS = new DL.UsuariosDS();
                DL.UsuariosDSTableAdapters.V_EQUIPOSTableAdapter t = new DL.UsuariosDSTableAdapters.V_EQUIPOSTableAdapter();
                t.Fill(DS.V_EQUIPOS, int.Parse(Request.QueryString["id"].ToString()));
                if (DS.V_EQUIPOS.Count > 0)
                {
                    nombre = DS.V_EQUIPOS[0].EQUIPO;
                    if (!DS.V_EQUIPOS[0].IsAVATARNull()) avatar="http://simracingchamps.net/Content/img/equipos/" + Request.QueryString["id"].ToString() + "/" + DS.V_EQUIPOS[0].AVATAR;
                    if (!DS.V_EQUIPOS[0].IsINFONull()) info = DS.V_EQUIPOS[0].INFO;
                    if (!DS.V_EQUIPOS[0].IsWEBNull() && DS.V_EQUIPOS[0].WEB!= "") social = "<a target='_blank' class='social' href='" + DS.V_EQUIPOS[0].WEB + "'><i class='fa fa-globe'></i></a>&nbsp;";
                    if (!DS.V_EQUIPOS[0].IsTWITTERNull() && DS.V_EQUIPOS[0].TWITTER != "") social += "<a target='_blank' class='social' href='" + cn.DameTwitter(DS.V_EQUIPOS[0].TWITTER) + "'><i class='fa fa-twitter'></i></a>&nbsp;";
                    if (!DS.V_EQUIPOS[0].IsFBNull() && DS.V_EQUIPOS[0].FB != "") social += "<a target='_blank' class='social' href='" + DS.V_EQUIPOS[0].FB + "'><i class='fa fa-facebook'></i></a>&nbsp;";
                    if (!DS.V_EQUIPOS[0].IsFUNDACIONNull()) fundacion = DS.V_EQUIPOS[0].FUNDACION;
                    if (avatar == "")
                    {
                        avatar = "Content/img/web/escudo.jpg";
                    }
                  

                    DL.UsuariosDSTableAdapters.V_USUARIOS_EQUIPOTableAdapter tu = new DL.UsuariosDSTableAdapters.V_USUARIOS_EQUIPOTableAdapter();
                    tu.Fill(DS.V_USUARIOS_EQUIPO, int.Parse(Request.QueryString["id"].ToString()));
                    repPendientes.DataSource = DS;
                    repPendientes.DataMember = "V_USUARIOS_EQUIPO";
                    repPendientes.DataBind();

                    DL.UsuariosDS ds2 = new DL.UsuariosDS();
                    DL.UsuariosDSTableAdapters.USUARIOSTableAdapter tu2 = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                    tu2.FillByIDU(ds2.USUARIOS, DS.V_EQUIPOS[0].IDUSUARIO);
                    jefeequipo = ds2.USUARIOS[0].NOMBRE + " " + ds2.USUARIOS[0].APELLIDOS;
                }
                else
                    Response.Redirect("default.aspx", false);
            }
            catch (Exception ex)
            {
                Response.Redirect("default.aspx", false);
            }
        }

        public string DameAvatar(object idu, object avatar)
        {
            try
            {
                if (avatar.ToString() != "isracetime_user.jpg")
                    return "Content/img/avatar/" + idu.ToString() + "/" + avatar.ToString();
                else
                    return "Content/img/avatar/isracetime_user.jpg";
            }
            catch (Exception)
            {
                return "Content/img/avatar/isracetime_user.jpg";
            }
        }

        public string DameTwitter(object sender)
        {
            try
            {
                if (sender.ToString().IndexOf("@") != -1)
                    return "<a target='_blank' href='http://twitter.com/" + sender.ToString().Replace("@", "") + "'><span class='fa fa-twitter'></span></a>";
                else if (sender.ToString().IndexOf("http") != -1)
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-twitter'></span></a>";
                else if (sender.ToString().IndexOf("http") == -1 && sender.ToString() != "" && sender.ToString() != "http://twitter.com/")
                    return "<a target='_blank' href='http://twitter.com/" + sender.ToString() + "'><span class='fa fa-twitter'></span></a>";
                else if (sender.ToString() != "" && sender.ToString() != "http://twitter.com/")
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-twitter'></span></a>";
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameFB(object sender)
        {
            try
            {
                if (sender.ToString() != "" && sender.ToString() != "http://facebook.com/")
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-facebook'></span></a>";
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameYT(object sender)
        {
            try
            {
                if (sender.ToString() != "" && sender.ToString() != "http://youtube.com/")
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-youtube'></span></a>";
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}