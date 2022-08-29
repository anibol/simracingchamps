using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class custom_circuits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session.IsNewSession) Response.Redirect("salir.aspx");

                DL.AuxliaresDS ds = new DL.AuxliaresDS();
                DL.AuxliaresDSTableAdapters.V_JUEGO_CIRCUITOSTableAdapter t = new DL.AuxliaresDSTableAdapters.V_JUEGO_CIRCUITOSTableAdapter();
                t.FillByIDORG(ds.V_JUEGO_CIRCUITOS, Guid.Parse(Session["idu"].ToString()));
                repCircuitos.DataSource = ds.V_JUEGO_CIRCUITOS;
                repCircuitos.DataBind();

                

                if (!IsPostBack)
                {
                    DL.AuxliaresDSTableAdapters.JUEGOTableAdapter tj = new DL.AuxliaresDSTableAdapters.JUEGOTableAdapter();
                    tj.Fill(ds.JUEGO);
                    cbSimulador.DataSource = ds;
                    cbSimulador.DataMember = "JUEGO";
                    cbSimulador.DataTextField = "JUEGO";
                    cbSimulador.DataValueField = "ID";
                    cbSimulador.DataBind();

                    if (Request.QueryString["ed"] != null)
                        Editar();
                    if (Request.QueryString["n"] != null)
                        Nuevo();
                    if (Request.QueryString["o"] != null)
                        lblmsg.Visible = true;
                }


            }
            catch (Exception ex)
            {
                panerror.Visible = true;
            }
        }

        private void Nuevo()
        {
            try
            {
                panCircuitos.Visible = true;
            }
            catch (Exception)
            {

            }
        }

        private void Editar()
        {
            try
            {
                panCircuitos.Visible = true;
                DL.AuxliaresDS ds = new DL.AuxliaresDS();
                DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter t = new DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter();
                t.FillByID(ds.JUEGO_CIRCUITOS, int.Parse(Request.QueryString["ed"].ToString()), Guid.Parse(Session["idu"].ToString()));
                if (ds.JUEGO_CIRCUITOS.Count > 0)
                {
                    DL.AuxliaresDS.JUEGO_CIRCUITOSRow f = ds.JUEGO_CIRCUITOS[0];
                    tNombre.Text = f.CIRCUITO;
                    tUrl.Text = f.MOD;
                    cbSimulador.SelectedValue = f.IDJUEGO.ToString();
                }
            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }

        protected void bGuardar_Click(object sender, EventArgs e)
        {
            try
            {

                DL.AuxliaresDS ds = new DL.AuxliaresDS();
                DL.AuxliaresDS.JUEGO_CIRCUITOSRow f;
                DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter t = new DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter();
                if (Request.QueryString["ed"] == null)
                    f = ds.JUEGO_CIRCUITOS.NewJUEGO_CIRCUITOSRow();
                else
                {
                    t.FillByID(ds.JUEGO_CIRCUITOS, int.Parse(Request.QueryString["ed"].ToString()), Guid.Parse(Session["idu"].ToString()));
                    f = ds.JUEGO_CIRCUITOS[0];
                }
                f.CIRCUITO = tNombre.Text;
                f.IDJUEGO = int.Parse(cbSimulador.SelectedValue.ToString());
                f.MOD = tUrl.Text;
                f.IDORG = Guid.Parse(Session["idu"].ToString());
                if (Request.QueryString["ed"] == null)
                    ds.JUEGO_CIRCUITOS.AddJUEGO_CIRCUITOSRow(f);
                t.Update(ds);
                Limpia();
                Response.Redirect("custom_circuits.aspx?o=0", false);

            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }

        private void Limpia()
        {
            try
            {
                cbSimulador.SelectedIndex = 0;
                tNombre.Text = "";
                tUrl.Text = "";
            }
            catch (Exception)
            {
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                Models.EventosCN cn = new Models.EventosCN();
                if (cn.CircuitoEnUso(int.Parse(Request.QueryString["ed"].ToString())))
                {
                    panerror.Visible = true;
                    panerror.InnerText = "El circuito no puede borrarse porque está en uso en alguna carrera";
                }
                else
                {
                    DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter t = new DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter();
                    if ((int)t.BorrarID(int.Parse(Request.QueryString["ed"].ToString())) > 0)
                    {
                        Limpia();
                        Response.Redirect("custom_circuits.aspx?o=0", false);
                    }
                    else
                    {
                        panerror.Visible = true;
                        panerror.InnerText = "El circuito no pudee borrarse porque está en uso en alguna carrera";
                    }
                }
            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }
    }
}