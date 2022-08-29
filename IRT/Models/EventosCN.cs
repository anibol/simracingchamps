using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using DL;
using DL.EventosDSTableAdapters;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace IRT.Models
{
    public class EventosCN
    {
        string servidor = "MAIL5001.SmarterASP.NET";

        public bool EsMio(int id, string idusuario)
        {
            try
            {
                EVENTOSTableAdapter t = new EVENTOSTableAdapter();
                return (int)t.EsMio(id, Guid.Parse(idusuario)) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public string DameUsuarioInscripcion(int idinscripcion)
        {
            try
            {
                EventosDS ds = new EventosDS();
                EVENTOS_INSCRIPCIONESTableAdapter t = new EVENTOS_INSCRIPCIONESTableAdapter();
                t.FillByID(ds.EVENTOS_INSCRIPCIONES, idinscripcion);
                return ds.EVENTOS_INSCRIPCIONES[0].IDUSUARIO.ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }

        public EventosDS.EVENTOSRow CargaEvento(int id)
        {
            try
            {
                EventosDS ds = new EventosDS();
                EVENTOSTableAdapter t = new EVENTOSTableAdapter();
                t.FillByID(ds.EVENTOS, id);
                return ds.EVENTOS[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool EventoValidado(int id)
        {
            try
            {
                DL.EventosDS.EVENTOSRow evento = CargaEvento(id);
                return evento.VALIDADO;
            }
            catch (Exception)
            {
                return false;
            }
            

        }

        public string Campeonato(int id)
        {
            try
            {
                EventosDS.EVENTOSRow f = CargaEvento(id);
                return f.EVENTO;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public AuxliaresDS DameCircuitos(int idevento)
        {
            try
            {
                EventosDS.EVENTOSRow f = CargaEvento(idevento);
                if (f != null)
                {
                    AuxliaresDS ds = new AuxliaresDS();
                    DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter t = new DL.AuxliaresDSTableAdapters.JUEGO_CIRCUITOSTableAdapter();
                    t.FillByIDJUEGO(ds.JUEGO_CIRCUITOS, f.IDJUEGO);
                    DL.AuxliaresDSTableAdapters.JUEGO_COCHESTableAdapter t2 = new DL.AuxliaresDSTableAdapters.JUEGO_COCHESTableAdapter();
                    t2.FillByIDJUEGO(ds.JUEGO_COCHES, f.IDJUEGO);
                    return ds;
                }
                else
                    return null;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool InscribeUsuario(string usuario, int idevento, string dorsal, string skin)
        {
            try
            {
                EVENTOS_INSCRIPCIONESTableAdapter t = new EVENTOS_INSCRIPCIONESTableAdapter();
                return (int)t.Insert(Guid.Parse(usuario), 1, DateTime.Now, idevento, 1, dorsal, skin) > 0;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public int InscribeUsuario2(string usuario, int idevento, string dorsal, string skin = "")
        {
            try
            {
                EVENTOS_INSCRIPCIONESTableAdapter t = new EVENTOS_INSCRIPCIONESTableAdapter();
                DL.EventosDS ds = new EventosDS();
                DL.EventosDS.EVENTOS_INSCRIPCIONESRow f = ds.EVENTOS_INSCRIPCIONES.NewEVENTOS_INSCRIPCIONESRow();
                f.FECHAINSCRIPCION = DateTime.Now;
                f.IDUSUARIO = Guid.Parse(usuario);
                f.IDEVENTO = idevento;
                f.IDSPLIT = 1;
                f.IDDIVISION = 1;
                f.DORSAL = dorsal;
                f.SKIN = skin;
                ds.EVENTOS_INSCRIPCIONES.AddEVENTOS_INSCRIPCIONESRow(f);
                t.Update(f);
                string correo = DameEmailUsuario(usuario);
                string nombre = DameNombreUsuario(usuario);
                EventosDS.EVENTOSRow ev = CargaEvento(idevento);
                SendNotificacion(Properties.Settings.Default.DireccionCorreo, correo, nombre, "Te has inscrito en el evento: " + ev.EVENTO + "<br>Recuerda que desde tu panel de control puedes cancelar tu inscripción si lo necesitas, así como enviar reclamaciones sobre acciones en las carreras disputadas o notificar tu ausencia en alguna carrera.");
                return f.ID;
            }
            catch (Exception)
            {
                return 0;
            }

        }

        public int InscribeUsuario3(Guid idusuario, int idevento, int iddivision, int idsplit, string dorsal)
        {
            try
            {
                EVENTOS_INSCRIPCIONESTableAdapter t = new EVENTOS_INSCRIPCIONESTableAdapter();
                DL.EventosDS ds = new EventosDS();
                DL.EventosDS.EVENTOS_INSCRIPCIONESRow f = ds.EVENTOS_INSCRIPCIONES.NewEVENTOS_INSCRIPCIONESRow();
                f.FECHAINSCRIPCION = DateTime.Now;
                f.IDUSUARIO = idusuario;
                f.IDEVENTO = idevento;
                f.IDSPLIT = idsplit;
                f.IDDIVISION = iddivision;
                f.DORSAL = dorsal;
                ds.EVENTOS_INSCRIPCIONES.AddEVENTOS_INSCRIPCIONESRow(f);
                t.Update(f);
                return f.ID;
            }
            catch (Exception)
            {
                return 0;
            }

        }

        public bool EstaInscrito(string idusuario, int idevento)
        {
            try
            {
                EVENTOS_INSCRIPCIONESTableAdapter t = new EVENTOS_INSCRIPCIONESTableAdapter();
                return (int)t.EstaInscrito(Guid.Parse(idusuario), idevento) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool EstaInscrito2(string usuario, int idevento)
        {
            try
            {
                V_INSCRIPCIONESTableAdapter t = new V_INSCRIPCIONESTableAdapter();
                return (int)t.EstaInscrito(idevento, usuario) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public List<decimal> DamePuntos(int idevento)
        {
            try
            {
                List<decimal> Puntos = new List<decimal>();
                EventosDS.EVENTOSRow ev = CargaEvento(idevento);
                AuxliaresDS ds = new AuxliaresDS();
                DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter t = new DL.AuxliaresDSTableAdapters.PUNTOSTableAdapter();
                t.FillByIDTABLA(ds.PUNTOS, ev.IDTABLA);
                foreach (AuxliaresDS.PUNTOSRow fila in ds.PUNTOS)
                    Puntos.Add(fila.PUNTOS);
                return Puntos;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public int DameTablaPuntos(int idevento)
        {
            try
            {
                EventosDS.EVENTOSRow ev = CargaEvento(idevento);
                return ev.IDTABLA;
            }
            catch (Exception)
            {
                return 1;
            }
        }


        public bool EtapaPublicada(int id)
        {
            try
            {
                DL.EventosDS ds = new EventosDS();
                EVENTOS_ETAPASTableAdapter t = new EVENTOS_ETAPASTableAdapter();
                t.FillByID(ds.EVENTOS_ETAPAS, id);
                return ds.EVENTOS_ETAPAS[0].PUBLICADO;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool CambiaEtapaPublicada(int id, bool publicado)
        {
            try
            {
                EVENTOS_ETAPASTableAdapter t = new EVENTOS_ETAPASTableAdapter();
                return (int)t.ActualizaPublicado(publicado, id) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool EsMultiCoche(int idevento)
        {
            try
            {
                QueriesTableAdapter q = new QueriesTableAdapter();
                return (int)q.CuentaCochesEtapas(idevento) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //public string Resultados(int idevento)
        //{
        //    try
        //    {
        //        string cad = "", columnas = "", filas = "";
        //        EVENTOS_ETAPASTableAdapter te = new EVENTOS_ETAPASTableAdapter();
        //        bool hay = (int)te.HayResultadosPublicados(idevento) > 0;
        //        if (!hay)
        //            return "";
        //        //1. MIRAR SI HAY MAS DE UNA DIVISION 
        //        //1.1 SI LA HAY MONTAR TABS PARA CADA DIVISION Y CALCULAR LA TABLA DE RESULTADOS POR DIVISIONES
        //        DL.EventosDS ds = new DL.EventosDS();
        //        QueriesTableAdapter q = new QueriesTableAdapter();
        //        V_DIVISIONES_EVENTOTableAdapter tdiv = new V_DIVISIONES_EVENTOTableAdapter();
        //        tdiv.Fill(ds.V_DIVISIONES_EVENTO, idevento);
        //        int numdiv = (int)q.CuentaDivisionesEvento(idevento);
        //        int cuentaetapas = (int)q.CuentaEtapasEvento(idevento);
        //        SP_CLASIFICACION_GENERALTableAdapter tres = new SP_CLASIFICACION_GENERALTableAdapter();
        //        SP_CLASIFICACION_GENERAL2TableAdapter tdos = new SP_CLASIFICACION_GENERAL2TableAdapter();
        //        if (numdiv == 1)
        //        {
        //            columnas = "<table class='table table-bordered' style='background-color: white;'>";
        //            tres.Fill(ds.SP_CLASIFICACION_GENERAL, idevento, ds.V_DIVISIONES_EVENTO[0].IDDIVISION);
        //            for (int i = 0; i <= cuentaetapas + 12; i++)
        //            {
        //                if (ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName == "TOTAL" || ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName == "PILOTO")
        //                    columnas += "<th style='background-color:whitesmoke;'>" + ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName + "</th>";
        //                else if (i <= cuentaetapas)
        //                    columnas += "<th  style='background-color:whitesmoke;' class='hidden-xs'>" + ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName + "</th>";
        //            }
        //            string aux = "";
        //            foreach (EventosDS.SP_CLASIFICACION_GENERALRow resultado in ds.SP_CLASIFICACION_GENERAL)
        //            {
        //                aux = "";
        //                filas += "<tr>";
        //                filas += "<td><img style='height:40px;width:40px;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'>" + resultado[0].ToString() + "</td>";
        //                for (int i = 1; i <= cuentaetapas; i++)
        //                {
        //                    if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
        //                        aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
        //                    else
        //                        aux = resultado[i].ToString();
        //                    filas += "<td style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
        //                }
        //                if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
        //                    aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
        //                else
        //                    aux = resultado[cuentaetapas + 1].ToString();
        //                filas += "<td style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
        //                filas += "</tr>";
        //            }
        //            filas += "</table>";
        //            return columnas + filas;
        //        }
        //        else
        //        {
        //            if (ds.V_DIVISIONES_EVENTO.Count > 0)
        //            {
        //                cad = "<ul class='nav nav-tabs day' role='tablist'>";
        //                int i = 0;
        //                foreach (DL.EventosDS.V_DIVISIONES_EVENTORow fila in ds.V_DIVISIONES_EVENTO)
        //                {
        //                    if (i == 0)
        //                        cad += "<li role='presentation' class='active'><a href='#res" + i.ToString() + "' aria-controls='res" + i.ToString() + "' role='tab' data-toggle='tab'>" + fila.ES + "</a></li>";
        //                    else
        //                        cad += "<li role='presentation'><a href='#res" + i.ToString() + "' aria-controls='res" + i.ToString() + "' role='tab' data-toggle='tab'>" + fila.ES + "</a></li>";
        //                    i++;
        //                }
        //                cad += "</ul>";
        //                cad += "<div class='tab-content'>";
        //                DL.EventosDS ds2 = new EventosDS();
        //                int j = 0;
        //                int division = -1;
        //                int grupo = -1;
        //                ds2.V_DIVISIONES_EVENTO.Merge(ds.V_DIVISIONES_EVENTO);
        //                foreach (DL.EventosDS.V_DIVISIONES_EVENTORow fila in ds.V_DIVISIONES_EVENTO)
        //                {

        //                    if (division == -1)
        //                    {
        //                        cad += "<div role='tabpanel' class='tab-pane active' id='res" + j.ToString() + "'>";
        //                        j++;
        //                        //cad += "<table class='table table-bordered' style='background-color: white;'>";
        //                        division = fila.IDDIVISION;
        //                    }
        //                    else if (division != fila.IDDIVISION)
        //                    {
        //                        cad += "</table>";
        //                        cad += "</div>";

        //                        cad += "<div role='tabpanel' class='tab-pane' id='res" + j.ToString() + "'>";
        //                        j++;

        //                        division = fila.IDDIVISION;
        //                    }

        //                    columnas = "";
        //                    filas = "";
        //                    grupo = -1;
        //                    foreach (DL.EventosDS.V_DIVISIONES_EVENTORow split in ds2.V_DIVISIONES_EVENTO)
        //                    {
        //                        if (division == split.IDDIVISION)
        //                        {
        //                            if (grupo == -1)
        //                            {
        //                                grupo = split.IDSPLIT;
        //                                columnas = "<table class='table table-bordered' style='background-color: white;'>";
        //                            }
        //                            else if (grupo != split.IDSPLIT)
        //                            {
        //                                grupo = split.IDSPLIT;
        //                                columnas = "</table>";
        //                                columnas = "<table class='table table-bordered' style='background-color: white;'>";
        //                            }
        //                            tdos.Fill(ds.SP_CLASIFICACION_GENERAL2_b, idevento, division, grupo, 0);
        //                            for (i = 0; i <= cuentaetapas + 12; i++)
        //                            {
        //                                if (ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "TOTAL" || ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "PILOTO")
        //                                    columnas += "<th style='background-color:whitesmoke;'>" + ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName + "</th>";
        //                                else if (i <= cuentaetapas)
        //                                    columnas += "<th  style='background-color:whitesmoke;' class='hidden-xs'>" + ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName + "</th>";
        //                            }
        //                            string aux = "";
        //                            decimal total = 0;
        //                            foreach (EventosDS.SP_CLASIFICACION_GENERAL2Row resultado in ds.SP_CLASIFICACION_GENERAL2_b)
        //                            {
        //                                aux = "";
        //                                total = 0;
        //                                filas += "<tr>";
        //                                filas += "<td><img style='height:40px;width:40px;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'>" + resultado[0].ToString() + "</td>";
        //                                for (i = 1; i <= cuentaetapas; i++)
        //                                {
        //                                    if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
        //                                        aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
        //                                    else
        //                                        aux = resultado[i].ToString();
        //                                    filas += "<td style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
        //                                    if (aux != "") total += decimal.Parse(aux);
        //                                }
        //                                if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
        //                                    aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
        //                                else
        //                                    aux = resultado[cuentaetapas + 1].ToString();
        //                                filas += "<td style='text-align:center; vertical-align:middle;'>" + total.ToString() + "</td>";
        //                                filas += "</tr>";
        //                            }

        //                            cad += columnas + filas;
        //                        }
        //                    }
        //                    cad += "</table>";
        //                }
        //                cad += "</div>";
        //                return cad;
        //            }
        //            return "";
        //        }

        //    }
        //    catch (Exception)
        //    {
        //        return "";
        //    }
        //}

        public string ResultadosFinal(int idevento)
        {
            try
            {
                string cad = "";
                DL.EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                if (evento.TIPO == 0)
                    cad = ResultadosPilotos(idevento);
                else if (evento.TIPO == 1)
                {
                    cad = ResultadosEquipos(idevento);
                    cad += "<p>&nbsp;</p>";
                    cad += ResultadosPilotos(idevento);
                }
                else if (evento.TIPO == 2)
                    cad = ResultadosEquipos(idevento);
                else if (evento.TIPO == 3)
                {
                    cad = ResultadosComunidades(idevento);
                    cad += "<p>&nbsp;</p>";
                    cad += ResultadosPilotos(idevento);
                }
                else if (evento.TIPO == 4)
                    cad = ResultadosComunidades(idevento);

                return cad;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string ResultadosFinalWidget(int idevento, bool solototal)
        {
            try
            {
                string cad = "";
                DL.EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                if (evento.TIPO == 0)
                    cad = ResultadosWidget(idevento, solototal);
                else if (evento.TIPO == 1)
                {
                    cad = ResultadosWidgetEquipos(idevento, solototal);
                    cad += "<p>&nbsp;</p>";
                    cad += ResultadosWidget(idevento, solototal);
                }
                else if (evento.TIPO == 2)
                    cad = ResultadosWidgetEquipos(idevento, solototal);
                return cad;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string Top3(int idevento)
        {
            try
            {
                var culture = System.Globalization.CultureInfo.CurrentCulture;
                bool solototal = true;
                EVENTOS_ETAPASTableAdapter te = new EVENTOS_ETAPASTableAdapter();
                bool hay = (int)te.HayResultadosPublicados(idevento) > 0;
                if (!hay)
                    return "";
                string cad = "", columnas = "", filas = "", filasorden = "";
                string equipo = "";
                //1. MIRAR SI HAY MAS DE UNA DIVISION 
                //1.1 SI LA HAY MONTAR TABS PARA CADA DIVISION Y CALCULAR LA TABLA DE RESULTADOS POR DIVISIONES
                int cont = 1;
                int idtabla = DameTablaPuntos(idevento);
                DL.EventosDS ds = new DL.EventosDS();
                QueriesTableAdapter q = new QueriesTableAdapter();
                V_DIVISIONES_EVENTOTableAdapter tdiv = new V_DIVISIONES_EVENTOTableAdapter();
                V_SOLO_DIVISIONESTableAdapter tsolo = new V_SOLO_DIVISIONESTableAdapter();
                V_LLEGADATableAdapter tll = new V_LLEGADATableAdapter();
                EVENTOS_ETAPASTableAdapter tet = new EVENTOS_ETAPASTableAdapter();
                tet.FillByIDEVENTO(ds.EVENTOS_ETAPAS, idevento);
                tsolo.Fill(ds.V_SOLO_DIVISIONES, idevento);
                tdiv.Fill(ds.V_DIVISIONES_EVENTO, idevento);
                DL.EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                int numdiv = (int)q.CuentaDivisionesEvento(idevento);
                int cuentaetapas = (int)q.CuentaEtapasEvento(idevento);
                SP_CLASIFICACION_GENERALTableAdapter tres = new SP_CLASIFICACION_GENERALTableAdapter();
                SP_CLASIFICACION_GENERAL2_bTableAdapter  tdos = new SP_CLASIFICACION_GENERAL2_bTableAdapter();
                DL.AuxliaresDS dsaux = new AuxliaresDS();
                DL.AuxliaresDS.AUX_CLASIFICACIONRow clasif;

                int esf1 = 0;
                if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15) esf1 = 1;

                if (ds.V_SOLO_DIVISIONES.Count == 1)
                {
                    int i = 0;
                    DL.EventosDS ds2 = new EventosDS();
                    int j = 0;
                    int division = -1;
                    int grupo = -1;
                    ds2.V_DIVISIONES_EVENTO.Merge(ds.V_DIVISIONES_EVENTO);
                    foreach (DL.EventosDS.V_SOLO_DIVISIONESRow fila in ds.V_SOLO_DIVISIONES)
                    {

                        if (division == -1)
                        {
                            if (numdiv != 1)
                                cad += "<div style='margin-top:55px;background-color:black;width:100%;color:white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                   "<span style='padding: 3px 0px 3px 3px;'>TOP 3</span>";
                            else
                            {
                                if (esf1 == 0)
                                    cad += "<div style='margin-top:55px;background-color:black;width:100%;color:white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                      "<span style='padding: 3px 0px 3px 3px;'>TOP 3</span>";
                                else
                                    cad += "<div style='margin-top:55px;background-color:black;width:100%;color:white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                  "<span style='padding: 3px 0px 3px 3px;'>TOP 3</span>";
                            }

                            j++;

                            division = fila.IDDIVISION;
                        }
                        else if (division != fila.IDDIVISION)
                        {

                            cad += "</div>";
                            cad += "<div style='margin-top:55px;background-color:black;width:100%;color:white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:1em;'>" +
                                 "<span style='padding: 3px 0px 3px 3px;'>TOP 3</span>";

                            j++;

                            division = fila.IDDIVISION;
                        }

                        columnas = "";
                        filas = "";
                        filasorden = "";
                        grupo = -1;
                        System.Data.DataView dv = new System.Data.DataView();

                        foreach (DL.EventosDS.V_DIVISIONES_EVENTORow split in ds2.V_DIVISIONES_EVENTO)
                        {
                            if (division == split.IDDIVISION)
                            {
                                if (grupo == -1)
                                {
                                    grupo = split.IDSPLIT;
                                    if (split.IDSPLIT != 1)
                                        columnas = "<table class='table table-bordered' style='width:100%;background-color: white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;border:solid 1px silver;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    else
                                        columnas = "<table class='table table-bordered' style='width:100%;background-color: white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;border:solid 1px silver;'>";
                                }
                                else if (grupo != split.IDSPLIT)
                                {
                                    grupo = split.IDSPLIT;
                                    columnas = "</table>";
                                    columnas = "<table style='width:100%;background-color: white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    filas = "";
                                    filasorden = "";
                                }

                                tdos.Fill(ds.SP_CLASIFICACION_GENERAL2_b, idevento, division, grupo, esf1);
                                columnas += "<tr><th style='color:black;background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                for (i = 0; i <= cuentaetapas + 12; i++)
                                {
                                    if (ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "PILOTO") //ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "TOTAL" || 
                                    {
                                        if (ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "PILOTO")
                                        {
                                            columnas += "<th style='color:black;background-color:whitesmoke;vertical-align:middle;'>" + Resources.Global.piloto + "</th><th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                        }
                                        //else
                                        //    columnas += "<th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                    }
                                    else if (i <= cuentaetapas && !solototal)
                                        columnas += "<th  style='color:black;background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + RemoveSpecialCharactersPuro(ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName) + "</th>";
                                }
                                columnas += "</tr>";
                                string aux = "";
                                decimal total = 0;
                                string avatar = "";
                                string lila = "";
                                cont = 1;
                                int cuentaf = 0;
                                bool existe = false;
                                foreach (EventosDS.SP_CLASIFICACION_GENERAL2_bRow resultado in ds.SP_CLASIFICACION_GENERAL2_b)
                                {
                                    tll.Fill(ds.V_LLEGADA, int.Parse(resultado[cuentaetapas + 16].ToString()), idevento);
                                    cuentaf = cuentaetapas - ds.V_LLEGADA.Count;
                                    //for (int z=0;z<cuentaf;z++)
                                    foreach (DL.EventosDS.EVENTOS_ETAPASRow etapa in ds.EVENTOS_ETAPAS)
                                    {
                                        foreach (DL.EventosDS.V_LLEGADARow llegada in ds.V_LLEGADA)
                                        {
                                            if (llegada.IDETAPA == etapa.ID)
                                            {
                                                existe = true;
                                                break;
                                            }
                                        }
                                        if (!existe)
                                        {
                                            EventosDS.V_LLEGADARow FLL = ds.V_LLEGADA.NewV_LLEGADARow();
                                            FLL.POSLLEGADA = 0;
                                            FLL.VUELTARAPIDA = "N";
                                            FLL.FECHA = etapa.FECHA;
                                            FLL.IDETAPA = etapa.ID;
                                            ds.V_LLEGADA.AddV_LLEGADARow(FLL);

                                        }
                                        existe = false;
                                    }
                                    ds.V_LLEGADA.AcceptChanges();
                                    dv.Table = ds.V_LLEGADA;
                                    dv.Sort = "FECHA ASC";
                                    System.Data.DataTable sortedDT = dv.ToTable();
                                    dv.Table = sortedDT;
                                    clasif = dsaux.AUX_CLASIFICACION.NewAUX_CLASIFICACIONRow();
                                    aux = "";
                                    filas = "";
                                    total = 0;
                                    filas += "<tr style='%%'>";
                                    if (resultado[cuentaetapas + 14].ToString() == "SIN EQUIPO" || resultado[cuentaetapas + 14].ToString() == "")
                                        equipo = "&nbsp;";
                                    else
                                    {
                                        if (esf1 == 0)
                                            equipo = "<a href='team.aspx?id=" + resultado[cuentaetapas + 7].ToString() + "'>" + resultado[cuentaetapas + 14].ToString() + "</a>";
                                        else
                                            equipo = resultado[cuentaetapas + 14].ToString();
                                    }
                                    if (resultado[cuentaetapas + 3].ToString() != "isracetime_user.jpg")
                                        avatar = resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString();
                                    else
                                        avatar = resultado[cuentaetapas + 3].ToString();
                                    //filas += "<td><img style='height:40px;width:40px;float:left;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'><span style='float:left;'>" + resultado[0].ToString() + "<br>" + resultado[20].ToString()  + "</span></td>";
                                    filas += "<td style='color:black;text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/avatar/" + avatar + "'></div><p style='float:left;margin-bottom:0px;'><b><a href='http://simracingchamps.net/rank.aspx?n=" + resultado[cuentaetapas + 15].ToString() + "'>" + resultado[0].ToString() + "</a></b>&nbsp;<img src='http://simracingchamps.net/Content/img/flags/" + resultado[cuentaetapas + 8].ToString().Trim() + ".png'></br>" + equipo + "</p></td><td>%TOTALSRC%</td>";
                                    cont++;

                                    for (i = 1; i <= cuentaetapas; i++)
                                    {
                                        if (ds.V_LLEGADA[i - 1].POSLLEGADA >= 1 && ds.V_LLEGADA[i - 1].POSLLEGADA <= 3)
                                        {
                                            if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                                aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                            else
                                                aux = resultado[i].ToString();
                                            if (aux != "") total += decimal.Parse(aux);
                                        }
                                    }
                                    if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
                                        aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
                                    else
                                        aux = resultado[cuentaetapas + 1].ToString();
                                    filas = filas.Replace("<td>%TOTALSRC%</td>", "<td style='text-align:center; vertical-align:middle;background-color:black;color:white;font-weight:bold;'>" + total.ToString() + "</td>");
                                    filas += "</tr>";
                                    clasif.fila = filas;
                                    clasif.total = total;
                                    dsaux.AUX_CLASIFICACION.AddAUX_CLASIFICACIONRow(clasif);
                                }

                                var Rows = (from row in dsaux.AUX_CLASIFICACION.AsEnumerable()
                                            orderby row["total"] descending
                                            select row);
                                cont = 1;
                                foreach (DL.AuxliaresDS.AUX_CLASIFICACIONRow ff in Rows)
                                {
                                    if (cont == 1)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid red;padding-left: 4px;");
                                    else if (cont == 2)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid orange;padding-left: 4px;");
                                    else if (cont == 3)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid yellow;padding-left: 4px;");
                                    if (cont >= 1 && cont <= 3)
                                        filasorden += ff.fila.ToString().Replace("XPOS99XPOS99XPOS99", cont.ToString());


                                    cont++;
                                }
                                dsaux.AUX_CLASIFICACION.Clear();
                                cad += columnas + filasorden;
                            }
                        }
                        cad += "</table>";
                    }
                    cad += "</div><a href='#resultados'>" + Resources.Global.vercompleta + "</a>";
                    return cad;
                    //}
                }
                return "";

            }
            catch (Exception ex)
            {
                return "";
            }
        }

        public string ResultadosPilotos(int idevento)
        {
            try
            {
                EVENTOS_ETAPASTableAdapter te = new EVENTOS_ETAPASTableAdapter();
                bool hay = (int)te.HayResultadosPublicados(idevento) > 0;
                if (!hay)
                    return "";
                string cad = "", columnas = "", filas = "", filasorden = "";
                string equipo = "", dorsal="";
                //1. MIRAR SI HAY MAS DE UNA DIVISION 
                //1.1 SI LA HAY MONTAR TABS PARA CADA DIVISION Y CALCULAR LA TABLA DE RESULTADOS POR DIVISIONES
                int cont = 1;
                int idtabla = DameTablaPuntos(idevento);
                DL.EventosDS ds = new DL.EventosDS();
                QueriesTableAdapter q = new QueriesTableAdapter();
                V_DIVISIONES_EVENTOTableAdapter tdiv = new V_DIVISIONES_EVENTOTableAdapter();
                V_SOLO_DIVISIONESTableAdapter tsolo = new V_SOLO_DIVISIONESTableAdapter();
                V_LLEGADATableAdapter tll = new V_LLEGADATableAdapter();
                EVENTOS_ETAPASTableAdapter tet = new EVENTOS_ETAPASTableAdapter();
                tet.FillByIDEVENTO(ds.EVENTOS_ETAPAS, idevento);
                tsolo.Fill(ds.V_SOLO_DIVISIONES, idevento);
                tdiv.Fill(ds.V_DIVISIONES_EVENTO, idevento);
                int numdiv = (int)q.CuentaDivisionesEvento(idevento);
                int cuentaetapas = (int)q.CuentaEtapasEvento(idevento);
                SP_CLASIFICACION_GENERALTableAdapter tres = new SP_CLASIFICACION_GENERALTableAdapter();
                SP_CLASIFICACION_GENERAL2_bTableAdapter tdos = new SP_CLASIFICACION_GENERAL2_bTableAdapter();
                DL.AuxliaresDS dsaux = new AuxliaresDS();
                DL.AuxliaresDS.AUX_CLASIFICACIONRow clasif;
                EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                DL.EventosDSTableAdapters.V_EVENTOSTableAdapter ve = new V_EVENTOSTableAdapter();
                ve.FillByIDEVENTO(ds.V_EVENTOS, idevento);
                int esf1 = 0;
                bool haydorsal = false;
                if (!evento.IsDORSALNull()) haydorsal = evento.DORSAL;
                if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15) esf1 = 1;
                //if (numdiv == 1)
                //{
                //    columnas = "<div class='blog-post single-gallery'><div class='feature-inner' >" +
                //                  "<h1>Clasificación General</h1>";
                //    columnas += "<table class='table table-bordered' style='background-color: white;'>";
                //    columnas += "<tr><th style='background-color:whitesmoke;'>Pos</th>";
                //    tres.Fill(ds.SP_CLASIFICACION_GENERAL, idevento, ds.V_DIVISIONES_EVENTO[0].IDDIVISION);
                //    for (int i = 0; i <= cuentaetapas + 12; i++)
                //    {
                //        if (ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName == "TOTAL" || ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName == "PILOTO")
                //        {
                //            if (ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName=="PILOTO")
                //                columnas += "<th style='background-color:whitesmoke;'>Piloto</th>";
                //            else
                //                columnas += "<th style='background-color:whitesmoke;'>Total</th>";
                //        }
                //        else if (i <= cuentaetapas)
                //            columnas += "<th  style='background-color:whitesmoke;' class='hidden-xs'>" + ds.SP_CLASIFICACION_GENERAL.Columns[i].ColumnName + "</th>";
                //    }
                //    columnas += "</tr>";
                //    string aux = "";                    
                //    foreach (EventosDS.SP_CLASIFICACION_GENERALRow resultado in ds.SP_CLASIFICACION_GENERAL)
                //    {
                //        aux = "";
                //        filas += "<tr>";
                //        if (resultado[20].ToString() == "SIN EQUIPO")
                //            equipo = "&nbsp;";
                //        else
                //            equipo = resultado[20].ToString();
                //        //filas += "<td><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:40px;vertical-align:middle;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'></div><p style='float:left;'>" + resultado[0].ToString() + "</p></td>";
                //        filas += "<td  style='text-align:center;vertical-align:middle;'>" + cont.ToString() + "</td><td style='width:300px'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'></div><p style='float:left;margin-bottom:0px;'>" + resultado[0].ToString() + "<br>" + equipo + "</p></td>";
                //        cont++;
                //        for (int i = 1; i <= cuentaetapas; i++)
                //        {
                //            if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                //                aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                //            else
                //                aux = resultado[i].ToString();
                //            filas += "<td style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                //        }
                //        if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
                //            aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
                //        else
                //            aux = resultado[cuentaetapas + 1].ToString();
                //        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                //        filas += "</tr>";
                //    }
                //    filas += "</table>";
                //    return columnas + filas + "</div></div>";
                //}
                //else
                //{
                if (ds.V_SOLO_DIVISIONES.Count > 0)
                {
                    int i = 0;
                    DL.EventosDS ds2 = new EventosDS();
                    int j = 0;
                    int division = -1;
                    int grupo = -1;
                    ds2.V_DIVISIONES_EVENTO.Merge(ds.V_DIVISIONES_EVENTO);
                    foreach (DL.EventosDS.V_SOLO_DIVISIONESRow fila in ds.V_SOLO_DIVISIONES)
                    {

                        if (division == -1)
                        {
                            if (numdiv != 1)
                                cad += "<div class='blog-post single-gallery'><div class='feature-inner' >"
                                    + "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                    "<div style='top:0px;left:250px;'><h1>Pilotos: " + fila.ES + "</h1></div>";
                            else
                                cad += "<div class='blog-post single-gallery'><div class='feature-inner' >"
                                    + "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                "<div style='top:0px;left:250px;'><h1>" + evento.EVENTO + "</h1><h2>Clasificación General Pilotos</h2></div>";

                            j++;

                            division = fila.IDDIVISION;
                        }
                        else if (division != fila.IDDIVISION)
                        {

                            cad += "</div></div>";
                            cad += "<div class='blog-post single-gallery'><div class='feature-inner'>" +
                               "<h1>Pilotos: " + fila.ES + "</h1>";

                            j++;

                            division = fila.IDDIVISION;
                        }

                        columnas = "";
                        filas = "";
                        filasorden = "";
                        grupo = -1;
                        System.Data.DataView dv = new System.Data.DataView();

                        foreach (DL.EventosDS.V_DIVISIONES_EVENTORow split in ds2.V_DIVISIONES_EVENTO)
                        {
                            if (division == split.IDDIVISION)
                            {
                                if (grupo == -1)
                                {
                                    grupo = split.IDSPLIT;
                                    if (split.IDSPLIT != 1)
                                    {
                                        if (esf1==0)
                                            columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                        else
                                            columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    }
                                    else
                                    {
                                        if (esf1==0)
                                            columnas = "<table class='table table-bordered' style='background-color: white;'>";
                                        else
                                            columnas = "<table class='table table-bordered' style='background-color: white;'>";
                                    }
                                }
                                else if (grupo != split.IDSPLIT)
                                {
                                    grupo = split.IDSPLIT;
                                    columnas = "</table>";
                                    if (esf1==0)
                                        columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    else
                                        columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    filas = "";
                                    filasorden = "";
                                }

                                tdos.Fill(ds.SP_CLASIFICACION_GENERAL2_b, idevento, division, grupo, esf1);
                                if (cuentaetapas>10)
                                    columnas += "<tr style='font-size:10px;'><th style='background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                else
                                    columnas += "<tr><th style='background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                for (i = 0; i <= cuentaetapas + 12; i++)
                                {
                                    if (ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "PILOTO") //ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "TOTAL" || 
                                    {
                                        if (!haydorsal)
                                            columnas += "<th style='background-color:whitesmoke;vertical-align:middle;'>Piloto</th><th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                        else
                                            columnas += "<th style='background-color:whitesmoke;vertical-align:middle;'>Piloto</th><th style='background-color:whitesmoke;vertical-align:middle;'>Dorsal</th><th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                        //else
                                        //    columnas += "<th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                    }
                                    else if (i <= cuentaetapas)
                                    {
                                        string colname = ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName;
                                        if (ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName.IndexOf("_") != -1)
                                            colname = ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName.Substring(0, ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName.IndexOf("_") );
                                        if (esf1 == 0)
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + colname + "</th>";
                                        else
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'><img src='Content/img/flags/" + colname + ".png'></th>";
                                    }
                                }
                                columnas += "</tr>";
                                string aux = "";
                                decimal total = 0;
                                string avatar = "";
                                string lila = "";
                                cont = 1;
                                int cuentaf = 0;
                                bool existe = false;
                                foreach (EventosDS.SP_CLASIFICACION_GENERAL2_bRow resultado in ds.SP_CLASIFICACION_GENERAL2_b)
                                {
                                    tll.Fill(ds.V_LLEGADA, int.Parse(resultado[cuentaetapas + 16].ToString()), idevento);
                                    cuentaf = cuentaetapas - ds.V_LLEGADA.Count;
                                    //for (int z=0;z<cuentaf;z++)
                                    foreach (DL.EventosDS.EVENTOS_ETAPASRow etapa in ds.EVENTOS_ETAPAS)
                                    {
                                        foreach (DL.EventosDS.V_LLEGADARow llegada in ds.V_LLEGADA)
                                        {
                                            if (llegada.IDETAPA == etapa.ID)
                                            {
                                                existe = true;
                                                break;
                                            }
                                        }
                                        if (!existe)
                                        {
                                            EventosDS.V_LLEGADARow FLL = ds.V_LLEGADA.NewV_LLEGADARow();
                                            FLL.POSLLEGADA = 0;
                                            FLL.POSLLEGADA2 = 0;
                                            FLL.VUELTARAPIDA = "N";
                                            FLL.FECHA = etapa.FECHA;
                                            FLL.IDETAPA = etapa.ID;
                                            FLL.INCIDENCIAS = 0;
                                            ds.V_LLEGADA.AddV_LLEGADARow(FLL);

                                        }
                                        existe = false;
                                    }
                                    ds.V_LLEGADA.AcceptChanges();
                                    dv.Table = ds.V_LLEGADA;
                                    dv.Sort = "FECHA ASC";
                                    System.Data.DataTable sortedDT = dv.ToTable();
                                    dv.Table = sortedDT;
                                    clasif = dsaux.AUX_CLASIFICACION.NewAUX_CLASIFICACIONRow();
                                    aux = "";
                                    filas = "";
                                    total = 0;
                                    filas += "<tr style='%%'>";

                                    if (resultado[cuentaetapas + 14].ToString() == "SIN EQUIPO" || resultado[cuentaetapas + 14].ToString() == "")
                                        equipo = "&nbsp;";
                                    else
                                    {
                                        if (esf1 == 0)
                                            equipo = "<a href='team.aspx?id=" + resultado[cuentaetapas + 7].ToString() + "'>" + resultado[cuentaetapas + 14].ToString() + "</a>";
                                        else
                                            equipo = resultado[cuentaetapas + 14].ToString();
                                    }
                                    if (resultado[cuentaetapas + 3].ToString() != "isracetime_user.jpg")
                                        avatar = resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString();
                                    else
                                        avatar = resultado[cuentaetapas + 3].ToString();

                                    if (resultado[cuentaetapas + 17].ToString() != "")
                                        dorsal = "&nbsp;#" + resultado[cuentaetapas + 17].ToString() ;
                                    else
                                        dorsal = "";

                                    //filas += "<td><img style='height:40px;width:40px;float:left;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'><span style='float:left;'>" + resultado[0].ToString() + "<br>" + resultado[20].ToString()  + "</span></td>";
                                    if (!haydorsal )
                                        filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px'><div style='float:left; padding-right:10px; margin-right:0px;'><img class='img-circle' style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/avatar/" + avatar + "'></div><p style='float:left;margin-bottom:0px;'><img src='http://simracingchamps.net/Content/img/flags/" + resultado[cuentaetapas + 8].ToString().Trim() + ".png'>&nbsp;<b><a href='http://simracingchamps.net/rank.aspx?n=" + resultado[cuentaetapas + 15].ToString() + "'>" + resultado[0].ToString() + "</a></b></br>" + equipo + "</p></td><td>%TOTALSRC%</td>";
                                    else
                                        filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px'><div style='float:left; padding-right:10px; margin-right:0px;'><img class='img-circle' style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/avatar/" + avatar + "'></div><p style='float:left;margin-bottom:0px;'><img src='http://simracingchamps.net/Content/img/flags/" + resultado[cuentaetapas + 8].ToString().Trim() + ".png'>&nbsp;<b><a href='http://simracingchamps.net/rank.aspx?n=" + resultado[cuentaetapas + 15].ToString() + "'>" + resultado[0].ToString() + "</a></br>" + equipo + "</p></td><td style='text-align:center; vertical-align:middle;'>" + dorsal + "</td><td>%TOTALSRC%</td>";
                                    cont++;
                                    for (i = 1; i <= cuentaetapas; i++)
                                    {
                                        if (ds.V_LLEGADA[i - 1].POSLLEGADA >= 7777 && (ds.V_LLEGADA[i - 1].POSLLEGADA2 >= 7777 || ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0))
                                        {
                                            if (ds.V_LLEGADA[i - 1].POSLLEGADA2 >= 7777)
                                            {
                                                if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 7777)
                                                {
                                                    aux = "DSQ";
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 8888)
                                                {
                                                    aux = "RET";
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 9999)
                                                {
                                                    aux = "DNS";
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0 && ds.V_LLEGADA[i - 1].FECHA.ToShortDateString() == DateTime.Now.ToShortDateString())
                                                {
                                                    aux = "";
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'></td>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now)
                                                {
                                                    //ds.V_LLEGADA[i - 1].POSLLEGADA = 9999;
                                                    aux = "DNS";
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'></td>"; //<label style='padding:8px 10px 8px 10px;color:black;' class='btn btn-default'>" + aux + "</label>
                                                }
                                            }
                                            else
                                            {
                                                if (ds.V_LLEGADA[i - 1].POSLLEGADA == 7777)
                                                {
                                                    aux = "DSQ";
                                                    if (esf1 == 1 && !ds.V_LLEGADA[i - 1].IsINCIDENCIASNull())
                                                    {
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + " <span class='supsub'><sup class='superscriptf1'>&nbsp;</sup><sub class='subscriptf1'>x" + ds.V_LLEGADA[i - 1].INCIDENCIAS.ToString() + "</sub></span></td>";
                                                    }
                                                    else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 8888)
                                                {
                                                    aux = "RET";
                                                    if (esf1 == 1 && !ds.V_LLEGADA[i - 1].IsINCIDENCIASNull())
                                                    {
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + " <span class='supsub'><sup class='superscriptf1'>&nbsp;</sup><sub class='subscriptf1'>x" + ds.V_LLEGADA[i - 1].INCIDENCIAS.ToString() + "</sub></span></td>";
                                                    }
                                                    else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";

                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 9999)
                                                {
                                                    aux = "DNS";
                                                    if (esf1 == 1 && !ds.V_LLEGADA[i - 1].IsINCIDENCIASNull())
                                                    {
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + " <span class='supsub'><sup class='superscriptf1'>&nbsp;</sup><sub class='subscriptf1'>x" + ds.V_LLEGADA[i - 1].INCIDENCIAS.ToString() + "</sub></span></td>";
                                                    }
                                                    else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA.ToShortDateString() == DateTime.Now.ToShortDateString())
                                                {
                                                    aux = "";
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'></td>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now)
                                                {
                                                    //ds.V_LLEGADA[i - 1].POSLLEGADA = 9999;
                                                    aux = "DNS";
                                                    if (esf1 == 1 && !ds.V_LLEGADA[i - 1].IsINCIDENCIASNull())
                                                    {
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + " <span class='supsub'><sup class='superscript'>&nbsp;</sup><sub class='subscript'>x" + ds.V_LLEGADA[i - 1].INCIDENCIAS.ToString() + "</sub></span></td>";
                                                    }
                                                    else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'></td>"; //<label style='padding:8px 10px 8px 10px;color:black;' class='btn btn-default'>" + aux + "</label>
                                                }
                                            }
                                        }
                                        else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 >= 7777 && ds.V_LLEGADA[i - 1].POSLLEGADA == 0)
                                        {
                                            if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 7777)
                                            {
                                                aux = "DSQ";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 8888)
                                            {
                                                aux = "RET";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 9999)
                                            {
                                                aux = "DNS";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0 && ds.V_LLEGADA[i - 1].FECHA.ToShortDateString() == DateTime.Now.ToShortDateString())
                                            {
                                                aux = "";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'></td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now)
                                            {
                                                //ds.V_LLEGADA[i - 1].POSLLEGADA = 9999;
                                                aux = "DNS";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'></td>"; //<label style='padding:8px 10px 8px 10px;color:black;' class='btn btn-default'>" + aux + "</label>
                                            }
                                        }
                                        else
                                        {
                                            if (ds.V_LLEGADA[i - 1].POSLLEGADA2 < 7777 && ds.V_LLEGADA[i - 1].POSLLEGADA2 > 0 && ds.V_LLEGADA[i - 1].POSLLEGADA >= 7777)
                                            {
                                                if (ds.V_LLEGADA[i - 1].POSLLEGADA == 7777)
                                                {
                                                    aux = "<sup class='superscript'>DSQ</sup>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 8888)
                                                {
                                                    aux = "<sup class='superscript'>RET</sup>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 9999)
                                                {
                                                    aux = "<sup class='superscript'>DNS</sup>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA.ToShortDateString() == DateTime.Now.ToShortDateString())
                                                {
                                                    aux = "";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now)
                                                {
                                                    //ds.V_LLEGADA[i - 1].POSLLEGADA = 9999;
                                                    aux = "<sup class='superscript'>DNS</sup>";
                                                }
                                            }
                                            else
                                                aux = "<sup class='superscript'>P" + ds.V_LLEGADA[i - 1].POSLLEGADA.ToString() + "</sup>";
                                            string llegada = aux;
                                            if (ds.V_LLEGADA[i - 1].POSLLEGADA2.ToString() != "0")
                                            {
                                                if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 7777)
                                                {
                                                    llegada += "<sub class='subscript'>DSQ</sub>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 8888)
                                                {
                                                    llegada += "<sub class='subscript'>RET</sub>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 9999)
                                                {
                                                    llegada += "<sub class='subscript'>DNS</sub>";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0 && ds.V_LLEGADA[i - 1].FECHA.ToShortDateString() == DateTime.Now.ToShortDateString())
                                                {
                                                    llegada = "";
                                                }
                                                else if (ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0 && ds.V_LLEGADA[i - 1].POSLLEGADA2 == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now)
                                                {
                                                    llegada += "<sub class='subscript'>DNS</sub>";
                                                }
                                                else
                                                    llegada += "<sub class='subscript'>P" + ds.V_LLEGADA[i - 1].POSLLEGADA2.ToString() + "</sub>";
                                            }

                                            if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                                aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                            else
                                                aux = resultado[i].ToString();
                                            if (aux != "")
                                            {



                                                if (idtabla != 2)
                                                {
                                                    //if (aux != "" && decimal.Parse(aux) == 25)
                                                    //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-danger'>" + aux + "</label></td>";
                                                    //else if (aux != "" && decimal.Parse(aux) == 18)
                                                    //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-warning'>" + aux + "</label></td>";
                                                    //else if (aux != "" && decimal.Parse(aux) == 15)
                                                    //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-primary'>" + aux + "</label></td>";
                                                    //else
                                                    if (esf1 == 0)
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + " <span class='supsub'>" + llegada + "</td>";
                                                    else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + " <span class='supsub'><sup class='superscriptf1'>P" + ds.V_LLEGADA[i - 1].POSLLEGADA.ToString() + "</sup><sub class='subscriptf1'>x" + ds.V_LLEGADA[i - 1].INCIDENCIAS.ToString() + "</sub></span></td>";
                                                }
                                                else if (idtabla == 2)
                                                {
                                                    //if (aux != "" && decimal.Parse(aux) == 5)
                                                    //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-danger'>" + aux + "</label></td>";
                                                    //else if (aux != "" && decimal.Parse(aux) == 3)
                                                    //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-warning'>" + aux + "</label></td>";
                                                    //else if (aux != "" && decimal.Parse(aux) == 2)
                                                    //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-primary'>" + aux + "</label></td>";
                                                    //else
                                                    if (esf1 == 0)
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + " <span class='supsub'>" + llegada + "</td>";
                                                    else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + " <span class='supsub'><sup class='superscriptf1'>P" + ds.V_LLEGADA[i - 1].POSLLEGADA.ToString() + "</sup><sub class='subscriptf1'>x" + ds.V_LLEGADA[i - 1].INCIDENCIAS.ToString() + "</sub></span></td>";
                                                }
                                            }
                                            else
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'></td>";
                                            if (aux != "") total += decimal.Parse(aux);
                                        }
                                        try
                                        {
                                            if (dv[i - 1]["BONIFICACION"] != null && dv[i - 1]["BONIFICACION"].ToString() != "" && decimal.Parse(dv[i - 1]["BONIFICACION"].ToString()) < 0)
                                                filas = filas.Replace("lila", "background-color:red;color:white;");
                                            else if (dv[i - 1]["VUELTARAPIDA"].ToString() == "S")
                                                filas = filas.Replace("lila", "background-color:#d298d2;color:white;");
                                            else
                                                filas = filas.Replace("lila", "");
                                        }
                                        catch (Exception)
                                        {
                                            if (dv[i - 1]["VUELTARAPIDA"].ToString() == "S")
                                                filas = filas.Replace("lila", "background-color:#d298d2;color:white;");
                                            else
                                                filas = filas.Replace("lila", "");
                                        }
                                    }
                                    if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
                                        aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
                                    else
                                        aux = resultado[cuentaetapas + 1].ToString();
                                    filas = filas.Replace("<td>%TOTALSRC%</td>", "<td style='text-align:center; vertical-align:middle;background-color:black;color:white;font-weight:bold;'>" + total.ToString() + "</td>");
                                    filas += "</tr>";
                                    if (ds.V_LLEGADA[0].IsPOSLLEGADANull() && ds.V_LLEGADA[0].IsPOSLLEGADA2Null())
                                        clasif.posicion = 9999;
                                    else
                                    {
                                        if (ds.V_LLEGADA[0].POSLLEGADA > 0 && ds.V_LLEGADA[0].POSLLEGADA < 7777)
                                            clasif.posicion = ds.V_LLEGADA[0].POSLLEGADA;
                                        else if (ds.V_LLEGADA[0].POSLLEGADA2 > 0 && ds.V_LLEGADA[0].POSLLEGADA2 < 7777)
                                            clasif.posicion = ds.V_LLEGADA[0].POSLLEGADA2;
                                        else if (ds.V_LLEGADA[0].POSLLEGADA2 > 0 && ds.V_LLEGADA[0].POSLLEGADA2 < 7777)
                                            clasif.posicion = 1000;
                                        else
                                            clasif.posicion = 1000;
                                    }
                                    clasif.fila = filas;
                                    clasif.total = total;
                                    dsaux.AUX_CLASIFICACION.AddAUX_CLASIFICACIONRow(clasif);
                                }

                                var Rows = (from row in dsaux.AUX_CLASIFICACION.AsEnumerable()
                                            orderby row["total"] descending, row["posicion"] ascending
                                            select row);
                                cont = 1;
                                foreach (DL.AuxliaresDS.AUX_CLASIFICACIONRow ff in Rows)
                                {
                                    if (cont == 1)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid gold;padding-left: 4px;");
                                    else if (cont == 2)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid silver;padding-left: 4px;");
                                    else if (cont == 3)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid #cd7f32;padding-left: 4px;");
                                    else
                                        ff.fila = ff.fila.Replace("%%", "");
                                    filasorden += ff.fila.ToString().Replace("XPOS99XPOS99XPOS99", cont.ToString());


                                    cont++;
                                }
                                dsaux.AUX_CLASIFICACION.Clear();
                                cad += columnas + filasorden;
                            }
                        }
                        cad += "</table>";
                    }
                    cad += "</div>";
                    return cad;
                    //}
                }
                return "No se han publicado resultados del campeonato";

            }
            catch (Exception ex)
            {
                return "No se han publicado resultados del campeonato";
            }
        }

        public string ResultadosEquipos(int idevento)
        {
            try
            {
                EVENTOS_ETAPASTableAdapter te = new EVENTOS_ETAPASTableAdapter();
                bool hay = (int)te.HayResultadosPublicados(idevento) > 0;
                if (!hay)
                    return "";
                string cad = "", columnas = "", filas = "", filasorden = "";
                string equipo = "";
                //1. MIRAR SI HAY MAS DE UNA DIVISION 
                //1.1 SI LA HAY MONTAR TABS PARA CADA DIVISION Y CALCULAR LA TABLA DE RESULTADOS POR DIVISIONES
                int cont = 1;
                int idtabla = DameTablaPuntos(idevento);
                DL.EventosDS ds = new DL.EventosDS();
                QueriesTableAdapter q = new QueriesTableAdapter();
                V_DIVISIONES_EVENTOTableAdapter tdiv = new V_DIVISIONES_EVENTOTableAdapter();
                V_SOLO_DIVISIONESTableAdapter tsolo = new V_SOLO_DIVISIONESTableAdapter();
                V_LLEGADATableAdapter tll = new V_LLEGADATableAdapter();
                EVENTOS_ETAPASTableAdapter tet = new EVENTOS_ETAPASTableAdapter();
                tet.FillByIDEVENTO(ds.EVENTOS_ETAPAS, idevento);
                tsolo.Fill(ds.V_SOLO_DIVISIONES, idevento);
                tdiv.Fill(ds.V_DIVISIONES_EVENTO, idevento);
                int numdiv = (int)q.CuentaDivisionesEvento(idevento);
                int cuentaetapas = (int)q.CuentaEtapasEvento(idevento);
                DL.EquiposDS eqds = new DL.EquiposDS();
                DL.EquiposDSTableAdapters.SP_CLASIFICACION_GENERAL_EQUIPOSTableAdapter tdos = new DL.EquiposDSTableAdapters.SP_CLASIFICACION_GENERAL_EQUIPOSTableAdapter();
                DL.AuxliaresDS dsaux = new AuxliaresDS();
                DL.AuxliaresDS.AUX_CLASIFICACIONRow clasif;
                EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                DL.EventosDSTableAdapters.V_EVENTOSTableAdapter ve = new V_EVENTOSTableAdapter();
                ve.FillByIDEVENTO(ds.V_EVENTOS, idevento);
                int esf1 = 0;
                if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15) esf1 = 1;

                if (ds.V_SOLO_DIVISIONES.Count > 0)
                {
                    int i = 0;
                    DL.EventosDS ds2 = new EventosDS();
                    int j = 0;
                    int division = -1;
                    int grupo = -1;
                    ds2.V_DIVISIONES_EVENTO.Merge(ds.V_DIVISIONES_EVENTO);
                    foreach (DL.EventosDS.V_SOLO_DIVISIONESRow fila in ds.V_SOLO_DIVISIONES)
                    {

                        if (division == -1)
                        {
                            if (numdiv != 1)
                                cad += "<div class='blog-post single-gallery'><div class='feature-inner' >"
                                     + "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                    "<div style='top:0px;left:250px;'><h1>Equipos: " + fila.ES + "</h1></div>";
                            else
                            {
                                if (esf1 == 0)
                                    cad += "<div class='blog-post single-gallery'><div class='feature-inner' >"
                                    + "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                    "<div style='top:0px;left:250px;'><h1>" + evento.EVENTO + "</h1><h2>Clasificación General Equipos</h2></div>";
                                else
                                    cad += "<div class='blog-post single-gallery'><div class='feature-inner' >" +
                                        "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                "<div style='top:0px;left:250px;'><h1>" + evento.EVENTO + "</h1><h2>Clasificación General Constructores</h2></div>";
                            }
                            j++;

                            division = fila.IDDIVISION;
                        }
                        else if (division != fila.IDDIVISION)
                        {

                            cad += "</div></div>";
                            cad += "<div class='blog-post single-gallery'><div class='feature-inner'>" +
                               "<h1>Equipos: " + fila.ES + "</h1>";

                            j++;

                            division = fila.IDDIVISION;
                        }

                        columnas = "";
                        filas = "";
                        filasorden = "";
                        grupo = -1;
                        System.Data.DataView dv = new System.Data.DataView();

                        foreach (DL.EventosDS.V_DIVISIONES_EVENTORow split in ds2.V_DIVISIONES_EVENTO)
                        {
                            if (division == split.IDDIVISION)
                            {
                                if (grupo == -1)
                                {
                                    grupo = split.IDSPLIT;
                                    if (split.IDSPLIT != 1)
                                        columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    else
                                        columnas = "<table class='table table-bordered' style='background-color: white;'>";
                                }
                                else if (grupo != split.IDSPLIT)
                                {
                                    grupo = split.IDSPLIT;
                                    columnas = "</table>";
                                    columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    filas = "";
                                    filasorden = "";
                                }

                                tdos.Fill(eqds.SP_CLASIFICACION_GENERAL_EQUIPOS, idevento, division, grupo, esf1);
                                if (cuentaetapas>10)
                                    columnas += "<tr style='font-size:10px'><th style='background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                else
                                    columnas += "<tr><th style='background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                for (i = 0; i <= cuentaetapas; i++)
                                {
                                    if (eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName == "EQUIPO") //eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName == "TOTAL" || 
                                    {
                                        if (eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName == "EQUIPO")
                                            columnas += "<th style='background-color:whitesmoke;vertical-align:middle;'>Equipo</th><th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                        //else
                                        //    columnas += "<th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                    }
                                    else if (i <= cuentaetapas)
                                    {
                                        string colname = eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName;
                                        if (eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName.IndexOf("_") != -1)
                                            colname = eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName.Substring(0, eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName.IndexOf("_"));

                                        if (esf1 == 0)
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + colname + "</th>";
                                        else
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'><img src='Content/img/flags/" + colname + ".png'></th>";
                                    }
                                }
                                columnas += "</tr>";
                                string aux = "";
                                decimal total = 0;
                                string avatar = "";
                                string lila = "";
                                cont = 1;
                                int cuentaf = 0;
                                bool existe = false;
                                foreach (DL.EquiposDS.SP_CLASIFICACION_GENERAL_EQUIPOSRow resultado in eqds.SP_CLASIFICACION_GENERAL_EQUIPOS)
                                {
                                    clasif = dsaux.AUX_CLASIFICACION.NewAUX_CLASIFICACIONRow();
                                    aux = "";
                                    filas = "";
                                    total = 0;
                                    filas += "<tr style='%%'>";
                                    if (esf1 == 0)
                                    {
                                        if (resultado[0].ToString() == "SIN EQUIPO" || resultado[0].ToString() == "")
                                            equipo = "SIN EQUIPO/NO TEAM";
                                        else
                                            equipo = "<a href='team.aspx?id=" + resultado[cuentaetapas + 3].ToString() + "'><b>" + resultado[0].ToString() + "</b></a>";
                                        if (resultado[cuentaetapas + 2].ToString() != "escudo.jpg")
                                            avatar = resultado[cuentaetapas + 3].ToString() + "/" + resultado[cuentaetapas + 2].ToString();
                                        else
                                            avatar = resultado[cuentaetapas + 2].ToString();
                                        filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/equipos/" + avatar + "'></div><p>" + equipo + "</p></td><td>%TOTALSRC%</td>";
                                    }
                                    else
                                    {
                                        equipo = resultado[0].ToString();
                                        avatar = resultado[0].ToString().Replace(" ", "-") + ".png";
                                        if (esf1 == 0)
                                            filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:auto;vertical-align:middle;' src='http://simracingchamps.net/Content/img/web/" + avatar + "'><br>" + equipo + "</div></td><td>%TOTALSRC%</td>";
                                        else
                                            filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='width:auto;vertical-align:middle;' src='http://simracingchamps.net/Content/img/web/" + avatar + "'><br>" + equipo + "</div></td><td>%TOTALSRC%</td>";
                                    }
                                    //filas += "<td><img style='height:40px;width:40px;float:left;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'><span style='float:left;'>" + resultado[0].ToString() + "<br>" + resultado[20].ToString()  + "</span></td>";

                                    cont++;
                                    for (i = 1; i <= cuentaetapas; i++)
                                    {

                                        if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                            aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                        else
                                            aux = resultado[i].ToString();

                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";


                                        if (aux != "") total += decimal.Parse(aux);

                                    }
                                    //if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
                                    //    aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
                                    //else
                                    //    aux = resultado[cuentaetapas + 1].ToString();
                                    filas = filas.Replace("<td>%TOTALSRC%</td>", "<td style='text-align:center; vertical-align:middle;background-color:black;color:white;font-weight:bold;'>" + total.ToString() + "</td>");
                                    filas += "</tr>";
                                    clasif.fila = filas;
                                    clasif.total = total;
                                    dsaux.AUX_CLASIFICACION.AddAUX_CLASIFICACIONRow(clasif);
                                }


                                var Rows = (from row in dsaux.AUX_CLASIFICACION.AsEnumerable()
                                            orderby row["total"] descending
                                            select row);
                                cont = 1;
                                foreach (DL.AuxliaresDS.AUX_CLASIFICACIONRow ff in Rows)
                                {
                                    if (cont == 1)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid gold;padding-left: 4px;");
                                    else if (cont == 2)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid silver;padding-left: 4px;");
                                    else if (cont == 3)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid #cd7f32;padding-left: 4px;");
                                    else
                                        ff.fila = ff.fila.Replace("%%", "");
                                    filasorden += ff.fila.ToString().Replace("XPOS99XPOS99XPOS99", cont.ToString());


                                    cont++;
                                }
                                dsaux.AUX_CLASIFICACION.Clear();
                                cad += columnas + filasorden;
                            }
                        }
                        cad += "</table>";
                    }
                    cad += "</div>";
                    return cad;
                    //}
                }
                return "No se han publicado resultados del campeonato";

            }
            catch (Exception ex)
            {
                return "No se han publicado resultados del campeonato";
            }
        }

        public string ResultadosComunidades(int idevento)
        {
            try
            {
                EVENTOS_ETAPASTableAdapter te = new EVENTOS_ETAPASTableAdapter();
                bool hay = (int)te.HayResultadosPublicados(idevento) > 0;
                if (!hay)
                    return "";
                string cad = "", columnas = "", filas = "", filasorden = "";
                string equipo = "";
                //1. MIRAR SI HAY MAS DE UNA DIVISION 
                //1.1 SI LA HAY MONTAR TABS PARA CADA DIVISION Y CALCULAR LA TABLA DE RESULTADOS POR DIVISIONES
                int cont = 1;
                int idtabla = DameTablaPuntos(idevento);
                DL.EventosDS ds = new DL.EventosDS();
                QueriesTableAdapter q = new QueriesTableAdapter();
                V_DIVISIONES_EVENTOTableAdapter tdiv = new V_DIVISIONES_EVENTOTableAdapter();
                V_SOLO_DIVISIONESTableAdapter tsolo = new V_SOLO_DIVISIONESTableAdapter();
                V_LLEGADATableAdapter tll = new V_LLEGADATableAdapter();
                EVENTOS_ETAPASTableAdapter tet = new EVENTOS_ETAPASTableAdapter();
                tet.FillByIDEVENTO(ds.EVENTOS_ETAPAS, idevento);
                tsolo.Fill(ds.V_SOLO_DIVISIONES, idevento);
                tdiv.Fill(ds.V_DIVISIONES_EVENTO, idevento);
                int numdiv = (int)q.CuentaDivisionesEvento(idevento);
                int cuentaetapas = (int)q.CuentaEtapasEvento(idevento);
                DL.EquiposDS eqds = new DL.EquiposDS();
                DL.EquiposDSTableAdapters.SP_CLASIFICACION_GENERAL_COMUNIDADESTableAdapter tdos = new DL.EquiposDSTableAdapters.SP_CLASIFICACION_GENERAL_COMUNIDADESTableAdapter();
                DL.AuxliaresDS dsaux = new AuxliaresDS();
                DL.AuxliaresDS.AUX_CLASIFICACIONRow clasif;
                EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                DL.EventosDSTableAdapters.V_EVENTOSTableAdapter ve = new V_EVENTOSTableAdapter();
                ve.FillByIDEVENTO(ds.V_EVENTOS, idevento);
                int esf1 = 0;
                if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15) esf1 = 1;

                if (ds.V_SOLO_DIVISIONES.Count > 0)
                {
                    int i = 0;
                    DL.EventosDS ds2 = new EventosDS();
                    int j = 0;
                    int division = -1;
                    int grupo = -1;
                    ds2.V_DIVISIONES_EVENTO.Merge(ds.V_DIVISIONES_EVENTO);
                    foreach (DL.EventosDS.V_SOLO_DIVISIONESRow fila in ds.V_SOLO_DIVISIONES)
                    {

                        if (division == -1)
                        {
                            if (numdiv != 1)
                                cad += "<div class='blog-post single-gallery'><div class='feature-inner' >"
                                     + "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                    "<div style='float:left;'><h1>Equipos: " + fila.ES + "</h1></div>";
                            else
                            {
                                if (esf1 == 0)
                                    cad += "<div class='blog-post single-gallery'><div class='feature-inner' >"
                                    + "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                    "<div style='float:left;'><h1>Clasificación General Equipos</h1></div>";
                                else
                                    cad += "<div class='blog-post single-gallery'><div class='feature-inner' >" +
                                        "<div class='logoclasif'><img style='height:130px;width:auto;max-width:230px;' src='../Content/img/avatar/" + evento.IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR + "'></div>" +
                                "<div style='float:left;'><h1>" + evento.EVENTO + "</h1><h2>Clasificación General Constructores</h2></div>";
                            }
                            j++;

                            division = fila.IDDIVISION;
                        }
                        else if (division != fila.IDDIVISION)
                        {

                            cad += "</div></div>";
                            cad += "<div class='blog-post single-gallery'><div class='feature-inner'>" +
                               "<h1>Equipos: " + fila.ES + "</h1>";

                            j++;

                            division = fila.IDDIVISION;
                        }

                        columnas = "";
                        filas = "";
                        filasorden = "";
                        grupo = -1;
                        System.Data.DataView dv = new System.Data.DataView();

                        foreach (DL.EventosDS.V_DIVISIONES_EVENTORow split in ds2.V_DIVISIONES_EVENTO)
                        {
                            if (division == split.IDDIVISION)
                            {
                                if (grupo == -1)
                                {
                                    grupo = split.IDSPLIT;
                                    if (split.IDSPLIT != 1)
                                        columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    else
                                        columnas = "<table class='table table-bordered' style='background-color: white;'>";
                                }
                                else if (grupo != split.IDSPLIT)
                                {
                                    grupo = split.IDSPLIT;
                                    columnas = "</table>";
                                    columnas = "<table class='table table-bordered' style='background-color: white;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    filas = "";
                                    filasorden = "";
                                }

                                tdos.Fill(eqds.SP_CLASIFICACION_GENERAL_COMUNIDADES, idevento, division, grupo, esf1);
                                columnas += "<tr><th style='background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                for (i = 0; i <= cuentaetapas; i++)
                                {
                                    if (eqds.SP_CLASIFICACION_GENERAL_COMUNIDADES.Columns[i].ColumnName == "EQUIPO") //eqds.SP_CLASIFICACION_GENERAL_COMUNIDADES.Columns[i].ColumnName == "TOTAL" || 
                                    {
                                        if (eqds.SP_CLASIFICACION_GENERAL_COMUNIDADES.Columns[i].ColumnName == "EQUIPO")
                                            columnas += "<th style='background-color:whitesmoke;vertical-align:middle;'>Equipo</th><th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                        //else
                                        //    columnas += "<th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                    }
                                    else if (i <= cuentaetapas)
                                    {
                                        if (esf1 == 0)
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + eqds.SP_CLASIFICACION_GENERAL_COMUNIDADES.Columns[i].ColumnName + "</th>";
                                        else
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'><img src='Content/img/flags/" + eqds.SP_CLASIFICACION_GENERAL_COMUNIDADES.Columns[i].ColumnName + ".png'></th>";
                                    }
                                }
                                columnas += "</tr>";
                                string aux = "";
                                decimal total = 0;
                                string avatar = "";
                                string lila = "";
                                cont = 1;
                                int cuentaf = 0;
                                bool existe = false;
                                foreach (DL.EquiposDS.SP_CLASIFICACION_GENERAL_COMUNIDADESRow resultado in eqds.SP_CLASIFICACION_GENERAL_COMUNIDADES)
                                {
                                    clasif = dsaux.AUX_CLASIFICACION.NewAUX_CLASIFICACIONRow();
                                    aux = "";
                                    filas = "";
                                    total = 0;
                                    filas += "<tr style='%%'>";
                                    if (esf1 == 0)
                                    {
                                        if (resultado[0].ToString() == "SIN EQUIPO" || resultado[0].ToString() == "")
                                            equipo = "SIN EQUIPO/NO TEAM";
                                        else
                                            equipo = "<a href='team.aspx?id=" + resultado[cuentaetapas + 3].ToString() + "'>" + resultado[0].ToString() + "</a>";
                                        if (resultado[cuentaetapas + 2].ToString() != "escudo.jpg")
                                            avatar = resultado[cuentaetapas + 3].ToString() + "/" + resultado[cuentaetapas + 2].ToString();
                                        else
                                            avatar = resultado[cuentaetapas + 2].ToString();
                                        filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/equipos/" + avatar + "'></div><p>" + equipo + "</p></td><td>%TOTALSRC%</td>";
                                    }
                                    else
                                    {
                                        equipo = resultado[0].ToString();
                                        avatar = resultado[0].ToString().Replace(" ", "-") + ".png";
                                        if (esf1 == 0)
                                            filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:auto;vertical-align:middle;' src='http://simracingchamps.net/Content/img/web/" + avatar + "'><br>" + equipo + "</div></td><td>%TOTALSRC%</td>";
                                        else
                                            filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='width:auto;vertical-align:middle;' src='http://simracingchamps.net/Content/img/web/" + avatar + "'><br>" + equipo + "</div></td><td>%TOTALSRC%</td>";
                                    }
                                    //filas += "<td><img style='height:40px;width:40px;float:left;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'><span style='float:left;'>" + resultado[0].ToString() + "<br>" + resultado[20].ToString()  + "</span></td>";

                                    cont++;
                                    for (i = 1; i <= cuentaetapas; i++)
                                    {

                                        if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                            aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                        else
                                            aux = resultado[i].ToString();

                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'>" + aux + "</td>";


                                        if (aux != "") total += decimal.Parse(aux);

                                    }
                                    //if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
                                    //    aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
                                    //else
                                    //    aux = resultado[cuentaetapas + 1].ToString();
                                    filas = filas.Replace("<td>%TOTALSRC%</td>", "<td style='text-align:center; vertical-align:middle;background-color:black;color:white;font-weight:bold;'>" + total.ToString() + "</td>");
                                    filas += "</tr>";
                                    clasif.fila = filas;
                                    clasif.total = total;
                                    dsaux.AUX_CLASIFICACION.AddAUX_CLASIFICACIONRow(clasif);
                                }


                                var Rows = (from row in dsaux.AUX_CLASIFICACION.AsEnumerable()
                                            orderby row["total"] descending
                                            select row);
                                cont = 1;
                                foreach (DL.AuxliaresDS.AUX_CLASIFICACIONRow ff in Rows)
                                {
                                    if (cont == 1)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid gold;padding-left: 4px;");
                                    else if (cont == 2)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid silver;padding-left: 4px;");
                                    else if (cont == 3)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid #cd7f32;padding-left: 4px;");
                                    else
                                        ff.fila = ff.fila.Replace("%%", "");
                                    filasorden += ff.fila.ToString().Replace("XPOS99XPOS99XPOS99", cont.ToString());


                                    cont++;
                                }
                                dsaux.AUX_CLASIFICACION.Clear();
                                cad += columnas + filasorden;
                            }
                        }
                        cad += "</table>";
                    }
                    cad += "</div>";
                    return cad;
                    //}
                }
                return "No se han publicado resultados del campeonato";

            }
            catch (Exception ex)
            {
                return "No se han publicado resultados del campeonato";
            }
        }

        public string ResultadosWidget(int idevento, bool solototal)
        {
            try
            {
                EVENTOS_ETAPASTableAdapter te = new EVENTOS_ETAPASTableAdapter();
                bool hay = (int)te.HayResultadosPublicados(idevento) > 0;
                if (!hay)
                    return "";
                string cad = "", columnas = "", filas = "", filasorden = "";
                string equipo = "";
                //1. MIRAR SI HAY MAS DE UNA DIVISION 
                //1.1 SI LA HAY MONTAR TABS PARA CADA DIVISION Y CALCULAR LA TABLA DE RESULTADOS POR DIVISIONES
                int cont = 1;
                int idtabla = DameTablaPuntos(idevento);
                DL.EventosDS ds = new DL.EventosDS();
                QueriesTableAdapter q = new QueriesTableAdapter();
                V_DIVISIONES_EVENTOTableAdapter tdiv = new V_DIVISIONES_EVENTOTableAdapter();
                V_SOLO_DIVISIONESTableAdapter tsolo = new V_SOLO_DIVISIONESTableAdapter();
                V_LLEGADATableAdapter tll = new V_LLEGADATableAdapter();
                EVENTOS_ETAPASTableAdapter tet = new EVENTOS_ETAPASTableAdapter();
                tet.FillByIDEVENTO(ds.EVENTOS_ETAPAS, idevento);
                tsolo.Fill(ds.V_SOLO_DIVISIONES, idevento);
                tdiv.Fill(ds.V_DIVISIONES_EVENTO, idevento);
                DL.EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                int numdiv = (int)q.CuentaDivisionesEvento(idevento);
                int cuentaetapas = (int)q.CuentaEtapasEvento(idevento);
                SP_CLASIFICACION_GENERALTableAdapter tres = new SP_CLASIFICACION_GENERALTableAdapter();
                SP_CLASIFICACION_GENERAL2_bTableAdapter tdos = new SP_CLASIFICACION_GENERAL2_bTableAdapter();
                DL.AuxliaresDS dsaux = new AuxliaresDS();
                DL.AuxliaresDS.AUX_CLASIFICACIONRow clasif;

                int esf1 = 0;
                if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15) esf1 = 1;

                if (ds.V_SOLO_DIVISIONES.Count > 0)
                {
                    int i = 0;
                    DL.EventosDS ds2 = new EventosDS();
                    int j = 0;
                    int division = -1;
                    int grupo = -1;
                    ds2.V_DIVISIONES_EVENTO.Merge(ds.V_DIVISIONES_EVENTO);
                    foreach (DL.EventosDS.V_SOLO_DIVISIONESRow fila in ds.V_SOLO_DIVISIONES)
                    {

                        if (division == -1)
                        {
                            if (numdiv != 1)
                                cad += "<div style='background-color:black;width:100%;color:white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                   "<span style='padding: 3px 0px 3px 3px;'>" + evento.EVENTO + " :: " + fila.ES + "</span>";
                            else
                            {
                                if (esf1 == 0)
                                    cad += "<div style='background-color:black;width:100%;color:white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                      "<span style='padding: 3px 0px 3px 3px;'>Clasificación General :: " + evento.EVENTO + "</span>";
                                else
                                    cad += "<div style='background-color:black;width:100%;color:white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                  "<span style='padding: 3px 0px 3px 3px;'>Clasificación General Pilotos :: " + evento.EVENTO + "</span>";
                            }

                            j++;

                            division = fila.IDDIVISION;
                        }
                        else if (division != fila.IDDIVISION)
                        {

                            cad += "</div>";
                            cad += "<div  style='background-color:black;width:100%;color:white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:1em;'>" +
                                 "<span style='padding: 3px 0px 3px 3px;'>" + evento.EVENTO + " :: " + fila.ES + "</span>";

                            j++;

                            division = fila.IDDIVISION;
                        }

                        columnas = "";
                        filas = "";
                        filasorden = "";
                        grupo = -1;
                        System.Data.DataView dv = new System.Data.DataView();

                        foreach (DL.EventosDS.V_DIVISIONES_EVENTORow split in ds2.V_DIVISIONES_EVENTO)
                        {
                            if (division == split.IDDIVISION)
                            {
                                if (grupo == -1)
                                {
                                    grupo = split.IDSPLIT;
                                    if (split.IDSPLIT != 1)
                                        columnas = "<table style='width:100%;background-color: white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    else
                                        columnas = "<table style='width:100%;background-color: white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;'>";
                                }
                                else if (grupo != split.IDSPLIT)
                                {
                                    grupo = split.IDSPLIT;
                                    columnas = "</table>";
                                    columnas = "<table style='width:100%;background-color: white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    filas = "";
                                    filasorden = "";
                                }

                                tdos.Fill(ds.SP_CLASIFICACION_GENERAL2_b, idevento, division, grupo, esf1);
                                columnas += "<tr><th style='background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                for (i = 0; i <= cuentaetapas + 12; i++)
                                {
                                    if (ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "PILOTO") //ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "TOTAL" || 
                                    {
                                        if (ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName == "PILOTO")
                                            columnas += "<th style='background-color:whitesmoke;vertical-align:middle;'>Piloto</th><th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                        //else
                                        //    columnas += "<th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                    }
                                    else if (i <= cuentaetapas && !solototal)
                                    {
                                        if (esf1 == 0)
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + RemoveSpecialCharactersPuro(ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName) + "</th>";
                                        else
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'><img src='Content/img/flags/" + RemoveSpecialCharactersPuro(ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName) + ".png'></th>";
                                    }
                                    //columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + RemoveSpecialCharactersPuro(ds.SP_CLASIFICACION_GENERAL2_b.Columns[i].ColumnName) + "</th>";
                                }
                                columnas += "</tr>";
                                string aux = "";
                                decimal total = 0;
                                string avatar = "";
                                string lila = "";
                                cont = 1;
                                int cuentaf = 0;
                                bool existe = false;
                                foreach (EventosDS.SP_CLASIFICACION_GENERAL2_bRow resultado in ds.SP_CLASIFICACION_GENERAL2_b)
                                {
                                    tll.Fill(ds.V_LLEGADA, int.Parse(resultado[cuentaetapas + 16].ToString()), idevento);
                                    cuentaf = cuentaetapas - ds.V_LLEGADA.Count;
                                    //for (int z=0;z<cuentaf;z++)
                                    foreach (DL.EventosDS.EVENTOS_ETAPASRow etapa in ds.EVENTOS_ETAPAS)
                                    {
                                        foreach (DL.EventosDS.V_LLEGADARow llegada in ds.V_LLEGADA)
                                        {
                                            if (llegada.IDETAPA == etapa.ID)
                                            {
                                                existe = true;
                                                break;
                                            }
                                        }
                                        if (!existe)
                                        {
                                            EventosDS.V_LLEGADARow FLL = ds.V_LLEGADA.NewV_LLEGADARow();
                                            FLL.POSLLEGADA = 0;
                                            FLL.VUELTARAPIDA = "N";
                                            FLL.FECHA = etapa.FECHA;
                                            FLL.IDETAPA = etapa.ID;
                                            ds.V_LLEGADA.AddV_LLEGADARow(FLL);

                                        }
                                        existe = false;
                                    }
                                    ds.V_LLEGADA.AcceptChanges();
                                    dv.Table = ds.V_LLEGADA;
                                    dv.Sort = "FECHA ASC";
                                    System.Data.DataTable sortedDT = dv.ToTable();
                                    dv.Table = sortedDT;
                                    clasif = dsaux.AUX_CLASIFICACION.NewAUX_CLASIFICACIONRow();
                                    aux = "";
                                    filas = "";
                                    total = 0;
                                    filas += "<tr style='%%'>";
                                    if (resultado[cuentaetapas + 14].ToString() == "SIN EQUIPO" || resultado[cuentaetapas + 14].ToString() == "")
                                        equipo = "&nbsp;";
                                    else
                                    {
                                        if (esf1 == 0)
                                            equipo = "<a href='http://simracingchamps.net/team.aspx?id=" + resultado[cuentaetapas + 7].ToString() + "'>" + resultado[cuentaetapas + 14].ToString() + "</a>";
                                        else
                                            equipo = resultado[cuentaetapas + 14].ToString();
                                    }
                                    if (resultado[cuentaetapas + 3].ToString() != "isracetime_user.jpg")
                                        avatar = resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString();
                                    else
                                        avatar = resultado[cuentaetapas + 3].ToString();
                                    //filas += "<td><img style='height:40px;width:40px;float:left;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'><span style='float:left;'>" + resultado[0].ToString() + "<br>" + resultado[20].ToString()  + "</span></td>";
                                    filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:100%'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/avatar/" + avatar + "'></div><p style='float:left;margin-bottom:0px;'><img src='http://simracingchamps.net/Content/img/flags/" + resultado[cuentaetapas + 8].ToString().Trim() + ".png'>&nbsp;<b><a href='http://simracingchamps.net/rank.aspx?n=" + resultado[cuentaetapas + 15].ToString() + "'>" + resultado[0].ToString() + "</a></b></br>" + equipo + "</p></td><td>%TOTALSRC%</td>";
                                    cont++;

                                    for (i = 1; i <= cuentaetapas; i++)
                                    {
                                        if (!solototal)
                                        {
                                            if (ds.V_LLEGADA[i - 1].POSLLEGADA == 7777)
                                            {
                                                aux = "DSQ";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'><label style='padding:8px 10px 8px 10px;color:black;' class='btn btn-default'>" + aux + "</label></td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 8888)
                                            {
                                                aux = "RET";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'><label style='padding:8px 10px 8px 10px;color:black;' class='btn btn-default'>" + aux + "</label></td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 9999)
                                            {
                                                aux = "DNS";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'><label style='padding:8px 10px 8px 10px;color:black;' class='btn btn-default'>" + aux + "</label></td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA.ToShortDateString() == DateTime.Now.ToShortDateString())
                                            {
                                                aux = "";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'></td>";
                                            }
                                            else if (ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now)
                                            {
                                                aux = "DNS";
                                                filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;'><label style='padding:8px 10px 8px 10px;color:black;' class='btn btn-default'>" + aux + "</label></td>";
                                            }
                                            else
                                            {
                                                if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                                    aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                                else
                                                    aux = resultado[i].ToString();
                                                if (aux != "")
                                                {
                                                    if (idtabla != 2)
                                                    {
                                                        //if (aux != "" && decimal.Parse(aux) == 25)
                                                        //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-danger'>" + aux + "</label></td>";
                                                        //else if (aux != "" && decimal.Parse(aux) == 18)
                                                        //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-warning'>" + aux + "</label></td>";
                                                        //else if (aux != "" && decimal.Parse(aux) == 15)
                                                        //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-primary'>" + aux + "</label></td>";
                                                        //else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + " <sup>(" + ds.V_LLEGADA[i - 1].POSLLEGADA.ToString() + "&deg;)</sup></td>";
                                                    }
                                                    else if (idtabla == 2)
                                                    {
                                                        //if (aux != "" && decimal.Parse(aux) == 5)
                                                        //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-danger'>" + aux + "</label></td>";
                                                        //else if (aux != "" && decimal.Parse(aux) == 3)
                                                        //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-warning'>" + aux + "</label></td>";
                                                        //else if (aux != "" && decimal.Parse(aux) == 2)
                                                        //    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-primary'>" + aux + "</label></td>";
                                                        //else
                                                        filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + " <sup>(" + ds.V_LLEGADA[i - 1].POSLLEGADA.ToString() + "&deg;)</sup></td>";
                                                    }
                                                }
                                                else
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'></td>";

                                                if (aux != "") total += decimal.Parse(aux);
                                            }
                                            try
                                            {
                                                if (dv[i - 1]["BONIFICACION"] != null && dv[i - 1]["BONIFICACION"].ToString() != "" && decimal.Parse(dv[i - 1]["BONIFICACION"].ToString()) < 0)
                                                    filas = filas.Replace("lila", "background-color:red;color:white;");
                                                else if (dv[i - 1]["VUELTARAPIDA"].ToString() == "S")
                                                    filas = filas.Replace("lila", "background-color:#d298d2;color:white;");
                                                else
                                                    filas = filas.Replace("lila", "");
                                            }
                                            catch (Exception)
                                            {
                                                if (dv[i - 1]["VUELTARAPIDA"].ToString() == "S")
                                                    filas = filas.Replace("lila", "background-color:#d298d2;color:white;");
                                                else
                                                    filas = filas.Replace("lila", "");
                                            }

                                        }
                                        else if (ds.V_LLEGADA[i - 1].POSLLEGADA != 7777 && ds.V_LLEGADA[i - 1].POSLLEGADA != 8888 && ds.V_LLEGADA[i - 1].POSLLEGADA != 9999 && !(ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now))
                                        {
                                            if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                                aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                            else
                                                aux = resultado[i].ToString();
                                            if (aux != "") total += decimal.Parse(aux);
                                        }
                                    }
                                    if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
                                        aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
                                    else
                                        aux = resultado[cuentaetapas + 1].ToString();
                                    filas = filas.Replace("<td>%TOTALSRC%</td>", "<td style='text-align:center; vertical-align:middle;background-color:black;color:white;font-weight:bold;'>" + total.ToString() + "</td>");
                                    filas += "</tr>";
                                    clasif.fila = filas;
                                    clasif.total = total;
                                    dsaux.AUX_CLASIFICACION.AddAUX_CLASIFICACIONRow(clasif);
                                }

                                var Rows = (from row in dsaux.AUX_CLASIFICACION.AsEnumerable()
                                            orderby row["total"] descending
                                            select row);
                                cont = 1;
                                foreach (DL.AuxliaresDS.AUX_CLASIFICACIONRow ff in Rows)
                                {
                                    if (cont == 1)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid gold;padding-left: 4px;");
                                    else if (cont == 2)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid silver;padding-left: 4px;");
                                    else if (cont == 3)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid #cd7f32;padding-left: 4px;");
                                    else
                                        ff.fila = ff.fila.Replace("%%", "");
                                    filasorden += ff.fila.ToString().Replace("XPOS99XPOS99XPOS99", cont.ToString());


                                    cont++;
                                }
                                dsaux.AUX_CLASIFICACION.Clear();
                                cad += columnas + filasorden;
                            }
                        }
                        cad += "</table>";
                    }
                    cad += "</div>";
                    return cad;
                    //}
                }
                return "No se han publicado resultados del campeonato";

            }
            catch (Exception ex)
            {
                return "No se han publicado resultados del campeonato";
            }
        }

        public string ResultadosWidgetEquipos(int idevento, bool solototal)
        {
            try
            {
                EVENTOS_ETAPASTableAdapter te = new EVENTOS_ETAPASTableAdapter();
                bool hay = (int)te.HayResultadosPublicados(idevento) > 0;
                if (!hay)
                    return "";
                string cad = "", columnas = "", filas = "", filasorden = "";
                string equipo = "";
                //1. MIRAR SI HAY MAS DE UNA DIVISION 
                //1.1 SI LA HAY MONTAR TABS PARA CADA DIVISION Y CALCULAR LA TABLA DE RESULTADOS POR DIVISIONES
                int cont = 1;
                int idtabla = DameTablaPuntos(idevento);
                DL.EventosDS ds = new DL.EventosDS();
                QueriesTableAdapter q = new QueriesTableAdapter();
                V_DIVISIONES_EVENTOTableAdapter tdiv = new V_DIVISIONES_EVENTOTableAdapter();
                V_SOLO_DIVISIONESTableAdapter tsolo = new V_SOLO_DIVISIONESTableAdapter();
                V_LLEGADATableAdapter tll = new V_LLEGADATableAdapter();
                EVENTOS_ETAPASTableAdapter tet = new EVENTOS_ETAPASTableAdapter();
                tet.FillByIDEVENTO(ds.EVENTOS_ETAPAS, idevento);
                tsolo.Fill(ds.V_SOLO_DIVISIONES, idevento);
                tdiv.Fill(ds.V_DIVISIONES_EVENTO, idevento);
                DL.EventosDS.EVENTOSRow evento = CargaEvento(idevento);
                int numdiv = (int)q.CuentaDivisionesEvento(idevento);
                int cuentaetapas = (int)q.CuentaEtapasEvento(idevento);
                DL.EquiposDS eqds = new DL.EquiposDS();
                DL.EquiposDSTableAdapters.SP_CLASIFICACION_GENERAL_EQUIPOSTableAdapter tdos = new DL.EquiposDSTableAdapters.SP_CLASIFICACION_GENERAL_EQUIPOSTableAdapter();
                //SP_CLASIFICACION_GENERAL2TableAdapter tdos = new SP_CLASIFICACION_GENERAL2TableAdapter();
                DL.AuxliaresDS dsaux = new AuxliaresDS();
                DL.AuxliaresDS.AUX_CLASIFICACIONRow clasif;
                int esf1 = 0;
                if (evento.IDJUEGO == 9 || evento.IDJUEGO == 12 || evento.IDJUEGO == 15) esf1 = 1;

                if (ds.V_SOLO_DIVISIONES.Count > 0)
                {
                    int i = 0;
                    DL.EventosDS ds2 = new EventosDS();
                    int j = 0;
                    int division = -1;
                    int grupo = -1;
                    ds2.V_DIVISIONES_EVENTO.Merge(ds.V_DIVISIONES_EVENTO);
                    foreach (DL.EventosDS.V_SOLO_DIVISIONESRow fila in ds.V_SOLO_DIVISIONES)
                    {

                        if (division == -1)
                        {
                            if (numdiv != 1)
                                cad += "<div style='background-color:black;width:100%;color:white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                   "<span style='padding: 3px 0px 3px 3px;'>" + evento.EVENTO + " :: " + fila.ES + "</span>";
                            else
                            {
                                if (esf1 == 0)
                                    cad += "<div style='background-color:black;width:100%;color:white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                      "<span style='padding: 3px 0px 3px 3px;'>Clasificación General :: " + evento.EVENTO + "</span>";
                                else
                                    cad += "<div style='background-color:black;width:100%;color:white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:1em;' >" +
                                   "<span style='padding: 3px 0px 3px 3px;'>Clasificación General Constructores :: " + evento.EVENTO + "</span>";
                            }

                            j++;

                            division = fila.IDDIVISION;
                        }
                        else if (division != fila.IDDIVISION)
                        {

                            cad += "</div>";
                            cad += "<div  style='background-color:black;width:100%;color:white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:1em;'>" +
                                 "<span style='padding: 3px 0px 3px 3px;'>" + evento.EVENTO + " :: " + fila.ES + "</span>";

                            j++;

                            division = fila.IDDIVISION;
                        }

                        columnas = "";
                        filas = "";
                        filasorden = "";
                        grupo = -1;
                        System.Data.DataView dv = new System.Data.DataView();

                        foreach (DL.EventosDS.V_DIVISIONES_EVENTORow split in ds2.V_DIVISIONES_EVENTO)
                        {
                            if (division == split.IDDIVISION)
                            {
                                if (grupo == -1)
                                {
                                    grupo = split.IDSPLIT;
                                    if (split.IDSPLIT != 1)
                                        columnas = "<table style='width:100%;background-color: white;font-family:Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    else
                                        columnas = "<table style='width:100%;background-color: white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;'>";
                                }
                                else if (grupo != split.IDSPLIT)
                                {
                                    grupo = split.IDSPLIT;
                                    columnas = "</table>";
                                    columnas = "<table style='width:100%;background-color: white;font-family: Tahoma, Geneva, Verdana, sans-serif;font-size:0.8em;'><caption>Grupo: " + (split.IDSPLIT - 1).ToString() + "</caption>";
                                    filas = "";
                                    filasorden = "";
                                }

                                tdos.Fill(eqds.SP_CLASIFICACION_GENERAL_EQUIPOS, idevento, division, grupo, esf1);
                                columnas += "<tr><th style='background-color:whitesmoke;vertical-align:middle;'>Pos</th>";
                                for (i = 0; i <= cuentaetapas; i++)
                                {
                                    if (eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName == "EQUIPO") //eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName == "TOTAL" || 
                                    {
                                        if (eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName == "EQUIPO")
                                            columnas += "<th style='background-color:whitesmoke;vertical-align:middle;'>Equipo</th><th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                        //else
                                        //    columnas += "<th style='background-color:red;color:white;vertical-align:middle;text-align:center;'>Ptos.</th>";
                                    }
                                    else if (i <= cuentaetapas && !solototal)
                                    {
                                        if (esf1 == 0)
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName + "</th>";
                                        else
                                            columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'><img src='Content/img/flags/" + eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName + ".png'></th>";
                                        //columnas += "<th  style='background-color:whitesmoke;text-align:center;vertical-align:middle;' class='hidden-xs'>" + RemoveSpecialCharactersPuro(eqds.SP_CLASIFICACION_GENERAL_EQUIPOS.Columns[i].ColumnName) + "</th>";
                                    }
                                }
                                columnas += "</tr>";
                                string aux = "";
                                decimal total = 0;
                                string avatar = "";
                                string lila = "";
                                cont = 1;
                                int cuentaf = 0;
                                bool existe = false;
                                foreach (DL.EquiposDS.SP_CLASIFICACION_GENERAL_EQUIPOSRow resultado in eqds.SP_CLASIFICACION_GENERAL_EQUIPOS)
                                {
                                    clasif = dsaux.AUX_CLASIFICACION.NewAUX_CLASIFICACIONRow();
                                    aux = "";
                                    filas = "";
                                    total = 0;
                                    filas += "<tr style='%%'>";
                                    if (esf1 == 0)
                                    {
                                        if (resultado[0].ToString() == "SIN EQUIPO" || resultado[0].ToString() == "")
                                            equipo = "SIN EQUIPO/NO TEAM";
                                        else
                                            equipo = "<a href='http://simracingchamps.net/team.aspx?id=" + resultado[cuentaetapas + 3].ToString() + "'>" + resultado[0].ToString() + "</a>";
                                        if (resultado[cuentaetapas + 2].ToString() != "escudo.jpg")
                                            avatar = resultado[cuentaetapas + 3].ToString() + "/" + resultado[cuentaetapas + 2].ToString();
                                        else
                                            avatar = resultado[cuentaetapas + 2].ToString();
                                        filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:40px;vertical-align:middle;' src='http://simracingchamps.net/Content/img/equipos/" + avatar + "'></div><p>" + equipo + "</p></td><td>%TOTALSRC%</td>";
                                    }
                                    else
                                    {
                                        equipo = resultado[0].ToString();
                                        avatar = resultado[0].ToString().Replace(" ", "-") + ".png";
                                        filas += "<td style='text-align:center;vertical-align:middle;'>XPOS99XPOS99XPOS99</td><td style='width:300px;vertical-align:middle;'><div style='float:left; padding-right:10px; margin-right:0px;'><img style='height:40px;width:auto;vertical-align:middle;' src='http://simracingchamps.net/Content/img/web/" + avatar + "'></div><p>" + equipo + "</p></td><td>%TOTALSRC%</td>";
                                    }
                                    //filas += "<td><img style='height:40px;width:40px;float:left;' src='Content/img/avatar/" + resultado[cuentaetapas + 13].ToString() + "/" + resultado[cuentaetapas + 3].ToString() + "'><span style='float:left;'>" + resultado[0].ToString() + "<br>" + resultado[20].ToString()  + "</span></td>";

                                    cont++;

                                    for (i = 1; i <= cuentaetapas; i++)
                                    {
                                        if (!solototal)
                                        {

                                            if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                                aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                            else
                                                aux = resultado[i].ToString();
                                            if (idtabla != 2)
                                            {
                                                if (aux != "" && decimal.Parse(aux) == 25)
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-danger'>" + aux + "</label></td>";
                                                else if (aux != "" && decimal.Parse(aux) == 18)
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-warning'>" + aux + "</label></td>";
                                                else if (aux != "" && decimal.Parse(aux) == 15)
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-primary'>" + aux + "</label></td>";
                                                else
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + "</td>";
                                            }
                                            else if (idtabla == 2)
                                            {
                                                if (aux != "" && decimal.Parse(aux) == 5)
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-danger'>" + aux + "</label></td>";
                                                else if (aux != "" && decimal.Parse(aux) == 3)
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-warning'>" + aux + "</label></td>";
                                                else if (aux != "" && decimal.Parse(aux) == 2)
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'><label style='padding:8px 10px 8px 10px;' class='btn btn-primary'>" + aux + "</label></td>";
                                                else
                                                    filas += "<td class='hidden-xs' style='text-align:center; vertical-align:middle;lila'>" + aux + "</td>";
                                            }

                                            if (aux != "") total += decimal.Parse(aux);

                                        }
                                        else if (ds.V_LLEGADA[i - 1].POSLLEGADA != 7777 && ds.V_LLEGADA[i - 1].POSLLEGADA != 8888 && ds.V_LLEGADA[i - 1].POSLLEGADA != 9999 && !(ds.V_LLEGADA[i - 1].POSLLEGADA == 0 && ds.V_LLEGADA[i - 1].FECHA < DateTime.Now))
                                        {
                                            if (resultado[i].ToString() != "" && resultado[i].ToString().Length > 2 && resultado[i].ToString().Substring(resultado[i].ToString().Length - 2) == ",0")
                                                aux = resultado[i].ToString().Substring(0, resultado[i].ToString().Length - 2);
                                            else
                                                aux = resultado[i].ToString();
                                            if (aux != "") total += decimal.Parse(aux);
                                        }
                                    }
                                    //if (resultado[cuentaetapas + 1].ToString() != "" && resultado[cuentaetapas + 1].ToString().Length > 2 && resultado[cuentaetapas + 1].ToString().Substring(resultado[cuentaetapas + 1].ToString().Length - 2) == ",0")
                                    //    aux = resultado[cuentaetapas + 1].ToString().Substring(0, resultado[cuentaetapas + 1].ToString().Length - 2);
                                    //else
                                    //    aux = resultado[cuentaetapas + 1].ToString();
                                    filas = filas.Replace("<td>%TOTALSRC%</td>", "<td style='text-align:center; vertical-align:middle;background-color:black;color:white;font-weight:bold;'>" + total.ToString() + "</td>");
                                    filas += "</tr>";
                                    clasif.fila = filas;
                                    clasif.total = total;
                                    dsaux.AUX_CLASIFICACION.AddAUX_CLASIFICACIONRow(clasif);
                                }

                                var Rows = (from row in dsaux.AUX_CLASIFICACION.AsEnumerable()
                                            orderby row["total"] descending
                                            select row);
                                cont = 1;
                                foreach (DL.AuxliaresDS.AUX_CLASIFICACIONRow ff in Rows)
                                {
                                    if (cont == 1)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid gold;padding-left: 4px;");
                                    else if (cont == 2)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid silver;padding-left: 4px;");
                                    else if (cont == 3)
                                        ff.fila = ff.fila.Replace("%%", "border-left: 5px solid #cd7f32;padding-left: 4px;");
                                    else
                                        ff.fila = ff.fila.Replace("%%", "");
                                    filasorden += ff.fila.ToString().Replace("XPOS99XPOS99XPOS99", cont.ToString());


                                    cont++;
                                }
                                dsaux.AUX_CLASIFICACION.Clear();
                                cad += columnas + filasorden;
                            }
                        }
                        cad += "</table>";
                    }
                    cad += "</div>";
                    return cad;
                    //}
                }
                return Resources.Global.noresultados;

            }
            catch (Exception ex)
            {
                return Resources.Global.noresultados;
            }
        }

        public void SendError(string mensaje)
        {
            try
            {
                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress("info@simracingchamps.net");
                m.To.Add("info@simracingchamps.net");
                m.Subject = "Error SimRacingChamps.net";
                m.IsBodyHtml = true;
                m.Body = string.Format("<html><head></head><body><b>" + mensaje + "</b><br><br>Un saludo, el equipo de SimRacingChamps</body>");
                sc.Host = Properties.Settings.Default.ServidorCorreo;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.UsuarioCorreo, Properties.Settings.Default.PassCorreo);
                sc.EnableSsl = false;
                sc.Send(m);
            }
            catch
            {
            }
        }

        public void SendContacto(string from, string nombre, string mensaje)
        {
            try
            {
                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress(from);
                m.To.Add("info@simracingchamps.net");
                m.Subject = "Contacto SimRacingChamps.net";
                m.IsBodyHtml = true;
                m.Body = string.Format("<html><head></head><body><b><img src='http://www.SimRacingChamps.net/Content/img/web/SimRacingChamps2.png' style='height:80px;width:auto;'><br><br>Nombre: " + nombre + "</b><br><br><b>Mensaje: " + mensaje + "</b><br><br>Un saludo, el equipo de SimRacingChamps</body>");
                sc.Host = Properties.Settings.Default.ServidorCorreo;
                sc.Timeout = 60;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.UsuarioCorreo, Properties.Settings.Default.PassCorreo);
                sc.EnableSsl = false;
                sc.Send(m);
            }
            catch
            {
            }
        }

        public void SendNotificacion(string from, string to, string nombre, string mensaje)
        {
            try
            {
                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress(from);
                m.To.Add(to);
                m.Subject = "Notificación SimRacingChamps.net";
                m.IsBodyHtml = true;
                m.Body = string.Format("<html><head></head><body><img src='http://www.SimRacingChamps.net/Content/img/web/SimRacingChamps2.png' style='height:40px;width:auto;'><br><br><b>Nombre:</b> " + nombre + "<br><br><b>Mensaje:</b> " + mensaje + "<br><br>Un saludo, el equipo de SimRacingChamps</body>");
                sc.Host = Properties.Settings.Default.ServidorCorreo;
                sc.Timeout = 60;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.UsuarioCorreo, Properties.Settings.Default.PassCorreo);
                sc.EnableSsl = false;
                sc.Send(m);
            }
            catch (Exception ex)
            {

            }
        }

        public string SendComm(string from, string to, string campeonato, string nombre, string mensaje, string titulo, SmtpClient sc)
        {
            try
            {
                MailMessage m = new MailMessage();
                m.From = new MailAddress("informacion@simracingchamps.net");
                m.To.Add(to);
                m.Subject = nombre + ":: " + titulo;
                m.IsBodyHtml = true;
                m.Body = string.Format("<html><head></head><body><b><img src='http://www.SimRacingChamps.net/Content/img/web/SimRacingChamps2.png' style='height:80px;width:auto;'><br><br>Comunicado sobre el campeonato: " + campeonato + "<br><br>Mensaje: " + mensaje + "<br><br>Un saludo, el equipo de SimRacingChamps<br><br>No contestes a este correo, esta dirección de email no tiene respuesta. Si quieres contactar con el organizador haz <a href='mailto:" + from + "'>clic aquí</a></body>");
                sc.Send(m);
                return to + " OK";
            }
            catch
            {
                return to + " ERROR";
            }
        }

        public bool SendRecover(string to, string pass)
        {
            try
            {
                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress("info@simracingchamps.net");
                m.To.Add(to);
                m.Subject = "SimRacingChamps :: Reseteo de contraseña";
                m.IsBodyHtml = false;
                m.Body = "Hola tu contraseña ha sido reseteada" + Environment.NewLine + "Tu nueva contraseña es: " + pass + Environment.NewLine + "Puedes entrar en tu cuenta y cambiarla cuando desees." + Environment.NewLine + Environment.NewLine + "Un saludo, el equipo de SimRacingChamps";
                sc.Host = Properties.Settings.Default.ServidorCorreo;
                sc.Timeout = 60;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.UsuarioCorreo, Properties.Settings.Default.PassCorreo);
                sc.EnableSsl = false;
                sc.Send(m);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool SendValidacion(string to, string organizador, string campeonato, bool validado)
        {
            try
            {
                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress("info@simracingchamps.net");
                m.To.Add(to);
                m.Subject = "SimRacingChamps :: Validación de campeonato";
                m.IsBodyHtml = true;
                if (validado)
                    m.Body = string.Format("<html><head></head><body><img src='http://www.SimRacingChamps.net/Content/img/web/SimRacingChamps2.png' style='height:80px;width:auto;'><br><br>Hola " + organizador + ",<br><br>El campeonato <b>" + campeonato + "</b> ha sido validado y ya está publicado en SimRacingChamps.net<br><br>Recuerda que puedes despublicar el campeonato en cualquier momento si así lo necesitas.<br><br>Un saludo, el equipo de SimRacingChamps</body>");
                else
                    m.Body = string.Format("<html><head></head><body><img src='http://www.SimRacingChamps.net/Content/img/web/SimRacingChamps2.png' style='height:80px;width:auto;'><br><br>Hola " + organizador + ",<br><br>El campeonato <b>" + campeonato + "</b> ha sido desvalidado debido a algún problema. Nos pondremos en contacto contigo en breve.<br><br>Un saludo, el equipo de SimRacingChamps</body>");
                sc.Host = Properties.Settings.Default.ServidorCorreo;
                sc.Timeout = 60;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.UsuarioCorreo, Properties.Settings.Default.PassCorreo);
                sc.EnableSsl = false;
                sc.Send(m);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool SendReclamacionOrg(string idorganizador, ReclamacionesDS.EVENTOS_RECLAMACIONESRow f, string campeonato)
        {
            try
            {
                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress("info@simracingchamps.net");
                m.To.Add(DameEmailUsuario(idorganizador));
                m.Subject = "SimRacingChamps :: Nueva reclamación " + campeonato;
                m.IsBodyHtml = true;
                m.Body = string.Format("<html><head></head><body><img src='http://www.SimRacingChamps.net/Content/img/web/SimRacingChamps2.png' style='height:80px;width:auto;'><br><br>Hola " + DameNombreUsuario(idorganizador) + ",<br><br>Te han enviado la siguiente reclamación para el campeonato <b>" + campeonato + "</b>:" +
                    "<p>RECLAMANTE: " + f.RECLAMANTE + "<br>" +
                    "RECLAMADO: " + f.RECLAMADO + "<br>" +
                    f.RECLAMACION + "</p><br>Por favor, para ver el resto de la información <a href='http://simracingchamps.net/login.aspx'>accede a tu panel</a><br>Un saludo, el equipo de SimRacingChamps</body>");
                sc.Host = Properties.Settings.Default.ServidorCorreo;
                sc.Timeout = 60;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.UsuarioCorreo, Properties.Settings.Default.PassCorreo);
                sc.EnableSsl = false;
                sc.Send(m);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool SendRespuesta(string from, string to, string campeonato, string respuesta)
        {
            try
            {
                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                m.From = new MailAddress("info@simracingchamps.net");
                m.To.Add(DameEmailUsuario(to));
                m.Subject = "SimRacingChamps :: Nueva respuesta de reclamación: " + campeonato;
                m.IsBodyHtml = true;
                m.Body = string.Format("<html><head></head><body><img src='http://www.SimRacingChamps.net/Content/img/web/SimRacingChamps2.png' style='height:80px;width:auto;'><br><br>Hola " + DameNombreUsuario(to) + ",<br><br>" + DameNombreUsuario(from) + " te han enviado la siguiente respuesta para tu reclamación en el campeonato <b>" + campeonato + "</b>:" +
                    "<p>RESPUESTA: " + respuesta + "<br>" +
                    "<br>Por favor, para ver el resto de la información <a href='http://simracingchamps.net/login.aspx'>accede a tu panel</a><br>Un saludo, el equipo de SimRacingChamps</body>");
                sc.Host = Properties.Settings.Default.ServidorCorreo;
                sc.Timeout = 60;
                sc.Port = 25;
                sc.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.UsuarioCorreo, Properties.Settings.Default.PassCorreo);
                sc.EnableSsl = false;
                sc.Send(m);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public string DameNombreUsuario(string idusuario)
        {
            try
            {
                UsuariosDS ds = new UsuariosDS();
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                t.FillByIDU(ds.USUARIOS, Guid.Parse(idusuario));
                string n = ds.USUARIOS[0].NOMBRE;
                if (!ds.USUARIOS[0].IsAPELLIDOSNull())
                    n += " " + ds.USUARIOS[0].APELLIDOS;
                return n;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DameEmailUsuario(string idusuario)
        {
            try
            {
                UsuariosDS ds = new UsuariosDS();
                DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                t.FillByIDU(ds.USUARIOS, Guid.Parse(idusuario));
                return ds.USUARIOS[0].USUARIO;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public void EliminaAdjunto(int id)
        {
            try
            {
                EVENTOS_ADJUNTOSTableAdapter t = new EVENTOS_ADJUNTOSTableAdapter();
                t.BorrarID(id);
            }
            catch (Exception)
            {

            }
        }

        public string Encrypt(string clearText)
        {
            string EncryptionKey = "LREVZ2B46I22672";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        public bool BorraEvento(int id)
        {
            try
            {
                EVENTOSTableAdapter t = new EVENTOSTableAdapter();
                return (int)t.BorraEvento(id) > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public string DamePais(string cod)
        {
            try
            {
                AuxliaresDS ds = new AuxliaresDS();
                DL.AuxliaresDSTableAdapters.PAISESTableAdapter t = new DL.AuxliaresDSTableAdapters.PAISESTableAdapter();
                t.FillByCod(ds.PAISES, cod);
                if (ds.PAISES.Count > 0)
                {
                    return ": <img src='Content/img/flags/" + cod + ".png'>&nbsp; " + ds.PAISES[0].EN;
                }
                return "";
            }
            catch (Exception)
            {

                return "";
            }
        }

        public bool HayInscritos(int idevento)
        {
            try
            {
                QueriesTableAdapter q = new QueriesTableAdapter();
                return (int)q.ExistenInscritos(idevento) > 0;
            }
            catch (Exception)
            {
                return true;
            }
        }

        public bool CircuitoEnUso(int idjc)
        {
            try
            {
                EVENTOS_ETAPASTableAdapter t = new EVENTOS_ETAPASTableAdapter();
                return (int)t.CircuitoEnUso(idjc) > 0;
            }
            catch (Exception)
            {
                return true;
            }
        }

        public bool CocheEnUso(int idjc)
        {
            try
            {
                EVENTO_ETAPAS_COCHESTableAdapter t = new EVENTO_ETAPAS_COCHESTableAdapter();
                return (int)t.CocheEnUso(idjc) > 0;
            }
            catch (Exception)
            {
                return true;
            }
        }

        public static string RemoveSpecialCharactersPuro(string str)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in str)
            {
                if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '.' || c == '_' || c == ' ')
                {
                    sb.Append(c);
                }
            }
            return sb.ToString();
        }

        public string ResizeImage(string ruta)
        {
            try
            {
                Image imgToResize = Image.FromFile(ruta);
                Size destinationSize = new Size(1920, 450);
                var originalWidth = imgToResize.Width;
                var originalHeight = imgToResize.Height;

                //how many units are there to make the original length
                var hRatio = (float)originalHeight / destinationSize.Height;
                var wRatio = (float)originalWidth / destinationSize.Width;

                //get the shorter side
                var ratio = Math.Min(hRatio, wRatio);

                var hScale = Convert.ToInt32(destinationSize.Height * ratio);
                var wScale = Convert.ToInt32(destinationSize.Width * ratio);

                //start cropping from the center
                var startX = (originalWidth - wScale) / 2;
                var startY = (originalHeight - hScale) / 2;

                //crop the image from the specified location and size
                var sourceRectangle = new Rectangle(startX, startY, wScale, hScale);

                //the future size of the image
                var bitmap = new Bitmap(destinationSize.Width, destinationSize.Height);

                //fill-in the whole bitmap
                var destinationRectangle = new Rectangle(0, 0, bitmap.Width, bitmap.Height);

                //generate the new image
                using (var g = Graphics.FromImage(bitmap))
                {
                    g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    g.DrawImage(imgToResize, destinationRectangle, sourceRectangle, GraphicsUnit.Pixel);
                }
                imgToResize.Dispose();
                File.Delete(ruta);
                bitmap.Save(ruta);
                return ruta;
            }
            catch (Exception ex)
            {
                return "error";
            }

        }

        public string RemoveSpecialCharacters(string str)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in str)
            {
                if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '.' || c == '_')
                {
                    sb.Append(c);
                }
            }
            return sb.ToString();
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
       

    }
}