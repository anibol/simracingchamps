using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IRT
{
    public partial class noticia : System.Web.UI.Page
    {
        public string cartel = "", carrusel = "", titulo = "", correo="", twitter="", facebook="", youtube="";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    DL.NoticiasDS nds = new DL.NoticiasDS();
                    DL.NoticiasDS nds2 = new DL.NoticiasDS();
                    DL.NoticiasDSTableAdapters.NOTICIASTableAdapter tn = new DL.NoticiasDSTableAdapters.NOTICIASTableAdapter();
                    tn.FillByIDEVENTO(nds.NOTICIAS, int.Parse(Request.QueryString["ev"].ToString()));
                    tn.FillByIDNoticia(nds2.NOTICIAS, int.Parse(Request.QueryString["id"].ToString()));
                    if (nds.NOTICIAS.Count == 0)
                        Response.Redirect("eventos.aspx?id=" + Request.QueryString["ev"].ToString(), false);
                    else
                    {
                        repTodasNoticias.DataSource = nds;
                        repTodasNoticias.DataMember = "NOTICIAS";
                        repTodasNoticias.DataBind();
                        repNoticia.DataSource = nds2;
                        repNoticia.DataMember = "NOTICIAS";
                        repNoticia.DataBind();
                    }
                    Models.EventosCN cn = new Models.EventosCN();
                    DL.EventosDS.EVENTOSRow evento = cn.CargaEvento(nds2.NOTICIAS[0].IDEVENTO);
                    titulo = evento.EVENTO;
                    DL.EventosDS ds = new DL.EventosDS();
                    DL.EventosDSTableAdapters.V_EVENTOSTableAdapter ve = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
                    ve.FillByIDEVENTO(ds.V_EVENTOS, int.Parse(Request.QueryString["ev"].ToString()));
                    correo = ds.V_EVENTOS[0].USUARIO;
                    if (!ds.V_EVENTOS[0].IsTWITTERNull()) twitter = DameTwitter(ds.V_EVENTOS[0].TWITTER);
                    if (!ds.V_EVENTOS[0].IsFACEBOOKNull()) facebook = ds.V_EVENTOS[0].FACEBOOK;
                    if (!ds.V_EVENTOS[0].IsYOUTUBENull()) youtube = ds.V_EVENTOS[0].YOUTUBE;

                    if (evento.IsCARTELNull())
                        cartel = "assets/img/background/bg-1.jpg";
                    else
                        cartel = "Content/img/eventos/" + evento.ID.ToString() + "/" + evento.CARTEL;

                    carrusel = "<div class='item active'> " +
               "<img src = '" + cartel + "' alt='' > " +
               "<div class='carousel-caption'>  " +
                   "<h2 class='wow fadeInRight' data-wow-delay='300ms'>" + evento.EVENTO + "<br>" +
                       "</h2> " +
                   "<div class='buttons wow fadeInDown' data-wow-delay='0.2s'><a class='btn btn-lg btn-border' href='eventos.aspx?id=" + evento.ID + "'>Minisite</a></div> " +
               "</div> " +
           "</div>";
                }
            }
            catch (Exception ed)
            {

                throw;
            }
        }

        public string DameFotoNoticia(object id, object foto)
        {
            try
            {
                if (foto == null || foto.ToString() == "")
                    return "assets/img/background/bg-1.jpg";
                else
                    return "Content/img/noticias/" + id.ToString() + "/" + foto.ToString();
            }
            catch (Exception)
            {
                return "assets/img/background/bg-1.jpg";
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

        public string DameSocial()
        {
            try
            {
                string cad = "";
                if (correo != "") cad = "<a class='social' href='mailto:" + correo + "'><i class='fa fa-envelope'></i></a>&nbsp;";
                if (facebook != "") cad += "<a class='social' href='" + facebook + "' target='_blank'><i class='fa fa-facebook'></i></a>&nbsp;";
                if (twitter != "" && twitter != "http://twitter.com/" && twitter != "http://twitter.com") cad += "<a class='social' href='" + twitter + "' target='_blank'><i class='fa fa-twitter'></i></a>&nbsp;";
                if (youtube != "") cad += "<a class='social' href='" + youtube + "' target='_blank'><i class='fa fa-youtube'></i></a>&nbsp;";
                //<a class="social" href="#" target="_blank"><i class="fa fa-google-plus"></i></a>
                //<a class="social" href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                return cad;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public string Youtube(object video)
        {
            try
            {
                string url = video.ToString();
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
                return "";
            }

        }
    }

}