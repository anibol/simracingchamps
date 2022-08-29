using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class circuitos : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                lnkNuevo.Visible = !cn.HayInscritos(int.Parse(Request.QueryString["id"].ToString()));
                lblaviso.Visible = !lnkNuevo.Visible;
                if (!IsPostBack)
                {
                    if (cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                    {
                        DL.AuxliaresDS ds = cn.DameCircuitos(int.Parse(Request.QueryString["id"].ToString()));
                        cbCircuito.DataSource = ds;
                        cbCircuito.DataMember = "JUEGO_CIRCUITOS";
                        cbCircuito.DataValueField = "ID";
                        cbCircuito.DataTextField = "CIRCUITO";
                        chListCoches.DataSource = ds;
                        chListCoches.DataMember = "JUEGO_COCHES";
                        chListCoches.DataTextField = "COCHE";
                        chListCoches.DataValueField = "ID";
                        cbCircuito.DataBind();
                        chListCoches.DataBind();
                        CargaEtapas(int.Parse(Request.QueryString["id"].ToString()));
                        if (Request.QueryString["ed"] != null)
                            Editar();
                        if (Request.QueryString["n"] != null)
                            Nuevo();
                        if (Request.QueryString["c"] != null)
                            Copiar();
                        if (Request.QueryString["o"] != null)
                            lblmsg.Visible = true;

                    }
                    else
                        Response.Redirect("inicio.aspx", false);
                }


            }
            catch (Exception ex)
            {

            }
        }

        private void Copiar()
        {
            try
            {
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDS dsdestino = new DL.EventosDS();
                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter co = new DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter();
                t.FillByID(ds.EVENTOS_ETAPAS, int.Parse(Request.QueryString["c"].ToString()));
                co.FillByIDEVENTOETAPA(ds.EVENTO_ETAPAS_COCHES, int.Parse(Request.QueryString["c"].ToString()));
                DL.EventosDS.EVENTOS_ETAPASRow netapas = dsdestino.EVENTOS_ETAPAS.NewEVENTOS_ETAPASRow();
                netapas.ItemArray = ds.EVENTOS_ETAPAS[0].ItemArray;
                dsdestino.EVENTOS_ETAPAS.AddEVENTOS_ETAPASRow(netapas);
                t.Update(netapas);
                co.FillByIDEVENTOETAPA(ds.EVENTO_ETAPAS_COCHES, ds.EVENTOS_ETAPAS[0].ID);
                foreach (DL.EventosDS.EVENTO_ETAPAS_COCHESRow coche in ds.EVENTO_ETAPAS_COCHES)
                    co.Insert(netapas.ID, coche.IDJUEGOCOCHE);
                Response.Redirect("circuitos.aspx?id=" + Request.QueryString["id"].ToString() + "&ed=" + netapas.ID.ToString(), false);
            }
            catch (Exception)
            {

                Response.Redirect("inicio.aspx?e=99", false);
            }
        }


        private void CargaEtapas(int id)
        {
            try
            {
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_ETAPASTableAdapter t = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
                t.FillByIDEVENTO(ds.V_ETAPAS, id);
                int idjuego = 1;
                if (ds.V_ETAPAS.Count == 0)
                {
                    DL.EventosDSTableAdapters.EVENTOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                    te.FillByID(ds.EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                    idjuego = ds.EVENTOS[0].IDJUEGO;
                }
                else
                    idjuego = ds.V_ETAPAS[0].IDJUEGO;
                repCircuitos.DataSource = ds;
                repCircuitos.DataMember = "V_ETAPAS";
                repCircuitos.DataBind();

                panIRacing.Visible = false;
                panComunPC_AC.Visible = false;
                panRF_Sala.Visible = false;
                panAC_Sala.Visible = false;
                panPC_Sala.Visible = false;
                panF1.Visible = false;
                panRR.Visible = false;
                panFR.Visible = false;
                panGTS.Visible = false;

                switch (idjuego)
                {
                    case 2:
                        panComunPC_AC.Visible = true;
                        panAC_Sala.Visible = true;
                        break;
                    case 3:
                        panComunPC_AC.Visible = true;
                        panPC_Sala.Visible = true;
                        break;
                    case 11:
                        panComunPC_AC.Visible = true;
                        panPC_Sala.Visible = true;
                        break;
                    case 4:
                        panRR.Visible = true;
                        break;
                    case 6:
                        panComunPC_AC.Visible = true;
                        panRF_Sala.Visible = true;
                        break;
                    case 7:
                        panComunPC_AC.Visible = true;
                        panRF_Sala.Visible = true;
                        break;
                    case 9:
                        panF1.Visible = true;
                        break;
                    case 12:
                        panF1.Visible = true;
                        break;
                    case 15:
                        panF1.Visible = true;
                        break;
                    case 13:
                        panFR.Visible = true;
                        break;
                    case 14:
                        panFR.Visible = true;
                        break;
                    case 8: //gts
                        panComunPC_AC.Visible = true;
                        panGTS.Visible = true;
                        break;
                    default:
                        panIRacing.Visible = true;
                        break;
                }
            }
            catch (Exception)
            {

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
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                t.FillByID(ds.EVENTOS_ETAPAS, int.Parse(Request.QueryString["ed"].ToString()));
                if (ds.EVENTOS_ETAPAS.Count > 0)
                {
                    DL.EventosDSTableAdapters.EVENTOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                    te.FillByID(ds.EVENTOS, ds.EVENTOS_ETAPAS[0].IDEVENTO);

                    DL.EventosDS.EVENTOS_ETAPASRow f = ds.EVENTOS_ETAPAS[0];
                    cbCircuito.SelectedValue = f.IDJUEGOCIRCUITO.ToString();
                    tFecha.Text = f.FECHA.ToShortDateString();
                    tInfo.Text = f.INFORMACION;

                    if (ds.EVENTOS[0].IDJUEGO == 2 || ds.EVENTOS[0].IDJUEGO == 3 || ds.EVENTOS[0].IDJUEGO == 7 || ds.EVENTOS[0].IDJUEGO == 6 || ds.EVENTOS[0].IDJUEGO == 11)
                    {
                        tPC_PRACTICA.Text = f.PRACTICASTIEMPO;
                        tPC_CLASIFICACION.Text = f.CUALITIEMPO;
                        if (!f.IsPC_CALENTAMIENTONull()) tPC_CALENTAMIENTO.Text = f.PC_CALENTAMIENTO;
                        tPC_CARRERA_T.Text = f.CARRERATIEMPO;
                        tPC_CARRERA_V.Text = f.CARRERAVUELTAS;
                        if (ds.EVENTOS[0].IDJUEGO == 3 || ds.EVENTOS[0].IDJUEGO == 11)
                        {
                            if (!f.IsPC_ESPACIOS_METNull()) tPC_ESP_MET.Text = f.PC_ESPACIOS_MET;
                            if (!f.IsPC_METNull()) tPC_MET.Text = f.PC_MET;
                            if (!f.IsPC_PROGRESION_METNull()) tPC_PROG_MET.Text = f.PC_PROGRESION_MET;
                            if (!f.IsPC_TIPOFECHANull()) tPC_TIPO_FECHA.Text = f.PC_TIPOFECHA;
                            if (!f.IsPC_PROGRESION_TIEMPONull()) tPC_PROG_TIEMPO.Text = f.PC_PROGRESION_TIEMPO;
                            if (!f.IsPC_CLASE_COCHENull()) tPC_CLASE_COCHE.Text = f.PC_CLASE_COCHE;
                            if (!f.IsPC_STOP_PITSNull()) tPC_PITS.Text = f.PC_STOP_PITS;
                            if (!f.IsPC_SALIDA_LANZADANull()) tPC_SALIDA.Text = f.PC_SALIDA_LANZADA;
                            if (!f.IsPC_VISTA_INTERIORNull()) tPC_VISTA_INT.Text = f.PC_VISTA_INTERIOR;
                            if (!f.IsPC_MARCHAS_MANUALESNull()) tPC_MARCHAS_MAN.Text = f.PC_MARCHAS_MANUALES;
                            if (!f.IsPC_AYUDAS_REALISTASNull()) tPC_AYUDAS.Text = f.PC_AYUDAS_REALISTAS;
                            if (!f.IsPC_ABSNull()) tPC_ABS.Text = f.PC_ABS;
                            if (!f.IsPC_ESPNull()) tPC_ESP.Text = f.PC_ESP;
                            if (!f.IsPC_CTNull()) tPC_CT.Text = f.PC_CT;
                            if (!f.IsPC_CONF_FUERZANull()) tPC_FUERZA.Text = f.PC_CONF_FUERZA;
                            if (!f.IsPC_DANOSNull()) tPC_DANOS.Text = f.PC_DANOS;
                            if (!f.IsPC_FALLOS_MECNull()) tPC_FALLOS.Text = f.PC_FALLOS_MEC;
                            if (!f.IsPC_DESGASTENull()) tPC_DESGASTE.Text = f.PC_DESGASTE;
                            if (!f.IsPC_COMBUSTIBLENull()) tPC_COMBUSTIBLE.Text = f.PC_COMBUSTIBLE;
                            if (!f.IsPC_ARRANQUE_AUTONull()) tPC_ARRANQUE.Text = f.PC_ARRANQUE_AUTO;
                            if (!f.IsPC_BANDERASNull()) tPC_BANDERAS.Text = f.PC_BANDERAS;
                            if (!f.IsPC_TRANSPARENTENull()) tPC_TRANSP.Text = f.PC_TRANSPARENTE;
                            if (!f.IsPC_HORANull()) tHora.Text = f.PC_HORA;
                        }
                        else if (ds.EVENTOS[0].IDJUEGO == 2)
                        {
                            if (!f.IsAC_CLIMANull()) tAC_CLIMA.Text = f.AC_CLIMA;
                            if (!f.IsAC_TEMP_AMBNull()) tAC_TEMP.Text = f.AC_TEMP_AMB;
                            if (!f.IsAC_PISTANull()) tAC_PISTA.Text = f.AC_PISTA;
                            if (!f.IsAC_AUTOEMBRAGUENull()) tAC_EMBRAGUE.Text = f.AC_AUTOEMBRAGUE;
                            if (!f.IsAC_CTNull()) tAC_CT.Text = f.AC_CT;
                            if (!f.IsAC_ABSNull()) tAC_ABS.Text = f.AC_ABS;
                            if (!f.IsAC_ESPNull()) tAC_ESP.Text = f.AC_ESP;
                            if (!f.IsAC_CALENTADORESNull()) tAC_CALENTADORES.Text = f.AC_CALENTADORES;
                            if (!f.IsAC_COMBUSTIBLENull()) tAC_COMBUSTIBLE.Text = f.AC_COMBUSTIBLE;
                            if (!f.IsAC_DANOSNull()) tAC_DAÑOS.Text = f.AC_DANOS;
                            if (!f.IsAC_DESGASTENull()) tAC_DESGASTE.Text = f.AC_DESGASTE;
                            if (!f.IsAC_PENALIZACIONNull()) tAC_PENALIZACION.Text = f.AC_PENALIZACION;
                            if (!f.IsAC_LIMITE_CLASIFNull()) tAC_LIMITE.Text = f.AC_LIMITE_CLASIF;
                            if (!f.IsAC_HORANull()) tHora.Text = f.AC_HORA;
                        }
                        else
                        {
                            if (!f.IsRF_DANOSNull()) tRFDanos.Text = f.RF_DANOS;
                            if (!f.IsRF_DEPOSITONull()) tRFDeposito.Text = f.RF_DEPOSITO;
                            if (!f.IsRF_DESGASTENull()) tRFDesgaste.Text = f.RF_DESGASTE;
                            if (!f.IsRF_METEONull()) tRFMeteo.Text = f.RF_METEO;
                            if (!f.IsRF_PASSNull()) tRFPass.Text = f.RF_PASS;
                            if (!f.IsRF_PISTANull()) tRFEstado.Text = f.RF_PISTA;
                            if (!f.IsRF_ROADNull()) tRFReal.Text = f.RF_ROAD;
                            if (!f.IsRF_SERVIDORNull()) tRFServidor.Text = f.RF_SERVIDOR;
                            if (!f.IsRF_VERSIONNull()) tRFVersion.Text = f.RF_VERSION;
                            if (!f.IsAC_HORANull()) tHora.Text = f.AC_HORA;
                        }
                    }
                    else if (ds.EVENTOS[0].IDJUEGO == 9 || ds.EVENTOS[0].IDJUEGO == 12 || ds.EVENTOS[0].IDJUEGO == 15)
                    {
                        tHora.Text = f.HORAPRACTICAS.Replace("<", "").Replace(">", "");
                        if (!f.IsF1_ANTIBLOQUEONull()) tF1Frenos.SelectedIndex = f.F1_ANTIBLOQUEO;
                        if (!f.IsF1_ARRANQUENull()) tF1Arranque.Text = f.F1_ARRANQUE;
                        if (!f.IsF1_BOXESNull()) tF1Box.SelectedIndex = f.F1_BOXES;
                        if (!f.IsF1_CAMBIOSNull()) tF1Caja.Text = f.F1_CAMBIOS;
                        if (!f.IsF1_CLIMANull()) tF1Clima.Text = f.F1_CLIMA;
                        if (!f.IsF1_CLIMA_INICIONull()) tF1ClimaInicio.Text = f.F1_CLIMA_INICIO;
                        if (!f.IsF1_COCHE_SEGNull()) tF1Coche.SelectedIndex = f.F1_COCHE_SEG;
                        if (!f.IsF1_COLISIONESNull()) tF1Colisiones.SelectedIndex = f.F1_COLISIONES;
                        if (!f.IsF1_CTNull()) tF1CT.SelectedIndex = f.F1_CT;
                        if (!f.IsF1_DANOSNull()) tF1Daños.Text = f.F1_DANOS;
                        if (!f.IsF1_DISTANCIA_CARRERANull()) tF1Distancia.Text = f.F1_DISTANCIA_CARRERA;
                        if (!f.IsF1_FERMENull()) tF1Ferme.SelectedIndex = f.F1_FERME;
                        if (!f.IsF1_FRENADANull()) tF1Frenada.SelectedIndex = f.F1_FRENADA;
                        if (!f.IsF1_RENDIMIENTONull()) tF1Rendimiento.Text = f.F1_RENDIMIENTO;
                        if (!f.IsF1_SALTA_CURVASNull()) tF1Curvas.Text = f.F1_SALTA_CURVAS;
                        if (!f.IsF1_TIEMPO_CLASIFNull()) tF1TiempoClasif.Text = f.F1_TIEMPO_CLASIF;
                        if (!f.IsF1_TIPO_ENTRENNull()) tF1TipoEntre.Text = f.F1_TIPO_ENTREN;
                        if (!f.IsF1_TRAZADANull()) tF1Trazada.SelectedIndex = f.F1_TRAZADA;
                        if (!f.IsF1_VUELTA_FORMNull()) tF1Vuelta.SelectedIndex = f.F1_VUELTA_FORM;
                    }
                    else if (ds.EVENTOS[0].IDJUEGO == 4)
                    {
                        tRRPracticas.Text = f.PRACTICASTIEMPO;
                        tRRCuali.Text = f.CUALITIEMPO;
                        tRRCarrera.Text = f.CARRERATIEMPO;
                        cbRRPracticasPeriodo.SelectedIndex = f.PRACTICASPERIODODIA;
                        cbRRCualiPeriodo.SelectedIndex = f.CUALIPERIODODIA;
                        cbRRCarreraPeriodo.SelectedIndex = f.CARRERAPERIODODIA;
                        tHora.Text = f.HORAPRACTICAS.Replace("<", "").Replace(">", "");
                        if (!f.IsRR_REVERSENull()) tRRReverse.Text = f.RR_REVERSE;
                        if (!f.IsRR_TIRE_WEARNull()) cbRRTireWear.SelectedIndex = f.RR_TIRE_WEAR; else cbRRTireWear.SelectedIndex = 0;
                        if (!f.IsRR_MECHANICAL_DAMAGENull()) cbRRMechDamage.SelectedIndex = f.RR_MECHANICAL_DAMAGE; else cbRRMechDamage.SelectedIndex = 0;
                        if (!f.IsRR_FLAG_RULESNull()) cbRRFlags.SelectedIndex = f.RR_FLAG_RULES; else cbRRFlags.SelectedIndex = 0;
                        if (!f.IsRR_KICK_CLIENTSNull()) cbRRKick.SelectedIndex = f.RR_KICK_CLIENTS; else cbRRKick.SelectedIndex = 0;
                        if (!f.IsRR_MANDATORY_PITSTOPNull()) cbRRMandPit.SelectedIndex = f.RR_MANDATORY_PITSTOP; else cbRRMandPit.SelectedIndex = 0;
                        if (!f.IsRR_STAY_INPRACTICENull()) cbRRStayInPractice.SelectedIndex = f.RR_STAY_INPRACTICE; else cbRRStayInPractice.SelectedIndex = 0;
                        if (!f.IsRR_DIFFICULTYNull()) cbRRDif.SelectedIndex = f.RR_DIFFICULTY; else cbRRDif.SelectedIndex = 0;
                        if (!f.IsRR_FUEL_USAGENull()) cbRRFuel.SelectedIndex = f.RR_FUEL_USAGE; else cbRRFuel.SelectedIndex = 0;
                        if (!f.IsRR_VISUAL_DAMAGENull()) cbRRVisDam.SelectedIndex = f.RR_VISUAL_DAMAGE; else cbRRVisDam.SelectedIndex = 0;
                        if (!f.IsRR_RACE_FINISHNull()) cbRRRaceFin.SelectedIndex = f.RR_RACE_FINISH; else cbRRRaceFin.SelectedIndex = 0;
                        if (!f.IsRR_CUT_RULESNull()) cbRRCutRules.SelectedIndex = f.RR_CUT_RULES; else cbRRCutRules.SelectedIndex = 0;
                        if (!f.IsRR_WRECKERNull()) cbRRWrecker.SelectedIndex = f.RR_WRECKER; else cbRRWrecker.SelectedIndex = 0;
                        if (!f.IsRR_NONREADY_PITLANENull()) tRRNonReady.Text = f.RR_NONREADY_PITLANE;
                        if (!f.IsRR_ALLOW_QUALYNull()) cbRRAllowQuali.SelectedIndex = f.RR_ALLOW_QUALY; else cbRRAllowQuali.SelectedIndex = 0;
                    }
                    else if (ds.EVENTOS[0].IDJUEGO == 13 || ds.EVENTOS[0].IDJUEGO == 14)
                    {
                        tFR_Apertura.Text = f.FR_APERTURA;
                        tFR_Quali.Text = f.HORACUALIFICACION;
                        tFR_QualiVueltas.Text=f.CUALIVUELTAS ;
                        tFR_Retraso.Text=f.FR_RETRASO ;
                        tFR_Manga1.Text=f.FR_MANGA1;
                        tFR_Manga2.Text=f.FR_MANGA2;
                        tFR_Clima1.Text=f.FR_CLIMA_M1 ;
                        tfrmid1.Text = f.FR_CLIMAMID_ESCENARIO_M1;
                        tfrporcmid1.Text = f.FR_CLIMAMID_PORC_M1;
                        tfrend1.Text = f.FR_CLIMAEND_M1;
                        tfrporcend1.Text = f.FR_CLIMAEND_PORC_M1;
                        tFR_Clima2.Text=f.FR_CLIMA_M2 ;
                        tfrmid2.Text = f.FR_CLIMAMID_ESCENARIO_M2;
                        tfrporcmid2.Text = f.FR_CLIMAMID_PORC_M2;
                        tfrend2.Text = f.FR_CLIMAEND_M2;
                        tfrporcend2.Text = f.FR_CLIMAEND_PORC_M2;
                        tFR_Tuneo.Text=f.FR_TUNEO ;
                        tFR_Piezas.Text=f.FR_PIEZAS ;
                        tFR_Daños.Text=f.FR_DAÑOS ;
                        tFR_Ayudas.Text=f.FR_AYUDAS ;
                        tFR_Embrague.Text=f.FR_EMBRAGUE ;
                        tFR_Vista.Text=f.FR_VISTA ;
                        tFR_Pitstops.Text=f.FR_PITSTOPS;
                        tFR_Colision.Text=f.FR_COLISION;
                        tFR_Salida.Text=f.FR_SALIDA ;
                        tFR_Traccion.Text=f.FR_TRACCION;
                        tFR_Handicap.Text=f.FR_HANDICAP;
                        tFR_Agarre.Text=f.FR_AGARRE;
                        
                        tHora.Text = f.HORACARRERA;
                    }
                    else if (ds.EVENTOS[0].IDJUEGO == 8) //GTS
                    {
                        tPC_PRACTICA.Text = f.PRACTICASTIEMPO;
                        tPC_CLASIFICACION.Text = f.CUALITIEMPO;
                        if (!f.IsPC_CALENTAMIENTONull()) tPC_CALENTAMIENTO.Text = f.PC_CALENTAMIENTO;
                        tPC_CARRERA_T.Text = f.CARRERATIEMPO;
                        tPC_CARRERA_V.Text = f.CARRERAVUELTAS;
                        tGT_CLIMA.Text = f.AC_CLIMA;
                        tGT_ABS.Text = f.GT_ABS;
                        tGT_AGARRE.Text = f.GT_AGARRE;
                        tGT_ASM.Text = f.GT_ASM;
                        tGT_ATAJO.Text = f.GT_ATAJO;
                        tGT_BANDERAS.Text = f.GT_BANDERAS;
                        tGT_CLAS_NEUM_MAX.Text = f.GT_CLAS_NEUM_MAX;
                        tGT_CLAS_NEUM_MIN.Text = f.GT_CLAS_NEUM_MIN;
                        tGT_COMBUSTIBLE.Text = f.GT_COMBUSTIBLE;
                        tGT_COMB_INICIAL.Text = f.GT_COMB_INICIAL;
                        tGT_CONFIG.Text = f.GT_CONFIG;
                        tGT_CONTRAVOLANTE.Text = f.GT_CONTRAVOLANTE;
                        tGT_DANOS.Text = f.GT_DANOS;
                        tGT_DANOS_MEC.Text = f.GT_DANOS_MEC;
                        tGT_DETEC_MURO.Text = f.GT_DETEC_MURO;
                        tGT_DISENOS.Text = f.GT_DISENOS;
                        tGT_FANTASMAS.Text = f.GT_FANTASMAS;
                        if (!f.IsGT_FANTASMA_DOBLADONull()) tGT_FANTASMAS_DOBLADOS.Text = f.GT_FANTASMA_DOBLADO;
                        tGT_IMPULSO.Text = f.GT_IMPULSO;
                        tGT_KART.Text = f.GT_KART;
                        tGT_LATERAL.Text = f.GT_LATERAL;
                        tGT_LIMITE_POT.Text = f.GT_LIMITE_POT;
                        tGT_MODO_SALA.Text = f.GT_MODO_SALA;
                        tGT_MURO.Text = f.GT_MURO;
                        tGT_NEUMATICOS.Text = f.GT_NEUMATICOS;
                        tGT_PARRILLA.Text = f.GT_PARRILLA;
                        tGT_PESO.Text = f.GT_PESO;
                        tGT_PILOT_AIT.Text = f.GT_PILOTO_AUT;
                        tGT_REBUFO.Text = f.GT_REBUFO;
                        tGT_RENDIMIENTO.Text = f.GT_RENDIMIENTO;
                        tGT_REPOSICIONAR.Text = f.GT_REPOSICIONAR;
                        tGT_TCS.Text = f.GT_TCS;
                        tGT_TIEMPOFIN.Text = f.GT_TIEMPOFIN;
                        tGT_TIPO_NUM_COCHE.Text = f.GT_TIPO_NUM_COCHE;
                        tGT_TIPO_SALIDA.Text = f.GT_TIPO_SALIDA;
                        tGT_TRAYECTORIA.Text = f.GT_TRAYECTORIA;
                        tGT_TRAZADA.Text = f.GT_TRAZADA;
                        tGT_CLIMA.Text = f.AC_CLIMA;
                        tHora.Text = f.HORACARRERA;
                    }
                    else
                    {
                        tHora.Text = f.HORAPRACTICAS;
                        tDuracionPracticas.Text = f.PRACTICASTIEMPO;
                        //tHoraCuali.Text = f.HORACUALIFICACION;
                        //tVueltasCuali.Text = f.CUALIVUELTAS;
                        tDuracionCuali.Text = f.CUALITIEMPO;
                        tHoraCarrera.Text = f.HORACARRERA;
                        tDuracionCarrera.Text = f.CARRERATIEMPO;
                        tVueltasCarrera.Text = f.CARRERAVUELTAS;
                        //cbPeriodoPracticas.SelectedIndex = f.PRACTICASPERIODODIA;
                        //cbPeriodoCuali.SelectedIndex = f.CUALIPERIODODIA;
                        cbPeriodoCarrera.SelectedIndex = f.CARRERAPERIODODIA;
                        //chPracticasDinamico.Checked = f.PRACTICASDINAMICO;
                        //chPracticasLLuvia.Checked = f.PRACTICASLLUVIA;
                        //chCualiDinamico.Checked = f.CUALIDINAMICO;
                        //chCualiLluvia.Checked = f.CUALILLUVIA;
                        //chCarreraDinamico.Checked = f.CARRERADINAMICO;
                        //chCarreraLLuvia.Checked = f.CARRERALLUVIA;
                        tEstadoPista.Text = f.ESTADOPISTA;
                        tDeposito.Text = f.PORCDEPOSITO.ToString();
                        if (!f.IsIR_CLIMANull())
                            tIRClima.Text = f.IR_CLIMA;
                        if (!f.IsSALIDANull())
                            cbTipoSalida.SelectedIndex = f.SALIDA;
                        else
                            cbTipoSalida.SelectedIndex = 0;
                        if (!f.IsFASTREPAIRSNull())
                            cbFastRepairs.SelectedIndex = f.FASTREPAIRS;
                        else
                            cbFastRepairs.SelectedIndex = 0;
                        if (!f.IsCAUTIONSNull())
                            cbCautions.SelectedIndex = f.CAUTIONS;
                        else
                            cbCautions.SelectedIndex = 0;
                        if (!f.IsINCIDENTESNull())
                            tNumIncidentes.Text = f.INCIDENTES.ToString();
                        else
                            tNumIncidentes.Text = "17";
                        if (!f.IsAYUDASNull())
                            cbAyudas.SelectedIndex = f.AYUDAS;
                        else
                            cbAyudas.SelectedIndex = 0;
                    }


                    if (!f.IsURLMODNull())
                        tMod.Text = f.URLMOD;
                    if (!f.IsURLEMISIONTVNull())
                        tTV.Text = f.URLEMISIONTV;

                    DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter t2 = new DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter();
                    t2.FillByIDEVENTOETAPA(ds.EVENTO_ETAPAS_COCHES, f.ID);
                    foreach (ListItem elto in chListCoches.Items)
                    {
                        foreach (DL.EventosDS.EVENTO_ETAPAS_COCHESRow coche in ds.EVENTO_ETAPAS_COCHES)
                            if (coche.IDJUEGOCOCHE.ToString() == elto.Value)
                                elto.Selected = true;
                    }
                    bool hay = cn.HayInscritos(int.Parse(Request.QueryString["id"].ToString()));
                    if (hay)
                    {
                        chListCoches.Enabled = false;
                        cbCircuito.Enabled = false;
                        lblcoches.Visible = true;
                        lblaviso.Visible = true;
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
                panerror.Visible = false;
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.EVENTOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                te.FillByID(ds.EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                System.Globalization.CultureInfo cultureinfo = new System.Globalization.CultureInfo("es-ES");
                if (DateTime.Parse(tFecha.Text) >= ds.EVENTOS[0].FECHAINI && DateTime.Parse(tFecha.Text) <= ds.EVENTOS[0].FECHAFIN)
                {
                    lblmsg2b.Text = Resources.Global.errorfecha;
                    panerror.Visible = true;
                    return;
                }
                DL.EventosDS.EVENTOS_ETAPASRow f;
                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter tc = new DL.EventosDSTableAdapters.EVENTO_ETAPAS_COCHESTableAdapter();
                if (Request.QueryString["ed"] == null)
                    f = ds.EVENTOS_ETAPAS.NewEVENTOS_ETAPASRow();
                else
                {
                    t.FillByID(ds.EVENTOS_ETAPAS, int.Parse(Request.QueryString["ed"].ToString()));
                    f = ds.EVENTOS_ETAPAS[0];
                }
                f.IDJUEGOCIRCUITO = int.Parse(cbCircuito.SelectedValue.ToString());
                f.FECHA = DateTime.Parse(tFecha.Text);
                f.INFORMACION = tInfo.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.HORAPRACTICAS = tHora.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PRACTICASTIEMPO = tDuracionPracticas.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                //f.HORACUALIFICACION = tHoraCuali.Text.Replace("<","").Replace(">", "").Replace("'", "");
                //f.CUALIVUELTAS = tVueltasCuali.Text.Replace("<","").Replace(">", "").Replace("'", "");
                f.CUALITIEMPO = tDuracionCuali.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.HORACARRERA = tHoraCarrera.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.CARRERAVUELTAS = tVueltasCarrera.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.CARRERATIEMPO = tDuracionCarrera.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.IDEVENTO = int.Parse(Request.QueryString["id"].ToString());
                //f.PRACTICASPERIODODIA = cbPeriodoPracticas.SelectedIndex;
                //f.CUALIPERIODODIA = cbPeriodoCuali.SelectedIndex;
                f.CARRERAPERIODODIA = cbPeriodoCarrera.SelectedIndex;
                //f.PRACTICASDINAMICO = chPracticasDinamico.Checked;
                //f.PRACTICASLLUVIA = chPracticasLLuvia.Checked;
                //f.CUALIDINAMICO = chCualiDinamico.Checked;
                //f.CUALILLUVIA = chCualiLluvia.Checked;
                //f.CARRERADINAMICO = chCarreraDinamico.Checked;
                //f.CARRERALLUVIA = chCarreraLLuvia.Checked;
                f.PORCDEPOSITO = int.Parse(tDeposito.Text.Replace("<", "").Replace(">", "").Replace("'", ""));
                f.SALIDA = cbTipoSalida.SelectedIndex;
                f.FASTREPAIRS = cbFastRepairs.SelectedIndex;
                f.CAUTIONS = cbCautions.SelectedIndex;
                f.INCIDENTES = tNumIncidentes.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AYUDAS = cbAyudas.SelectedIndex;
                f.URLMOD = tMod.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.URLEMISIONTV = tTV.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.IR_CLIMA = tIRClima.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.ESTADOPISTA = tEstadoPista.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                if (panComunPC_AC.Visible)
                {
                    f.PRACTICASTIEMPO = tPC_PRACTICA.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.CUALITIEMPO = tPC_CLASIFICACION.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.CARRERATIEMPO = tPC_CARRERA_T.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.CARRERAVUELTAS = tPC_CARRERA_V.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.HORACARRERA = tHora.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                }
                if (panF1.Visible) f.HORACARRERA = tHora.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_CALENTAMIENTO = tPC_CALENTAMIENTO.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_ESPACIOS_MET = tPC_ESP_MET.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_MET = tPC_MET.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_PROGRESION_MET = tPC_PROG_MET.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_TIPOFECHA = tPC_TIPO_FECHA.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_PROGRESION_TIEMPO = tPC_PROG_TIEMPO.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_CLASE_COCHE = tPC_CLASE_COCHE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_STOP_PITS = tPC_PITS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_SALIDA_LANZADA = tPC_SALIDA.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_VISTA_INTERIOR = tPC_VISTA_INT.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_MARCHAS_MANUALES = tPC_MARCHAS_MAN.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_AYUDAS_REALISTAS = tPC_AYUDAS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_ABS = tPC_ABS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_ESP = tPC_ESP.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_CT = tPC_CT.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_CONF_FUERZA = tPC_FUERZA.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_DANOS = tPC_DANOS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_FALLOS_MEC = tPC_FALLOS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_DESGASTE = tPC_DESGASTE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_COMBUSTIBLE = tPC_COMBUSTIBLE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_ARRANQUE_AUTO = tPC_ARRANQUE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_BANDERAS = tPC_BANDERAS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_TRANSPARENTE = tPC_TRANSP.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_CLIMA = tAC_CLIMA.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_TEMP_AMB = tAC_TEMP.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_PISTA = tAC_PISTA.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_AUTOEMBRAGUE = tAC_EMBRAGUE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_CT = tAC_CT.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_ABS = tAC_ABS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_ESP = tAC_ESP.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_CALENTADORES = tAC_CALENTADORES.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_COMBUSTIBLE = tAC_COMBUSTIBLE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_DANOS = tAC_DAÑOS.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_DESGASTE = tAC_DESGASTE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_PENALIZACION = tAC_PENALIZACION.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_LIMITE_CLASIF = tAC_LIMITE.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.PC_HORA = tHora.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.AC_HORA = tHora.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_ANTIBLOQUEO = tF1Frenos.SelectedIndex;
                f.F1_ARRANQUE = tF1Arranque.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_BOXES = tF1Box.SelectedIndex;
                f.F1_CAMBIOS = tF1Caja.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_CLIMA = tF1Clima.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_CLIMA_INICIO = tF1ClimaInicio.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_COCHE_SEG = tF1Coche.SelectedIndex;
                f.F1_COLISIONES = tF1Colisiones.SelectedIndex;
                f.F1_CT = tF1CT.SelectedIndex;
                f.F1_DANOS = tF1Daños.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_DISTANCIA_CARRERA = tF1Distancia.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_FERME = tF1Ferme.SelectedIndex;
                f.F1_FRENADA = tF1Frenada.SelectedIndex;
                f.F1_RENDIMIENTO = tF1Rendimiento.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_SALTA_CURVAS = tF1Curvas.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_TIEMPO_CLASIF = tF1TiempoClasif.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_TIPO_ENTREN = tF1TipoEntre.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.F1_TRAZADA = tF1Trazada.SelectedIndex;
                f.F1_VUELTA_FORM = tF1Vuelta.SelectedIndex;
                f.RF_DANOS = tRFDanos.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_DEPOSITO = tRFDeposito.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_DESGASTE = tRFDesgaste.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_METEO = tRFMeteo.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_PASS = tRFPass.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_PISTA = tRFEstado.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_ROAD = tRFReal.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_SERVIDOR = tRFServidor.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                f.RF_VERSION = tRFVersion.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                if (panRR.Visible)
                {
                    f.PRACTICASTIEMPO = tRRPracticas.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.CUALITIEMPO = tRRCuali.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.CARRERATIEMPO = tRRCarrera.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.HORACARRERA = tHora.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.CARRERAPERIODODIA = cbRRCarreraPeriodo.SelectedIndex;
                    f.PRACTICASPERIODODIA = cbRRPracticasPeriodo.SelectedIndex;
                    f.CUALIPERIODODIA = cbRRCualiPeriodo.SelectedIndex;
                }
                f.RR_REVERSE = tRRReverse.Text;
                f.RR_TIRE_WEAR = cbRRTireWear.SelectedIndex;
                f.RR_MECHANICAL_DAMAGE = cbRRMechDamage.SelectedIndex;
                f.RR_FLAG_RULES = cbRRFlags.SelectedIndex;
                f.RR_KICK_CLIENTS = cbRRKick.SelectedIndex;
                f.RR_MANDATORY_PITSTOP = cbRRMandPit.SelectedIndex;
                f.RR_STAY_INPRACTICE = cbRRStayInPractice.SelectedIndex;
                f.RR_DIFFICULTY = cbRRDif.SelectedIndex;
                f.RR_FUEL_USAGE = cbRRFuel.SelectedIndex;
                f.RR_VISUAL_DAMAGE = cbRRVisDam.SelectedIndex;
                f.RR_RACE_FINISH = cbRRRaceFin.SelectedIndex;
                f.RR_CUT_RULES = cbRRCutRules.SelectedIndex;
                f.RR_WRECKER = cbRRWrecker.SelectedIndex;
                f.RR_NONREADY_PITLANE = tRRNonReady.Text;
                f.RR_ALLOW_QUALY = cbRRAllowQuali.SelectedIndex;
                if (panFR.Visible)
                {
                    f.FR_APERTURA = tFR_Apertura.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.HORACUALIFICACION = tFR_Quali.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.CUALIVUELTAS = tFR_QualiVueltas.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_RETRASO = tFR_Retraso.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_MANGA1 = tFR_Manga1.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_MANGA2 = tFR_Manga2.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_CLIMA_M1 = tFR_Clima1.Text.Replace("<", "").Replace(">", "").Replace("'", "");

                    f.FR_CLIMAMID_ESCENARIO_M1=tfrmid1.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_CLIMAMID_PORC_M1=tfrporcmid1.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_CLIMAEND_M1=tfrend1.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_CLIMAEND_PORC_M1=tfrporcend1.Text.Replace("<", "").Replace(">", "").Replace("'", "");

                    f.FR_CLIMA_M2 = tFR_Clima2.Text.Replace("<", "").Replace(">", "").Replace("'", "");

                    f.FR_CLIMAMID_ESCENARIO_M2=tfrmid2.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_CLIMAMID_PORC_M2=tfrporcmid2.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_CLIMAEND_M2=tfrend2.Text.Replace("<", "").Replace(">", "").Replace("'", "");
                    f.FR_CLIMAEND_PORC_M2=tfrporcend2.Text.Replace("<", "").Replace(">", "").Replace("'", "");

                    f.HORACARRERA = tHora.Text;
                }
                f.FR_TUNEO = tFR_Tuneo.Text;
                f.FR_PIEZAS = tFR_Piezas.Text;
                f.FR_DAÑOS = tFR_Daños.Text;
                f.FR_AYUDAS = tFR_Ayudas.Text;
                f.FR_EMBRAGUE = tFR_Embrague.Text;
                f.FR_VISTA = tFR_Vista.Text;
                f.FR_PITSTOPS = tFR_Pitstops.Text;
                f.FR_COLISION = tFR_Colision.Text;
                f.FR_SALIDA = tFR_Salida.Text;
                f.FR_TRACCION = tFR_Traccion.Text;
                f.FR_HANDICAP = tFR_Handicap.Text;
                f.FR_AGARRE = tFR_Agarre.Text;

                if (panGTS.Visible)
                {
                    f.GT_ABS = tGT_ABS.Text;
                    f.GT_AGARRE = tGT_AGARRE.Text;
                    f.GT_ASM = tGT_ASM.Text;
                    f.GT_ATAJO = tGT_ATAJO.Text;
                    f.GT_BANDERAS = tGT_BANDERAS.Text;
                    f.GT_CLAS_NEUM_MAX = tGT_CLAS_NEUM_MAX.Text;
                    f.GT_CLAS_NEUM_MIN = tGT_CLAS_NEUM_MIN.Text;
                    f.GT_COMBUSTIBLE = tGT_COMBUSTIBLE.Text;
                    f.GT_COMB_INICIAL = tGT_COMB_INICIAL.Text;
                    f.GT_CONFIG = tGT_CONFIG.Text;
                    f.GT_CONTRAVOLANTE = tGT_CONTRAVOLANTE.Text;
                    f.GT_DANOS = tGT_DANOS.Text;
                    f.GT_DANOS_MEC = tGT_DANOS_MEC.Text;
                    f.GT_DETEC_MURO = tGT_DETEC_MURO.Text;
                    f.GT_DISENOS = tGT_DISENOS.Text;
                    f.GT_FANTASMAS = tGT_FANTASMAS.Text;
                    f.GT_FANTASMA_DOBLADO = tGT_FANTASMAS_DOBLADOS.Text;
                    f.GT_IMPULSO = tGT_IMPULSO.Text;
                    f.GT_KART = tGT_KART.Text;
                    f.GT_LATERAL = tGT_LATERAL.Text;
                    f.GT_LIMITE_POT = tGT_LIMITE_POT.Text;
                    f.GT_MODO_SALA = tGT_MODO_SALA.Text;
                    f.GT_MURO = tGT_MURO.Text;
                    f.GT_NEUMATICOS = tGT_NEUMATICOS.Text;
                    f.GT_PARRILLA = tGT_PARRILLA.Text;
                    f.GT_PESO = tGT_PESO.Text;
                    f.GT_PILOTO_AUT = tGT_PILOT_AIT.Text;
                    f.GT_REBUFO = tGT_REBUFO.Text;
                    f.GT_RENDIMIENTO = tGT_RENDIMIENTO.Text;
                    f.GT_REPOSICIONAR = tGT_REPOSICIONAR.Text;
                    f.GT_TCS = tGT_TCS.Text;
                    f.GT_TIEMPOFIN = tGT_TIEMPOFIN.Text;
                    f.GT_TIPO_NUM_COCHE = tGT_TIPO_NUM_COCHE.Text;
                    f.GT_TIPO_SALIDA = tGT_TIPO_SALIDA.Text;
                    f.GT_TRAYECTORIA = tGT_TRAYECTORIA.Text;
                    f.GT_TRAZADA = tGT_TRAZADA.Text;
                    f.AC_CLIMA = tGT_CLIMA.Text;
                }
                bool hay = cn.HayInscritos(int.Parse(Request.QueryString["id"].ToString()));
                if (Request.QueryString["ed"] == null)
                    ds.EVENTOS_ETAPAS.AddEVENTOS_ETAPASRow(f);
                else
                {
                    if (!hay) tc.BorrarTodosCochesEtapa(f.ID);
                }

                List<ListItem> selected = chListCoches.Items.Cast<ListItem>()
                .Where(li => li.Selected)
                .ToList();

                if (!hay)
                {
                    if (selected.Count > 0)
                    {
                        t.Update(ds);
                        foreach (ListItem l in selected)
                        {
                            tc.Insert(f.ID, int.Parse(l.Value.ToString()));
                        }

                        Limpia();
                        Response.Redirect("circuitos.aspx?id=" + int.Parse(Request.QueryString["id"].ToString()) + "&o=0", false);
                    }
                    else
                    {
                        lblmsg2b.Text = Resources.Global.errorcoche;
                        panerror.Visible = true;
                        return;

                    }
                }
                else
                {
                    t.Update(ds);
                    Limpia();
                    Response.Redirect("circuitos.aspx?id=" + int.Parse(Request.QueryString["id"].ToString()) + "&o=0", false);
                }
            }
            catch (Exception ex)
            {
                panerror.Visible = true;
                return;
            }
        }

        private void Limpia()
        {
            try
            {
                tFecha.Text = "";
                cbCircuito.SelectedIndex = 0;
                tHoraCarrera.Text = "";
                //tHoraCuali.Text = "";
                //tHoraPracticas.Text = "";
                tDuracionCarrera.Text = "";
                tDuracionCuali.Text = "";
                tDuracionPracticas.Text = "";
                tVueltasCarrera.Text = "";
                tIRClima.Text = "";
                //tVueltasCuali.Text = "";
                tInfo.Text = "";
                cbPeriodoCarrera.SelectedIndex = 0;
                //cbPeriodoCuali.SelectedIndex = 0;
                //cbPeriodoPracticas.SelectedIndex = 0;
                //chCarreraDinamico.Checked = false;
                //chCarreraLLuvia.Checked = false;
                //chCualiDinamico.Checked = false;
                //chCualiLluvia.Checked = false;
                tDeposito.Text = "";
                chListCoches.ClearSelection();
                panCircuitos.Visible = false;
            }
            catch (Exception)
            {
            }
        }

        protected void lnkNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("circuitos.aspx?id=" + Request.QueryString["id"].ToString() + "&n=1", false);
        }

        protected void tFiniEvento_CalendarExtender_Load(object sender, EventArgs e)
        {
            try
            {
                String format = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
                tFiniEvento_CalendarExtender.Format = format;

            }
            catch (Exception)
            {

            }
        }
    }
}