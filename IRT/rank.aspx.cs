using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class rank : System.Web.UI.Page
    {
        public string nombre = "", social = "", miembro = "", equipo = "", avatar = "", logoequipo = "";
        DL.EventosDS ds = new DL.EventosDS();
        DL.EventosDSTableAdapters.V_RESULTADOS_POSICIONTableAdapter tpos = new DL.EventosDSTableAdapters.V_RESULTADOS_POSICIONTableAdapter();
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
                    if ((ds.USUARIOS[0].IsAVATARNull() || ds.USUARIOS[0].AVATAR == "isracetime_user.jpg") && (ds.USUARIOS[0].IsAVATAREQUIPONull() || ds.USUARIOS[0].AVATAREQUIPO == ""))
                        avatar = "Content/img/avatar/isracetime_user.jpg";
                    else
                    {
                        if (ds.USUARIOS[0].IsAVATAREQUIPONull() || ds.USUARIOS[0].AVATAREQUIPO == "")
                            avatar = "Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString() + "/" + ds.USUARIOS[0].AVATAR;
                        else
                            avatar = "Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString() + "/" + ds.USUARIOS[0].AVATAREQUIPO;
                    }
                    if (!ds.USUARIOS[0].IsFACEBOOKNull() && ds.USUARIOS[0].FACEBOOK != "") social += "<a class='social' href='" + ds.USUARIOS[0].FACEBOOK + "' target='_blank'><i class='fa fa-facebook'></i></a>&nbsp;";
                    if (!ds.USUARIOS[0].IsTWITTERNull() && ds.USUARIOS[0].TWITTER != "") social += "<a class='social' href='http://twitter.com/" + ds.USUARIOS[0].TWITTER + "' target='_blank'><i class='fa fa-twitter'></i></a>&nbsp;";
                    if (!ds.USUARIOS[0].IsALIASNull())
                        nombre += " (" + ds.USUARIOS[0].ALIAS + ")";
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
                    DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter vt = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
                    DL.EventosDSTableAdapters.V_RESULTADOS_PILOTOTableAdapter tres = new DL.EventosDSTableAdapters.V_RESULTADOS_PILOTOTableAdapter();
                    tres.Fill(ds2.V_RESULTADOS_PILOTO, int.Parse(Request.QueryString["n"].ToString()));
                    vt.FillByIDUSUARIO(ds2.V_INSCRIPCIONES, ds.USUARIOS[0].IDUSUARIO);
                    repPendientes.DataSource = ds2.V_INSCRIPCIONES;


                    ds2.Relations.Add("myrelation", new System.Data.DataColumn[] { ds2.Tables["V_INSCRIPCIONES"].Columns["NID"], ds2.Tables["V_INSCRIPCIONES"].Columns["IDEVENTO"] },
                        new System.Data.DataColumn[] { ds2.Tables["V_RESULTADOS_PILOTO"].Columns["ID"], ds2.Tables["V_RESULTADOS_PILOTO"].Columns["IDEVENTO"] }, false);

                    Page.DataBind();



                }
                else
                    Response.Redirect("404.aspx");

            }
            catch (Exception)
            {
                Response.Redirect("404.aspx");
            }
        }

        public string DamePos(object valor)
        {
            try
            {
                if (valor.ToString() == "9999") return "DNS";
                if (valor.ToString() == "8888") return "RET";
                if (valor.ToString() == "7777") return "DSQ";
                return valor.ToString();
            }
            catch (Exception)
            {
                return "DNS";
            }
        }

        public string Posicion(object nid)
        {
            try
            {
                tpos.Fill(ds.V_RESULTADOS_POSICION, int.Parse(nid.ToString()));
                int cont = 1;
                foreach (DL.EventosDS.V_RESULTADOS_POSICIONRow elto in ds.V_RESULTADOS_POSICION)
                {
                    if (elto.id.ToString() == Request.QueryString["n"].ToString())
                        break;
                    cont++;
                }
                return cont.ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}