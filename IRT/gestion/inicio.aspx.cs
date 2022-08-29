using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class inicio : System.Web.UI.Page
    {
        public bool admin = false;
        public int numinscritos=0, numcampeonatos=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
             
                if (Request.QueryString["e"]!=null)
                {
                    switch (Request.QueryString["e"].ToString())
                    {
                        case "e0":
                            lblmsg2.Visible = true;
                            break;
                        case "e1":
                            lblmsg2.Visible = true;
                            break;
                    }
                }
                else if (Request.QueryString["o"] != null)
                {

                    switch (Request.QueryString["o"].ToString())
                    {
                        case "o0":
                            lblmsg.Visible = true;                            
                            break;
                    }
                }
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDS dsp = new DL.EventosDS();
                DL.EventosDS dsv = new DL.EventosDS();
                DL.NoticiasDS nds = new DL.NoticiasDS();
                DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                DL.EventosDSTableAdapters.QueriesTableAdapter q = new DL.EventosDSTableAdapters.QueriesTableAdapter();
                DL.NoticiasDSTableAdapters.V_NOTICIASTableAdapter  n = new DL.NoticiasDSTableAdapters.V_NOTICIASTableAdapter();
                if (Session["usr"].ToString() == "admin@simracingchamps.net")
                {
                    admin = true;
                    t.FillByPendientesPublicarAdmin(ds.EVENTOS);
                    t.FillByPendientesValidarAdmin(dsv.EVENTOS);
                    t.FillByPublicadosAdmin(dsp.EVENTOS);
                    n.Fill(nds.V_NOTICIAS);
                }
                else
                {
                    t.FillByPendientesPublicar(ds.EVENTOS, Guid.Parse(Session["idu"].ToString()));
                    t.FillByPendientesValidar(dsv.EVENTOS, Guid.Parse(Session["idu"].ToString()));
                    t.FillByPublicados(dsp.EVENTOS, Guid.Parse(Session["idu"].ToString()));
                }
                numcampeonatos = dsp.EVENTOS.Count;
                numinscritos = (int)q.CuentaInscritos(Guid.Parse(Session["idu"].ToString()));
                repPendientes.DataSource = ds.EVENTOS;
                repPendientes.DataBind();
                repValidar.DataSource = dsv.EVENTOS;
                repValidar.DataBind();
                repPublicados.DataSource = dsp.EVENTOS;
                repPublicados.DataBind();
                repNoticias.DataSource = nds.V_NOTICIAS;
                repNoticias.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string Estado(object pub, object val, object id)
        {
            try
            {
                if (!(bool)pub)
                   return @"<a href='publish.aspx?id=" + id.ToString() + "' class='label label-xs label-info'>" + Resources.Global.pdtepublicar + "</a>";
                else if (!(bool)val)
                    return @"<a href='publish.aspx?id=" + id.ToString() + "' class='label label-xs label-primary'>" + Resources.Global.pdtevalidar + "</a>";                
                else
                    return @"<a href='publish.aspx?id=" + id.ToString() + "' class='label label-xs label-success'>" + Resources.Global.publicado  + "</a>";
            }
            catch (Exception)
            {
                return "<span class='label label-xs label-danger'>Error</span>";
            }
            
        }

        public string EstadoNoticia(object publicada, object validada)
        {
            try
            {
                if (publicada.ToString() == "False")
                    return "<label class='label label-info label-xs'>Pdte. Publicar</label>";
                else
                {
                    if (validada.ToString() == "False")
                        return "<label class='label label-warning label-xs'>Pdte. Validar</label>";
                    else
                        return "<label class='label label-success label-xs'>Publicada</label>";
                }
            }
            catch (Exception)
            {
                return "<label class='label label-info label-xs'>Pdte. Publicar</label>";
            }
        }
    }
}