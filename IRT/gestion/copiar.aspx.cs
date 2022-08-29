using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class copiar : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        if (!cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) && !(bool)Session["super"])
                            Response.Redirect("inicio.aspx", false);
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bCopiar_Click(object sender, EventArgs e)
        {
            try
            {
                int idevento = int.Parse(Request.QueryString["id"].ToString());
                DL.EventosDS dsorig = new DL.EventosDS();
                DL.EventosDS dsdestino = new DL.EventosDS();
                DL.EventosDS.EVENTOSRow forig = cn.CargaEvento(idevento);
                DL.EventosDS.EVENTOSRow fdest = dsdestino.EVENTOS.NewEVENTOSRow();                
                forig.EVENTO = forig.EVENTO + "-copia";
                fdest.ItemArray = forig.ItemArray;
                fdest.PUBLICADO = false;
                fdest.VALIDADO = false;
                fdest.BORRADO = false;
                DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                dsdestino.EVENTOS.AddEVENTOSRow(fdest);
                t.Update(fdest);
                int iddestino = fdest.ID;
                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter te = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter co = new DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter();

                te.FillByIDEVENTO(dsorig.EVENTOS_ETAPAS, idevento);
                foreach (DL.EventosDS.EVENTOS_ETAPASRow etapa in dsorig.EVENTOS_ETAPAS)
                {
                    etapa.IDEVENTO = iddestino;
                    DL.EventosDS.EVENTOS_ETAPASRow netapas = dsdestino.EVENTOS_ETAPAS.NewEVENTOS_ETAPASRow();
                    netapas.ItemArray = etapa.ItemArray;
                    netapas.PUBLICADO = false;
                    dsdestino.EVENTOS_ETAPAS.AddEVENTOS_ETAPASRow(netapas);
                    te.Update(netapas);
                    co.FillByIDEVENTOETAPA(dsorig.EVENTO_ETAPAS_COCHES, etapa.ID);
                    foreach (DL.EventosDS.EVENTO_ETAPAS_COCHESRow coche in dsorig.EVENTO_ETAPAS_COCHES)
                        co.Insert(netapas.ID, coche.IDJUEGOCOCHE);
                }
                
                Response.Redirect("inicio.aspx?o=o0", false);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}