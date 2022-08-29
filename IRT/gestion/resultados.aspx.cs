using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tweetinvi;
using Tweetinvi.Models;
using Tweetinvi.Parameters;

namespace IRT.gestion
{
    public partial class resultados : System.Web.UI.Page
    {
        public string clase = "btn-primary", widget = "";
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    var culture = System.Globalization.CultureInfo.CurrentCulture;
                    if (culture.TwoLetterISOLanguageName != "es")
                    {
                        cbDivision.DataTextField = "EN";
                        cbSplit.DataTextField = "EN";
                    }
                    if (cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                    {
                        DL.EventosDS ds = new DL.EventosDS();
                        DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                        if (evento.IDJUEGO == 4 && (bool)Session["super"])
                            panRR.Visible = true;
                        DL.EventosDSTableAdapters.V_ETAPASTableAdapter t = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
                        t.FillByIDEVENTO(ds.V_ETAPAS, int.Parse(Request.QueryString["id"].ToString()));
                        cbCarrera.DataSource = ds;
                        cbCarrera.DataMember = "V_ETAPAS";
                        cbCarrera.DataValueField = "ID";
                        cbCarrera.DataTextField = "CIRCUITO";
                        cbCarrera.DataBind();
                    }
                }


            }
            catch (Exception)
            {

                throw;
            }
        }

        public string DameChecked(object valor, object opcion)
        {
            try
            {
                if (valor.ToString() == opcion.ToString())
                    return "selected";
                else
                    return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string DamePosLlegada(object pos)
        {
            try
            {
                if (int.Parse(pos.ToString()) == 9999)
                    return "DNS";
                else if (int.Parse(pos.ToString()) == 8888)
                    return "RET";
                else if (int.Parse(pos.ToString()) == 7777)
                    return "DSQ";
                else
                    return pos.ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }

        protected void bCargar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    DL.EventosDS ds = new DL.EventosDS();
                    ds.EnforceConstraints = false;
                    DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter t = new DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter();
                    ds.V_RESULTADOS.Clear();
                    t.Fill(ds.V_RESULTADOS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()), int.Parse(cbCarrera.SelectedValue.ToString()));
                    if (ds.V_RESULTADOS.Count == 0)
                    {
                        //Insertamos valores 0
                        DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter ti = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
                        ti.FillByEventoDivSplit(ds.V_INSCRIPCIONES, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()));
                        DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter();
                        int idequipo = 0;
                        foreach (DL.EventosDS.V_INSCRIPCIONESRow inscrito in ds.V_INSCRIPCIONES)
                        {
                            if (inscrito.IsIDEQUIPONull())
                                idequipo = 0;
                            else
                                idequipo = inscrito.IDEQUIPO;
                            te.Insert(inscrito.ID, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbCarrera.SelectedValue.ToString()), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, idequipo, "");
                        }
                        t.Fill(ds.V_RESULTADOS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()), int.Parse(cbCarrera.SelectedValue.ToString()));
                    }
                    repResultados.DataSource = ds;
                    repResultados.DataMember = "V_RESULTADOS";
                    repResultados.DataBind();

                    if (cn.EtapaPublicada(int.Parse(cbCarrera.SelectedValue.ToString())))
                    {
                        bPublicar.Text = "Cancelar publicación";
                        clase = "btn-danger";
                    }
                    else
                    {
                        bPublicar.Text = "Publicar resultados";
                        clase = "btn-primary";
                    }


                }
                else
                    Response.Redirect("inicio.aspx", false);
            }
            catch (Exception)
            {

                throw;
            }
        }

        private DL.EventosDS.V_RESULTADOSRow DameFila(ref DL.EventosDS ds, int id)
        {
            foreach (DL.EventosDS.V_RESULTADOSRow fila in ds.V_RESULTADOS)
                if (fila.ID == id)
                    return fila;
            return null;
        }

        protected void bGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                lblmesg.Visible = false;
                DL.EventosDS ds = new DL.EventosDS();
                ds.EnforceConstraints = false;
                Models.EventosCN cn = new Models.EventosCN();
                DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter t2 = new DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter();
                t2.Fill(ds.V_RESULTADOS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()), int.Parse(cbCarrera.SelectedValue.ToString()));
                DL.EventosDS.V_RESULTADOSRow fila;
                DL.EventosDS.EVENTOSRow ev = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter();
                List<decimal> Puntos = cn.DamePuntos(int.Parse(Request.QueryString["id"].ToString()));
                if (Request.Form.Count > 0)
                {
                    for (int i = 0; i <= Request.Form.Count - 1; i++)
                    {

                        if (Request.Form.Keys[i].ToString().IndexOf("lle-") != -1)
                        {
                            string[] aux = Request.Form.Keys[i].ToString().Split('-');
                            fila = DameFila(ref ds, int.Parse(aux[1]));
                            if (Request.Form[i].ToString().ToUpper() != "DNS" && Request.Form[i].ToString().ToUpper() != "RET" && Request.Form[i].ToString().ToUpper() != "DSQ" && Request.Form[i].ToString().ToUpper() != "DNF")
                            {

                                if (ev.IDTABLA != 2)
                                {
                                    if (Request.Form[i].ToString() != "0" && int.Parse(Request.Form[i].ToString()) <= Puntos.Count)
                                        fila.PUNTOS = Puntos[int.Parse(Request.Form[i].ToString()) - 1];
                                    else
                                        fila.PUNTOS = 0;
                                }
                                else if (ev.IDTABLA == 2)
                                {
                                    if (int.Parse(Request.Form[i].ToString()) >= 4)
                                        fila.PUNTOS = 1;
                                    else if (int.Parse(Request.Form[i].ToString()) <= 3 && int.Parse(Request.Form[i].ToString()) >= 1)
                                        fila.PUNTOS = Puntos[int.Parse(Request.Form[i].ToString()) - 1];
                                    else if (int.Parse(Request.Form[i].ToString()) == 0)
                                        fila.PUNTOS = 0;
                                    else
                                        fila.PUNTOS = 0;
                                }
                                fila.POSLLEGADA = int.Parse(Request.Form[i].ToString());
                            }
                            else if (Request.Form[i].ToString().ToUpper() == "DSQ")
                            {
                                fila.PUNTOS = 0;
                                fila.POSLLEGADA = 7777;
                            }
                            else if (Request.Form[i].ToString().ToUpper() == "DNS")
                            {
                                fila.PUNTOS = 0;
                                fila.POSLLEGADA = 9999;
                            }
                            else if (Request.Form[i].ToString().ToUpper() == "RET" || Request.Form[i].ToString().ToUpper() == "DNF")
                            {
                                fila.PUNTOS = 0;
                                fila.POSLLEGADA = 8888;
                            }
                            //t.ActualizaPuntos(Puntos[int.Parse(Request.Form[i].ToString()) - 1], int.Parse(aux[1]));
                        }
                        if (Request.Form.Keys[i].ToString().IndexOf("lle2-") != -1)
                        {
                            string[] aux = Request.Form.Keys[i].ToString().Split('-');
                            fila = DameFila(ref ds, int.Parse(aux[1]));
                            if (Request.Form[i].ToString().ToUpper() != "DNS" && Request.Form[i].ToString().ToUpper() != "RET" && Request.Form[i].ToString().ToUpper() != "DSQ" && Request.Form[i].ToString().ToUpper() != "DNF")
                            {
                                fila.PUNTOS2 = 0;
                                if (ev.IDTABLA != 2)
                                {
                                    if (Request.Form[i].ToString() != "0" && int.Parse(Request.Form[i].ToString()) <= Puntos.Count)
                                        fila.PUNTOS2 = Puntos[int.Parse(Request.Form[i].ToString()) - 1];
                                    else
                                        fila.PUNTOS2 = 0;
                                }
                                else if (ev.IDTABLA == 2)
                                {
                                    if (int.Parse(Request.Form[i].ToString()) >= 4)
                                        fila.PUNTOS2 = 1;
                                    else if (int.Parse(Request.Form[i].ToString()) <= 3 && int.Parse(Request.Form[i].ToString()) >= 1)
                                        fila.PUNTOS2 = Puntos[int.Parse(Request.Form[i].ToString()) - 1];
                                    else if (int.Parse(Request.Form[i].ToString()) == 0)
                                        fila.PUNTOS2 = 0;
                                    else
                                        fila.PUNTOS2 = 0;
                                }
                                fila.POSLLEGADA2 = int.Parse(Request.Form[i].ToString());
                                fila.PUNTOS = fila.PUNTOS + fila.PUNTOS2;
                            }
                            else if (Request.Form[i].ToString().ToUpper() == "DSQ")
                            {
                                fila.PUNTOS2 = 0;
                                fila.POSLLEGADA2 = 7777;
                            }
                            else if (Request.Form[i].ToString().ToUpper() == "DNS")
                            {
                                fila.PUNTOS2 = 0;
                                fila.POSLLEGADA2 = 9999;
                            }
                            else if (Request.Form[i].ToString().ToUpper() == "RET" || Request.Form[i].ToString().ToUpper() == "DNF")
                            {
                                fila.PUNTOS2 = 0;
                                fila.POSLLEGADA2 = 8888;
                            }
                            //t.ActualizaPuntos(Puntos[int.Parse(Request.Form[i].ToString()) - 1], int.Parse(aux[1]));
                        }
                        if (Request.Form.Keys[i].ToString().IndexOf("sal-") != -1)
                        {
                            string[] aux = Request.Form.Keys[i].ToString().Split('-');
                            fila = DameFila(ref ds, int.Parse(aux[1]));
                            fila.POSSALIDA = int.Parse(Request.Form[i].ToString());
                        }
                        if (Request.Form.Keys[i].ToString().IndexOf("inc-") != -1)
                        {
                            string[] aux = Request.Form.Keys[i].ToString().Split('-');
                            fila = DameFila(ref ds, int.Parse(aux[1]));
                            if (Request.Form[i].ToString() != "") fila.INCIDENCIAS = int.Parse(Request.Form[i].ToString());
                        }
                        if (Request.Form.Keys[i].ToString().IndexOf("bon-") != -1)
                        {
                            string[] aux = Request.Form.Keys[i].ToString().Split('-');
                            fila = DameFila(ref ds, int.Parse(aux[1]));
                            if (Request.Form[i].ToString() != "")
                            {
                                fila.BONIFICACION = decimal.Parse(Request.Form[i].ToString());
                                fila.PUNTOS = fila.PUNTOS + fila.BONIFICACION;
                            }
                        }
                        if (Request.Form.Keys[i].ToString().IndexOf("vta-") != -1)
                        {
                            string[] aux = Request.Form.Keys[i].ToString().Split('-');
                            fila = DameFila(ref ds, int.Parse(aux[1]));
                            fila.VUELTARAPIDA = Request.Form[i].ToString();
                        }
                    }

                    t2.Update(ds.V_RESULTADOS);

                    DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter tv = new DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter();
                    ds.EnforceConstraints = false;
                    tv.Fill(ds.V_RESULTADOS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()), int.Parse(cbCarrera.SelectedValue.ToString()));
                    repResultados.DataBind();

                    lblmsg.Visible = true;
                    bCargar_Click(sender, e);
                }
            }
            catch (Exception EX)
            {

                lblmesg.Visible = true;
                lblmesg.Text = "Revisa los datos, los campos numéricos solo admiten números y RET/DSQ/DNS (solo la columna posición de llegada)";
            }
        }

        protected void bPublicar_Click(object sender, EventArgs e)
        {
            try
            {
                if (bPublicar.Text == "Cancelar publicación")
                {
                    cn.CambiaEtapaPublicada(int.Parse(cbCarrera.SelectedValue.ToString()), false);
                    bPublicar.Text = "Publicar resultados";
                    clase = "btn-primary";
                }
                else
                {
                    cn.CambiaEtapaPublicada(int.Parse(cbCarrera.SelectedValue.ToString()), true);
                    try
                    {
                        DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                        cn.SendContacto("info@simracingchamps.net", Session["NombrePersona"].ToString(), "Publicados resultados de " + evento.EVENTO);
                        PublicarTweet();
                    }
                    catch (Exception)
                    {
                    }
                    bPublicar.Text = "Cancelar publicación";
                    clase = "btn-danger";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string Top3(int idevento, int idetapa)
        {
            try
            {
                string cad = "";
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_TOP3TableAdapter t = new DL.EventosDSTableAdapters.V_TOP3TableAdapter();
                t.Fill(ds.V_TOP3, idevento, idetapa);
                int cont = 1;
                bool hay = false;
                foreach (DL.EventosDS.V_TOP3Row fila in ds.V_TOP3)
                {
                    cad += cont.ToString() + "º " + fila.PILOTO + Environment.NewLine;
                    cont++;
                }
                return cad;
            }
            catch (Exception)
            {
                return "";
            }
        }

        private void PublicarTweet()
        {
            try
            {
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDS.EVENTOSRow f = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                string top3 = Top3(f.ID, int.Parse(cbCarrera.SelectedValue.ToString()));
                if (top3.Trim() != "")
                {
                    Auth.SetUserCredentials("7FaIR9zhXUjc6wC9lcjZs1IC5", "bXBdeNZTmHIHHtC6XVqFsYKmr0BZTInfMWD9d6zSfTeGeXGlXc", "867421051000696832-4pDjUoqiPMgzqADKcavv3t1D5TqRNp5", "pDbsGGxQFhRFNmjhiqtoJ6FN4tlO1CDR4GcLTVIjt9xeU");
                    var user = Tweetinvi.User.GetAuthenticatedUser();
                    Tweet.PublishTweet("Publicados los resultados de la carrera '" + cbCarrera.SelectedItem.Text + "' del evento " + f.EVENTO + ":" + Environment.NewLine + top3 + Environment.NewLine + "Info:  http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString());
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter();
                t.BorrarIdEvento(int.Parse(Request.QueryString["id"].ToString()));
                DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter te = new DL.EventosDSTableAdapters.EVENTOS_ETAPASTableAdapter();
                te.DespublicaEtapas(int.Parse(Request.QueryString["id"].ToString()));
                DL.EventosDS ds = new DL.EventosDS();
                repResultados.DataSource = ds;
                repResultados.DataMember = "V_RESULTADOS";
                repResultados.DataBind();
                lblmsg.Visible = true;
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bImpRR_Click(object sender, EventArgs e)
        {
            try
            {

                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDS.EVENTOSRow ev = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                ds.EnforceConstraints = false;
                DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter t = new DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter();
                ds.V_RESULTADOS.Clear();
                List<decimal> Puntos = cn.DamePuntos(int.Parse(Request.QueryString["id"].ToString()));
                t.Fill(ds.V_RESULTADOS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()), int.Parse(cbCarrera.SelectedValue.ToString()));
                if (ds.V_RESULTADOS.Count == 0)
                {
                    //Insertamos valores 0
                    DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter ti = new DL.EventosDSTableAdapters.V_INSCRIPCIONESTableAdapter();
                    ti.FillByEventoDivSplit(ds.V_INSCRIPCIONES, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()));
                    DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter te = new DL.EventosDSTableAdapters.EVENTOS_RESULTADOSTableAdapter();
                    int idequipo = 0;
                    foreach (DL.EventosDS.V_INSCRIPCIONESRow inscrito in ds.V_INSCRIPCIONES)
                    {
                        if (inscrito.IsIDEQUIPONull())
                            idequipo = 0;
                        else
                            idequipo = inscrito.IDEQUIPO;
                        te.Insert(inscrito.ID, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbCarrera.SelectedValue.ToString()), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, idequipo, "");
                    }
                    t.Fill(ds.V_RESULTADOS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(cbDivision.SelectedValue.ToString()), int.Parse(cbSplit.SelectedValue.ToString()), int.Parse(cbCarrera.SelectedValue.ToString()));
                }

                if (fileRR.HasFile)
                {
                    if (!Directory.Exists(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString())))
                        Directory.CreateDirectory(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString()));
                    if (!Directory.Exists(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/json")))
                        Directory.CreateDirectory(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/json"));

                    string filepath = Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/json/");
                    HttpFileCollection uploadedFiles = Request.Files;

                    HttpPostedFile userPostedFile = uploadedFiles[0];
                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {
                            if (File.Exists(filepath + "\\" + Path.GetFileName(userPostedFile.FileName)))
                                File.Delete(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                            userPostedFile.SaveAs(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                            Newtonsoft.Json.JsonSerializer serializer = new Newtonsoft.Json.JsonSerializer();
                            JObject o1 = JObject.Parse(File.ReadAllText(filepath + "\\" + Path.GetFileName(userPostedFile.FileName)));
                            string username = "", posicion = "";
                            using (var reader = new JsonTextReader(new StringReader(o1.ToString())))
                            {
                                while (reader.Read())
                                {
                                    Console.WriteLine("{0} - {1} - {2}",
                                                      reader.TokenType, reader.ValueType, reader.Value);
                                    if (reader.Value.ToString() == "Username")
                                    {
                                        reader.Read();
                                        username = reader.Value.ToString();
                                        reader.Read();
                                        reader.Read();
                                        posicion = reader.Value.ToString();
                                        foreach (DL.EventosDS.V_RESULTADOSRow fila in ds.V_RESULTADOS)
                                        {
                                            if (!fila.IsRRIDNull() && fila.RRID == username)
                                            {
                                                fila.POSLLEGADA = int.Parse(posicion);
                                                if (ev.IDTABLA != 2)
                                                {
                                                    if (posicion.ToString() != "0" && int.Parse(posicion) <= Puntos.Count)
                                                        fila.PUNTOS = Puntos[int.Parse(posicion) - 1];
                                                    else
                                                        fila.PUNTOS = 0;
                                                }
                                                else if (ev.IDTABLA == 2)
                                                {
                                                    if (int.Parse(posicion) >= 4)
                                                        fila.PUNTOS = 1;
                                                    else if (int.Parse(posicion) <= 3 && int.Parse(posicion) >= 1)
                                                        fila.PUNTOS = Puntos[int.Parse(posicion) - 1];
                                                    else if (int.Parse(posicion) == 0)
                                                        fila.PUNTOS = 0;
                                                    else
                                                        fila.PUNTOS = 0;
                                                }
                                            }
                                        }
                                        username = "";
                                        posicion = "";
                                    }
                                }
                            }
                            DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter tres = new DL.EventosDSTableAdapters.V_RESULTADOSTableAdapter();
                            tres.Update(ds.V_RESULTADOS);
                            lblmesg.Text = "Datos guardados";
                            bCargar_Click(sender, e);
                        }
                    }
                    catch (Exception Ex)
                    {
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string DameAvatar(object avatar, object idusuario)
        {
            try
            {
                if (avatar.ToString() != "" && avatar.ToString() != "isracetime_user.jpg")
                    return "<img src='http://simracingchamps.net/Content/img/avatar/" + idusuario.ToString() + "/" + avatar.ToString() + "' style='height:40px;width:40px;vertical-align:middle;'>";
                else
                    return "<img src='http://simracingchamps.net/Content/img/avatar/isracetime_user.jpg' style='height:40px;width:40px;vertical-align:middle;'>";
            }
            catch (Exception)
            {
                return "<img src='http://simracingchamps.net/Content/img/avatar/isracetime_user.jpg' style='height:40px;width:40px;vertical-align:middle;'>";
            }
        }
    }
}