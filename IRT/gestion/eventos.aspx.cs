using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Globalization;
using System.Collections.ObjectModel;

namespace IRT.gestion
{
    public partial class eventos : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        public string imagenactual = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        if (cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                            CargaDatos(int.Parse(Request.QueryString["id"].ToString()));
                        else
                            Response.Redirect("inicio.aspx", false);
                    }
                    else
                    {
                        DL.AuxliaresDS ads = new DL.AuxliaresDS();
                        DL.AuxliaresDSTableAdapters.TABLASTableAdapter ttab = new DL.AuxliaresDSTableAdapters.TABLASTableAdapter();
                        ttab.FillByDesplegable(ads.TABLAS, Guid.Parse(Session["idu"].ToString()));
                        cbTablaPuntos.DataTextField = "TABLA";
                        cbTablaPuntos.DataValueField = "ID";
                        cbTablaPuntos.DataSource = ads.TABLAS;
                        cbTablaPuntos.DataBind();
                        DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter tsp = new DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter();
                        tsp.FillByIDUSUARIO(ads.SPONSORS, Guid.Parse(Session["idu"].ToString()));
                        chPatrocinadores.DataSource = ads.SPONSORS;
                        chPatrocinadores.DataBind();
                        //ReadOnlyCollection<TimeZoneInfo> tzCollection;
                        //tzCollection = TimeZoneInfo.GetSystemTimeZones();
                        //cbZonaHoraria.DataSource = tzCollection;
                        //cbZonaHoraria.DataTextField = "DisplayName";
                        //cbZonaHoraria.DataValueField = "Id";
                        //cbZonaHoraria.DataBind();
                    }
                }
            }
            catch (Exception )
            {

                throw;
            }
        }

        private void CargaDatos(int id)
        {
            try
            {

                //ReadOnlyCollection<TimeZoneInfo> tzCollection;
                //tzCollection = TimeZoneInfo.GetSystemTimeZones();
                //cbZonaHoraria.DataSource = tzCollection;
                //cbZonaHoraria.DataTextField = "DisplayName";
                //cbZonaHoraria.DataValueField = "Id";
                //cbZonaHoraria.DataBind();
                DL.AuxliaresDS ads = new DL.AuxliaresDS();
                DL.AuxliaresDSTableAdapters.TABLASTableAdapter ttab = new DL.AuxliaresDSTableAdapters.TABLASTableAdapter();
                ttab.FillByDesplegable(ads.TABLAS, Guid.Parse(Session["idu"].ToString()));
                cbTablaPuntos.DataTextField = "TABLA";
                cbTablaPuntos.DataValueField = "ID";
                cbTablaPuntos.DataSource = ads.TABLAS;
                cbTablaPuntos.DataBind();
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                t.FillByID(ds.EVENTOS, id);
                DL.EventosDS.EVENTOSRow f = ds.EVENTOS[0];
                tEvento.Text = f.EVENTO;
                cbTipos.SelectedIndex = f.TIPO;
                tDescripcion.Text = f.DESCRIPCION;
                tFini.Text= f.FECHAINI.ToShortDateString();
                tFfin.Text = f.FECHAFIN.ToShortDateString();
                //tFiniEvento.Text = f.FECHAALTA.ToShortDateString();
                if (!f.IsCOLORNull())
                    cbColor.SelectedValue = f.COLOR;
                else
                    cbColor.SelectedValue = "rosa.css";
                if (!f.IsIDTABLANull())
                    cbTablaPuntos.SelectedValue = f.IDTABLA.ToString();
                else
                    cbTablaPuntos.SelectedValue = "1";
                if (!f.IsSETUPNull())
                    cbSetup.SelectedIndex = f.SETUP;
                else
                    cbSetup.SelectedIndex = 0;
                if (!f.IsSININSCRIPCIONESNull())
                    chSinInsripcion.Checked = f.SININSCRIPCIONES;
                if (!f.IsDIANull())
                    cbDia.SelectedIndex =int.Parse(f.DIA);
                if (!f.IsMANGASNull())
                {
                    if (!f.MANGAS)
                        tMangas.SelectedIndex = 0;
                    else
                        tMangas.SelectedIndex = 1;
                }
                else
                    tMangas.SelectedIndex = 0;
                if (!f.IsVIDEONull())
                {
                    tVideo.Text = f.VIDEO;
                }
                if (!f.IsTS_SERVERNull()) tServidorTS.Text = f.TS_SERVER; 
                if (!f.IsTS_PASSNull()) tServidorTSPass.Text = f.TS_PASS;
                if (!f.IsSIM_SERVERNull()) tHost.Text=f.SIM_SERVER;
                if (!f.IsSIM_SERVER_PASSNull()) tPassHost.Text=f.SIM_SERVER_PASS ;
                if (!f.IsURL_LAPSNull()) tLap.Text=f.URL_LAPS;
                if (!f.IsZONANull()) cbZonaHoraria.SelectedValue = f.ZONA;
                if (!f.IsDORSALNull()) chDorsal.Checked = f.DORSAL;
                if (!f.IsSKINSNull()) chSKin.Checked = f.SKINS;
                objPlataforma.DataBind();
                cbPlataforma.DataBind();
                cbPlataforma.SelectedValue = f.IDPLATAFORMA.ToString();
                objJuegos.DataBind();
                cbSimulador.DataBind();
                cbSimulador.SelectedValue = f.IDJUEGO.ToString();
                if (!f.IsHORANull()) tHora.Text = f.HORA;
                DL.EventosDSTableAdapters.QueriesTableAdapter q = new DL.EventosDSTableAdapters.QueriesTableAdapter();
                try
                {
                    if ((int)q.ExistenInscritos(f.ID)>0)
                    {
                        cbSimulador.Enabled = false;
                        cbPlataforma.Enabled = false;
                        lblinscritos.Visible = true;
                    }
                }
                catch (Exception)
                {
                }
                DL.EventosDSTableAdapters.EVENTOS_SPONSORTableAdapter ts = new DL.EventosDSTableAdapters.EVENTOS_SPONSORTableAdapter();
                ts.FillByIDEVENTO(ds.EVENTOS_SPONSOR, id);
                DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter tsp = new DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter();
                tsp.FillByIDUSUARIO(ads.SPONSORS, f.IDUSUARIO);
                ///objPatrocinadores.DataBind();
                chPatrocinadores.DataSource = ads.SPONSORS;
                chPatrocinadores.DataBind();
                foreach (ListItem l in chPatrocinadores.Items)
                {
                    foreach (DL.EventosDS.EVENTOS_SPONSORRow fila in ds.EVENTOS_SPONSOR)
                    {
                        if (l.Value == fila.IDSPONSOR.ToString())
                            l.Selected = true;
                            
                    }
                }
                if (!f.IsCARTELNull())
                {
                    if (File.Exists(Server.MapPath("../Content/img/eventos/" + f.ID.ToString() + "/" + f.CARTEL)))
                        imagenactual = "<img style='height:75px;width:auto;' src='../Content/img/eventos/" + f.ID.ToString() + "/" + f.CARTEL + "' />";
                }
                if (!f.IsNUMAXNull())
                    tNumMax.Text = f.NUMAX.ToString();
                else
                    tNumMax.Text = "0";
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx?e=e0");
            }
        }

        protected void bGuardar_Click(object sender, EventArgs e)
        {
            try
            {         
               
                if (!Page.IsValid)
                {
                    lblmesg.Text = "No se admiten caracteres no alfanuméricos";
                    lblmesg.Visible = true;
                    return;
                }
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDS.EVENTOSRow f;
                bool nuevo = false;
                if (Request.QueryString["id"] == null)
                {
                    f = ds.EVENTOS.NewEVENTOSRow();
                    nuevo = true;
                }
                else
                    f = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                f.DESCRIPCION = tDescripcion.Text.Replace("<","").Replace(">", "").Replace("'", "");
                f.EVENTO = tEvento.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                //System.Globalization.CultureInfo cultureinfo = new System.Globalization.CultureInfo("es-ES");
                f.FECHAINI = DateTime.Parse(tFini.Text.Replace("<", "").Replace(">", "").Replace("'", ""));
                f.FECHAFIN = DateTime.Parse(tFfin.Text.Replace("<", "").Replace(">", "").Replace("'", ""));
                f.FECHAALTA = DateTime.Now;
                f.IDPLATAFORMA = int.Parse(cbPlataforma.SelectedValue.ToString());
                if (nuevo) f.IDUSUARIO = Guid.Parse(Session["idu"].ToString());
                f.IDJUEGO = int.Parse(cbSimulador.SelectedValue.ToString());
                f.TIPO = cbTipos.SelectedIndex;
                f.IDTABLA = int.Parse(cbTablaPuntos.SelectedValue.ToString());
                f.BORRADO = false;
                f.REGLAMENTO = "";
                f.PREMIOS = "";
                f.TS_SERVER = tServidorTS.Text;
                f.TS_PASS = tServidorTSPass.Text;
                f.SIM_SERVER = tHost.Text;
                f.SIM_SERVER_PASS = tPassHost.Text;
                f.URL_LAPS = tLap.Text;
                f.VIDEO = tVideo.Text;
                f.DORSAL = chDorsal.Checked;
                f.SKINS = chSKin.Checked;
                f.SININSCRIPCIONES = chSinInsripcion.Checked;
                if (tNumMax.Text!="")
                    f.NUMAX = int.Parse(tNumMax.Text.Replace("<", "").Replace(">", ""));
                if (tMangas.SelectedIndex == 1)
                    f.MANGAS = true;
                else
                    f.MANGAS = false;
                f.SETUP = cbSetup.SelectedIndex;
                f.DIA = cbDia.SelectedIndex.ToString();
                f.HORA = tHora.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                if (nuevo)
                {
                    f.PUBLICADO = false;
                    f.VALIDADO = false;
                }
                f.COLOR = cbColor.SelectedValue.ToString();
                f.ZONA = cbZonaHoraria.SelectedValue.ToString();
                if (Request.QueryString["id"] == null)
                    ds.EVENTOS.AddEVENTOSRow(f);
                DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                t.Update(f);
                try
                {
                    if (nuevo) cn.SendContacto("info@simracingchamps.net", Session["NombrePersona"].ToString(), "Nuevo campeonato " + f.EVENTO);
                }
                catch (Exception)
                {
                }

                List<ListItem> selected = chPatrocinadores.Items.Cast<ListItem>()
                    .Where(li => li.Selected)
                    .ToList();

                DL.EventosDSTableAdapters.EVENTOS_SPONSORTableAdapter  t2 = new DL.EventosDSTableAdapters.EVENTOS_SPONSORTableAdapter();
                t2.BorrarIDEvento(f.ID);
                foreach (ListItem l in selected)
                {
                    t2.Insert(f.ID, int.Parse(l.Value.ToString()));
                }

                if (fUpload.HasFile)
                {
                    if (!Directory.Exists(Server.MapPath("../Content/img/eventos/" + f.ID.ToString())))
                        Directory.CreateDirectory(Server.MapPath("../Content/img/eventos/" + f.ID.ToString()));
                    try
                    {
                        string ruta= Server.MapPath("../Content/img/eventos/" + f.ID.ToString());
                        try
                        {
                            if (File.Exists(ruta + "/" + fUpload.FileName))
                                File.Delete(ruta + "/" + fUpload.FileName);
                        }
                        catch (Exception)
                        {
                        }
                       
                        fUpload.SaveAs(ruta + "/" + fUpload.FileName);
                        
                        //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                       
                        f.CARTEL= fUpload.FileName;
                        t.Update(f);
                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("inicio.aspx?e=e2", false);
                    }
                }
                Response.Redirect("inicio.aspx?o=o0", false);
            }
            catch (Exception ex)
            {
                Response.Redirect("inicio.aspx?e=e1");
            }
        }

        protected void cbPlataforma_SelectedIndexChanged(object sender, EventArgs e)
        {
            objJuegos.DataBind();
            cbSimulador.DataBind();
        }

        protected void bEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (cn.BorraEvento(int.Parse(Request.QueryString["id"].ToString())))
                    Response.Redirect("inicio.aspx?o=o0", false);
                else
                    Response.Redirect("inicio.aspx?e=e1");
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx?e=e1");
            }
        }

        protected void tFini_CalendarExtender_Load(object sender, EventArgs e)
        {
            String format = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
            tFini_CalendarExtender.Format = format;
        }

        protected void tFfin_CalendarExtender_Load(object sender, EventArgs e)
        {
            String format = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
            tFfin_CalendarExtender.Format = format;
        }

        protected void cbZonaHoraria_Init(object sender, EventArgs e)
        {
            try
            {
                ReadOnlyCollection<TimeZoneInfo> tzCollection;
                tzCollection = TimeZoneInfo.GetSystemTimeZones();
                cbZonaHoraria.DataSource = tzCollection;
                cbZonaHoraria.DataTextField = "DisplayName";
                cbZonaHoraria.DataValueField = "Id";
                cbZonaHoraria.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void chSinInsripcion_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}