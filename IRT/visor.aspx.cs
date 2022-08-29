using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class visor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Resultado();
                //DL.EventosDS ds = new DL.EventosDS();
                //DL.EventosDSTableAdapters.V_EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
                //t.FillByIDEVENTO(ds.V_EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                //repProximosCampeonatos.DataSource = ds;
                //repProximosCampeonatos.DataMember = "V_EVENTOS";
                //repProximosCampeonatos.DataBind();
            }
            catch (Exception)
            {
                //Response.Redirect("default.aspx", false);
            }
        }

        private void Resultado()
        {
            Request.ValidateInput();
            try
            {
                Models.EventosCN cn = new Models.EventosCN();
                string Id = Request.QueryString["id"];
                bool solototal = false;
                if (Request.QueryString["t"] != null)
                    solototal = true;
                string scriptContent = "";
                string res=cn.ResultadosFinalWidget(int.Parse(Id),solototal);
                scriptContent = "document.write(\"" + res +  "\")";

                Response.Clear();
                Response.AddHeader("content-description", "SimRacingChamps.net");
                Response.AddHeader("content-type", "text/javascript");

                //Response.AddHeader("content-length", scriptContent.Length.ToString());
                Response.Write(scriptContent);
                Response.Flush();
                Response.End();

            }
            catch (Exception ex)
            {
            }
        }

        public string DameDuracion(object vueltas, object tiempo)
        {
            try
            {
                if (vueltas.ToString() == "0")
                    return tiempo.ToString() + " " + Resources.Global.duracion1;
                else
                    return vueltas.ToString() + " " + Resources.Global.duracion2;

            }
            catch (Exception)
            {
                return Resources.Global.vueltas;
            }
        }

        public string DameCircuito(object circ, object idlogo, object idfoto, int tipo = 0)
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
                        return "<img class='hidden-xs' alt='" + circuito.ToString() + "' style='height: 79px; width: 140px;' src='http://simracingchamps.net/Content/img/circuitos/" + idlogo.ToString() + ".jpg' />";
                    else if (idfoto != null && File.Exists(Server.MapPath("Content/img/circuitos/" + idfoto.ToString() + ".jpg")))
                        return "<img class='circuito hidden-xs' style='height: 79px; width: 140px;' alt='circuito' src='http://simracingchamps.net/Content/img/circuitos/" + idfoto.ToString() + ".jpg' />";
                    else
                        return cad;
                    //                    return "<img alt='" + circuito.ToString() + "' style='height: 79px; width: 140px;' src='Content/img/web/circuito.jpg' />";
                }
                else
                {
                    // style='width:98px;height:83px;' 
                    if (File.Exists(Server.MapPath("Content/img/circuitos/" + idlogo.ToString() + ".jpg")))
                        return "<img alt='' style='width:98px;height:83px;' src='http://simracingchamps.net/Content/img/circuitos/" + idlogo.ToString() + ".jpg' />";
                    else if (idfoto != null && File.Exists(Server.MapPath("Content/img/circuitos/" + idfoto.ToString() + ".jpg")))
                        return "<img alt='' style='width:98px;height:83px;' src='http://simracingchamps.net/Content/img/circuitos/" + idfoto.ToString() + ".jpg' />";
                    else
                        return "<img alt='' style='width:98px;height:83px;' src='http://simracingchamps.net/Content/img/web/circuito.jpg' />";
                }

            }
            catch (Exception)
            {
                if (tipo == 0)
                    return "<img alt='' class='hidden-xs' style='height: 79px; width: 140px;' src='http://simracingchamps.net/Content/img/web/circuito.jpg' />";
                else
                    return "<img alt='' style='width:98px;height:83px;' src='http://simracingchamps.net/Content/img/web/circuito.jpg' />";
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
                return "<img style='width:16px' src='http://simracingchamps.net/Content/img/flags/" + sender.ToString().Trim() + ".png'>";
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
                    return "http://twitter.com/" + sender.ToString().Replace("@", "");
                else if (sender.ToString().IndexOf("http") != -1)
                    return sender.ToString();
                else if (sender.ToString().IndexOf("http") == -1)
                    return "http://twitter.com/" + sender.ToString();
                else
                    return sender.ToString();
            }
            catch (Exception)
            {
                return Resources.Global.mes;
            }
        }
    }
}