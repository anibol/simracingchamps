using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace IRT.gestion
{
    public partial class sponsors : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.IsNewSession) Response.Redirect("salir.aspx");
        }

        protected void dgAdj_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                if (File.Exists(Server.MapPath("../Content/img/sponsors/" + Session["idu"].ToString()  + "/" + e.Values[0].ToString())))
                {
                    File.Delete(Server.MapPath("../Content/img/sponsors/" + Session["idu"].ToString() + "/" + e.Values[0].ToString()));
                    DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter t = new DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter();
                    t.BorrarId(int.Parse(e.Keys[0].ToString()));
                    DL.EventosDSTableAdapters.EVENTOS_SPONSORTableAdapter t2 = new DL.EventosDSTableAdapters.EVENTOS_SPONSORTableAdapter();
                    t2.BorrarIdSponsor(int.Parse(e.Keys[0].ToString()));
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string DameRuta(object sender)
        {
            try
            {
                return "../Content/img/sponsors/" + Session["idu"].ToString() + "/" + sender.ToString();
            }
            catch (Exception)
            {
                return "";
            }
        }

        protected void bAdj_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Directory.Exists(Server.MapPath("../Content/img/sponsors/" + Session["idu"].ToString())))
                    Directory.CreateDirectory(Server.MapPath("../Content/img/sponsors/" + Session["idu"].ToString()));

                string filepath = Server.MapPath("../Content/img/sponsors/" + Session["idu"].ToString());
                HttpFileCollection uploadedFiles = Request.Files;
                DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter t = new DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter();

                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];

                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {
                            if (File.Exists(filepath + "\\" + Path.GetFileName(userPostedFile.FileName)))
                            {
                                File.Delete(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                            }
                            userPostedFile.SaveAs(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                            t.Insert(tNombre.Text, filepath + "\\" + Path.GetFileName(userPostedFile.FileName), Guid.Parse(Session["idu"].ToString()), Path.GetFileName(userPostedFile.FileName), tUrl.Text);
                        }
                    }
                    catch (Exception Ex)
                    {
                    }
                }
                objAdj.DataBind();
                dgAdj.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}