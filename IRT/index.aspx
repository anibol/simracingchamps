<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="IRT.index" meta:resourcekey="PageResource1" Culture="auto:es-ES" UICulture="auto"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <title>SimRacingChamps.com</title>

    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
    <link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/fonts/simple-line-icons.css">
    <link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">
    <link rel="stylesheet" type="text/css" href="assets/css/nivo-lightbox.css">
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">
    <style>
        .carousel-inner > .item > a > img, .carousel-inner > .item > img, .img-responsive, .thumbnail a > img, .thumbnail > img {
            display: block;
            max-width: 100%;
            height: 450px;
            width: 100%
        }
    </style>
    <script src="assets/js/jquery.min.js"></script>
    <%-- Color CSS Styles  --%>
    <link id="linkCSS" runat="server" rel="stylesheet" type="text/css" href="assets/css/colors/src.css" media="screen" />
   

</head>
<body>
    <form id="form1" runat="server">
       
    <!-- Header Area wrapper Starts -->
    <header id="header-wrap">
        <!-- Roof area Starts -->
        <div id="roof" class="hidden-xs">
            <div class="container" style="height: 5px">
            </div>
        </div>

    </header>
    <!-- Header Area wrapper End -->


    <section id="about" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="section-title wow fadeInUp" data-wow-delay="0s"><img src="Content/img/web/SimRacingChamps2.png" style="width:390px;height:auto;" /><br />
                        <asp:Label ID="Label5" runat="server" Text="¿Qué es SimRacingChamps.com?" meta:resourcekey="Label5Resource1"></asp:Label></h2>

                    <div class="col-md-6 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.1s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/img-1.jpg" style="width:100%" alt="">
                            </div>
                            <div class="descr">
                                <h4>
                                    <asp:Label ID="Label1" runat="server" Text="Para los Organizadores" meta:resourcekey="Label1Resource1"></asp:Label></h4>
                                <p>
                                    <asp:Label ID="Label2" runat="server" Text="Ofrecemos un portal que te permita organizar tu campeonato de forma sencilla, ágil y automatizada. Nada de hojas de cálculo manuales ni leer decenas de mensajes en tus foros para ver quién se inscribe en tus competiciones. Fácil para ti, fácil para tus participantes." meta:resourcekey="Label2Resource1"></asp:Label></p>
                                <p>
                                    <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="¿Quieres probarlo? &lt;a href=&quot;http://twitter.com/simracingchamps&quot;&gt;Contáctanos por Twitter&lt;/a&gt; y te diremos cómo"></asp:Literal></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.2s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/img-2.jpg" style="width:100%" alt="">
                            </div>
                            <div class="descr">
                                <h4>
                                    <asp:Label ID="Label3" runat="server" Text="Para los Pilotos" meta:resourcekey="Label3Resource1"></asp:Label></h4>
                                <p>
                                    <asp:Label ID="Label4" runat="server" Text="Te proporcionamos un lugar donde encontrar y seguir los campeonatos de simracing de tu combinación plataforma/simulador preferida. Sólo necesitas una única cuenta para inscribirte fácilmente en cualquiera de ellos." meta:resourcekey="Label4Resource1"></asp:Label><br />&nbsp;</p>
                                <p>
                                    <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="¿Quieres estar al dia de los nuevos campeonatos? &lt;a href=&quot;http://twitter.com/simracingchamps&quot;&gt;Síguenos en Twitter&lt;/a&gt;"></asp:Literal></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="section" style="padding-top:0px;padding-bottom:10px;">
        <div class="container">
            <div class="row">
                <div class="col-md-2 col-sm-2 col-xs-12">
                    <h3>
                        <img style="width: 188px" src="Content/img/web/SimRacingChamps2.png" alt="">
                    </h3>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-12" style="padding-left:40px;">
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Estamos trabajando para tener el portal online lo antes posible. Publicaremos las novedades así como las nuevas funcionalidades en nuestro twitter. !Estad atentos! &lt;i class=&quot;icon icon-social-twitter&quot;&gt;&lt;/i&gt; &lt;a href=&quot;http://twitter.com/simracingchamps&quot;&gt;Síguenos en Twitter&lt;/a&gt;"></asp:Literal>
                </div>
            </div>
        </div>
    </footer>


    <section id="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p class="copyright-text text-center">
                        ©2017 <a href="http://simracingchamps.com/">SimRacingChamps.com</a>
                    </p>
                </div>
            </div>
        </div>
    </section>


    <a href="#" class="back-to-top">
        <i class="icon-arrow-up"></i>
    </a>
    <div class="bottom"><a href="#" class="settings"></a></div>



    </form>

    
    <script src="assets/js/bootstrap.min.js"></script>

    <script src="assets/js/jquery.countdown.min.js"></script>

    <script src="assets/js/smooth-scroll.js"></script>

    <script src="assets/js/wow.js"></script>

    <script src="assets/js/owl.carousel.min.js"></script>

    <script src="assets/js/jquery.slicknav.js"></script>

    <script src="assets/js/nivo-lightbox.js"></script>

    <script src="assets/js/form-validator.min.js"></script>
    <script src="assets/js/contact-form-script.js"></script>


    <script src="assets/js/main.js"></script>

    <script type="text/javascript" src="assets/js/jquery.mapit.min.js"></script>
    <script src="assets/js/initializers.js"></script>

</body>
</html>
