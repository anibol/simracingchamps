using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class teams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DL.UsuariosDS ds = new DL.UsuariosDS();
                DL.UsuariosDSTableAdapters.V_EQUIPOSTableAdapter t = new DL.UsuariosDSTableAdapters.V_EQUIPOSTableAdapter();
                t.FillByTodos(ds.V_EQUIPOS);
                repEquipos.DataSource = ds;
                repEquipos.DataMember = "V_EQUIPOS";
                repEquipos.DataBind();
                repE2.DataSource = ds;
                repE2.DataMember = "V_EQUIPOS";
                repE2.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string DameSocial(object web, object fb, object tw)
        {
            try
            {
                string social = "";
                if (web!=null && web.ToString()!= "") social = "<a target='_blank' class='social' href='" + web.ToString() + "'><i class='fa fa-globe'></i></a>&nbsp;";
                if (tw!=null && tw.ToString() != "") social += "<a target='_blank' class='social' href='http://twitter.com/" + tw + "'><i class='fa fa-twitter'></i></a>&nbsp;";
                if (fb!=null && fb.ToString() != "") social += "<a target='_blank' class='social' href='" + fb + "'><i class='fa fa-facebook'></i></a>&nbsp;";
                return social;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameJefeEquipo(object idusuario)
        {
            try
            {
                DL.UsuariosDS ds2 = new DL.UsuariosDS();
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter tu = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                tu.FillByIDU(ds2.USUARIOS, Guid.Parse(idusuario.ToString()));
               return ds2.USUARIOS[0].NOMBRE + " " + ds2.USUARIOS[0].APELLIDOS;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameAvatar(object idu, object avatar)
        {
            try
            {
                if (avatar.ToString() != "escudo.jpg")
                    return "Content/img/equipos/" + idu.ToString() + "/" + avatar.ToString();
                else
                    return "Content/img/web/escudo.jpg";
            }
            catch (Exception)
            {
                return "Content/img/web/escudo.jpg";
            }
        }
    }
}