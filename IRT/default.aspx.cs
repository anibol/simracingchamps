using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace IRT
{

    public partial class _default1 : System.Web.UI.Page
    {
        public string carrusel = "";
        DL.EventosDS ds = new DL.EventosDS();
        DL.EventosDS ds2 = new DL.EventosDS();
        DL.EventosDS ds3 = new DL.EventosDS();
        DL.EventosDS ds4 = new DL.EventosDS();
        DL.EventosDS ds5 = new DL.EventosDS();
        DL.EventosDSTableAdapters.EVENTOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
        DL.EventosDSTableAdapters.V_EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
        DL.EventosDSTableAdapters.V_ETAPASTableAdapter ve = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
        DL.EventosDSTableAdapters.SP_PROXIMAS_CARRERAS_TVTableAdapter ttv = new DL.EventosDSTableAdapters.SP_PROXIMAS_CARRERAS_TVTableAdapter();
        DL.EventosDSTableAdapters.SP_PROXIMAS_CARRERASTableAdapter prox = new DL.EventosDSTableAdapters.SP_PROXIMAS_CARRERASTableAdapter();
        DL.EventosDSTableAdapters.SP_ULTIMOS_RESULTADOSTableAdapter ult = new DL.EventosDSTableAdapters.SP_ULTIMOS_RESULTADOSTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ds.EnforceConstraints = false;
                ds2.EnforceConstraints = false;
                ds3.EnforceConstraints = false;
                ds4.EnforceConstraints = false;
                ds5.EnforceConstraints = false;
                DL.NoticiasDS nds = new DL.NoticiasDS();
                DL.NoticiasDSTableAdapters.NOTICIASTableAdapter tn = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
                tn.FillByTop5General(nds.NOTICIAS);
                panNoticias.Visible = nds.NOTICIAS.Count > 0;
                repTodasNoticias.DataSource = nds;
                repTodasNoticias.DataMember = "NOTICIAS";
                repTodasNoticias.DataBind();
                t.FillByPortadaWebInscripciones(ds.V_EVENTOS);
                repEventos.DataSource = ds;
                repEventos.DataMember = "V_EVENTOS";
                repEventos.DataBind();
                if (ds.V_EVENTOS.Count == 0) panInscripciones.Visible = false;
                t.FillByPortadaWebEnCurso(ds5.V_EVENTOS);
                repEnCurso.DataSource = ds5;
                repEnCurso.DataMember = "V_EVENTOS";
                repEnCurso.DataBind();
                if (ds5.V_EVENTOS.Count == 0) panEnCurso.Visible = false;
                t.FillByPortadaWebProx(ds2.V_EVENTOS);
                repProximosCampeonatos.DataSource = ds2;
                repProximosCampeonatos.DataMember = "V_EVENTOS";
                repProximosCampeonatos.DataBind();
                if (ds2.V_EVENTOS.Count == 0) panProximosChamps.Visible = false;
                //prox.Fill(ds.SP_PROXIMAS_CARRERAS);
                //repProxCarreras.DataSource = ds;
                //repProxCarreras.DataMember = "SP_PROXIMAS_CARRERAS";
                //repProxCarreras.DataBind();
                //if (ds.SP_PROXIMAS_CARRERAS.Count == 0) panProximosCarreras.Visible = false;
                ve.FillByUltimosResultados(ds4.V_ETAPAS);
                ult.Fill(ds4.SP_ULTIMOS_RESULTADOS);
                repResultados.DataSource = ds4;
                repResultados.DataMember = "SP_ULTIMOS_RESULTADOS";
                repResultados.DataBind();
                if (ds4.V_ETAPAS.Count == 0) panResultados.Visible = false;
                //ve.FillByProximasTV(ds2.V_ETAPAS);
                ttv.Fill(ds.SP_PROXIMAS_CARRERAS_TV);
                repProximasTV.DataSource = ds;
                repProximasTV.DataMember = "SP_PROXIMAS_CARRERAS_TV";
                repProximasTV.DataBind();
                //ve.FillByUltimasTV(ds3.V_ETAPAS);
                //repUltimasTV.DataSource = ds3;
                //repUltimasTV.DataMember = "V_ETAPAS";
                //repUltimasTV.DataBind();
                DL.UsuariosDS dsu = new DL.UsuariosDS();
                DL.UsuariosDSTableAdapters.V_EQUIPOSTableAdapter eq = new DL.UsuariosDSTableAdapters.V_EQUIPOSTableAdapter();
                eq.FillByPortada(dsu.V_EQUIPOS);
                repEquipos.DataSource = dsu;
                repEquipos.DataMember = "V_EQUIPOS";
                repEquipos.DataBind();

                carrusel = "<div class='item active'> " +
                 "<img src = 'assets/img/background/bg-1.jpg' alt='' > " +
                 "<div class='carousel-caption'>  " +
                     "<h2 class='wow fadeInRight' data-wow-delay='300ms'>SimRacingChamps<br>  " + Resources.Global.default1 +
                         "</h2> " +
                     "<div class='buttons wow fadeInDown hidden-xs' data-wow-delay='0.2s'><a class='btn btn-lg btn-border' href='help.aspx'>" + Resources.Global.default2 + "</a></div> " +
                 "</div> " +
             "</div>";
                
                foreach (DL.EventosDS.V_EVENTOSRow fila in ds.V_EVENTOS)
                {
                    if (!fila.IsCARTELNull() && fila.CARTEL != "")
                    {
                        carrusel += "<div class='item'> " +
                                "<img src = 'Content/img/eventos/" + fila.ID.ToString() + "/" + fila.CARTEL + "' alt='' > " +
                                "<div class='carousel-caption'>  " +
                                    "<h2 class='wow fadeInRight' data-wow-delay='300ms'>" + fila.EVENTO + "<br>  " +
                                        Resources.Global.default3 + " " + fila.FECHAPRIMERA.ToShortDateString() + "</h2> " +
                                    "<div class='buttons wow fadeInDown hidden-xs' data-wow-delay='0.2s'><a class='btn btn-lg btn-border' href='eventos.aspx?id=" + fila.ID.ToString() + "'>" +  Resources.Global.default4 + "</a></div> " +
                                "</div> " +
                            "</div>";
                    }
                }
                foreach (DL.EventosDS.V_EVENTOSRow fila in ds2.V_EVENTOS)
                {
                    if (!fila.IsCARTELNull() && fila.CARTEL != "")
                    {
                        carrusel += "<div class='item'> " +
                                "<img src = 'Content/img/eventos/" + fila.ID.ToString() + "/" + fila.CARTEL + "' alt='' > " +
                                "<div class='carousel-caption'>  " +
                                    "<h2 class='wow fadeInRight' data-wow-delay='300ms'>" + fila.EVENTO + "<br>  " +
                                        Resources.Global.default3 + " " + fila.FECHAPRIMERA.ToShortDateString() + "</h2> " +
                                    "<div class='buttons wow fadeInDown hidden-xs' data-wow-delay='0.2s'><a class='btn btn-lg btn-border' href='eventos.aspx?id=" + fila.ID.ToString() + "'>" + Resources.Global.default4 + "</a></div> " +
                                "</div> " +
                            "</div>";
                    }
                }
                if (ds.V_EVENTOS.Count==0)
                {
                    foreach (DL.EventosDS.V_EVENTOSRow fila in ds5.V_EVENTOS)
                    {
                        if (!fila.IsCARTELNull() && fila.CARTEL != "")
                        {
                            carrusel += "<div class='item'> " +
                                    "<img src = 'Content/img/eventos/" + fila.ID.ToString() + "/" + fila.CARTEL + "' alt='' > " +
                                    "<div class='carousel-caption'>  " +
                                        "<h2 class='wow fadeInRight' data-wow-delay='300ms'>" + fila.EVENTO + "</h2> " +
                                        "<div class='buttons wow fadeInDown hidden-xs' data-wow-delay='0.2s'><a class='btn btn-lg btn-border' href='eventos.aspx?id=" + fila.ID.ToString() + "'>Minisite</a></div> " +
                                    "</div> " +
                                "</div>";
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string Top3(object idevento,object idetapa)
        {
            try
            {
                string cad = "";
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_TOP3TableAdapter t = new DL.EventosDSTableAdapters.V_TOP3TableAdapter();
                t.Fill(ds.V_TOP3, int.Parse(idevento.ToString()), int.Parse(idetapa.ToString()));
                int cont = 1;
                foreach (DL.EventosDS.V_TOP3Row fila in ds.V_TOP3)
                {
                    cad +=  cont.ToString() + "º <a href='rank.aspx?n=" +fila.NID.ToString() + "'>" + fila.PILOTO  +  "</a> | ";
                    cont++;
                }
                if (cad.Length > 0)
                    cad = cad.Substring(0, cad.Length - 3);
                return cad;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameDuracion(object vueltas, object tiempo)
        {
            try
            {
                if (vueltas.ToString() == "0")
                {
                    if (tiempo.ToString().IndexOf(Resources.Global.duracion1) == -1)
                        return tiempo.ToString() + " " + Resources.Global.duracion1;
                    else
                        return tiempo.ToString();
                }
                else
                {
                    if (vueltas.ToString().IndexOf(Resources.Global.duracion2)==-1)
                        return vueltas.ToString() + " " + Resources.Global.duracion2;
                    else
                        return vueltas.ToString();
                }

            }
            catch (Exception)
            {
                return Resources.Global.vueltas;
            }
        }

        public string DameJefeEquipo(object idusuario)
        {
            try
            {
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter tu = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                DL.UsuariosDS ds2 = new DL.UsuariosDS();
                tu.FillByIDU(ds2.USUARIOS, Guid.Parse(idusuario.ToString()));
                return ds2.USUARIOS[0].NOMBRE + " " + ds2.USUARIOS[0].APELLIDOS;
            }
            catch (Exception)
            {

                return "";
            }
        }

        public string DameCoches(object coches, object juego)
        {
            try
            {
                if (juego.ToString() == "9")
                    return "F1 2016";
                else if (juego.ToString() == "12")
                    return "F1 2017";
                else if (juego.ToString() == "15")
                    return "F1 2018";
                else
                {
                    if (coches.ToString().Length < 100)
                        return coches.ToString();
                    else
                        return coches.ToString().Substring(0, 100) + "...";
                }
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameAvatarEquipo(object avatar, object idu)
        {
            try
            {
                if (avatar.ToString() != "escudo.jpg")
                    return "Content/img/equipos/" + idu.ToString() + "/" + avatar.ToString();
                else
                    return "Content/img/web/escudo.jpg";
            }
            catch (Exception)
            {
                return "Content/img/avatar/escudo.jpg";
            }
        }

        public string DameCircuito(object circ, object idlogo,object idfoto, int tipo=0)
        {
            try
            {
                string circuito = "circuito";
                if (circ != null) circuito = circ.ToString();
                //< img alt = "<%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %>" style = "height: 79px; width: 140px;" src = "Content/img/circuitos/<%# DataBinder.Eval(Container.DataItem,"IDLOGO") %>.jpg" />
                if (tipo == 0)
                {
                    string cad = "<div class='nocircuito hidden-xs'>" + circuito.ToString() + "</div>";
                    if (File.Exists(Server.MapPath("Content/img/circuitos/" + idlogo.ToString() + ".jpg")))
                        return "<img class='hidden-xs' alt='" + circuito.ToString() + "' style='height: 79px; width: 140px;' src='Content/img/circuitos/" + idlogo.ToString() + ".jpg' />";
                    else if (idfoto!=null && File.Exists(Server.MapPath("Content/img/circuitos/" + idfoto.ToString() + ".jpg")))
                        return "<img class='circuito hidden-xs' style='height: 79px; width: 140px;' alt='circuito' src='Content/img/circuitos/" + idfoto.ToString() + ".jpg' />";
                    else
                        return cad;
                    //                    return "<img alt='" + circuito.ToString() + "' style='height: 79px; width: 140px;' src='Content/img/web/circuito.jpg' />";
                }
                else
                {
                    // style='width:98px;height:83px;' 
                    if (File.Exists(Server.MapPath("Content/img/circuitos/" + idlogo.ToString() + ".jpg")))
                        return "<img alt='' style='width:79px;height:79px;' src='Content/img/circuitos/" + idlogo.ToString() + ".jpg' />";
                    else if (idfoto != null && File.Exists(Server.MapPath("Content/img/circuitos/" + idfoto.ToString() + ".jpg")))
                        return "<img alt='' style='width:79px;height:79px;' src='Content/img/circuitos/" + idfoto.ToString() + ".jpg' />";
                    else
                        return "<img alt='' style='width:79px;height:79px;' src='Content/img/web/circuito.jpg' />";
                }

            }
            catch (Exception)
            {
                if (tipo==0)
                    return "<img alt='' class='hidden-xs' style='height: 79px; width: 140px;' src='Content/img/web/circuito.jpg' />";
                else
                        return "<img alt='' style='width:98px;height:83px;' src='Content/img/web/circuito.jpg' />";
            }
        }

        public string DameSetup(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return "Fixed";
                else
                    return "Open";
            }
            catch (Exception)
            {
                return "Fixed";
            }
        }

        public string DameBandera(object sender)
        {
            try
            {
                return "<img style='width:16px' src='Content/img/flags/" + sender.ToString().Trim() + ".png'>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameMes(object sender)
        {
            try
            {
                return DateTime.Parse(sender.ToString()).ToShortMonthName();
            }
            catch (Exception)
            {
                return Resources.Global.mes;
            }
        }

        public string DameTwitter(object sender)
        {
            try
            {
                if (sender.ToString().IndexOf("@") != -1)
                    return "<a target='_blank' href='http://twitter.com/" + sender.ToString().Replace("@", "") + "'><span class='fa fa-twitter'></span></a>";
                else if (sender.ToString().IndexOf("http") != -1)
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-twitter'></span></a>";
                else if (sender.ToString().IndexOf("http") == -1 && sender.ToString() != "" && sender.ToString() != "http://twitter.com/")
                    return "<a target='_blank' href='http://twitter.com/" + sender.ToString() + "'><span class='fa fa-twitter'></span></a>";
                else if (sender.ToString() != "" && sender.ToString() != "http://twitter.com/")
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-twitter'></span></a>";
                else
                    return "<a target='_blank' href='#'><span class='fa fa-twitter disabled'></span></a>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameFB(object sender)
        {
            try
            {
                if (sender.ToString() != "" && sender.ToString() != "http://facebook.com/")
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-facebook'></span></a>";
                else
                    return "<a target='_blank' href='#'><span class='fa fa-facebook disabled'></span></a>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameYT(object sender)
        {
            try
            {
                if (sender.ToString() != "" && sender.ToString() != "http://youtube.com/")
                    return "<a target='_blank' href='" + sender.ToString() + "'><span class='fa fa-youtube'></span></a>";
                else
                    return "<a target='_blank' href='#'><span class='fa fa-youtube disabled'></span></a>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DiaHora(object id, bool barra=true)
        {
            try
            {
                string diasemana = "";
                int dia = int.Parse((string)te.DameDia(int.Parse(id.ToString())));
                string hora = (string)te.DameHora(int.Parse(id.ToString()));
                switch (dia)
                {
                    case 0:
                        diasemana = Resources.Global.lunes;
                        break;
                    case 1:
                        diasemana = Resources.Global.martes;
                        break;
                    case 2:
                        diasemana = Resources.Global.miercoles;
                        break;
                    case 3:
                        diasemana =  Resources.Global.jueves;
                        break;
                    case 4:
                        diasemana = Resources.Global.viernes;
                        break;
                    case 5:
                        diasemana = Resources.Global.sabado;
                        break;
                    case 6:
                        diasemana =  Resources.Global.domingo;
                        break;
                }

                if (hora != "")
                {
                    if (barra)
                        return " | " + Resources.Global.diahora + ": " + diasemana + " " + Resources.Global.textolocal2 + " " + hora;
                    else
                        return "<br>" + Resources.Global.diahora + ": " + diasemana + " " + Resources.Global.textolocal2 + " " + hora;
                }
                else
                {
                    if (barra)
                        return " | " + Resources.Global.dia + ": " + diasemana;
                    else
                        return "<br>" + Resources.Global.dia + ": " + diasemana;
                }
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string Plazas(object nummax)
        {
            try
            {
                if (nummax == null || nummax.ToString() == "0" || nummax.ToString()=="")
                    return "<br>" + Resources.Global.nummax1;
                else
                    return "<br>" + Resources.Global.nummax2 + " " + nummax.ToString() + " " + Resources.Global.nummax3;
            }
            catch (Exception)
            {
                return "";
            }
        }

        private void CargaFeed()
        {
            string url = " https://simracer.es/feed/";
            XmlReader reader = XmlReader.Create(url);
            SyndicationFeed feed = SyndicationFeed.Load(reader);
            reader.Close();
            foreach (SyndicationItem item in feed.Items)
            {
                String subject = item.Title.Text;
                String summary = item.Summary.Text;
    
            }
        }

        public string DameFotoNoticia(object id, object foto)
        {
            try
            {
                if (foto==null || foto.ToString()=="")
                    return "assets/img/background/bg-1.jpg";
                else
                    return "Content/img/noticias/" + id.ToString() + "/" + foto.ToString();
            }
            catch (Exception)
            {
                return "assets/img/background/bg-1.jpg";
            }
        }
    }

    static class DateTimeExtensions
    {
        public static string ToMonthName(this DateTime dateTime)
        {
            return CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(dateTime.Month);
        }

        public static string ToShortMonthName(this DateTime dateTime)
        {
            return CultureInfo.CurrentCulture.DateTimeFormat.GetAbbreviatedMonthName(dateTime.Month);
        }
    }
}
