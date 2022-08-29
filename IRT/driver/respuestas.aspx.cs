using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.driver
{
    public partial class respuestas : System.Web.UI.Page
    {
        DL.ReclamacionesDS ds = new DL.ReclamacionesDS();
        public string campeonato = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    DL.ReclamacionesDS.EVENTOS_RECLAMACIONESRow f;
                    DL.ReclamacionesDS ds = new DL.ReclamacionesDS();
                    Models.ReclamacionesCN cn = new Models.ReclamacionesCN();
                    DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONESTableAdapter t = new DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONESTableAdapter();
                    f = cn.CargaReclamacion(int.Parse(Request.QueryString["idr"].ToString()), Session["idu"].ToString());
                    if (f != null)
                    {
                        Models.EventosCN ecn = new Models.EventosCN();
                        campeonato = ": " + ecn.Campeonato(int.Parse(Request.QueryString["id"].ToString()));
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

                        DL.ReclamacionesDSTableAdapters.V_RESPUESTASTableAdapter t2 = new DL.ReclamacionesDSTableAdapters.V_RESPUESTASTableAdapter();
                        t2.Fill(ds.V_RESPUESTAS, int.Parse(Request.QueryString["idr"].ToString()));
                        repDatos.DataSource = ds;
                        repDatos.DataMember = "V_RESPUESTAS";
                        repDatos.DataBind();
                    }
                    else
                        Response.Redirect("reclamaciones.aspx?id=" + Request.QueryString["id"].ToString() + "&e=e0");

                 
                }
                else
                    Response.Redirect("inicio.aspx");

            }
            catch (Exception)
            {
                throw;
            }
        }

        public string DameAvatar(object avatar, object usuario)
        {
            try
            {
                if (avatar == null || avatar.ToString() == "isracetime_user.jpg")
                    return "../Content/img/avatar/isracetime_user.jpg";
                else
                    return "../Content/img/avatar/" + usuario.ToString() + "/" + avatar.ToString();
            }
            catch (Exception)
            {
                return "../Content/img/avatar/isracetime_user.jpg";
            }
        }

        protected void bEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                if (tMensaje.Text != "")
                {
                    DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONES_RESPUESTASTableAdapter t = new DL.ReclamacionesDSTableAdapters.EVENTOS_RECLAMACIONES_RESPUESTASTableAdapter();
                    if ((int)t.Insert(int.Parse(Request.QueryString["idr"].ToString()), Guid.Parse(Session["idu"].ToString()), tMensaje.Text, DateTime.Now)>0)
                    {
                        Models.EventosCN cn = new Models.EventosCN();
                        DL.EventosDS.EVENTOSRow f = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                        cn.SendRespuesta(Session["idu"].ToString(), f.IDUSUARIO.ToString(), campeonato, tMensaje.Text);
                    }
                    DL.ReclamacionesDSTableAdapters.V_RESPUESTASTableAdapter t2 = new DL.ReclamacionesDSTableAdapters.V_RESPUESTASTableAdapter();
                    t2.Fill(ds.V_RESPUESTAS, int.Parse(Request.QueryString["idr"].ToString()));
                    repDatos.DataSource = ds;
                    repDatos.DataMember = "V_RESPUESTAS";
                    repDatos.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}