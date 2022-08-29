using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class rank_org : System.Web.UI.Page
    {
        public string nombre = "", social = "", miembro = "", equipo = "", avatar = "", logoequipo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DL.UsuariosDS ds = new DL.UsuariosDS();
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                DL.UsuariosDSTableAdapters.EQUIPOSTableAdapter eq = new DL.UsuariosDSTableAdapters.EQUIPOSTableAdapter();
                t.FillByID(ds.USUARIOS, int.Parse(Request.QueryString["n"].ToString()));
                if (ds.USUARIOS.Count > 0)
                {
                    nombre = ds.USUARIOS[0].NOMBRE + " " + ds.USUARIOS[0].APELLIDOS;
                    if (ds.USUARIOS[0].IsAVATARNull() || ds.USUARIOS[0].AVATAR == "isracetime_user.jpg")
                        avatar = "Content/img/avatar/isracetime_user.jpg";
                    else
                        avatar = "Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString() + "/" + ds.USUARIOS[0].AVATAR;
                    if (!ds.USUARIOS[0].IsWEBNull() && ds.USUARIOS[0].WEB != "") social += "<a class='social' href='" + ds.USUARIOS[0].WEB + "' target='_blank'><i class='fa fa-globe'></i></a>&nbsp;";
                    social += "<a class='social' href='mailto:" + ds.USUARIOS[0].USUARIO + "'><i class='fa fa-envelope'></i></a>&nbsp;";
                    if (!ds.USUARIOS[0].IsFACEBOOKNull() && ds.USUARIOS[0].FACEBOOK != "") social += "<a class='social' href='" + ds.USUARIOS[0].FACEBOOK + "' target='_blank'><i class='fa fa-facebook'></i></a>&nbsp;";
                    if (!ds.USUARIOS[0].IsTWITTERNull() && ds.USUARIOS[0].TWITTER != "") social += "<a class='social' href='http://twitter.com/" + ds.USUARIOS[0].TWITTER + "' target='_blank'><i class='fa fa-twitter'></i></a>&nbsp;";
                    
                    if (!ds.USUARIOS[0].IsCODPAISNull())
                        nombre = "<img src='Content/img/flags/" + ds.USUARIOS[0].CODPAIS.Trim() + ".png'>&nbsp;" + nombre;
                    if (!ds.USUARIOS[0].IsIDEQUIPONull())
                    {
                        eq.FillByID(ds.EQUIPOS, ds.USUARIOS[0].IDEQUIPO);
                        if (ds.EQUIPOS.Count > 0)
                        {
                            equipo = ds.EQUIPOS[0].EQUIPO;
                            if (!ds.EQUIPOS[0].IsAVATARNull())
                                logoequipo = "Content/img/equipos/" + ds.EQUIPOS[0].ID.ToString() + "/" + ds.EQUIPOS[0].AVATAR;
                        }
                    }

                    DL.EventosDS ds2 = new DL.EventosDS();
                    DL.EventosDSTableAdapters.V_EVENTOSTableAdapter tu = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
                    tu.FillByORG(ds2.V_EVENTOS, ds.USUARIOS[0].IDUSUARIO);
                    repPendientes.DataSource = ds2.V_EVENTOS;
                    repPendientes.DataBind();

                }
                else
                    Response.Redirect("404.aspx");

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}