using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class cuenta : System.Web.UI.Page
    {
        public string ano = "", organizador = "", altaequipo="", nombreequipo="", logoequipo="";
        public bool esorg = false;
        DL.UsuariosDS ds = new DL.UsuariosDS();
        Models.EventosCN cn = new Models.EventosCN();

        protected void bEliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("borrar.aspx", true);
        }

        DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
        protected void bGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                lblmsg.Visible = false;
                lblmsg2.Visible = false;
                if (tPass.Text != "" && tPass2.Text != "" && tPass.Text != tPass2.Text)
                {
                    lblmsg2.Visible = true;
                    return;
                }
                t.FillByIDU(ds.USUARIOS, Guid.Parse(Session["idu"].ToString()));
                if (ds.USUARIOS.Count != 0)
                {
                    DL.UsuariosDS.USUARIOSRow f = ds.USUARIOS[0];
                    f.NOMBRE = tNombre.Text;
                    f.APELLIDOS = tApellidos.Text;
                    f.USUARIO = tEmail.Text;
                    if (tPass.Text != "" && tPass2.Text != "") f.PASS = cn.Encrypt(tPass.Text); 
                    f.NOMBRE = tNombre.Text;
                    f.ALIAS = tAlias.Text;
                    f.TWITTER = tTwitter.Text.Replace("http://", "").Replace("@", "");
                    if (tFacebook.Text != "")
                    {
                        if (tFacebook.Text.IndexOf("http") == -1)
                            f.FACEBOOK = "http://" + tFacebook.Text;
                        else
                            f.FACEBOOK = tFacebook.Text;
                    }
                    else
                        f.FACEBOOK = "";
                    if (tYouTube.Text != "")
                    {
                        if (tYouTube.Text.IndexOf("http") == -1)
                            f.YOUTUBE = "http://" + tYouTube.Text;
                        else
                            f.YOUTUBE = tYouTube.Text;
                    }
                    else
                        f.YOUTUBE = "";
                    f.CODPAIS = cbPais.SelectedValue.ToString();
                    f.NOMBREIRACING = tNombreIRacing.Text;
                    f.PSN = tPSN.Text;
                    f.XBOXID = tXBOXID.Text;
                    f.IRID = tIDIracing.Text;
                    f.RRID = tRRID.Text;
                    f.ZONA = cbZonaHoraria.SelectedValue.ToString();
                    if (fUpload.HasFile)
                    {
                        if (!Directory.Exists(Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString())))
                            Directory.CreateDirectory(Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString()));
                        try
                        {
                            string ruta = Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString());
                            try
                            {
                                if (File.Exists(ruta + "/" + fUpload.FileName))
                                    File.Delete(ruta + "/" + fUpload.FileName);
                            }
                            catch (Exception)
                            {
                            }
                            fUpload.SaveAs(ruta + "/" + fUpload.FileName);
                            f.AVATAR = fUpload.FileName;
                            Session["Avatar"] = "../Content/img/avatar/" + f.IDUSUARIO.ToString() + "/" + f.AVATAR;
                        }
                        catch (Exception)
                        {
                            Response.Redirect("inicio.aspx?e=e2");
                        }
                    }
                    if (fUpload2.HasFile)
                    {
                        if (!Directory.Exists(Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString())))
                            Directory.CreateDirectory(Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString()));
                        try
                        {
                            string ruta = Server.MapPath("../Content/img/avatar/" + f.IDUSUARIO.ToString());
                            try
                            {
                                if (File.Exists(ruta + "/" + fUpload2.FileName))
                                    File.Delete(ruta + "/" + fUpload2.FileName);
                            }
                            catch (Exception)
                            {
                            }
                            fUpload2.SaveAs(ruta + "/" + fUpload2.FileName);
                            f.AVATAREQUIPO = fUpload2.FileName;
                            Session["AvatarEquipo"] = "../Content/img/avatar/" + f.IDUSUARIO.ToString() + "/" + f.AVATAREQUIPO;
                        }
                        catch (Exception)
                        {
                            Response.Redirect("inicio.aspx?e=e2");
                        }
                    }
                    t.Update(f);
                    lblmsg.Visible = true;
                    Response.Redirect("cuenta.aspx", false);
                }
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx?e=e2");
            }
        }

        private void CargaDatos()
        {
            try
            {
                t.FillByIDU(ds.USUARIOS, Guid.Parse(Session["idu"].ToString()));
                if (ds.USUARIOS.Count == 0)
                    Response.Redirect("salir.aspx");
                else
                {
                    ano = ds.USUARIOS[0].FECHAALTA.Year.ToString();
                    DL.UsuariosDS.USUARIOSRow f = ds.USUARIOS[0];
                    tNombre.Text = f.NOMBRE;
                    tAlias.Text = f.ALIAS;
                    if (!f.IsAPELLIDOSNull()) tApellidos.Text = f.APELLIDOS;
                    if (!f.IsALIASNull()) tAlias.Text = f.ALIAS;
                    tEmail.Text = f.USUARIO;
                    if (!f.IsTWITTERNull()) tTwitter.Text = f.TWITTER;
                    if (!f.IsFACEBOOKNull()) tFacebook.Text = f.FACEBOOK;
                    if (!f.IsYOUTUBENull()) tYouTube.Text = f.YOUTUBE;
                    if (!f.IsCODPAISNull()) cbPais.SelectedValue = f.CODPAIS;
                    if (!f.IsRRIDNull()) tRRID.Text = f.RRID;
                    tPass.Text = "";
                    tPass2.Text = "";
                    if (!f.IsNOMBREIRACINGNull())  tNombreIRacing.Text= f.NOMBREIRACING;
                    if (!f.IsPSNNull()) tPSN.Text= f.PSN;
                    if (!f.IsXBOXIDNull())  tXBOXID.Text= f.XBOXID;
                    if (!f.IsIRIDNull())  tIDIracing.Text= f.IRID;
                    if (!f.IsZONANull()) cbZonaHoraria.SelectedValue = f.ZONA;
                    organizador = "SIM RACER";
                    if (!f.IsCODPAISNull())
                        organizador = "<img src='../Content/img/flags/" + f.CODPAIS.Trim() + ".png'>&nbsp;" + organizador;
                    if (!f.IsIDEQUIPONull())
                    {
                        DL.UsuariosDSTableAdapters.EQUIPOSTableAdapter te = new DL.UsuariosDSTableAdapters.EQUIPOSTableAdapter();
                        te.FillByID(ds.EQUIPOS, f.IDEQUIPO);
                        if (ds.EQUIPOS.Count>0)
                        {
                            nombreequipo = ds.EQUIPOS[0].EQUIPO;
                            if (!ds.EQUIPOS[0].IsAVATARNull())
                                logoequipo = "../Content/img/equipos/" + ds.EQUIPOS[0].ID.ToString() + "/" + ds.EQUIPOS[0].AVATAR;
                            altaequipo = ds.EQUIPOS[0].FECHAALTA.Year.ToString();
                        }
                        panEquipo.Visible = true;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    ReadOnlyCollection<TimeZoneInfo> tzCollection;
                    tzCollection = TimeZoneInfo.GetSystemTimeZones();
                    cbZonaHoraria.DataSource = tzCollection;
                    cbZonaHoraria.DataTextField = "DisplayName";
                    cbZonaHoraria.DataValueField = "Id";
                    cbZonaHoraria.SelectedValue = null;
                    cbZonaHoraria.DataBind();
                    CargaDatos();
                }
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx");
            }
        }
    }
}