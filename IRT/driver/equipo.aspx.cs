using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class equipo : System.Web.UI.Page
    {
        public string imagenactual = "";
        DL.UsuariosDS ds = new DL.UsuariosDS();
        DL.UsuariosDSTableAdapters.EQUIPOSTableAdapter t = new DL.UsuariosDSTableAdapters.EQUIPOSTableAdapter();
        DL.UsuariosDSTableAdapters.USUARIOSTableAdapter tu = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    t.FillByIDUSUARIO(ds.EQUIPOS, Guid.Parse(Session["idu"].ToString()));
                    if (ds.EQUIPOS.Count > 0)
                    {
                        tEquipo.Text = ds.EQUIPOS[0].EQUIPO;
                        tId.Text = ds.EQUIPOS[0].ID.ToString();
                        if (!ds.EQUIPOS[0].IsFBNull()) tFB.Text = ds.EQUIPOS[0].FB;
                        if (!ds.EQUIPOS[0].IsWEBNull()) tWeb.Text = ds.EQUIPOS[0].WEB;
                        if (!ds.EQUIPOS[0].IsTWITTERNull()) tTwitter.Text = ds.EQUIPOS[0].TWITTER;
                        if (!ds.EQUIPOS[0].IsFUNDACIONNull()) tFundacion.Text = ds.EQUIPOS[0].FUNDACION;
                        if (!ds.EQUIPOS[0].IsINFONull()) tInfo.Text = ds.EQUIPOS[0].INFO;
                        objEquipos.DataBind();
                        dgUsuarios.DataBind();
                        if (!ds.EQUIPOS[0].IsAVATARNull())
                        {
                            if (File.Exists(Server.MapPath("../Content/img/equipos/" + ds.EQUIPOS[0].ID.ToString() + "/" + ds.EQUIPOS[0].AVATAR)))
                                imagenactual = "<img style='height:75px;width:auto;' src='../Content/img/equipos/" + ds.EQUIPOS[0].ID.ToString() + "/" + ds.EQUIPOS[0].AVATAR + "' />";
                        }
                        panPilotos.Visible = true;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.UsuariosDS.EQUIPOSRow f;
                t.FillByIDUSUARIO(ds.EQUIPOS, Guid.Parse(Session["idu"].ToString()));
                if (ds.EQUIPOS.Count == 0)
                {
                    f = ds.EQUIPOS.NewEQUIPOSRow();
                    f.FECHAALTA = DateTime.Now;
                    f.DESCRIPCION = "";
                    f.IDUSUARIO = Guid.Parse(Session["idu"].ToString());
                    f.AVATAR = "escudo.jpg";
                }
                else
                    f = ds.EQUIPOS[0];

                f.EQUIPO = tEquipo.Text;
                f.TWITTER = tTwitter.Text.Replace("https://twitter.com/","");
                if (tWeb.Text.IndexOf("http") == -1)
                    f.WEB = "http.//" + tWeb.Text;
                else
                    f.WEB = tWeb.Text;
                f.FB = tFB.Text;
                f.FUNDACION = tFundacion.Text;
                f.INFO = tInfo.Text;
                
                if (ds.EQUIPOS.Count == 0)
                    ds.EQUIPOS.AddEQUIPOSRow(f);
                t.Update(f);
                tu.ActualizaEquipo(f.ID, Guid.Parse(Session["idu"].ToString()));
                if (fUpload.FileName != "")
                {
                    if (!Directory.Exists(Server.MapPath("../Content/img/equipos/" + f.ID.ToString())))
                        Directory.CreateDirectory(Server.MapPath("../Content/img/equipos/" + f.ID.ToString()));
                    try
                    {
                        string ruta = Server.MapPath("../Content/img/equipos/" + f.ID.ToString());
                        fUpload.SaveAs(ruta + "/" + fUpload.FileName);
                        f.AVATAR = fUpload.FileName;
                        t.Update(f);
                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("inicio.aspx?e=e2");
                    }
                }
                
                    
                tId.Text = f.ID.ToString();
                objEquipos.DataBind();
                dgUsuarios.DataBind();
                panPilotos.Visible = true;
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bAddPiloto_Click(object sender, EventArgs e)
        {
            try
            {
                if (tEmail.Text!="")
                {
                    tu.FillByUSUARIO(ds.USUARIOS, tEmail.Text);
                    if (ds.USUARIOS.Count>0)
                    {
                        tu.ActualizaEquipo(int.Parse(tId.Text), ds.USUARIOS[0].IDUSUARIO);
                        objEquipos.DataBind();
                        dgUsuarios.DataBind();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in dgUsuarios.Rows)
                {
                    // Access the CheckBox
                    CheckBox cb = (CheckBox)row.FindControl("chSelector");
                    if (cb != null && cb.Checked)
                    {
                        // Delete row! (Well, not really...)
                        // First, get the ProductID for the selected row
                        Guid elto = Guid.Parse(dgUsuarios.DataKeys[row.RowIndex].Value.ToString());
                        tu.ActualizaEquipo(3, elto);

                    }
                }

                objEquipos.DataBind();
                dgUsuarios.DataBind();
                lblmsg.Visible = true;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}