using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.eventos
{
    public partial class eventos : System.Web.UI.Page
    {
        public string nombreevento = "", video="";
        public bool dorsal = false, skin = false;
        int tipo = 0;
        public string organizador = "", logo = "", correo = "", desde = "", hasta = "", cartel = "", visible = "hidden", mensaje = "", estilo = "success", informacion = "", juego = "", plataforma = "", nummax = "", calini = "", calfin = "", numetapas = "", twitter = "", facebook = "", instagram = "", google = "", cochescad = "", color = "red.css", resultados = "", relojini = "", docs = "", pais = "", youtube = "", diasemana = "", hora = "", setup = "", textocal = "", top3="", zona="", zona2="", fondo="", mangas="";
        Models.EventosCN cn = new Models.EventosCN();
        protected void bInscribete_Click(object sender, EventArgs e)
        {
            Models.EventosCN cn = new Models.EventosCN();
            int id = 0;
            try
            {
                if (tUser.Text != "" && tPass.Text != "")
                {
                    DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                    DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter t2 = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter();                   
                    DL.UsuariosDS ds = new DL.UsuariosDS();
                    t.FillByIDUSUARIOPASS(ds.USUARIOS, tUser.Text, cn.Encrypt(tPass.Text));
                    if (ds.USUARIOS.Count == 1)
                    {
                        
                        if (!cn.EstaInscrito(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString())))
                        {
                            //if (cn.EsMultiCoche(int.Parse(Request.QueryString["id"].ToString())))
                            //{
                            id = cn.InscribeUsuario2(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString()),tDorsal.Text,fuSkin.FileName);
                            if (id > 0)
                            {
                                if (fuSkin.HasFile)
                                {
                                    if (!Directory.Exists(Server.MapPath("Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString())))
                                        Directory.CreateDirectory(Server.MapPath("Content/img/avatar/" + ds.USUARIOS[0].ToString()));
                                    try
                                    {
                                        string ruta = Server.MapPath("Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString());
                                        try
                                        {
                                            if (File.Exists(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName)))
                                                File.Delete(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName));
                                        }
                                        catch (Exception)
                                        {
                                        }
                                        fuSkin.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName));
                                    }
                                    catch (Exception)
                                    {
                                        Response.Redirect("inicio.aspx?e=e2");
                                    }
                                }
                                for (int i = 0; i <= Request.Form.Count - 1; i++)
                                {
                                    if (Request.Form.Keys[i].ToString().IndexOf("cb-") != -1)
                                    {
                                        string[] aux = Request.Form.Keys[i].ToString().Split('-');
                                        if (Request.Form[i].ToString().IndexOf(",")!=-1)
                                            t2.Insert(int.Parse(aux[1]), ds.USUARIOS[0].IDUSUARIO, int.Parse(Request.Form[i].ToString().Split(',')[0]), id);
                                        else
                                            t2.Insert(int.Parse(aux[1]), ds.USUARIOS[0].IDUSUARIO, int.Parse(Request.Form[i].ToString()), id);
                                    }
                                }
                                Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=1#resinscripcion", false);
                            }
                            else
                                Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=3#resinscripcion", false);
                            //}
                            //else if (cn.InscribeUsuario(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString())))
                            //{
                            //    Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=1#inscripcion");
                            //}
                        }
                        else
                            Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=2#resinscripcion", false);
                    }
                    else
                        Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=4#resinscripcion", false);
                }
                else
                    Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=4#resinscripcion", false);
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        public string Youtube(string url)
        {
            try
            {
                string vidId = "";
                if ((url.IndexOf("youtube.com/watch?v=") != -1))
                {
                    vidId = url.Substring((url.IndexOf("youtube.com/watch?v=") + 20));
                }
                else if ((url.IndexOf("youtube.com/watch/?v=") != -1))
                {
                    vidId = url.Substring((url.IndexOf("youtube.com/watch/?v=") + 21));
                }
                else if ((url.IndexOf("youtu.be") != -1))
                {
                    vidId = url.Substring((url.IndexOf("youtu.be") + 9));
                }
                else if ((url.IndexOf("www.youtube.com/embed/") != -1))
                {
                    vidId = url.Substring((url.IndexOf("www.youtube.com/embed/") + 22));
                }
                else if ((url.IndexOf("?v=") != -1))
                {
                    vidId = url.Substring((url.IndexOf("?v=") + 3), 11);
                }

                if ((vidId != ""))
                {
                    return ("<iframe style=\'display:block;width:100%;height:400px;\' src=\'"
                                + (("https://www.youtube.com/embed/" + vidId)
                                + "\' frameborder=\'0\' allowfullscreen></iframe>"));
                }
                else
                {
                    return "";
                }

            }
            catch (Exception ex)
            {
                return url;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] == null)
                    Response.Redirect("error.aspx?e=0", true);
                if (Request.QueryString["ok"] != null)
                {
                    if (Request.QueryString["ok"].ToString() == "1")
                    {
                        mensaje = Resources.Global.mensaje1;
                        visible = "visible";
                        estilo = "success";
                        lblmensaje.Text = mensaje;
                        lblmensaje.Visible = true;
                    }
                    else if (Request.QueryString["ok"].ToString() == "2")
                    {
                        mensaje = Resources.Global.mensaje2;
                        visible = "visible";
                        estilo = "warning";
                        lblmensaje.Text = mensaje;
                        lblmensaje.Visible = true;
                    }
                    else if (Request.QueryString["ok"].ToString() == "3")
                    {
                        mensaje = Resources.Global.mensaje3;
                        visible = "visible";
                        estilo = "warning";
                        lblmensaje.Text = mensaje;
                        lblmensaje.Visible = true;
                    }
                    else if (Request.QueryString["ok"].ToString() == "4")
                    {
                        mensaje = Resources.Global.mensaje4;
                        visible = "visible";
                        estilo = "warning";
                        lblmensaje.Text = mensaje;
                        lblmensaje.Visible = true;
                    }
                }

                if (!IsPostBack)
                {
                    DL.EventosDS ds = new DL.EventosDS();
                    DL.EventosDSTableAdapters.EVENTOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                    DL.EventosDSTableAdapters.V_EVENTOSTableAdapter ve = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
                    DL.EventosDSTableAdapters.V_ETAPASTableAdapter vet = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
                    DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter ti = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
                    DL.EventosDSTableAdapters.V_SPONSORSTableAdapter ts = new DL.EventosDSTableAdapters.V_SPONSORSTableAdapter();
                    DL.EventosDSTableAdapters.V_ETAPAS_COCHESTableAdapter tc = new DL.EventosDSTableAdapters.V_ETAPAS_COCHESTableAdapter();
                    DL.NoticiasDS nds = new DL.NoticiasDS();
                    DL.NoticiasDS nds2 = new DL.NoticiasDS();
                    DL.NoticiasDSTableAdapters.NOTICIASTableAdapter tn = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();

                    ve.FillByIDEVENTO(ds.V_EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                    if (ds.V_EVENTOS.Count > 0)
                    {
                        try
                        {
                            tipo = ds.V_EVENTOS[0].TIPO;
                            tn.FillByPublicasEvento(nds.NOTICIAS, ds.V_EVENTOS[0].ID);
                            tn.FillByTop5(nds2.NOTICIAS, ds.V_EVENTOS[0].ID);
                            if (nds.NOTICIAS.Count==0)
                                panNoticias.Visible = false;
                            else
                            {
                                repTodasNoticias.DataSource = nds;
                                repTodasNoticias.DataMember = "NOTICIAS";
                                repTodasNoticias.DataBind();
                                repNoticias.DataSource = nds2;
                                repNoticias.DataMember = "NOTICIAS";
                                repNoticias.DataBind();
                            }

                            int dia = int.Parse((string)te.DameDia(ds.V_EVENTOS[0].ID));
                            hora = (string)te.DameHora(ds.V_EVENTOS[0].ID);
                            if (hora != "") hora = "<br>" + Resources.Global.horacarreras + ": " + hora;
                            if (!ds.V_EVENTOS[0].IsMANGASNull())
                            {
                                mangas = Mangas(ds.V_EVENTOS[0].MANGAS);
                            }
                            if (!ds.V_EVENTOS[0].IsVIDEONull())
                            {
                                video = Youtube(ds.V_EVENTOS[0].VIDEO);                              
                            }
                            if (!ds.V_EVENTOS[0].IsDORSALNull() && ds.V_EVENTOS[0].DORSAL)
                                dorsal = true;
                            if (!ds.V_EVENTOS[0].IsSKINSNull() && ds.V_EVENTOS[0].SKINS)
                            {
                                if (ds.V_EVENTOS[0].IDJUEGO==1 || ds.V_EVENTOS[0].IDJUEGO == 2)
                                    skin = true;
                                else if (ds.V_EVENTOS[0].IDJUEGO==4)
                                {
                                    skin = false;
                                    dorsal = true;
                                    litdorsal.Text = "Skin #";
                                }
                            }
                            if (!ds.V_EVENTOS[0].IsZONANull())
                            {
                                System.Collections.ObjectModel.ReadOnlyCollection<TimeZoneInfo> TimeZoneColl = TimeZoneInfo.GetSystemTimeZones();
                                TimeZoneInfo cstZone1 = TimeZoneInfo.FindSystemTimeZoneById(ds.V_EVENTOS[0].ZONA);
                                zona =cstZone1.DisplayName.ToString().Substring(0, cstZone1.DisplayName.ToString().IndexOf(")")+1);
                                zona2 = "&nbsp;" + cstZone1.DisplayName.ToString().Substring(0, cstZone1.DisplayName.ToString().IndexOf(")") + 1);
                            }
                            if (!ds.V_EVENTOS[0].IsFONDONull())
                                fondo = "Content/img/eventos/" + ds.V_EVENTOS[0].ID.ToString() + "/" +ds.V_EVENTOS[0].FONDO;
                            else
                                fondo = "assets/img/background/bg-" +  ds.V_EVENTOS[0].IDJUEGO.ToString() + ".jpg";
                            switch (dia)
                            {
                                case 0:
                                    diasemana = "<br>" + Resources.Global.diasemana + ": " + Resources.Global.lunes;
                                    break;
                                case 1:
                                    diasemana = "<br>" + Resources.Global.diasemana + ": " + Resources.Global.martes;
                                    break;
                                case 2:
                                    diasemana = "<br>" + Resources.Global.diasemana + ": " + Resources.Global.miercoles;
                                    break;
                                case 3:
                                    diasemana = "<br>" + Resources.Global.diasemana + ": " + Resources.Global.jueves;
                                    break;
                                case 4:
                                    diasemana = "<br>" + Resources.Global.diasemana + ": " + Resources.Global.viernes;
                                    break;
                                case 5:
                                    diasemana = "<br>" + Resources.Global.diasemana + ": " + Resources.Global.sabado;
                                    break;
                                case 6:
                                    diasemana = "<br>" + Resources.Global.diasemana + ": " + Resources.Global.domingo;
                                    break;
                            }
                            textocal = Resources.Global.textolocal1 + " <b>" + diasemana.Replace("<br>" + Resources.Global.diasemana + ": ", "") + "</b> " + Resources.Global.textolocal2 + " <b>" + hora.Replace("<br>" + Resources.Global.horacarreras + ": ", "") + "</b> " + zona2;
                        }
                        catch (Exception)
                        {
                        }

                        if (Request.QueryString["preview"] == null)
                        {
                            if (!ds.V_EVENTOS[0].VALIDADO)
                            {
                                Response.Redirect("default.aspx", false);
                                return;
                            }
                            if (!ds.V_EVENTOS[0].IsBORRADONull() && ds.V_EVENTOS[0].BORRADO)
                            {
                                Response.Redirect("default.aspx", false);
                                return;
                            }
                        }
                        if (Request.QueryString["preview"] != null || (!ds.V_EVENTOS[0].IsSININSCRIPCIONESNull() && ds.V_EVENTOS[0].SININSCRIPCIONES == true))
                            panIncripcion.Visible = false;
                        if (!ds.V_EVENTOS[0].IsDESCRIPCIONNull()) informacion = ds.V_EVENTOS[0].DESCRIPCION;
                        nombreevento = ds.V_EVENTOS[0].EVENTO;
                        organizador = ds.V_EVENTOS[0].NOMBRE;
                        logo = "Content/img/avatar/" + ds.V_EVENTOS[0].IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR;
                        if (ds.V_EVENTOS[0].IsCARTELNull())
                            cartel = "assets/img/background/bg-1.jpg";
                        else
                            cartel = "Content/img/eventos/" + ds.V_EVENTOS[0].ID.ToString() + "/" + ds.V_EVENTOS[0].CARTEL;
                        vet.FillByIDEVENTO(ds.V_ETAPAS, ds.V_EVENTOS[0].ID);
                        ts.Fill(ds.V_SPONSORS, ds.V_EVENTOS[0].ID);
                        desde = ds.V_EVENTOS[0].FECHAINI.ToShortDateString();
                        hasta = ds.V_EVENTOS[0].FECHAFIN.ToShortDateString();
                        if (ds.V_EVENTOS[0].SETUP == 0)
                            setup = "Fixed";
                        else
                            setup = "Open";
                        juego = ds.V_EVENTOS[0].JUEGO;
                        correo = ds.V_EVENTOS[0].USUARIO;
                        plataforma = ds.V_EVENTOS[0].PLATAFORMA;
                        if (!ds.V_EVENTOS[0].IsTWITTERNull()) twitter = DameTwitter(ds.V_EVENTOS[0].TWITTER);
                        if (!ds.V_EVENTOS[0].IsFACEBOOKNull()) facebook = ds.V_EVENTOS[0].FACEBOOK;
                        if (!ds.V_EVENTOS[0].IsYOUTUBENull()) youtube = ds.V_EVENTOS[0].YOUTUBE;
                        if (!ds.V_EVENTOS[0].IsCOLORNull()) linkCSS.Href = "assets/css/colors/" + ds.V_EVENTOS[0].COLOR;
                        vet.FillByIDEVENTO(ds.V_ETAPAS, int.Parse(Request.QueryString["id"].ToString()));
                        ti.Fill(ds.V_INSCRIPCIONES, int.Parse(Request.QueryString["id"].ToString()));
                        numetapas = ds.V_ETAPAS.Count.ToString();
                        if (!ds.V_EVENTOS[0].IsCODPAISNull())
                        {
                            try
                            {
                                pais = cn.DamePais(ds.V_EVENTOS[0].CODPAIS.Trim());
                            }
                            catch (Exception)
                            {
                            }

                        }
                        if (ds.V_ETAPAS.Count > 0)
                        {
                            try
                            {
                                relojini = ds.V_ETAPAS[0].FECHA.Year.ToString() + "/" + ds.V_ETAPAS[0].FECHA.Month.ToString().PadLeft(2,'0') + "/" + ds.V_ETAPAS[0].FECHA.Day.ToString().PadLeft(2, '0') + " " + ds.V_EVENTOS[0].HORA.Replace("h","");
                                DateTime compruebafecha = DateTime.Parse(relojini);
                                relojini = compruebafecha.Year.ToString() + "/" + compruebafecha.Month.ToString() + "/" + compruebafecha.Day.ToString();
                            }
                            catch (Exception)
                            {
                                relojini = ds.V_ETAPAS[0].FECHA.Year.ToString() + "/" + ds.V_ETAPAS[0].FECHA.Month.ToString().PadLeft(2, '0') + "/" + ds.V_ETAPAS[0].FECHA.Day.ToString().PadLeft(2, '0');
                            }
                            
                            calini = ds.V_ETAPAS[0].FECHA.ToShortDateString();
                            calfin = ds.V_ETAPAS[ds.V_ETAPAS.Count - 1].FECHA.ToShortDateString();

                            //if (ds.V_ETAPAS[0].FECHA <= DateTime.Now)
                            //{
                            //    panRelol.Visible = false;
                            //}
                            //if (ds.V_EVENTOS[0].FECHAFIN < DateTime.Now)
                            //{
                            //    panIncripcion.Visible = false;
                            //}
                        }
                        else
                        {
                            relojini = (DateTime.Now.Year + 1).ToString() + "/01/01";
                            panIncripcion.Visible = true;
                        }
                        bool primero = false;
                        foreach (DL.EventosDS.V_ETAPASRow etapa in ds.V_ETAPAS)
                        {
                            cochescad += "<tr class='hidden-xs'><td>" + etapa.FECHA.ToShortDateString() + "</td><td>" + etapa.CIRCUITO + "</td><td><select name='cb-" + etapa.ID.ToString() + "'>";
                            tc.Fill(ds.V_ETAPAS_COCHES, etapa.ID);
                            foreach (DL.EventosDS.V_ETAPAS_COCHESRow coche in ds.V_ETAPAS_COCHES)
                            {
                                if (!primero)
                                {
                                    cochescad += "<option selected='selected' value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                                    primero = true;
                                }
                                else
                                    cochescad += "<option value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                            }
                            cochescad += "</select></td></tr>";

                            cochescad += "<tr class='visible-xs'><td>" + etapa.FECHA.ToShortDateString() + " - " + etapa.CIRCUITO + "<br><select name='cb-" + etapa.ID.ToString() + "'>";
                            tc.Fill(ds.V_ETAPAS_COCHES, etapa.ID);
                            foreach (DL.EventosDS.V_ETAPAS_COCHESRow coche in ds.V_ETAPAS_COCHES)
                            {
                                if (!primero)
                                {
                                    cochescad += "<option selected='selected' value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                                    primero = true;
                                }
                                else
                                    cochescad += "<option value='" + coche.ID.ToString() + "'>" + coche.COCHE + "</option>";
                            }
                            cochescad += "</select></td></tr>";

                            primero = false;
                        }

                        repInscritos.DataSource = ds.V_INSCRIPCIONES;
                        //repInscritos.DataBind();                     
                        //repEtapas.DataBind();
                        if (ds.V_EVENTOS[0].IDJUEGO == 1) //iracing
                        {
                            repEtapas2.DataSource = ds;
                            repEtapas2.DataMember = "V_ETAPAS";
                            //repEtapas2.DataBind();
                        }
                        else if (ds.V_EVENTOS[0].IDJUEGO == 2) //assetto
                        {
                            repEtapasAC.DataSource = ds;
                            repEtapasAC.DataMember = "V_ETAPAS";
                            //repEtapasAC.DataBind();
                        }
                        else if (ds.V_EVENTOS[0].IDJUEGO == 3 || ds.V_EVENTOS[0].IDJUEGO == 11) //project 
                        {
                            repEtapasPC.DataSource = ds;
                            repEtapasPC.DataMember = "V_ETAPAS";
                            // repEtapasPC.DataBind();
                        }
                        else if (ds.V_EVENTOS[0].IDJUEGO == 4) // rr
                        {
                            repRR.DataSource = ds;
                            repRR.DataMember = "V_ETAPAS";
                            //repEtapasAC.DataBind();
                        }
                        else if (ds.V_EVENTOS[0].IDJUEGO == 6 || ds.V_EVENTOS[0].IDJUEGO == 7) //rfactor
                        {
                            repEtapasRF.DataSource = ds;
                            repEtapasRF.DataMember = "V_ETAPAS";
                            // repEtapasPC.DataBind();
                        }
                        else if (ds.V_EVENTOS[0].IDJUEGO == 9 || ds.V_EVENTOS[0].IDJUEGO == 12 || ds.V_EVENTOS[0].IDJUEGO == 15 || ds.V_EVENTOS[0].IDJUEGO == 17) //F1 2016/2017/2018/2019
                        {
                            repF1.DataSource = ds;
                            repF1.DataMember = "V_ETAPAS";
                            panCoches.Visible = false;
                            // repEtapasPC.DataBind();
                        }
                        else if (ds.V_EVENTOS[0].IDJUEGO == 13 || ds.V_EVENTOS[0].IDJUEGO == 14) //FORZA 6 - 7
                        {
                            repFR.DataSource = ds;
                            repFR.DataMember = "V_ETAPAS";                            
                            // repEtapasPC.DataBind();
                        }
                        else if (ds.V_EVENTOS[0].IDJUEGO == 8) // gts
                        {
                            repGTS.DataSource = ds;
                            repGTS.DataMember = "V_ETAPAS";
                            //repEtapasAC.DataBind();
                        }
                        
                        repSponsors.DataSource = ds;
                        repSponsors.DataMember = "V_SPONSORS";
                        repSponsors.DataBind();
                        panSponsors.Visible = ds.V_SPONSORS.Count > 0;
                        if (ds.V_EVENTOS[0].IsNUMAXNull() || ds.V_EVENTOS[0].NUMAX == 0)
                            nummax = Resources.Global.nummax1;
                        else
                        {
                            nummax += Resources.Global.nummax2 + " " + ds.V_EVENTOS[0].NUMAX.ToString() + " " + Resources.Global.nummax3 + " ";
                        }
                        if (informacion == "" && ds.V_ETAPAS.Count > 0)
                        {
                            informacion = Resources.Global.info1 + " " + ds.V_EVENTOS[0].EVENTO + " " + Resources.Global.info2 + " " + ds.V_ETAPAS.Count.ToString() + " " + Resources.Global.carreras + " ";
                            informacion += " " + Resources.Global.info3 + " " + ds.V_ETAPAS[0].FECHA.ToLongDateString() + " " + Resources.Global.info4 + " " + ds.V_ETAPAS[ds.V_ETAPAS.Count - 1].FECHA.ToLongDateString();
                        }
                        if (!ds.V_EVENTOS[0].IsTS_SERVERNull() && ds.V_EVENTOS[0].TS_SERVER!="")
                        {
                            informacion += "<br><i class='fa fa-microphone'></i>&nbsp;Chat Server: " + ds.V_EVENTOS[0].TS_SERVER;
                            if (!ds.V_EVENTOS[0].IsTS_PASSNull() && ds.V_EVENTOS[0].TS_PASS!="") informacion += "/ Pass:" + ds.V_EVENTOS[0].TS_PASS;
                        }
                        if (!ds.V_EVENTOS[0].IsSIM_SERVERNull() && ds.V_EVENTOS[0].SIM_SERVER != "")
                        {
                            informacion += "<br><i class='fa fa-server'></i>&nbsp;Servidor Sim: " + ds.V_EVENTOS[0].SIM_SERVER;
                            if (!ds.V_EVENTOS[0].IsSIM_SERVER_PASSNull()) informacion += "/ Pass:" + ds.V_EVENTOS[0].SIM_SERVER_PASS;
                        }
                        if (!ds.V_EVENTOS[0].IsURL_LAPSNull() && ds.V_EVENTOS[0].URL_LAPS!="") informacion += "<br><i class='fa fa-clock-o'></i>&nbsp;URL Laps/Estadísticas: <a target='_blank' href='" + ds.V_EVENTOS[0].URL_LAPS + "'>" + ds.V_EVENTOS[0].URL_LAPS + "</a>";
                        resultados = cn.ResultadosFinal(int.Parse(Request.QueryString["id"].ToString()));
                        top3 = cn.Top3(int.Parse(Request.QueryString["id"].ToString()));
                        panResultados.Visible = (resultados != "" && resultados!= "<p>&nbsp;</p>");
                        
                        DL.EventosDSTableAdapters.V_ADJUNTOSTableAdapter tadj = new DL.EventosDSTableAdapters.V_ADJUNTOSTableAdapter();
                        tadj.FillByIDEVENTO(ds.V_ADJUNTOS, int.Parse(Request.QueryString["id"].ToString()));
                        if (ds.V_ADJUNTOS.Count > 0)
                        {
                            docs += "<i class='fa fa-download' aria-hidden='true'></i> " + Resources.Global.docs1 + ": ";
                            foreach (DL.EventosDS.V_ADJUNTOSRow fila in ds.V_ADJUNTOS)
                            {
                                docs += "<a target='_blank' href='Content/img/eventos/" + fila.IDEVENTO.ToString() + "/docs/" + fila.FICHERO + "'>" + fila.TIPODOC + "</a>, ";
                            }
                            docs = "<h5>" + docs.Substring(0, docs.Length - 2) + "</h5>";
                        }

                        //1. Si no ha llegado el periodo de inscripcion: 1 Ocultar inscripcion, 2 resultados, 3 lista pilotos y 4 dejar tweet
                        if (ds.V_EVENTOS[0].FECHAINI > DateTime.Now)
                        {
                            panIncripcion.Visible = true; incricpcionForm.Visible = false; //1

                            panInscritos.Visible = false; //2
                            panResultados.Visible = false; //3

                            tweet.Visible = true; //4
                        }
                        //2. Si ha llegado el periodo de inscripcion: Mostrar inscripcion, ocultar resultados, mostrar lista pilotos, ocultar tweet
                        if (ds.V_EVENTOS[0].FECHAINI.Date <= DateTime.Now.Date && DateTime.Parse(ds.V_EVENTOS[0].FECHAFIN.ToShortDateString() + " 23:59:59") >= DateTime.Now.Date)
                        {
                            panIncripcion.Visible = true; incricpcionForm.Visible = true;//1
                            panResultados.Visible = false; //2
                            panInscritos.Visible = true; //3
                            tweet.Visible = false;//4
                            int cuenta = ds.V_INSCRIPCIONES.Count;
                            if (!ds.V_EVENTOS[0].IsNUMAXNull())
                            {
                                //3. Si se ha superado el nº max: ocultar inscripcion, resultados, mostrar lista pilotos y ocultar tweet
                                if (cuenta >= ds.V_EVENTOS[0].NUMAX && ds.V_EVENTOS[0].NUMAX > 0)
                                {                                   
                                    panIncripcion.Visible = true;
                                    incricpcionForm.Visible = false;
                                }
                            }
                        }

                        //3. Si ha pasado el tiempo de inscripcion pero no ha llegado la primera carrera. Ocultar inscripcion, mostrar pilotos, ocultar tweet
                        if (ds.V_EVENTOS[0].FECHAFIN.Date < DateTime.Now.Date  && (!ds.V_EVENTOS[0].IsFECHAPRIMERANull() && ds.V_EVENTOS[0].FECHAPRIMERA.Date>DateTime.Now.Date))
                        {
                            panIncripcion.Visible = false; incricpcionForm.Visible = false;
                            tweet.Visible = false;
                            panInscritos.Visible = true;
                        }

                        //4. Si se ha superado la fecha ini primera carrera: ocultar inscripcion, mostrar resultados, lista pilotos (si no hay resultados todavia), ocultar tweet
                       
                        if (!ds.V_EVENTOS[0].IsFECHAPRIMERANull())
                        {
                            DateTime horaprimera = ds.V_EVENTOS[0].FECHAPRIMERA.Date;
                            try
                            {
                                horaprimera = DateTime.Parse(ds.V_EVENTOS[0].FECHAPRIMERA.Date.ToShortDateString() + " " + ds.V_EVENTOS[0].HORA);
                            }
                            catch (Exception)
                            {
                            }
                            if (horaprimera <= DateTime.Now)
                            {
                                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter tde = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                                if ((int)tde.HayResultadosPublicados(ds.V_EVENTOS[0].ID) > 0)
                                {
                                    panIncripcion.Visible = false; incricpcionForm.Visible = false;
                                    panInscritos.Visible = false;
                                    panResultados.Visible = resultados != "";

                                    tweet.Visible = false;
                                    if (resultados == "") panInscritos.Visible = true;
                                }
                                else
                                {
                                    panInscritos.Visible = true;
                                    panIncripcion.Visible = false; incricpcionForm.Visible = false;
                                    panResultados.Visible = resultados != "" && resultados != "<p>&nbsp;</p>";

                                    tweet.Visible = false;
                                    if (resultados == "" && resultados != "<p>&nbsp;</p>") panInscritos.Visible = true;
                                }
                            }
                        }
                        Page.DataBind();
                    }
                    else
                        Response.Redirect("error.aspx?e=0");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("error.aspx?e=0");
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

        public string DameVueltas(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return Resources.Global.vueltas;
                else
                    return sender.ToString();
            }
            catch (Exception)
            {
                return Resources.Global.vueltas;
            }
        }

        public string DameSalida(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return "<p>" + Resources.Global.salida1 + "</p>";
                else
                    return "<p>" + Resources.Global.salida2 + "</p>";
            }
            catch (Exception)
            {
                return "<p>" + Resources.Global.salida1 + "</p>";
            }
        }

        public string DameFastRepairs(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return "<p>Fast Repairs: " + Resources.Global.fastrepairs + "</p>";
                else
                    return "<p>Fast Repairs: " + sender.ToString() + "</p>";
            }
            catch (Exception)
            {
                return "<p>Fast Repairs: " + Resources.Global.fastrepairs + "</p>";
            }
        }

        public string DameIncidentes(object sender)
        {
            try
            {
                if (sender.ToString() == "0" || sender.ToString() == "")
                    return "";
                else
                    return "<p>" + Resources.Global.incidentes + ": " + sender.ToString() + "</p>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameAyudas(object sender)
        {
            try
            {
                if (sender.ToString() == "0" || sender.ToString() == "")
                    return "<p>" + Resources.Global.ayudas + ": No establecidas</p>";
                else
                {
                    string res = "";
                    switch (sender.ToString())
                    {
                        case "0":
                            res = "Desactivadas";
                            break;
                        case "1":
                            res = "Embrague automático";
                            break;
                        case "2":
                            res = "Activadas";
                            break;
                    }
                    return "<p>" + Resources.Global.ayudas + ": " + res + "</p>";
                }

            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameEstadoPista(object sender)
        {
            try
            {
                return "<p>" + Resources.Global.estadopista + ": " + sender.ToString() + "</p>";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameCautions(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return "<p>Cautions: " + Resources.Global.cautions1 + "</p>";
                else
                    return "<p>Cautions: " + Resources.Global.cautions2 + "</p>";
            }
            catch (Exception)
            {
                return "<p>Cautions: " + Resources.Global.cautions1 + "</p>";
            }
        }

        public string DameParadas(object sender)
        {
            try
            {
                if (sender.ToString() != "")
                    return "<p>" + Resources.Global.paradas + ": " + sender.ToString() + "</p>";
                else
                    return "";
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

        public string DameClima(object dinamico, object lluvia)
        {
            try
            {
                string res = "";
                if (dinamico.ToString() == "True")
                    res = Resources.Global.clima1;
                if (lluvia.ToString() == "True")
                {
                    if (res == "")
                        res = Resources.Global.clima2;
                    else
                        res += " " + Resources.Global.clima3;
                }
                if (res != "")
                    res = "<p>" + Resources.Global.clima4 + ": " + res + "</p>";
                return res;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameSocial()
        {
            try
            {
                string cad = "";
                if (correo != "") cad = "<a class='social' href='mailto:" + correo + "'><i class='fa fa-envelope'></i></a>&nbsp;";
                if (facebook != "") cad += "<a class='social' href='" + facebook + "' target='_blank'><i class='fa fa-facebook'></i></a>&nbsp;";
                if (twitter != "" && twitter != "http://twitter.com/" && twitter != "http://twitter.com") cad += "<a class='social' href='" + twitter + "' target='_blank'><i class='fa fa-twitter'></i></a>&nbsp;";
                //<a class="social" href="#" target="_blank"><i class="fa fa-google-plus"></i></a>
                //<a class="social" href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                return cad;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string PeriodoTexto(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return Resources.Global.periodo1;
                else if (sender.ToString() == "1")
                    return Resources.Global.periodo2;
                else
                    return Resources.Global.periodo3;
            }
            catch (Exception)
            {
                return Resources.Global.periodo1;
            }
        }

        public string DameActivo(object sender)
        {
            try
            {
                if (sender.ToString() == "0")
                    return "active";
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameMod(object sender)
        {
            try
            {
                if (sender.ToString() != "")
                    return "<p>" + Resources.Global.descarga1 + " : <a target='_blank' href='" + sender.ToString() + "'> " + Resources.Global.descarga2 + "</a></p>";
                else
                    return "";
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
                if (sender.ToString() != "")
                    return "<p>Stream TV: <a href='" + sender.ToString() + "'> " + Resources.Global.stream + "</a></p>";
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }


        public string DameAvatar(object idu, object avatar)
        {
            try
            {
                if (avatar.ToString() != "isracetime_user.jpg")
                    return "Content/img/avatar/" + idu.ToString() + "/" + avatar.ToString();
                else
                    return "Content/img/avatar/isracetime_user.jpg";
            }
            catch (Exception)
            {
                return "Content/img/avatar/isracetime_user.jpg";
            }
        }

        public string DameDuracion(object vueltas, object tiempo)
        {
            try
            {
                if (vueltas.ToString() == "0" || vueltas.ToString() == "")
                    return tiempo.ToString() + " " + Resources.Global.duracion1;
                else
                    return vueltas.ToString() + " " + Resources.Global.duracion2;

            }
            catch (Exception)
            {
                return Resources.Global.vueltas;
            }
        }

        public string DameTwitter(object sender)
        {
            try
            {
                if (sender.ToString().IndexOf("@") != -1)
                    return "http://twitter.com/" + sender.ToString().Replace("@", "");
                else if (sender.ToString().IndexOf("http") != -1)
                    return sender.ToString();
                else if (sender.ToString().IndexOf("http") == -1)
                    return "http://twitter.com/" + sender.ToString();
                else if (sender.ToString() != "" && sender.ToString() != "http://twitter.com/")
                    return sender.ToString();
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameCircuito(object idlogo, object idfoto)
        {
            try
            {
                //< img alt = "<%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %>" style = "height: 79px; width: 140px;" src = "Content/img/circuitos/<%# DataBinder.Eval(Container.DataItem,"IDLOGO") %>.jpg" />
                if (File.Exists(Server.MapPath("Content/img/circuitos/" + idlogo.ToString() + ".jpg")))
                    return "<img style='width:100%;height:auto;margin-bottom:10px;' class='circuito' alt='circuito' src='Content/img/circuitos/" + idlogo.ToString() + ".jpg' />";
                else if (idfoto != null && File.Exists(Server.MapPath("Content/img/circuitos/" + cn.RemoveSpecialCharacters(idfoto.ToString()) + ".jpg")))
                    return "<img style='width:100%;height:auto;margin-bottom:10px;' class='circuito' alt='circuito' src='Content/img/circuitos/" + idfoto.ToString() + ".jpg' />";
                else
                    return "<img style='width:100%;height:auto;margin-bottom:10px;'  class='circuito' alt='circuito' src='Content/img/web/circuito.jpg' />";
            }
            catch (Exception)
            {
                return "<img style='width:100%;height:auto;margin-bottom:10px;' class='circuito' alt='circuito' src='Content/img/web/circuito.jpg' />";
            }
        }

        public string Top3(object idetapa)
        {
            try
            {
                string cad = "";
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_TOP3TableAdapter t = new DL.EventosDSTableAdapters.V_TOP3TableAdapter();
                t.Fill(ds.V_TOP3, int.Parse(Request.QueryString["ID"].ToString()), int.Parse(idetapa.ToString()));
                int cont = 1;
                foreach (DL.EventosDS.V_TOP3Row fila in ds.V_TOP3)
                {
                    cad += cont.ToString() + "º <a href='rank.aspx?n=" + fila.NID.ToString() + "'>" + fila.PILOTO + "</a> | ";
                    cont++;
                }
                if (cad.Length > 0)
                    cad = cad.Substring(0, cad.Length - 3) + "<br/>";
                return cad;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameCoches(object lista, object ideventoetapa, object idjuego)
        {
            try
            {
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_EV_ET_COCHETableAdapter t = new DL.EventosDSTableAdapters.V_EV_ET_COCHETableAdapter();
                t.Fill(ds.V_EV_ET_COCHE, int.Parse(ideventoetapa.ToString()));
                string coches = "";
                foreach (DL.EventosDS.V_EV_ET_COCHERow fila in ds.V_EV_ET_COCHE)
                {
                    if (fila.IsMODNull() || fila.MOD=="")
                        coches += fila.COCHE + ", ";
                    else
                        coches += "<a target='_blank' href='" + fila.MOD + "'>" + fila.COCHE + "</a>" + ", ";
                }
                if (coches.Length > 0)
                    coches = coches.Substring(0, coches.Length - 2);
                else
                    coches = lista.ToString().Replace(",", "<br><br>");
                return coches.Replace(",", ", ");
            }
            catch (Exception)
            {
                return lista.ToString().Replace(",", "<br><br>");
            }
        }

        public string DameEquipo(object equipo, object idequipo, object escuderia, object idjuego, object comunidad)
        {
            try
            {
                if (idjuego.ToString() == "9" || idjuego.ToString() == "12" || idjuego.ToString() == "15")
                {
                    return escuderia.ToString();
                }
                else
                {
                    if (equipo.ToString() == "SIN EQUIPO")
                    {
                        if (comunidad == null || comunidad.ToString() == "" || comunidad.ToString() == "NINGUNA" || tipo<3)
                            return "";
                        else
                            return comunidad.ToString();
                    }
                    else
                    {
                        if (comunidad == null || comunidad.ToString() == "" || comunidad.ToString() == "NINGUNA" || tipo < 3)
                            return "<a href='team.aspx?id=" + idequipo.ToString() + "'>" + equipo.ToString() + "</a>";
                        else
                            return "<a href='team.aspx?id=" + idequipo.ToString() + "'>" + equipo.ToString() + "</a> | " + comunidad.ToString();
                    }
                }
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameDuracionMin(object duracion)
        {
            try
            {
                if (duracion.ToString() != "")
                    return duracion.ToString() + " " + Resources.Global.duracion1;
                else
                    return "--";
            }
            catch (Exception)
            {

                return "--";
            }
        }

        public string DameDuracionSeg(object duracion)
        {
            try
            {
                if (duracion.ToString() != "")
                    return duracion.ToString() + " " + Resources.Global.segundos;
                else
                    return "--";
            }
            catch (Exception)
            {

                return "--";
            }
        }

        public string DameDuracionVueltas(object duracion)
        {
            try
            {
                if (duracion.ToString() != "")
                    return duracion.ToString() + " " + Resources.Global.duracion2;
                else
                    return "--";
            }
            catch (Exception)
            {

                return "--";
            }
        }

        public string SiNo(object elto)
        {
            try
            {
                if (elto.ToString() == "0")
                    return Resources.Global.si;
                else
                    return Resources.Global.no;
            }
            catch (Exception)
            {
                return Resources.Global.si;
            }
        }

        public string OnOff(object elto)
        {
            try
            {
                if (elto.ToString() == "0")
                    return "Off";
                else
                    return "On";
            }
            catch (Exception)
            {
                return "Off";
            }
        }

        public string KickClients(object elto)
        {
            try
            {
                if (elto.ToString() == "0")
                    return "Off";
                else
                    return "Wait Forever";
            }
            catch (Exception)
            {
                return "Off";
            }
        }

        public string FlagRules(object elto)
        {
            try
            {
                switch (elto.ToString())
                {
                    case "0":
                        return "None";
                    case "1":
                        return "Black-Only";
                    case "2":
                        return "Visual-Only";
                    case "3":
                        return "Complete";
                }
                return "None";
            }
            catch (Exception)
            {
                return "None";
            }
        }

        public string CutRules(object elto)
        {
            try
            {
                switch (elto.ToString())
                {
                    case "0":
                        return "Off";
                    case "1":
                        return "Slow-Down";
                    case "2":
                        return "Stop-Go";
                    case "3":
                        return "Drive-Through";
                }
                return "Off";
            }
            catch (Exception)
            {
                return "Off";
            }
        }

        public string FuelTire(object elto)
        {
            try
            {
                switch (elto.ToString())
                {
                    case "0":
                        return "Off";
                    case "1":
                        return "Normal";
                    case "2":
                        return "2x";
                    case "3":
                        return "3x";
                    case "4":
                        return "4x";
                }
                return "Off";
            }
            catch (Exception)
            {
                return "Off";
            }
        }

        public string Difficulty(object elto)
        {
            try
            {
                switch (elto.ToString())
                {
                    case "0":
                        return "Amateur";
                    case "1":
                        return "GetReal";
                    case "2":
                        return "Novice";

                }
                return "Amateur";
            }
            catch (Exception)
            {
                return "Amateur";
            }
        }

        public string VisualDamage(object elto)
        {
            try
            {
                switch (elto.ToString())
                {
                    case "0":
                        return "Off";
                    case "1":
                        return "Forgiving";
                    case "2":
                        return "Realistic";
                    
                }
                return "Off";
            }
            catch (Exception)
            {
                return "Off";
            }
        }

        public string RaceFinish(object elto)
        {
            try
            {
                switch (elto.ToString())
                {
                    case "0":
                        return "30";
                    case "1":
                        return "45";
                    case "2":
                        return "60";
                    case "3":
                        return "100";
                    case "4":
                        return "120";
                    case "5":
                        return "240";
                    case "6":
                        return "360";
                    case "7":
                        return "480";
                    case "8":
                        return "600";
                }
                return "30";
            }
            catch (Exception)
            {
                return "30";
            }
        }


        public string PeriodoRR(object elto)
        {
            try
            {
                switch (elto.ToString())
                {
                    case "0":
                        return "Sunrise";
                    case "1":
                        return "Morning";
                    case "2":
                        return "Noon";
                    case "3":
                        return "Afternoon";
                    case "4":
                        return "Sunset";
                }
                return "Sunrise";
            }
            catch (Exception)
            {

                return "Sunrise";
            }
        }

        public string Mangas(object elto)
        {
            try
            {
                if (elto.ToString() == "True")
                    return "2";
                else
                    return "1";
            }
            catch (Exception)
            {
                return "1";
            }
        }

        public string DameInicio(object elto)
        {
            try
            {
                if (elto.ToString().Length > 100)
                    return elto.ToString().Substring(0, 500) + "... </p>";
                else
                    return elto.ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameFotoNoticia(object id, object foto)
        {
            try
            {
                if (foto == null || foto.ToString() == "")
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
}
