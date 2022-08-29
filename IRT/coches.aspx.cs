using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class coches : System.Web.UI.Page
    {
        public string nombreevento = "", organizador = "", logo = "", desde = "", hasta = "", cartel = "", visible = "hidden", mensaje = "", estilo = "success", informacion = "", cochescad = "";
        Models.EventosCN cn = new Models.EventosCN();
        Models.EventosDS ds = new Models.EventosDS();
        Models.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter t = new Models.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter();
        protected void bInscribir_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["iduinsc"] != null && Request.Form.Count > 0)
                {
                    int id = cn.InscribeUsuario2(Session["iduinsc"].ToString(), int.Parse(Request.QueryString["id"].ToString()));
                    if (id>0)
                    {
                        for (int i = 0; i <= Request.Form.Count - 1; i++)
                        {
                            if (Request.Form.Keys[i].ToString().IndexOf("cb-") != -1)
                            {
                                string[] aux = Request.Form.Keys[i].ToString().Split('-');
                                t.Insert(int.Parse(aux[1]), Guid.Parse(Session["iduinsc"].ToString()), int.Parse(Request.Form[i].ToString()), id);
                            }
                        }
                        Response.Redirect("evento.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=1");
                    }
                    else
                        Response.Redirect("evento.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=3");
                }
                else
                    Response.Redirect("evento.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=3");
            }
            catch (Exception)
            {

                throw;
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
                        mensaje = "Inscripción realizada";
                        visible = "visible";
                        estilo = "success";
                    }
                    else if (Request.QueryString["ok"].ToString() == "2")
                    {
                        mensaje = "Ya estás inscrito";
                        visible = "visible";
                        estilo = "warning";
                    }
                }
                Models.EventosDS ds = new Models.EventosDS();
                Models.EventosDSTableAdapters.V_EVENTOSTableAdapter ve = new Models.EventosDSTableAdapters.V_EVENTOSTableAdapter();
                Models.EventosDSTableAdapters.V_ETAPASTableAdapter vet = new Models.EventosDSTableAdapters.V_ETAPASTableAdapter();
                Models.EventosDSTableAdapters.V_ETAPAS_COCHESTableAdapter tc = new Models.EventosDSTableAdapters.V_ETAPAS_COCHESTableAdapter();

                ve.FillByIDEVENTO(ds.V_EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                if (ds.V_EVENTOS.Count > 0)
                {


                    if (!ds.V_EVENTOS[0].IsDESCRIPCIONNull()) informacion = ds.V_EVENTOS[0].DESCRIPCION;
                    nombreevento = ds.V_EVENTOS[0].EVENTO;
                    organizador = ds.V_EVENTOS[0].NOMBRE;
                    logo = "../Content/img/avatar/" + ds.V_EVENTOS[0].IDUSUARIO.ToString() + "/" + ds.V_EVENTOS[0].AVATAR;
                    cartel = "../Content/img/eventos/" + ds.V_EVENTOS[0].ID.ToString() + "/" + ds.V_EVENTOS[0].CARTEL;
                    vet.FillByIDEVENTO(ds.V_ETAPAS, ds.V_EVENTOS[0].ID);
                    desde = ds.V_EVENTOS[0].FECHAINI.ToShortDateString();
                    hasta = ds.V_EVENTOS[0].FECHAFIN.ToShortDateString();

                    vet.FillByIDEVENTO(ds.V_ETAPAS, int.Parse(Request.QueryString["id"].ToString()));
                    bool primero = false;
                    foreach (Models.EventosDS.V_ETAPASRow etapa in ds.V_ETAPAS)
                    {
                        cochescad += "<tr><td>" + etapa.FECHA.ToShortDateString() + "</td><td>" + etapa.CIRCUITO + "</td><td><select name='cb-" + etapa.ID.ToString() + "'>";
                        tc.Fill(ds.V_ETAPAS_COCHES, etapa.ID);
                        foreach (Models.EventosDS.V_ETAPAS_COCHESRow coche in ds.V_ETAPAS_COCHES)
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
                    if (informacion == "")
                    {
                        informacion = "Ven y disfruta del campeonato " + ds.EVENTOS[0].EVENTO + " formado por " + ds.V_ETAPAS.Count.ToString() + " carreras ";
                        if (ds.V_EVENTOS[0].NUMAX == 0)
                            informacion += " sin límite de inscripciones ";
                        else
                            informacion += " limitado a " + ds.V_EVENTOS[0].NUMAX.ToString() + " participantes ";
                        informacion += " y que dará transcurrirá desde el " + ds.V_ETAPAS[0].FECHA.ToLongDateString() + " al " + ds.V_ETAPAS[ds.V_ETAPAS.Count - 1].FECHA.ToLongDateString();
                    }
                }
                else
                    Response.Redirect("error.aspx?e=0");
            }
            catch (Exception)
            {
                Response.Redirect("error.aspx?e=0");
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
                return "mes";
            }
        }

        public string DameDuracion(object vueltas, object tiempo)
        {
            try
            {
                if (vueltas.ToString() == "0")
                    return tiempo.ToString() + " minutos";
                else
                    return vueltas.ToString() + " vueltas";

            }
            catch (Exception)
            {
                return "No especificado";
            }
        }
    }
}