using Google.Apis.Services;
using Google.Apis.Urlshortener.v1;
using System;
using System.Collections.Generic;
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
    public partial class validar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["usr"].ToString() == "admin@simracingchamps.net" && Request.QueryString["id"] != null && Request.QueryString["a"] != null)
                {
                    Models.EventosCN ecn = new Models.EventosCN();
                    if (ecn.EventoValidado(int.Parse(Request.QueryString["id"].ToString())))
                    {
                        bValidar1.Text="Cancelar validación";
                    }
                }
                else
                    Response.Redirect("inicio.aspx", true);
            }
            catch (Exception)
            {
                Response.Redirect("inicio.aspx");
            }

        }

        private string DameUrl(string url)
        {
            try
            {
                UrlshortenerService service = new UrlshortenerService(new BaseClientService.Initializer()
                {
                    ApiKey = "tukey",
                    ApplicationName = "SimRacingChamps URL shortener",
                });

                var m = new Google.Apis.Urlshortener.v1.Data.Url();
                m.LongUrl = @url;
                var shortenedUrl = service.Url.Insert(m).Execute().Id;
                return shortenedUrl;
            }
            catch (Exception ex)
            {
                return url;
            }
        }

        protected void bValidar1_Click(object sender, EventArgs e)
        {
            DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
            bool a = false;
            if (int.Parse(Request.QueryString["a"].ToString()) == 1)
                a = true;
            if ((int)t.CambiaValidacion(a, int.Parse(Request.QueryString["id"].ToString())) > 0)
            {
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_EVENTOSTableAdapter tv = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
                tv.FillByIDEVENTO(ds.V_EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                if (ds.V_EVENTOS.Count == 1)
                {
                    try
                    {
                        Models.EventosCN cn = new Models.EventosCN();
                        if (!cn.SendValidacion(ds.V_EVENTOS[0].USUARIO, ds.V_EVENTOS[0].NOMBRE, ds.V_EVENTOS[0].EVENTO, a))
                            lblmsg.Text="El evento ha sido validado pero el correo de aviso al organizador no hay podido ser enviado";
                        Response.Redirect("inicio.aspx", true);

                    }
                    catch (Exception ex)
                    {
                        lblmsg.Text=ex.Message;
                        Models.EventosCN cn = new Models.EventosCN();
                        cn.SendError(ex.Message);
                    }

                }
            }
        }

        protected void bVAlidar2_Click(object sender, EventArgs e)
        {
            DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
            bool a = false;
            var culture = System.Globalization.CultureInfo.CurrentCulture;
            if (int.Parse(Request.QueryString["a"].ToString()) == 1)
                a = true;
            if ((int)t.CambiaValidacion(a, int.Parse(Request.QueryString["id"].ToString())) > 0)
            {
                DL.EventosDS ds = new DL.EventosDS();
                DL.EventosDSTableAdapters.V_EVENTOSTableAdapter tv = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
                tv.FillByIDEVENTO(ds.V_EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
                if (ds.V_EVENTOS.Count == 1)
                {
                    try
                    {
                        Models.EventosCN cn = new Models.EventosCN();
                        if (Request.QueryString["beta"] == null) cn.SendValidacion(ds.V_EVENTOS[0].USUARIO, ds.V_EVENTOS[0].NOMBRE, ds.V_EVENTOS[0].EVENTO, a);
                        DL.EventosDS.V_EVENTOSRow f = ds.V_EVENTOS[0];
                        DL.EventosDSTableAdapters.V_ETAPASTableAdapter vet = new DL.EventosDSTableAdapters.V_ETAPASTableAdapter();
                        vet.FillByIDEVENTO(ds.V_ETAPAS, ds.V_EVENTOS[0].ID);
                        if (a)
                        {
                            if (Request.QueryString["beta"] == null)
                            {
                                Auth.SetUserCredentials("credencial1", "credencial2", "credencial3", "credencial4");
                                var user = Tweetinvi.User.GetAuthenticatedUser();
                                string twitter = "", cartel = "", twitterjuego = "";
                                if (!f.IsTWITTERNull() && f.TWITTER != "") twitter = f.TWITTER;
                                if (!f.IsTWITTERJUEGONull() && f.TWITTERJUEGO != "") twitterjuego = "@" + f.TWITTERJUEGO;
                                if (!f.IsCARTELNull() && f.CARTEL != "") cartel = Server.MapPath("../Content/img/eventos/" + f.ID.ToString() + "/" + f.CARTEL);

                                if (cartel != "")
                                {
                                    byte[] file1 = File.ReadAllBytes(cartel);
                                    var media = Upload.UploadBinary(file1);
                                    if (twitter != "")
                                    {
                                        if (ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") ==-1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "mx" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("mx") == -1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "ar" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("ar") == -1)
                                        {
                                            Tweet.PublishTweet("@" + twitter + " presents " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Sign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString() + " " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()), new PublishTweetOptionalParameters
                                            {
                                                Medias = new List<IMedia> { media }
                                            });
                                        }
                                        else
                                        {
                                            Tweet.PublishTweet("@" + twitter + " organiza: " + f.EVENTO + "\r\nComienza el: " + f.FECHAPRIMERA.ToShortDateString() + ".\r\nPlataforma: " + ds.V_EVENTOS[0].JUEGO + "/" + ds.V_EVENTOS[0].PLATAFORMA + " " + twitterjuego +  " \r\nCircuitos: " + ds.V_ETAPAS.Count.ToString() + "\r\nInscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + "\r\nInscríbete aquí: " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()), new PublishTweetOptionalParameters
                                            {
                                                Medias = new List<IMedia> { media }
                                            });
                                        }
                                    }
                                    else
                                    {
                                        if (ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "mx" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("mx") == -1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "ar" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("ar") == -1)
                                        {
                                            Tweet.PublishTweet(f.NOMBRE + " presents " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Sign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString() + " " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()), new PublishTweetOptionalParameters
                                            {
                                                Medias = new List<IMedia> { media }
                                            });
                                        }
                                        else
                                        {
                                            Tweet.PublishTweet(f.NOMBRE + " organiza: " + f.EVENTO + "\r\nComienza el: " + f.FECHAPRIMERA.ToShortDateString() + "\r\nPlataforma: " + ds.V_EVENTOS[0].JUEGO + "/" + ds.V_EVENTOS[0].PLATAFORMA + " " + twitterjuego + "\r\nCircuitos: " + ds.V_ETAPAS.Count.ToString() + "\r\nInscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + "\r\nInscríbete aquí: " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()), new PublishTweetOptionalParameters
                                            {
                                                Medias = new List<IMedia> { media }
                                            });
                                        }
                                    }
                                }
                                else
                                {
                                    if (twitter != "")
                                    {
                                        if (ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "mx" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("mx") == -1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "ar" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("ar") == -1)
                                            Tweet.PublishTweet("@" + twitter + " introduce " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Sign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString() + " " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()));
                                        else
                                            Tweet.PublishTweet("@" + twitter + " organiza: " + f.EVENTO + "\r\nComienza el: " + f.FECHAPRIMERA.ToShortDateString() + ".\r\nPlataforma: " + ds.V_EVENTOS[0].JUEGO + "/" + ds.V_EVENTOS[0].PLATAFORMA + " " + twitterjuego + "\r\nCircuitos: " + ds.V_ETAPAS.Count.ToString() + "\r\nInscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + "\r\nInscríbete aquí: " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()));
                                    }
                                    else
                                    {
                                        if (ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "mx" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("mx") == -1 &&
                                            ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "ar" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("ar") == -1)
                                            Tweet.PublishTweet(f.NOMBRE + " introduce " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Sign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString() + " " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()));
                                        else
                                            Tweet.PublishTweet(f.NOMBRE + " organiza: " + f.EVENTO + "\r\nComienza el: " + f.FECHAPRIMERA.ToShortDateString() + "\r\nPlataforma: " + ds.V_EVENTOS[0].JUEGO + "/" + ds.V_EVENTOS[0].PLATAFORMA + " " + twitterjuego + "\r\nCircuitos: " + ds.V_ETAPAS.Count.ToString() + "\r\nInscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + "\r\nInscríbete aquí: " + DameUrl("http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString()));
                                    }
                                }
                                //if (twitter != "")
                                //{
                                //    if (culture.TwoLetterISOLanguageName != "es")
                                //        Tweet.PublishTweet("@" + twitter + " presents http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Sign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString());
                                //    else
                                //        Tweet.PublishTweet("@" + twitter + " organiza http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Inscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString());
                                //}
                                //else
                                //{
                                //    if (culture.TwoLetterISOLanguageName != "es")
                                //        Tweet.PublishTweet(f.NOMBRE + " presents http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Sign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString());
                                //    else
                                //        Tweet.PublishTweet(f.NOMBRE + " organiza http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). Inscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString());
                                //}
                                ////}
                            }
                            else
                            {                                
                                Auth.SetUserCredentials("credencial1", "credencial2", "credencial3", "credencial4");
                                var user = Tweetinvi.User.GetAuthenticatedUser();
                                string twitter = "", cartel = "";
                                if (!f.IsTWITTERNull() && f.TWITTER != "") twitter = f.TWITTER;
                                if (!f.IsCARTELNull() && f.CARTEL != "") cartel = Server.MapPath("../Content/img/eventos/" + f.ID.ToString() + "/" + f.CARTEL);
                                if (cartel != "")
                                {
                                    byte[] file1 = File.ReadAllBytes(cartel);
                                    var media = Upload.UploadBinary(file1);
                                    if (twitter != "")
                                        Tweet.PublishTweet("@" + twitter + " organiza http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). \r\nInscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString(), new PublishTweetOptionalParameters
                                        {
                                            Medias = new List<IMedia> { media }
                                        });
                                    else
                                        Tweet.PublishTweet(f.NOMBRE + " organiza http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + ").  \r\nInscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString(), new PublishTweetOptionalParameters
                                        {
                                            Medias = new List<IMedia> { media }
                                        });
                                }
                                else
                                {
                                    if (twitter != "")
                                    {
                                        if (ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1)
                                            Tweet.PublishTweet("@" + twitter + " presents http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). \r\n Sign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString());
                                        else
                                            Tweet.PublishTweet("@" + twitter + " organiza http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + "). \r\n Inscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString());
                                    }
                                    else
                                    {
                                        if (ds.V_EVENTOS[0].CODPAIS.ToLower().Trim() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1)
                                            Tweet.PublishTweet(f.NOMBRE + " presents http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (" + f.FECHAPRIMERA.ToShortDateString() + ").  \r\nSign up from: " + f.FECHAINI.ToShortDateString() + " to " + f.FECHAFIN.ToShortDateString());
                                        else
                                            Tweet.PublishTweet(f.NOMBRE + " organiza http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " " + f.EVENTO + " (). \r\n Inscripción: " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString());
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Models.EventosCN cn = new Models.EventosCN();
                        cn.SendError(ex.Message);
                    }

                }
            }
        }

        protected void bApertura_Click(object sender, EventArgs e)
        {
            DL.EventosDSTableAdapters.EVENTOSTableAdapter t = new DL.EventosDSTableAdapters.EVENTOSTableAdapter();
            bool a = false;
            var culture = System.Globalization.CultureInfo.CurrentCulture;
            DL.EventosDS ds = new DL.EventosDS();
            DL.EventosDSTableAdapters.V_EVENTOSTableAdapter tv = new DL.EventosDSTableAdapters.V_EVENTOSTableAdapter();
            tv.FillByIDEVENTO(ds.V_EVENTOS, int.Parse(Request.QueryString["id"].ToString()));
            if (ds.V_EVENTOS.Count == 1)
            {
                try
                {
                    Models.EventosCN cn = new Models.EventosCN();
                    DL.EventosDS.V_EVENTOSRow f = ds.V_EVENTOS[0];

                    
                    Auth.SetUserCredentials("credencial1", "credencial2", "credencial3", "credencial4");
                    var user = Tweetinvi.User.GetAuthenticatedUser();
                    var publishOptions = new PublishTweetOptionalParameters();
                    string twitter = "", cartel = "";
                    if (!f.IsTWITTERNull() && f.TWITTER != "") twitter = f.TWITTER;
                    if (!f.IsCARTELNull() && f.CARTEL != "") cartel = Server.MapPath("../Content/img/eventos/" + f.ID.ToString() + "/" + f.CARTEL);

                    if (cartel != "")
                    {
                        byte[] file1 = File.ReadAllBytes(cartel);
                        var media = Upload.UploadBinary(file1);
                        if (twitter != "")
                        {
                            if (f.CODPAIS.Trim().ToLower() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1)
                            {
                                Tweet.PublishTweet("Open registration period of " + f.EVENTO + ". Sign up here: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + " @" + twitter, new PublishTweetOptionalParameters
                                {
                                    Medias = new List<IMedia> { media }
                                });
                            }
                            else
                            {
                                Tweet.PublishTweet("Abierto el plazo de inscripción de " + f.EVENTO + ". Inscríbete aquí: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + " @" + twitter, new PublishTweetOptionalParameters
                                {
                                    Medias = new List<IMedia> { media }
                                });
                            }
                        }
                        else
                        {
                            if (f.CODPAIS.Trim().ToLower() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1)
                            {
                                Tweet.PublishTweet("Open registration period of " + f.EVENTO + ". Sign up here: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString(), new PublishTweetOptionalParameters
                                {
                                    Medias = new List<IMedia> { media }
                                });
                            }
                            else
                            {
                                Tweet.PublishTweet("Abierto el plazo de inscripción de " + f.EVENTO + ". Inscríbete aquí: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString(), new PublishTweetOptionalParameters
                                {
                                    Medias = new List<IMedia> { media }
                                });
                            }
                        }
                    }
                    else
                    {
                        if (twitter != "")
                        {
                            if (f.CODPAIS.Trim().ToLower() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1)
                                Tweet.PublishTweet("Open registration period of " + f.EVENTO + ". Sign up here: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + " @" + twitter);
                            else
                                Tweet.PublishTweet("Abierto el plazo de inscripción de " + f.EVENTO + ". Inscríbete aquí: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString() + " @" + twitter);
                        }
                        else
                        {
                            if (f.CODPAIS.Trim().ToLower() != "es" && ds.V_EVENTOS[0].CODPAIS.ToLower().Trim().IndexOf("es") == -1)
                                Tweet.PublishTweet("Open registration period of " + f.EVENTO + ". Sign up here: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString());
                            else
                                Tweet.PublishTweet("Abierto el plazo de inscripción de " + f.EVENTO + ". Inscríbete aquí: http://simracingchamps.net/eventos.aspx?id=" + f.ID.ToString() + " del " + f.FECHAINI.ToShortDateString() + " al " + f.FECHAFIN.ToShortDateString());
                        }
                    }



                }
                catch (Exception ex)
                {
                    Models.EventosCN cn = new Models.EventosCN();
                    cn.SendError(ex.Message);
                }

            }

        }
    }
}
