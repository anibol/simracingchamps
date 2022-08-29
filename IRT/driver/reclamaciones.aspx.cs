using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class reclamaciones : System.Web.UI.Page
    {
        DL.ReclamacionesDS.EVENTOS_RECLAMACIONESRow f;
        DL.ReclamacionesDS ds = new DL.ReclamacionesDS();
        Models.ReclamacionesCN cn = new Models.ReclamacionesCN();
        Models.EventosCN ecn = new Models.EventosCN();
        DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONESTableAdapter t = new DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONESTableAdapter();
        public string campeonato = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    campeonato = ": " +  ecn.Campeonato(int.Parse(Request.QueryString["id"].ToString()));
                    t.FillByEventoUsuario(ds.EVENTOS_RECLAMACIONES, int.Parse(Request.QueryString["id"].ToString()), Guid.Parse(Session["idu"].ToString()));
                    repDatos.DataSource = ds;
                    repDatos.DataMember = "EVENTOS_RECLAMACIONES";
                    repDatos.DataBind();
                    tReclamante.Text = Session["NombrePersona"].ToString();

                    if (Request.QueryString["o"] != null)
                        lblmsg.Visible = true;
                    if (Request.QueryString["e"] != null)
                        lblmsg2.Visible = true;
                    if (Request.QueryString["ed"] != null)
                        Editar();
                    if (Request.QueryString["n"] != null)
                        Nuevo();
                }
               
                       
            }
            catch (Exception ex)
            {
                 Response.Redirect("inicio.aspx", false);
            }
        }

        private void Nuevo()
        {
            try
            {
                panReclamacion.Visible = true;
                tReclamante.Text = Session["NombrePersona"].ToString();
                tReclamado.Text = "";
                cbAccion.SelectedIndex = 0;
                cbPerdida.SelectedIndex = 0;
                cbDanos.SelectedIndex = 0;
                cbAgravantes.SelectedIndex = 0;
                cbAtenuantes.SelectedIndex = 0;
                tVideo1.Text = "";
                tVideo2.Text = "";
                tVideo3.Text = "";
                tVideo4.Text = "";
                tVideo5.Text = "";
                tMinuto.Text = "";
                tReclamaciobn.Text = "";
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void Editar()
        {
            try
            {
                panReclamacion.Visible = true;
                f =cn.CargaReclamacion(int.Parse(Request.QueryString["ed"].ToString()), Session["idu"].ToString());
                if (f!=null)
                {
                    tReclamante.Text = f.RECLAMANTE;
                    tReclamado.Text = f.RECLAMADO;
                    cbAccion.SelectedIndex = f.ACCION;
                    cbPerdida.SelectedIndex = f.PERDIDA;
                    cbDanos.SelectedIndex = f.DANOS;
                    cbAgravantes.SelectedIndex = f.AGRAVANTES;
                    cbAtenuantes.SelectedIndex = f.ATENUANTES;
                    tVideo1.Text = f.VIDEO1;
                    tVideo2.Text = f.VIDEO2;
                    tVideo3.Text = f.VIDEO3;
                    tVideo4.Text = f.VIDEO4;
                    tVideo5.Text = f.VIDEO5;
                    tMinuto.Text = f.MINUTO;
                    if (!f.IsRECLAMACIONNull()) tReclamaciobn.Text = f.RECLAMACION;
                    bBorrar.Visible = true;                   
                }
                else
                    Response.Redirect("reclamaciones.aspx?id=" + Request.QueryString["id"].ToString() + "&e=e0");
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bEnviar_Click(object sender, EventArgs e)
        {
            try
            {

                if (Request.QueryString["ed"] == null)
                    f = ds.EVENTOS_RECLAMACIONES.NewEVENTOS_RECLAMACIONESRow();
                else
                    f = cn.CargaReclamacion(int.Parse(Request.QueryString["ed"].ToString()), Session["idu"].ToString());
                f.RECLAMANTE = tReclamante.Text;
                f.RECLAMADO = tReclamado.Text;
                f.IDEVENTO = int.Parse(Request.QueryString["id"].ToString());
                if (Request.QueryString["ed"] == null) f.FECHA = DateTime.Now;
                f.ACCION = cbAccion.SelectedIndex;
                f.PERDIDA = cbPerdida.SelectedIndex;
                f.DANOS = cbDanos.SelectedIndex;
                f.AGRAVANTES = cbAgravantes.SelectedIndex;
                f.ATENUANTES = cbAtenuantes.SelectedIndex;
                f.VIDEO1 = tVideo1.Text;
                f.VIDEO2 = tVideo2.Text;
                f.VIDEO3 = tVideo3.Text;
                f.VIDEO4 = tVideo4.Text;
                f.VIDEO5 = tVideo5.Text;
                f.MINUTO = tMinuto.Text;
                f.USUARIO = Guid.Parse(Session["idu"].ToString());
                f.RECLAMACION = tReclamaciobn.Text;
                if (Request.QueryString["ed"] == null)
                    ds.EVENTOS_RECLAMACIONES.AddEVENTOS_RECLAMACIONESRow(f);
                if ((int)t.Update(ds) > 0)
                {
                    Models.EventosCN ecn = new Models.EventosCN();
                    f.RECLAMACION = "ACCION: " + cbAccion.Text + "<br>" + "PERDIDA: " + cbPerdida.Text + "<br>DAÑOS: " + cbDanos.Text + "<br>AGRAVANTES: " + cbAgravantes.Text  + "<br>ATENUANTES: " + cbAtenuantes.Text + "<br>VIDEO 1: " + tVideo1.Text + "<br>VIDEO 2: " + tVideo2.Text + "<br>VIDEO 3: " + tVideo3.Text + "<br>VIDEO 4: " + tVideo4.Text + "<br>VIDEO 5: " + tVideo5.Text + "<br>MINUTO: " + tMinuto.Text + "<br>OBS: " + tReclamaciobn.Text;
                    DL.EventosDS.EVENTOSRow f2 = ecn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                    ecn.SendReclamacionOrg(f2.IDUSUARIO.ToString(), f, f2.EVENTO); 
                    Response.Redirect("reclamaciones.aspx?id=" + Request.QueryString["id"].ToString() + "&o=o0");
                }
                else
                    Response.Redirect("reclamaciones.aspx?id=" + Request.QueryString["id"].ToString() + "&e=e0");
            }
            catch (Exception)
            {
                
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                if ((int)t.BorrarID(int.Parse(Request.QueryString["ed"].ToString()),Guid.Parse(Session["idu"].ToString()))>0)
                    Response.Redirect("reclamaciones.aspx?id=" + Request.QueryString["id"].ToString() + "&o=o0");
                else
                    Response.Redirect("reclamaciones.aspx?id=" + Request.QueryString["id"].ToString() + "&e=e0");
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}