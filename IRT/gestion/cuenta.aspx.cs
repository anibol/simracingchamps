using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class cuenta : System.Web.UI.Page
    {
        public string ano = "", organizador = "";
        public bool esorg = false;
        DL.UsuariosDS ds = new DL.UsuariosDS();
        Models.EventosCN cn = new Models.EventosCN();
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
                    f.USUARIO = tEmail.Text;
                    if (tPass.Text != "" && tPass2.Text != "") f.PASS = cn.Encrypt(tPass.Text);
                    f.NOMBRE = tOrg.Text;
                    f.TWITTER = tTwitter.Text.Replace("http://","").Replace("@","");
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
                    if (tWeb.Text != "")
                    {
                        if (tWeb.Text.IndexOf("http") == -1)
                            f.WEB = "http://" + tWeb.Text;
                        else
                            f.WEB = tWeb.Text;
                    }
                    else
                        f.WEB = "";
                    f.CODPAIS = cbPais.SelectedValue.ToString();
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
                    t.Update(f);
                    lblmsg.Visible = true;
                    CargaDatos();
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
                    tOrg.Text = f.NOMBRE;
                    tEmail.Text = f.USUARIO;
                    if (!f.IsWEBNull()) tWeb.Text = f.WEB;
                    if (!f.IsTWITTERNull()) tTwitter.Text = f.TWITTER;
                    if (!f.IsFACEBOOKNull()) tFacebook.Text = f.FACEBOOK;
                    if (!f.IsYOUTUBENull()) tYouTube.Text = f.YOUTUBE;
                    if (!f.IsCODPAISNull()) cbPais.SelectedValue = f.CODPAIS;
                    if (!f.IsZONANull()) cbZonaHoraria.SelectedValue = f.ZONA;
                    tPass.Text = "";
                    tPass2.Text = "";
                    organizador = Resources.Global.organizador;
                    esorg = true;
                    if (!f.IsCODPAISNull())
                        organizador = "<img src='../Content/img/flags/" + f.CODPAIS.Trim() + ".png'>&nbsp;" + organizador;
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