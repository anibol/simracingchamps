using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class datos : System.Web.UI.Page
    {
        Models.EventosCN cn = new Models.EventosCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.Form.Count > 0)
                {
                    DL.UsuariosDSTableAdapters.USUARIOSTableAdapter t = new DL.UsuariosDSTableAdapters.USUARIOSTableAdapter();
                    DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter t2 = new DL.EventosDSTableAdapters.EVENTOS_INSCRIPCIONES_COCHESTableAdapter();
                    DL.UsuariosDS ds = new DL.UsuariosDS();
                    t.FillByIDUSUARIOPASS(ds.USUARIOS, Request.Form["tUser"].ToString(), cn.Encrypt(Request.Form["tPass"].ToString()));
                    if (ds.USUARIOS.Count == 1)
                    {
                        Models.EventosCN cn = new Models.EventosCN();
                        if (!cn.EstaInscrito(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString())))
                        {
                            //if (cn.EsMultiCoche(int.Parse(Request.QueryString["id"].ToString())))
                            //{
                            int id = cn.InscribeUsuario2(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString()), Request.QueryString["dorsal"].ToString(), Request.QueryString["fichero"].ToString());
                            if (id > 0)
                            {
                                //if (fuSkin.HasFile)
                                //{
                                //    if (!Directory.Exists(Server.MapPath("Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString())))
                                //        Directory.CreateDirectory(Server.MapPath("Content/img/avatar/" + ds.USUARIOS[0].ToString()));
                                //    try
                                //    {
                                //        string ruta = Server.MapPath("Content/img/avatar/" + ds.USUARIOS[0].IDUSUARIO.ToString());
                                //        try
                                //        {
                                //            if (File.Exists(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName)))
                                //                File.Delete(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName));
                                //        }
                                //        catch (Exception)
                                //        {
                                //        }
                                //        fuSkin.SaveAs(ruta + "/" + cn.RemoveSpecialCharacters(fuSkin.FileName));
                                //    }
                                //    catch (Exception)
                                //    {
                                //        Response.Redirect("inicio.aspx?e=e2");
                                //    }
                                //}
                                for (int i = 0; i <= Request.Form.Count - 1; i++)
                                {
                                    if (Request.Form.Keys[i].ToString().IndexOf("cb-") != -1)
                                    {
                                        string[] aux = Request.Form.Keys[i].ToString().Split('-');
                                        t2.Insert(int.Parse(aux[1]), ds.USUARIOS[0].IDUSUARIO, int.Parse(Request.Form[i].ToString()), id);
                                    }
                                }
                                Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=1#inscripcion");
                            }
                            else
                                Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=3#inscripcion");
                            //}
                            //else if (cn.InscribeUsuario(ds.USUARIOS[0].IDUSUARIO.ToString(), int.Parse(Request.QueryString["id"].ToString())))
                            //{
                            //    Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=1#inscripcion");
                            //}
                        }
                        else
                            Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=2#inscripcion");
                    }
                    else
                        Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=4#inscripcion");
                }
                else
                    Response.Redirect("eventos.aspx?id=" + Request.QueryString["id"].ToString() + "&ok=4#inscripcion");

                Response.Clear();
                Response.CacheControl = "no-cache";
                ////Use when you send data in XML   
                //Response.ContentType = "text/xml";
                ////Or use this content type when send json data
                Response.ContentType = "application/json";
                Response.Write("0");
                Response.End();
            }


            catch (Exception)
            {
                Response.Clear();
                Response.CacheControl = "no-cache";
                ////Use when you send data in XML   
                //Response.ContentType = "text/xml";
                ////Or use this content type when send json data
                Response.ContentType = "application/json";
                Response.Write("99");
                Response.End();
            }

        }
    }
}