using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT.gestion
{
    public partial class noticias : System.Web.UI.Page
    {
        public string fotoactual1 = "", fotoactual2 = "", fotoactual3 = "", fotoactual4 = "", fotoactual5 = "", fotoactual6 = "", fotoactual7 = "", fotoactual8 = "";
        DL.NoticiasDS ds = new DL.NoticiasDS();
        Models.EventosCN cn = new Models.EventosCN();
        DL.NoticiasDSTableAdapters.NOTICIASTableAdapter t = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                if (Session.IsNewSession) Response.Redirect("salir.aspx");
                if (!IsPostBack)
                {
                    if (cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                    {
                        t.FillByIDEVENTO(ds.NOTICIAS, int.Parse(Request.QueryString["id"].ToString()));
                        repNoticias.DataSource = ds;
                        repNoticias.DataMember = "NOTICIAS";
                        repNoticias.DataBind();
                    }

                    if (Request.QueryString["ed"] != null && Request.QueryString["id"] != null)
                        Editar();
                    if (Request.QueryString["n"] != null && Request.QueryString["id"] != null)
                        Nuevo();
                    if (Request.QueryString["o"] != null)
                        lblmsg.Visible = true;
                    if (Request.QueryString["v"] != null && Request.QueryString["id"] != null)
                        Validar(Request.QueryString["id"]);
                }
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx?e=0");
            }
        }

        private void Validar(string id)
        {
           
                try
                {
                    DL.NoticiasDSTableAdapters.NOTICIASTableAdapter t = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
                    Models.EventosCN cn = new Models.EventosCN();
                    DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["ev"].ToString()));

                    if ((int)t.CambiaValidada(true, int.Parse(Request.QueryString["id"].ToString())) > 0)
                    {
                        string usuario = cn.DameEmailUsuario(evento.IDUSUARIO.ToString());
                        cn.SendNotificacion(Properties.Settings.Default.DireccionCorreo, usuario,evento.EVENTO, "Tu noticia ha sido validada y ya está publicada.");
                        Response.Redirect("noticias.aspx?id=" + Request.QueryString["id"].ToString() + "&o=0", false);
                    }

                }
                catch (Exception)
                {

                    throw;
                }
           
        }

        private void Nuevo()
        {
            try
            {
                panDatos.Visible = true;
            }
            catch (Exception)
            {

            }
        }

        protected void bPreview_Click(object sender, EventArgs e)
        {
            
        }

        protected void bPreview_Click1(object sender, EventArgs e)
        {

        }

        private void Editar()
        {
            try
            {
                if (cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                {
                    bBorrar.Visible = true;
                    bPreview.Visible = true;
                    panDatos.Visible = true;
                    DL.NoticiasDS ds = new DL.NoticiasDS();
                    DL.NoticiasDSTableAdapters.NOTICIASTableAdapter t = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
                    t.FillByID(ds.NOTICIAS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(Request.QueryString["ed"].ToString()));

                    if (ds.NOTICIAS.Count > 0)
                    {
                        bPreview.PostBackUrl = "http://simracingchamps.net/noticia.aspx?id=" + Request.QueryString["ed"].ToString() + "&ev=" + Request.QueryString["id"].ToString();
                        DL.NoticiasDS.NOTICIASRow f = ds.NOTICIAS[0];
                        tTitulo.Text = f.TITULO;
                        tDescripcion.Text = f.TEXTO;
                        tVideo.Text = f.VIDEO;
                        bPublicar.Visible = true;
                        if (!f.IsPUBLICADANull() && f.PUBLICADA)
                            bPublicar.Text = "Cancelar Publicación";
                        if (!f.IsIMAGENNull())
                            fotoactual1 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN + "' />";
                        if (!f.IsIMAGEN2Null())
                            fotoactual2 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN2 + "' />";
                        if (!f.IsIMAGEN3Null())
                            fotoactual3 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN3 + "' />";
                        if (!f.IsIMAGEN4Null())
                            fotoactual4 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN4 + "' />";
                        if (!f.IsIMAGEN5Null())
                            fotoactual5 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN5 + "' />";
                        if (!f.IsIMAGEN6Null())
                            fotoactual6 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN6 + "' />";
                        if (!f.IsIMAGEN7Null())
                            fotoactual7 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN7 + "' />";
                        if (!f.IsIMAGEN8Null())
                            fotoactual8 = "<img style='height:80px;width:auto;max-width:200px;' src='../Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN8 + "' />";
                    }
                    else
                        panerror.Visible = true;
                }
            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }

        protected void bGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] == null)
                    Response.Redirect("inicio.aspx");
                else
                {
                    DL.NoticiasDS ds = new DL.NoticiasDS();
                    DL.NoticiasDSTableAdapters.NOTICIASTableAdapter t = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
                    DL.NoticiasDS.NOTICIASRow f;
                    if (Request.QueryString["ed"] == null)
                        f = ds.NOTICIAS.NewNOTICIASRow();
                    else
                    {
                        t.FillByID(ds.NOTICIAS, int.Parse(Request.QueryString["id"].ToString()), int.Parse(Request.QueryString["ed"].ToString()));
                        f = ds.NOTICIAS[0];
                        f.VALIDADA = false;
                    }
                    f.TITULO = tTitulo.Text;
                    f.TEXTO = tDescripcion.Text;
                    f.AUTOR = Session["NombrePersona"].ToString();
                    f.FECHA = DateTime.Now;
                    f.VIDEO = tVideo.Text;
                    f.VALIDADA = false;
                    f.PUBLICADA = false;
                    f.IDEVENTO = int.Parse(Request.QueryString["id"].ToString());

                    if (Request.QueryString["ed"] == null)
                    {
                        if (f.VIDEO != "")
                            f.TEXTO += "<p>" + Youtube(f.VIDEO) + "</p>";
                        ds.NOTICIAS.AddNOTICIASRow(f);
                    }
                    t.Update(ds);
                    if (fuFoto1.HasFile)
                    {
                        if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                            Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                        try
                        {
                            string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                            try
                            {
                                if (File.Exists(ruta + "\\" + fuFoto1.FileName))
                                    File.Delete(ruta + "\\" + fuFoto1.FileName);
                            }
                            catch (Exception)
                            {
                            }

                            fuFoto1.SaveAs(ruta + "\\" + cn.RemoveSpecialCharacters(fuFoto1.FileName));
                            //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                            f.IMAGEN = cn.RemoveSpecialCharacters(fuFoto1.FileName);
                        }
                        catch (Exception ex)
                        {
                            Response.Redirect("noticias.aspx?e=e1", false);
                        }
                    }
                    if (fuFoto2.HasFile)
                    {
                        if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                            Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                        try
                        {
                            string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                            try
                            {
                                if (File.Exists(ruta + "/" + fuFoto2.FileName))
                                    File.Delete(ruta + "/" + fuFoto2.FileName);
                            }
                            catch (Exception)
                            {
                            }

                            fuFoto2.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuFoto2.FileName));
                            //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                            f.IMAGEN2 = cn.RemoveSpecialCharacters(fuFoto2.FileName);
                        }
                        catch (Exception ex)
                        {
                            Response.Redirect("noticias.aspx?e=e1", false);
                        }
                        if (fuFoto3.HasFile)
                        {
                            if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                                Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                            try
                            {
                                string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                                try
                                {
                                    if (File.Exists(ruta + "/" + fuFoto3.FileName))
                                        File.Delete(ruta + "/" + fuFoto3.FileName);
                                }
                                catch (Exception)
                                {
                                }

                                fuFoto3.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuFoto3.FileName));
                                //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                                f.IMAGEN3 = cn.RemoveSpecialCharacters(fuFoto3.FileName);
                            }
                            catch (Exception ex)
                            {
                                Response.Redirect("noticias.aspx?e=e1", false);
                            }
                        }
                        if (fuFoto4.HasFile)
                        {
                            if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                                Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                            try
                            {
                                string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                                try
                                {
                                    if (File.Exists(ruta + "/" + fuFoto4.FileName))
                                        File.Delete(ruta + "/" + fuFoto4.FileName);
                                }
                                catch (Exception)
                                {
                                }

                                fuFoto4.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuFoto4.FileName));
                                //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                                f.IMAGEN4 = cn.RemoveSpecialCharacters(fuFoto4.FileName);
                            }
                            catch (Exception ex)
                            {
                                Response.Redirect("noticias.aspx?e=e1", false);
                            }
                        }
                        if (fuFoto5.HasFile)
                        {
                            if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                                Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                            try
                            {
                                string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                                try
                                {
                                    if (File.Exists(ruta + "/" + fuFoto5.FileName))
                                        File.Delete(ruta + "/" + fuFoto5.FileName);
                                }
                                catch (Exception)
                                {
                                }

                                fuFoto5.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuFoto5.FileName));
                                //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                                f.IMAGEN5 = cn.RemoveSpecialCharacters(fuFoto5.FileName);
                            }
                            catch (Exception ex)
                            {
                                Response.Redirect("noticias.aspx?e=e1", false);
                            }
                        }
                        if (fuFoto6.HasFile)
                        {
                            if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                                Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                            try
                            {
                                string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                                try
                                {
                                    if (File.Exists(ruta + "/" + fuFoto6.FileName))
                                        File.Delete(ruta + "/" + fuFoto6.FileName);
                                }
                                catch (Exception)
                                {
                                }

                                fuFoto6.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuFoto6.FileName));
                                //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                                f.IMAGEN6 = cn.RemoveSpecialCharacters(fuFoto6.FileName);
                            }
                            catch (Exception ex)
                            {
                                Response.Redirect("noticias.aspx?e=e1", false);
                            }
                        }
                        if (fuFoto7.HasFile)
                        {
                            if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                                Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                            try
                            {
                                string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                                try
                                {
                                    if (File.Exists(ruta + "/" + fuFoto7.FileName))
                                        File.Delete(ruta + "/" + fuFoto7.FileName);
                                }
                                catch (Exception)
                                {
                                }

                                fuFoto7.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuFoto7.FileName));
                                //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                                f.IMAGEN7 = cn.RemoveSpecialCharacters(fuFoto7.FileName);
                            }
                            catch (Exception ex)
                            {
                                Response.Redirect("noticias.aspx?e=e1", false);
                            }
                        }
                        if (fuFoto8.HasFile)
                        {
                            if (!Directory.Exists(Server.MapPath("../Content/img/noticias/" + f.ID.ToString())))
                                Directory.CreateDirectory(Server.MapPath("../Content/img/noticias/" + f.ID.ToString()));
                            try
                            {
                                string ruta = Server.MapPath("../Content/img/noticias/" + f.ID.ToString());
                                try
                                {
                                    if (File.Exists(ruta + "/" + fuFoto8.FileName))
                                        File.Delete(ruta + "/" + fuFoto8.FileName);
                                }
                                catch (Exception)
                                {
                                }

                                fuFoto8.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuFoto8.FileName));
                                //cn.ResizeImage(ruta + "/" + fUpload.FileName);
                                f.IMAGEN8 = cn.RemoveSpecialCharacters(fuFoto8.FileName);
                            }
                            catch (Exception ex)
                            {
                                Response.Redirect("noticias.aspx?e=e1", false);
                            }
                        }
                    }
                    if (!f.IsIMAGENNull()) f.TEXTO=f.TEXTO.Replace("[IMAGEN1]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN + "'>");
                    if (!f.IsIMAGEN2Null()) f.TEXTO = f.TEXTO.Replace("[IMAGEN2]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN2 + "'>");
                    if (!f.IsIMAGEN3Null()) f.TEXTO = f.TEXTO.Replace("[IMAGEN3]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN3 + "'>");
                    if (!f.IsIMAGEN4Null()) f.TEXTO = f.TEXTO.Replace("[IMAGEN4]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN4 + "'>");
                    if (!f.IsIMAGEN5Null()) f.TEXTO = f.TEXTO.Replace("[IMAGEN5]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN5 + "'>");
                    if (!f.IsIMAGEN6Null()) f.TEXTO = f.TEXTO.Replace("[IMAGEN6]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN6 + "'>");
                    if (!f.IsIMAGEN7Null()) f.TEXTO = f.TEXTO.Replace("[IMAGEN7]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN7 + "'>");
                    if (!f.IsIMAGEN8Null()) f.TEXTO = f.TEXTO.Replace("[IMAGEN8]", "<img src='http://simracingchamps.net/Content/img/noticias/" + f.ID.ToString() + "/" + f.IMAGEN8 + "'>");

                    t.Update(f);
                    Limpia();
                    Response.Redirect("noticias.aspx?ev=" + f.IDEVENTO.ToString() + "&o=0", false);
                }

            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }

        public string DameEstado(object publicada, object validada)
        {
            try
            {
                if (publicada.ToString() == "False")
                    return "<label class='label label-info label-xs'>Pdte. Publicar</label>";
                else
                {
                    if (validada.ToString() == "False")
                        return "<label class='label label-warning label-xs'>Pdte. Validar</label>";
                    else
                        return "<label class='label label-success label-xs'>Publicada</label>";
                }
            }
            catch (Exception)
            {
                return "<label class='label label-info label-xs'>Pdte. Publicar</label>";
            }
        }

        protected void bPublicar_Click(object sender, EventArgs e)
        {
            try
            {
                DL.NoticiasDSTableAdapters.NOTICIASTableAdapter t = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
                Models.EventosCN cn = new Models.EventosCN();
                DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(int.Parse(Request.QueryString["id"].ToString()));
                if (bPublicar.Text == "Publicar")
                {
                    if ((int)t.CambiaPublicada(true, int.Parse(Request.QueryString["ed"].ToString())) > 0)
                    {

                        cn.SendContacto("info@simracingchamps.net", Session["NombrePersona"].ToString(), "Publicada noticia de " + evento.EVENTO);
                        Response.Redirect("noticias.aspx?id=" + Request.QueryString["id"].ToString() + "&o=0", false);
                    }
                }
                else
                {
                    if ((int)t.CambiaPublicada(false, int.Parse(Request.QueryString["ed"].ToString())) > 0)
                    {
                        cn.SendContacto("info@simracingchamps.net", Session["NombrePersona"].ToString(), "Despublicada noticia de " + evento.EVENTO);
                        Response.Redirect("noticias.aspx?id=" + Request.QueryString["id"].ToString() + "&o=0", false);
                    }
                }
            }
            catch (Exception)
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

        private void Limpia()
        {
            try
            {
                panDatos.Visible = false;
                tTitulo.Text = "";
                tDescripcion.Text = "";
                tVideo.Text = "";
            }
            catch (Exception)
            {
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (cn.EsMio(int.Parse(Request.QueryString["id"].ToString()), Session["idu"].ToString()) || (bool)Session["super"])
                {
                    DL.NoticiasDSTableAdapters.NOTICIASTableAdapter t = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
                    if ((int)t.BorrarID(int.Parse(Request.QueryString["ed"].ToString()), int.Parse(Request.QueryString["id"].ToString()), Guid.Parse(Session["idu"].ToString())) > 0)
                    {
                        Limpia();
                        Response.Redirect("noticias.aspx?o=0", false);
                    }
                    else
                    {
                        panerror.Visible = true;
                    }
                }
            }
            catch (Exception)
            {
                panerror.Visible = true;
            }
        }
    }
}