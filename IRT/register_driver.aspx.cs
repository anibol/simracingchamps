using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class register_driver : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                System.Collections.ObjectModel.ReadOnlyCollection<TimeZoneInfo> TimeZoneColl = TimeZoneInfo.GetSystemTimeZones();
                cbZonaHoraria.DataSource = TimeZoneColl;
                cbZonaHoraria.DataTextField = "DisplayName";
                cbZonaHoraria.DataValueField = "Id";
                cbZonaHoraria.SelectedValue = null;
                cbZonaHoraria.DataBind();
            }
            if (Request.QueryString["e"] != null && !IsPostBack)
            {
                panMensaje.Visible = true;
                lblmsgerror.Visible = false;
                lblmsgok.Visible = false;
                if (Request.QueryString["e"] == "e1")
                {
                    lblmsgerror.Visible = true;
                    lblmsgerror.InnerText = Resources.Global.registro_e1;
                }
                else if (Request.QueryString["e"] == "e0")
                {
                    lblmsgok.Visible = true;
                    lblmsgok.InnerText = Resources.Global.registro_e0;
                }
                else if (Request.QueryString["e"] == "e2")
                {
                    lblmsgok.Visible = true;
                    lblmsgok.InnerText = Resources.Global.registro_e2;
                }
                else if (Request.QueryString["e"] == "e3")
                {
                    lblmsgerror.Visible = true;
                    lblmsgerror.InnerText = Resources.Global.registro_e3;
                }
                else if (Request.QueryString["e"] == "e4")
                {
                    lblmsgerror.Visible = true;
                    lblmsgerror.InnerText = "Error Captcha";
                }
            }
        }

        protected void bEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                //string EncodedResponse = Request.Form["g-Recaptcha-Response"];
                //bool IsCaptchaValid = (Models.ReCaptchaClass.Validate(EncodedResponse) == "true" ? true : false);
                bool IsCaptchaValid = true;

                if (!IsCaptchaValid)
                {
                    Response.Redirect("register_driver.aspx?e=e4");
                }
                else if(Page.IsValid)
                {
                    if (tUsuario.Text != "")
                    {
                        DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                        DL.UsuariosDS ds = new DL.UsuariosDS();
                        t.FillByUSUARIO(ds.USUARIOS, tUsuario.Text);
                        if (ds.USUARIOS.Count > 0)
                            Response.Redirect("register_driver.aspx?e=e1");
                        else
                        {
                            DL.UsuariosDS.USUARIOSRow f = ds.USUARIOS.NewUSUARIOSRow();
                            Guid nuevo = Guid.NewGuid();
                            while ((int)t.ExisteIDUSUARIO(nuevo) > 0)
                                nuevo = Guid.NewGuid();
                            f.IDUSUARIO = nuevo;
                            f.USUARIO = tUsuario.Text.ToLower();
                            f.FECHAALTA = DateTime.Now;
                            f.PASS = cn.Encrypt(tPass.Text);
                            f.IDEQUIPO = 3;
                            if (Request.QueryString["j"] != null)
                                f.JEFE = true;
                            else
                                f.JEFE = false;
                            f.NOMBRE = tNombre.Text;
                            f.APELLIDOS = tApellidos.Text;
                            f.ALIAS = tAlias.Text;
                            f.ORG = false;
                            f.AVATAR = "isracetime_user.jpg";
                            f.FECHAALTA = DateTime.Now;                            
                            f.CODPAIS = cbPais.SelectedValue.ToString();
                            f.PSN = tPSN.Text;
                            f.XBOXID = tXBOX.Text;
                            f.IRID = tIRID.Text;
                            f.NOMBREIRACING = tIRNombre.Text;
                            f.ZONA = cbZonaHoraria.SelectedValue.ToString();
                            f.RRID = tRRID.Text;
                            ds.USUARIOS.AddUSUARIOSRow(f);
                            t.Update(f);
                            if (fUpload.HasFile)
                            {
                                if (!Directory.Exists(Server.MapPath("Content/img/avatar/" + f.IDUSUARIO.ToString())))
                                    Directory.CreateDirectory(Server.MapPath("Content/img/avatar/" + f.IDUSUARIO.ToString()));
                                try
                                {
                                    string ruta = Server.MapPath("Content/img/avatar/" + f.IDUSUARIO.ToString());
                                    fUpload.SaveAs(ruta + "/" + fUpload.FileName);
                                    f.AVATAR = fUpload.FileName;
                                    t.Update(f);
                                }
                                catch (Exception)
                                {
                                    Response.Redirect("register_driver.aspx?e=e2");
                                }
                            }
                            Response.Redirect("register_driver.aspx?e=e0");
                        }
                    }
                }
                else
                    Response.Redirect("register_driver.aspx?e=e3");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}