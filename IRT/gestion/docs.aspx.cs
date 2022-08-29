using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class docs : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        DL.EventosDS ds = new DL.EventosDS();
        DL.EventosDSTableAdapters.V_ADJUNTOSTableAdapter t = new DL.EventosDSTableAdapters.V_ADJUNTOSTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.IsNewSession) Response.Redirect("salir.aspx");
            if (Request.QueryString["id"] != null)
            {
                if (!cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) && !(bool)Session["super"])
                    Response.Redirect("inicio.aspx");
                else
                {
                    t.FillByIDEVENTO(ds.V_ADJUNTOS, int.Parse(Request.QueryString["id"].ToString()));
                    dgAdj.DataSource = ds;
                    dgAdj.DataMember = "V_ADJUNTOS";
                    dgAdj.DataBind();
                }
            }
            else
                Response.Redirect("inicio.aspx", false);
        }

        protected void dgAdj_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                if (File.Exists(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/docs/" + e.Values[0].ToString())))
                {
                    File.Delete(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/docs/" + e.Values[0].ToString()));

                }
                cn.EliminaAdjunto(int.Parse(e.Keys[0].ToString()));
                t.FillByIDEVENTO(ds.V_ADJUNTOS, int.Parse(Request.QueryString["id"].ToString()));
                dgAdj.DataSource = ds;
                dgAdj.DataMember = "V_ADJUNTOS";
                dgAdj.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void bAdj_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Directory.Exists(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString())))
                    Directory.CreateDirectory(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString()));
                if (!Directory.Exists(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/docs")))
                    Directory.CreateDirectory(Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/docs"));

                string filepath = Server.MapPath("../Content/img/eventos/" + Request.QueryString["id"].ToString() + "/docs/");
                HttpFileCollection uploadedFiles = Request.Files;
                DL.EventosDSTableAdapters.EVENTOS_ADJUNTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOS_ADJUNTOSTableAdapter();

                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];

                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {
                            userPostedFile.SaveAs(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                            t.Insert(int.Parse(Request.QueryString["id"].ToString()), filepath + "\\" + Path.GetFileName(userPostedFile.FileName), Path.GetFileName(userPostedFile.FileName), int.Parse(cbTipo.SelectedValue.ToString()));
                        }
                    }
                    catch (Exception Ex)
                    {
                    }
                }
                Response.Redirect("docs.aspx?id=" + Request.QueryString["id"].ToString(), false);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}