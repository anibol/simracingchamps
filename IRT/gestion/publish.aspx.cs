using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace IRT.gestion
{
    public partial class publish : System.Web.UI.Page
    {
        public string patrocinadores = "", cartel = "", carreras = "";
        Models.EventosCN cn = new Models.EventosCN();
        protected void bPublicar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                t.CambiaPublicado(true, int.Parse(Request.QueryString["id"].ToString()));
                cn.SendContacto("info@simracingchamps.net", Session["NombrePersona"].ToString(), "Publicado campeonato ID=" + Request.QueryString["id"].ToString());             
                Response.Redirect("inicio.aspx");
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx?e=99");
            }
        }

        protected void bCancelarPublicacion_Click(object sender, EventArgs e)
        {
            try
            {
                DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
                t.CambiaPublicado(false, int.Parse(Request.QueryString["id"].ToString()));
                cn.SendContacto("info@simracingchamps.net", Session["NombrePersona"].ToString(), "Cancelado campeonato ID=" + Request.QueryString["id"].ToString());
                Response.Redirect("inicio.aspx");
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx?e=99");
            }
        }

        public bool correcto = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            DL.EventosDS ds = new DL.EventosDS();
            DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
            try
            {
                bool ccartel = false, ccarreras = false, cpatrocinador = false;
                if (Request.QueryString["id"] == null)
                    Response.Redirect("inicio.aspx");
                else
                {
                    if (!cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) && !(bool)Session["super"])
                    {
                        Response.Redirect("inicio.aspx");
                    }
                    t.FillByID(ds.EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                    if (ds.EVENTOS.Count == 1)
                    {
                        if (!ds.EVENTOS[0].PUBLICADO)
                        {
                            panPendientePublicar.Visible = true;



                            if (ds.EVENTOS[0].IsCARTELNull() || ds.EVENTOS[0].CARTEL == "")
                            {                                
                                cartel = "<span class='label label-danger'>" + GetLocalResourceObject("nocartel").ToString() + "</span>";
                                ccartel = false;
                            }
                            else
                            {
                                cartel = "<span class='label label-success'>" + GetLocalResourceObject("cartel").ToString() + "</span>";
                                ccartel = true;
                            }

                            DL.EventosDSTableAdapters.QueriesTableAdapter q = new DL.EventosDSTableAdapters.QueriesTableAdapter();
                            if ((int)q.CuentaEtapasEvento(int.Parse(Request.QueryString["id"].ToString())) == 0)
                            {
                                carreras = "<span class='label label-danger'>" + GetLocalResourceObject("nocarreras").ToString() + "</span>";
                                ccarreras = false;
                            }
                            else
                            {
                                carreras = "<span class='label label-success'>" + GetLocalResourceObject("carreras").ToString() + "</span>";
                                ccarreras = true;
                            }
                            if ((int)q.CuentaSponsorsEvento(int.Parse(Request.QueryString["id"].ToString())) == 0)
                            {
                                patrocinadores = "<span class='label label-warning'>" + GetLocalResourceObject("nosponsor").ToString() + "</span> (Este punto no impide que puedas publicar tu campeonato)";
                                cpatrocinador = false;
                            }
                            else
                            {
                                patrocinadores = "<span class='label label-success'>" + GetLocalResourceObject("sponsor").ToString() + "</span>";
                                cpatrocinador = true;
                            }
                            correcto = ccartel && ccarreras;

                        }
                        if (ds.EVENTOS[0].PUBLICADO && !ds.EVENTOS[0].VALIDADO)
                        {
                            panPendienteValidar.Visible = true;
                            panCancelarPublicación.Visible = true;
                        }
                        if (ds.EVENTOS[0].PUBLICADO && ds.EVENTOS[0].VALIDADO)
                        {
                            panCancelarPublicación.Visible = true;
                        }
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx?e=99", false);
            }
        }
    }
}