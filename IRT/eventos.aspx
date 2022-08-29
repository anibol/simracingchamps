<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eventos.aspx.cs" Inherits="IRT.eventos.eventos" meta:resourcekey="PageResource1" EnableViewState="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>SimRacingChamps</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css?v=4.3">
    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
    <!-- Fonts -->
    <link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome.min.css">
    <!-- Icon -->
    <link rel="stylesheet" type="text/css" href="assets/fonts/simple-line-icons.css">
    <!-- Slicknav -->
    <link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">
    <!-- Nivo Lightbox -->
    <link rel="stylesheet" type="text/css" href="assets/css/nivo-lightbox.css">
    <!-- Animate -->
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css">
    <!-- Owl carousel -->
    <link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css" />
    <style>
        .supsub {
            position: absolute
        }

        .subscript {
            color: red;
            display: block;
            position: relative;
            left: 2px;
            top: 18px
        }

        .superscript {
            color: green;
            display: block;
            position: relative;
            left: 2px;
            top: 6px
        }

        .subscriptf1 {
            color: red;
            display: block;
            position: relative;
            left: -4px;
            top: 21px;
        }

        .superscriptf1 {
            color: green;
            display: block;
            position: relative;
            left: -21px;
            top: 21px;
        }

        .carousel-inner > .item > a > img, .carousel-inner > .item > img, .img-responsive, .thumbnail a > img, .thumbnail > img {
            display: block;
            max-width: 100%;
            height: 450px;
            width: 100%
        }

        caption {
            padding-top: 8px;
            padding-bottom: 8px;
            color: #777;
            text-align: left;
            margin-top: 10px;
            background-color: white;
            padding-left: 10px;
            font-weight: bold;
        }

        #event {
            background: url(<%=fondo%>);
            background-size: cover;
            position: relative;
            background-position: 0px -200px;
        }

        #inscripcion {
            background: url(<%=fondo%>);
            background-size: cover;
            position: relative;
            color: white;
            background-position: 0px -200px;
            /*margin-bottom:80px;*/
        }

        .blog-post .feature-inner .logoclasif {
            float: left;
            /*width: 230px;*/
            text-align: center;
            margin-right: 10px;
        }


        /*@media (min-width: 320px) and (max-width: 768px) {

            .carousel-inner > .item > a > img, .carousel-inner > .item > img, .img-responsive, .thumbnail a > img, .thumbnail > img {
                display: block;
                max-width: 100%;
                height: auto;
                width: 100%
            }

            .blog-post .feature-inner h1 {
                font-size: 23px;
                padding-left:10px;
            }

            .blog-post .feature-inner h2 {
                font-size: 20px;
            }

            .blog-post .feature-inner .logoclasif {
                display:none;
            }
        }*/

        @media (min-width: 320px) and (max-width: 768px) {
            .carousel-inner > .item > a > img, .carousel-inner > .item > img, .img-responsive, .thumbnail a > img, .thumbnail > img {
                display: block;
                max-width: 100%;
                height: 450px;
                width: 100%;
            }

            .blog-post .feature-inner h1 {
                font-size: 23px;
                padding-left: 10px;
                height: auto;
            }

            .blog-post .feature-inner h2 {
                padding-left: 10px;
                font-size: 20px;
            }

            .blog-post .feature-inner .logoclasif {
                display: none;
            }

            .main-board .col-sm-12 {
                padding-left: 0px;
                padding-right: 0px;
            }

            .text h3 {
                font-size: 18px;
            }
        }
    </style>
    <!-- Color CSS Styles  -->
    <link id="linkCSS" runat="server" rel="stylesheet" type="text/css" href="assets/css/colors/default.css" media="screen" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        -->
</head>
<body>
    <form id="form1" runat="server">
        <a name="inicio"></a>
        <!-- Header Area wrapper Starts -->
        <header id="header-wrap">
            <!-- Roof area Starts -->
            <div id="roof" class="hidden-xs">
                <div class="container" style="height: 5px">
                </div>
            </div>
            <!-- Roof area End -->

            <!-- Nav Menu Section Start -->
            <div class="navigation-menu">
                <nav class="navbar navbar-default navbar-event">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header col-md-2">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="# ">
                                <div style="float: left; padding-right: 10px; margin-right: 0px;">
                                    <img style="width: 188px; padding-top: 16px;" src="Content/img/web/SimRacingChamps2.png" alt="SimRacingChamps.net" />
                                </div>
                            </a>
                        </div>

                        <div class="collapse navbar-collapse" id="navbar">
                            <%-- <ul class="nav navbar-nav">
                                <li ><a href="#inicio">
                                    <%=organizador %></a></li>
                                </ul>--%>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="#inicio">
                                    <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                                <li><a href="#calendario">
                                    <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Calendario"></asp:Literal></a></li>
                                <% if (panSponsors.Visible)
                                    { %>
                                <li><a href="#sponsors">
                                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Sponsors"></asp:Literal></a></li>
                                <% } %>
                                <% if (panIncripcion.Visible)
                                    { %>
                                <li class="animated bounceIn"><a href="#inscripcion">
                                    <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Inscríbete"></asp:Literal></a></li>
                                <% }
                                    else if (panInscritos.Visible)
                                    { %>
                                <li class="animated bounceIn"><a href="#inscritos">
                                    <asp:Literal ID="Literal33" runat="server" Text="Inscritos" meta:resourcekey="Literal33Resource2"></asp:Literal></a></li>
                                <% }
                                    else if (panResultados.Visible)
                                    { %>

                                <li class="animated bounceIn"><a href="#resultados">
                                    <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Clasificación"></asp:Literal></a></li>
                                <%} %>
                                <% if (panNoticias.Visible)
                                    { %>
                                <li class="animated bounceIn"><a href="#noticias">
                                    <asp:Literal ID="Literal113" runat="server" meta:resourcekey="noticias" Text="Noticias"></asp:Literal></a></li>
                                <%} %>
                                <li><a href="#contacto">
                                    <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Contacto"></asp:Literal></a></li>
                                <li><a href="default.aspx"><i class="fa fa-home"></i>SRC</a></li>
                            </ul>
                        </div>
                        <!-- /navbar-collapse -->
                    </div>
                    <!-- /container -->

                    <!-- Mobile Menu Start -->
                    <ul class="wpb-mobile-menu">
                        <li class="active"><a href="#inicio">
                            <asp:Literal ID="Literal105" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                        <li><a href="#calendario">
                            <asp:Literal ID="Literal106" runat="server" meta:resourcekey="Literal2Resource1" Text="Calendario"></asp:Literal></a></li>
                        <% if (panSponsors.Visible)
                            { %>
                        <li><a href="#sponsors">
                            <asp:Literal ID="Literal107" runat="server" meta:resourcekey="Literal3Resource1" Text="Sponsors"></asp:Literal></a></li>
                        <% } %>
                        <% if (panIncripcion.Visible)
                            { %>
                        <li class="animated bounceIn"><a href="#inscripcion">
                            <asp:Literal ID="Literal108" runat="server" meta:resourcekey="Literal4Resource1" Text="Inscríbete"></asp:Literal></a></li>
                        <% }
                            else if (panInscritos.Visible)
                            { %>
                        <li class="animated bounceIn"><a href="#inscritos">
                            <asp:Literal ID="Literal109" runat="server" Text="Inscritos" meta:resourcekey="Literal33Resource2"></asp:Literal></a></li>
                        <% }
                            else if (panResultados.Visible)
                            { %>

                        <li class="animated bounceIn"><a href="#resultados">
                            <asp:Literal ID="Literal110" runat="server" meta:resourcekey="Literal5Resource1" Text="Clasificación"></asp:Literal></a></li>
                        <%} %>
                        <li><a href="#contacto">
                            <asp:Literal ID="Literal111" runat="server" meta:resourcekey="Literal6Resource1" Text="Contacto"></asp:Literal></a></li>
                        <li><a href="register_driver.aspx">
                            <asp:Literal ID="Literal11" runat="server" Text="Registro piloto" meta:resourcekey="Literal11Resource2"></asp:Literal></a></li>
                        <li><a href="register_driver.aspx?j=1">
                            <asp:Literal ID="Literal8" runat="server" Text="Registro jefe equipo" meta:resourcekey="Literal8Resource2"></asp:Literal></a></li>
                        <li><a href="register.aspx">
                            <asp:Literal ID="Literal7" runat="server" Text="Registro organizador" meta:resourcekey="Literal7Resource2"></asp:Literal></a></li>
                        <li><a href="default.aspx"><i class="fa fa-home"></i>SRC</a></li>

                    </ul>
                    <!-- Mobile Menu End -->

                </nav>
            </div>
            <!-- Nav Menu Section End -->

        </header>
        <!-- Header Area wrapper End -->
        <% if (Request.QueryString["preview"] != null)
            { %>
        <div class="row" style="position: fixed; top: 0px; left: 10px; z-index: 9999 !important;">
            <h1><span class="label label-danger">
                <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="EVENTO EN MODO PREVIEW"></asp:Literal></span></h1>
        </div>
        <% } %>

        <!-- Main Slider Section Start -->
        <div id="carousel-area">
            <div id="carousel-slider" class="carousel slide">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="<%= cartel %>" alt="cartel" />
                        <div class="carousel-caption">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Main Slider Section End -->

        <!-- Call to action Section -->
        <asp:Panel ID="panRelol" runat="server" meta:resourcekey="panRelolResource1">
            <section class="countdown-timer section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-delay="0.2s">
                            <div class="text">
                                <h2><%=nombreevento %></h2>
                                <h3>
                                    <asp:Literal ID="Literal62" runat="server" meta:resourcekey="organiza" Text="Organiza"></asp:Literal>
                                    <%=organizador %></h3>
                                <div class="social-link">
                                    <% if (correo != "")
                                        { %><a href="mailto:<%=correo %>"><i class="fa fa-envelope"></i></a><% } %>
                                    <% if (facebook != "")
                                        { %><a href="<%=facebook %>"><i class="fa fa-facebook"></i></a><% } %>
                                    <% if (twitter != "")
                                        { %><a href="<%=twitter %>"><i class="fa fa-twitter"></i></a><% } %>
                                    <% if (youtube != "")
                                        { %><a href="<%=youtube %>"><i class="fa fa-youtube"></i></a><% } %>
                                </div>
                                <h4>
                                    <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="Plazo inscripcion"></asp:Literal>: <%=desde %> - <%=hasta %>
                                    <%=diasemana %>
                                    <%=hora %>&nbsp;<%=zona %></h4>

                                <%=docs %>
                                <% if (panIncripcion.Visible)
                                    { %>

                                <a href="#inscripcion" class="btn btn-lg btn-common">
                                    <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Inscríbete"></asp:Literal></a>
                                <% }
                                    else if (panInscritos.Visible)
                                    { %>
                                <a href="#inscritos" class="btn btn-lg btn-common">
                                    <asp:Literal ID="Literal57" runat="server" Text="Inscritos" meta:resourcekey="Literal33Resource2"></asp:Literal></a>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 wow fadeInRight" data-wow-delay="0.2s">
                            <% if (panIncripcion.Visible)
                                {
                                    if (video == "")
                                    {%>
                            <div class="time-countdown">
                                <div id="clock" class="time-count"></div>
                            </div>
                            <%=video %>
                            <% }
                                else
                                {%>
                            <%=video %>
                            <%}
                                }
                                else if (video != "")
                                { %>
                            <%=video %>
                            <% } %>
                        </div>
                    </div>
                </div>
            </section>
        </asp:Panel>

        <!-- Call to action Section End -->
        <section id="event" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-6 col-xs-12">
                        <div class="tab-block wow fadeInDown" data-wow-delay="0s">
                            <div class="icon">
                                <i class="icon-game-controller"></i>
                            </div>
                            <div class="desc">
                                <h4>
                                    <asp:Literal ID="Literal15" runat="server" meta:resourcekey="Literal15Resource1" Text="Plataforma"></asp:Literal></h4>
                                <p><%=juego %> / <%=plataforma %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-6 col-xs-12">
                        <div class="tab-block wow fadeInDown" data-wow-delay="0s">
                            <div class="icon">
                                <i class="icon-settings"></i>
                            </div>
                            <div class="desc">
                                <h4>
                                    <asp:Literal ID="Literal126" runat="server" Text="Setup"></asp:Literal></h4>
                                <p><%=setup %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="tab-block wow fadeInDown" data-wow-delay="0.2s">
                            <div class="icon">
                                <i class="icon-calendar"></i>
                            </div>
                            <div class="desc">
                                <h4>
                                    <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="Calendario"></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="Del"></asp:Literal>
                                    <%=calini %>
                                    <asp:Literal ID="Literal18" runat="server" meta:resourcekey="Literal18Resource1" Text="al"></asp:Literal>
                                    <%=calfin %>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-6 col-xs-12">
                        <div class="tab-block wow fadeInDown" data-wow-delay="0.4s">
                            <div class="icon">
                                <i class="icon-speedometer"></i>
                            </div>
                            <div class="desc">
                                <h4>
                                    <asp:Literal ID="Literal19" runat="server" meta:resourcekey="Literal19Resource1" Text="Circuitos"></asp:Literal></h4>
                                <p><%=numetapas %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="tab-block last-block wow fadeInDown" data-wow-delay="0.6s">
                            <div class="icon">
                                <i class="icon-user"></i>
                            </div>
                            <div class="desc left">
                                <h4>
                                    <asp:Literal ID="Literal20" runat="server" meta:resourcekey="Literal20Resource1" Text="Plazas"></asp:Literal></h4>
                                <p><%=nummax %></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="content-text">
                            <h3 class="wow fadeInUp" data-wow-delay="0.8s">
                                <asp:Literal ID="Literal21" runat="server" meta:resourcekey="Literal21Resource1" Text="Información"></asp:Literal></h3>
                            <p class="wow fadeInUp" data-wow-delay="1s"><%=informacion %></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--Agenda Section Start -->
        <a name="calendario"></a>
        <section id="schedule" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="section-title wow fadeInUp" data-wow-delay="0s">
                            <asp:Literal ID="Literal22" runat="server" meta:resourcekey="Literal22Resource1" Text="Calendario"></asp:Literal></h2>
                        <p class="section-subcontent wow fadeInUp" data-wow-delay="0.2s">
                            <%=textocal %>
                        </p>

                        <asp:Repeater ID="repEtapasPC" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h5>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></h5>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#PC<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal39" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="PC<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-3">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="sesionesduracion01" meta:resourcekey="sesionesduracion" runat="server" Text="Sesiones y duraci&oacute;n"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal88" runat="server" Text="Hora Carrera Simulador" meta:resourcekey="Literal88Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_HORA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Prácticas" meta:resourcekey="Literal26Resource2"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"PRACTICASTIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Clasificación" meta:resourcekey="Literal27Resource2"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CUALITIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal28" runat="server" Text="Calentamiento/Retraso" meta:resourcekey="Literal28Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_CALENTAMIENTO")%>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal63" runat="server" Text="Carrera por tiempo" meta:resourcekey="Literal63Resource1"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal64" runat="server" Text="Carrera por vueltas" meta:resourcekey="Literal64Resource1"></asp:Literal>: <%# DameDuracionVueltas(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS")) %>
                                                            </p>
                                                            <p>
                                                                &nbsp;
                                                            </p>
                                                            <p>
                                                                &nbsp;
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-9 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal61" runat="server" Text="Datos de la Sala" meta:resourcekey="Literal61Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal31" runat="server" Text="Espacios meteorología" meta:resourcekey="Literal31Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_ESPACIOS_MET") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal65" runat="server" Text="Meteorología" meta:resourcekey="Literal65Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_MET") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal66" runat="server" Text="Progresión Meteorológica" meta:resourcekey="Literal66Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_PROGRESION_MET") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal67" runat="server" Text="Tipo de fecha" meta:resourcekey="Literal67Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_TIPOFECHA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal69" runat="server" Text="Progresión del tiempo" meta:resourcekey="Literal69Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_PROGRESION_TIEMPO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal70" runat="server" Text="Clase de coche" meta:resourcekey="Literal70Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_CLASE_COCHE") %>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal71" runat="server" Text="Detención obligatoria en Pits" meta:resourcekey="Literal71Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_STOP_PITS") %>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal72" runat="server" Text="Salida lanzada" meta:resourcekey="Literal72Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_SALIDA_LANZADA") %>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal73" runat="server" Text="Forzar vista interior" meta:resourcekey="Literal73Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_VISTA_INTERIOR") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal74" runat="server" Text="Forzar marchas manuales" meta:resourcekey="Literal74Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_MARCHAS_MANUALES") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal75" runat="server" Text="Forzar ayudas realistas" meta:resourcekey="Literal75Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_AYUDAS_REALISTAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal76" runat="server" Text="Permitir ABS" meta:resourcekey="Literal76Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_ABS") %>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal77" runat="server" Text="Permitir control de estabilidad" meta:resourcekey="Literal77Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_ESP") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal78" runat="server" Text="Permitir control de tracción" meta:resourcekey="Literal78Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_CT") %>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal79" runat="server" Text="Config. defecto fuerza" meta:resourcekey="Literal79Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_CONF_FUERZA") %>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal80" runat="server" Text="Daños" meta:resourcekey="Literal80Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_DANOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal81" runat="server" Text="Fallos mecánicos" meta:resourcekey="Literal81Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_FALLOS_MEC") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal82" runat="server" Text="Desgaste neumáticos" meta:resourcekey="Literal82Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_DESGASTE") %>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal83" runat="server" Text="Uso de combustible" meta:resourcekey="Literal83Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_COMBUSTIBLE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal84" runat="server" Text="Arranque automático" meta:resourcekey="Literal84Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_ARRANQUE_AUTO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal85" runat="server" Text="Banderas y penalizaciones" meta:resourcekey="Literal85Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_BANDERAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal86" runat="server" Text="Coches transparentes" meta:resourcekey="Literal86Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PC_TRANSPARENTE") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="repEtapasAC" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h5>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DameCoches(DataBinder.Eval(Container.DataItem,"COCHES"),DataBinder.Eval(Container.DataItem,"ID"),DataBinder.Eval(Container.DataItem,"IDJUEGO")) %></h5>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#AC<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal123" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="AC<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-3">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal39" runat="server" Text="Sesiones y duraci&oacute;n" meta:resourcekey="Literal39Resource2"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal88" runat="server" Text="Hora Carrera Simulador" meta:resourcekey="Literal88Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_HORA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Prácticas" meta:resourcekey="Literal26Resource3"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"PRACTICASTIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Clasificación" meta:resourcekey="Literal27Resource3"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CUALITIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal28" runat="server" Text="Calentamiento/Retraso" meta:resourcekey="Literal28Resource3"></asp:Literal>: <%# DameDuracionSeg(DataBinder.Eval(Container.DataItem,"PC_CALENTAMIENTO")) %>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal63" runat="server" Text="Carrera por tiempo" meta:resourcekey="Literal63Resource2"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal64" runat="server" Text="Carrera por vueltas" meta:resourcekey="Literal64Resource2"></asp:Literal>: <%# DameDuracionVueltas(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS")) %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-9 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal41" runat="server" Text="Datos de la Sala" meta:resourcekey="Literal41Resource2"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal87" runat="server" Text="Clima" meta:resourcekey="Literal87Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_CLIMA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal89" runat="server" Text="Temperatura ambiente" meta:resourcekey="Literal89Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_TEMP_AMB") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal90" runat="server" Text="Superficie pista" meta:resourcekey="Literal90Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_PISTA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal91" runat="server" Text="Autoembrague" meta:resourcekey="Literal91Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_AUTOEMBRAGUE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal92" runat="server" Text="Control de Tracción" meta:resourcekey="Literal92Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_CT") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal93" runat="server" Text="ABS" meta:resourcekey="Literal93Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_ABS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal94" runat="server" Text="Control de estabilidad" meta:resourcekey="Literal94Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_ESP") %>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal95" runat="server" Text="Calentadores neumáticos" meta:resourcekey="Literal95Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_CALENTADORES") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal96" runat="server" Text="Consumo combustible" meta:resourcekey="Literal96Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_COMBUSTIBLE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal97" runat="server" Text="Daños" meta:resourcekey="Literal97Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_DANOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal98" runat="server" Text="Desgaste de ruedas" meta:resourcekey="Literal98Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_DESGASTE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal99" runat="server" Text="Penalización por salirse" meta:resourcekey="Literal99Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_PENALIZACION") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal100" runat="server" Text="Límite de clasificaciones" meta:resourcekey="Literal100Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_LIMITE_CLASIF") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="repEtapasRF" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h6>
                                                    <p>
                                                        <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DameCoches(DataBinder.Eval(Container.DataItem,"COCHES"),DataBinder.Eval(Container.DataItem,"ID"),DataBinder.Eval(Container.DataItem,"IDJUEGO")) %>
                                                    </p>
                                                </h6>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#RF<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal123" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="RF<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-3">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="sesionesduracion04" runat="server" Text="Sesiones y duraci&oacute;n" meta:resourcekey="sesionesduracion04Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal88" runat="server" Text="Hora Carrera Simulador" meta:resourcekey="Literal88Resource3"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_HORA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Prácticas" meta:resourcekey="Literal26Resource4"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"PRACTICASTIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Clasificación" meta:resourcekey="Literal27Resource4"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CUALITIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal28" runat="server" Text="Calentamiento/Retraso" meta:resourcekey="Literal28Resource4"></asp:Literal>: <%# DameDuracionSeg(DataBinder.Eval(Container.DataItem,"PC_CALENTAMIENTO")) %>
                                                            </p>

                                                            <p>
                                                                <asp:Literal ID="Literal63" runat="server" Text="Carrera por tiempo" meta:resourcekey="Literal63Resource3"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal64" runat="server" Text="Carrera por vueltas" meta:resourcekey="Literal64Resource3"></asp:Literal>: <%# DameDuracionVueltas(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS")) %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-9 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal101" runat="server" Text="Datos de la Sala" meta:resourcekey="Literal101Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal87" runat="server" Text="Versión rFactor" meta:resourcekey="Literal87Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_VERSION") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal89" runat="server" Text="Servidor" meta:resourcekey="Literal89Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_SERVIDOR") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal90" runat="server" Text="Contraseña" meta:resourcekey="Literal90Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_PASS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal91" runat="server" Text="Estado Pista" meta:resourcekey="Literal91Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_PISTA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal92" runat="server" Text="Real Road" meta:resourcekey="Literal92Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_ROAD") %>
                                                            </p>
                                                            <p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal95" runat="server" Text="Consumo Combustible" meta:resourcekey="Literal95Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_DEPOSITO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal96" runat="server" Text="Desgaste Neumáticos" meta:resourcekey="Literal96Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_DESGASTE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal97" runat="server" Text="Daños" meta:resourcekey="Literal97Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_DANOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal98" runat="server" Text="Meteorología" meta:resourcekey="Literal98Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RF_METEO") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="repEtapas2" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h5>
                                                    <asp:Literal ID="Literal68" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></h5>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#E2<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal123" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="E2<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-4">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="sesionesduracion05" runat="server" Text="Sesiones y duraci&oacute;n" meta:resourcekey="sesionesduracion05Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Prácticas" meta:resourcekey="Literal26Resource5"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"PRACTICASTIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Clasificación" meta:resourcekey="Literal27Resource5"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CUALITIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal24" runat="server" Text="Hora Carrera Simulador" meta:resourcekey="Literal24Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"HORAPRACTICAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal28" runat="server" Text="Carrera" meta:resourcekey="Literal28Resource5"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal58" runat="server" meta:resourcekey="Literal39Resource1" Text="Vueltas"></asp:Literal>: <%# DameVueltas(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS")) %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-8">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal288" runat="server" Text="Configuración de Sala" meta:resourcekey="Literal288Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>

                                                            <p>
                                                                <asp:Literal ID="Literal32" runat="server" Text="Clima" meta:resourcekey="Literal32Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"IR_CLIMA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal59" runat="server" meta:resourcekey="Literal40Resource1" Text="Periodo dia"></asp:Literal>: <%# PeriodoTexto(DataBinder.Eval(Container.DataItem,"CARRERAPERIODODIA")) %>
                                                            </p>
                                                            <%# DameSalida(DataBinder.Eval(Container.DataItem,"SALIDA")) %>
                                                            <p>
                                                                Setup:  <%=setup %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal60" runat="server" meta:resourcekey="Literal41Resource1" Text="Depósito"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"PORCDEPOSITO") %>%
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <%--<%# DameEstadoPista(DataBinder.Eval(Container.DataItem,"ESTADOPISTA")) %>--%>
                                                            <%# DameFastRepairs(DataBinder.Eval(Container.DataItem,"FASTREPAIRS")) %>
                                                            <%# DameCautions(DataBinder.Eval(Container.DataItem,"CAUTIONS")) %>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="repF1" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h5>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></h5>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#F1<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal123" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="F1<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-4 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="sesionesopcion" runat="server" Text="Opciones de la Sesi&oacute;n" meta:resourcekey="sesionesopcionResource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal88" runat="server" Text="Tipo de entrenamiento" meta:resourcekey="Literal88Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_TIPO_ENTREN") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Ronda de clasificación" meta:resourcekey="Literal26Resource6"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"F1_TIEMPO_CLASIF")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Distancia de carrera" meta:resourcekey="Literal27Resource6"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_DISTANCIA_CARRERA") %>%
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal28" runat="server" Text="Clima" meta:resourcekey="Literal28Resource6"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_CLIMA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal63" runat="server" Text="Clima inicio sesión" meta:resourcekey="Literal63Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_CLIMA_INICIO") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal289" runat="server" Text="Opciones de Carrera" meta:resourcekey="Literal289Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal87" runat="server" Text="Rendimiento coche" meta:resourcekey="Literal87Resource3"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_RENDIMIENTO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal89" runat="server" Text="Parc Fermé" meta:resourcekey="Literal89Resource3"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_FERME")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal90" runat="server" Text="Colisiones" meta:resourcekey="Literal90Resource3"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_COLISIONES")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal91" runat="server" Text="Daños monoplaza" meta:resourcekey="Literal91Resource3"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_DANOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal92" runat="server" Text="Coche seguridad" meta:resourcekey="Literal92Resource3"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_COCHE_SEG")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal93" runat="server" Text="Severidad saltarse curvas" meta:resourcekey="Literal93Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_SALTA_CURVAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal94" runat="server" Text="Vuelta de formación" meta:resourcekey="Literal94Resource2"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_VUELTA_FORM")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal40" runat="server" Text="Arranque de carrera" meta:resourcekey="Literal40Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_ARRANQUE") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">Restriciones de Ayudas</caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal29" runat="server" Text="Asistencia de frenada" meta:resourcekey="Literal29Resource2"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_FRENADA")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal30" runat="server" Text="Frenos antibloqueo" meta:resourcekey="Literal30Resource2"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_ANTIBLOQUEO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal35" runat="server" Text="Control de tracción" meta:resourcekey="Literal35Resource2"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_CT")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal36" runat="server" Text="Caja de cambios" meta:resourcekey="Literal36Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"F1_CAMBIOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal37" runat="server" Text="Asistencia en boxes" meta:resourcekey="Literal37Resource2"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_BOXES")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal38" runat="server" Text="Trazada dinámica" meta:resourcekey="Literal38Resource2"></asp:Literal>: <%# SiNo(DataBinder.Eval(Container.DataItem,"F1_TRAZADA")) %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="repRR" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h5>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></h5>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#RR<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal123" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="RR<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-4 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="sesionesopcion" runat="server" Text="Opciones de la Sesi&oacute;n" meta:resourcekey="sesionesopcionResource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Prácticas" meta:resourcekey="Literal26Resource2"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"PRACTICASTIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal63" runat="server" Text="Periodo dia" meta:resourcekey="Literal33Resource1"></asp:Literal>: <%# PeriodoRR(DataBinder.Eval(Container.DataItem,"PRACTICASPERIODODIA")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Clasificación" meta:resourcekey="Literal27Resource2"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CUALITIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal102" runat="server" Text="Periodo dia" meta:resourcekey="Literal33Resource1"></asp:Literal>: <%# PeriodoRR(DataBinder.Eval(Container.DataItem,"CUALIPERIODODIA")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal28" runat="server" Text="Periodo dia" meta:resourcekey="Literal63Resource2"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal64" runat="server" Text="Periodo dia" meta:resourcekey="Literal33Resource1"></asp:Literal>: <%# PeriodoRR(DataBinder.Eval(Container.DataItem,"CARRERAPERIODODIA")) %>
                                                            </p>


                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal289" runat="server" Text="Opciones de Carrera" meta:resourcekey="Literal289Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal87" runat="server" Text="Reverse Start Order Places" meta:resourcekey="Literal87Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RR_REVERSE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal89" runat="server" Text="Tire Wear" meta:resourcekey="Literal89Resource4"></asp:Literal>: <%# FuelTire(DataBinder.Eval(Container.DataItem,"RR_TIRE_WEAR")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal90" runat="server" Text="Mechanical Damage" meta:resourcekey="Literal90Resource4"></asp:Literal>: <%# OnOff(DataBinder.Eval(Container.DataItem,"RR_MECHANICAL_DAMAGE")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal91" runat="server" Text="Flag Rules" meta:resourcekey="Literal91Resource4"></asp:Literal>: <%# FlagRules(DataBinder.Eval(Container.DataItem,"RR_FLAG_RULES")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal92" runat="server" Text="Kick Non Ready Clients Time" meta:resourcekey="Literal92Resource4"></asp:Literal>: <%# KickClients(DataBinder.Eval(Container.DataItem,"RR_KICK_CLIENTS")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal93" runat="server" Text="Mandatory Pitstop" meta:resourcekey="Literal93Resource3"></asp:Literal>: <%# OnOff(DataBinder.Eval(Container.DataItem,"RR_MANDATORY_PITSTOP")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal94" runat="server" Text="Stay In Practice Session If Empty" meta:resourcekey="Literal94Resource3"></asp:Literal>: <%# OnOff(DataBinder.Eval(Container.DataItem,"RR_STAY_INPRACTICE")) %>
                                                            </p>

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">Restriciones de Ayudas</caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal29" runat="server" Text="Difficulty" meta:resourcekey="Literal29Resource3"></asp:Literal>: <%# Difficulty(DataBinder.Eval(Container.DataItem,"RR_DIFFICULTY")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal30" runat="server" Text="Fuel Usage" meta:resourcekey="Literal30Resource3"></asp:Literal>: <%# FuelTire(DataBinder.Eval(Container.DataItem,"RR_FUEL_USAGE")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal35" runat="server" Text="Visual Damage" meta:resourcekey="Literal35Resource3"></asp:Literal>: <%# VisualDamage(DataBinder.Eval(Container.DataItem,"RR_VISUAL_DAMAGE")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal36" runat="server" Text="Race Finish Duration" meta:resourcekey="Literal36Resource3"></asp:Literal>: <%# RaceFinish(DataBinder.Eval(Container.DataItem,"RR_RACE_FINISH")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal37" runat="server" Text="Cut Rules" meta:resourcekey="Literal37Resource3"></asp:Literal>: <%# CutRules(DataBinder.Eval(Container.DataItem,"RR_CUT_RULES")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal38" runat="server" Text="Wrecker Prevention" meta:resourcekey="Literal38Resource3"></asp:Literal>: <%# OnOff(DataBinder.Eval(Container.DataItem,"RR_WRECKER")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal103" runat="server" Text="Non Ready Pitlane Start Delay" meta:resourcekey="Literal103Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"RR_NONREADY_PITLANE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal104" runat="server" Text="Allow Players Join In Qualifying" meta:resourcekey="Literal104Resource1"></asp:Literal>: <%# OnOff(DataBinder.Eval(Container.DataItem,"RR_ALLOW_QUALY")) %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="repFR" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h5>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></h5>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#FR<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal123" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="FR<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-3 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="sesionesopcion" runat="server" Text="Opciones de la Sesi&oacute;n" meta:resourcekey="sesionesopcionResource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Apertura sala + Briefing" meta:resourcekey="Literal26Resource7"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_APERTURA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal63" runat="server" Text="Hora Cualificación" meta:resourcekey="Literal63Resource5"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"HORACUALIFICACION") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Vueltas Cualificación" meta:resourcekey="Literal27Resource7"></asp:Literal>: <%# DameVueltas(DataBinder.Eval(Container.DataItem,"CUALIVUELTAS")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal10" runat="server" Text="Nº Mangas" meta:resourcekey="Literal10Resource2"></asp:Literal>: 
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal102" runat="server" Text="Hora Manga 1" meta:resourcekey="Literal102Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_MANGA1") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal7" runat="server" Text="Hora Manga 2" meta:resourcekey="Literal7Resource3"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_MANGA2") %>
                                                            </p>

                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-9 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal289" runat="server" Text="Configuración de sala" meta:resourcekey="Literal61Resource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal8" runat="server" Text="Clima Inicio Manga 1" meta:resourcekey="Literal8Resource3"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMA_M1") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal114" runat="server" Text="Clima Media-Carrera Manga 1" meta:resourcekey="Literal114Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAMID_ESCENARIO_M1") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal115" runat="server" Text="Probab. Media-Carrera Manga 1" meta:resourcekey="Literal115Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAMID_PORC_M1") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal116" runat="server" Text="Clima Fin-Carrera Manga 1" meta:resourcekey="Literal116Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAEND_M1") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal117" runat="server" Text="Probab. Fin-Carrera Manga 1" meta:resourcekey="Literal117Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAEND_PORC_M1") %>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal9" runat="server" Text="Clima Inicio Manga 2" meta:resourcekey="Literal9Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMA_M2") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal118" runat="server" Text="Clima Media-Carrera Manga 2" meta:resourcekey="Literal118Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAMID_ESCENARIO_M2") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal119" runat="server" Text="Probab. Media-Carrera Manga 2" meta:resourcekey="Literal119Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAMID_PORC_M2") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal120" runat="server" Text="Clima Fin-Carrera Manga 2" meta:resourcekey="Literal120Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAEND_M2") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal121" runat="server" Text="Probab. Fin-Carrera Manga 2" meta:resourcekey="Literal121Resource1"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_CLIMAEND_PORC_M2") %>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal87" runat="server" Text="Tuneo" meta:resourcekey="Literal87Resource5"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_TUNEO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal89" runat="server" Text="Piezas" meta:resourcekey="Literal89Resource5"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_PIEZAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal90" runat="server" Text="Daños" meta:resourcekey="Literal90Resource5"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_DAÑOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal91" runat="server" Text="Ayudas" meta:resourcekey="Literal91Resource5"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_AYUDAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal92" runat="server" Text="Embrague" meta:resourcekey="Literal92Resource5"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_EMBRAGUE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal93" runat="server" Text="Vista" meta:resourcekey="Literal93Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_VISTA") %>
                                                            </p>


                                                        </td>

                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal94" runat="server" Text="Paradas Rápidas" meta:resourcekey="Literal94Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_PITSTOPS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal29" runat="server" Text="Colision" meta:resourcekey="Literal29Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_COLISION") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal30" runat="server" Text="Tipo Salida" meta:resourcekey="Literal30Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_SALIDA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal35" runat="server" Text="Tracción" meta:resourcekey="Literal35Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_TRACCION") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal36" runat="server" Text="% Handicap" meta:resourcekey="Literal36Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_HANDICAP") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal37" runat="server" Text="% Agarre" meta:resourcekey="Literal37Resource4"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FR_AGARRE") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="repGTS" runat="server">
                            <ItemTemplate>
                                <div class="main-board wow fadeInDown" data-wow-delay="0.3s">
                                    <div class="bordercal">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <%# DameCircuito(DataBinder.Eval(Container.DataItem,"IDLOGO"), DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                            </div>
                                            <div class="col-md-9 col-xs-12">
                                                <h1><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %> <%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %> - <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h1>
                                                <h4><%# DataBinder.Eval(Container.DataItem,"INFORMACION").ToString() %></h4>
                                                <h5>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Coches"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"COCHES") %></h5>
                                                <h6><%# DameMod(DataBinder.Eval(Container.DataItem,"URLMOD").ToString()) %></h6>
                                                <h6><%# DameYT(DataBinder.Eval(Container.DataItem,"URLEMISIONTV").ToString()) %></h6>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"ID")) %>
                                                <a class="label label-default label-small" role="button" data-toggle="collapse" href="#GTS<%# DataBinder.Eval(Container.DataItem,"ID") %>" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-list"></i>
                                                    <asp:Literal ID="Literal123" runat="server" Text="Ver datos de sala" meta:resourcekey="datossala"></asp:Literal></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row collapse" style="padding: 10px" id="GTS<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                        <div class="col-md-3 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="sesionesopcion" runat="server" Text="Opciones de la Sesi&oacute;n" meta:resourcekey="sesionesopcionResource1"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal26" runat="server" Text="Prácticas" meta:resourcekey="Literal26Resource5"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"PRACTICASTIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal27" runat="server" Text="Clasificación" meta:resourcekey="Literal27Resource5"></asp:Literal>: <%# DameDuracionMin(DataBinder.Eval(Container.DataItem,"CUALITIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal24" runat="server" Text="Hora Carrera Simulador" meta:resourcekey="Literal24Resource2"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"HORAPRACTICAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal28" runat="server" Text="Carrera" meta:resourcekey="Literal28Resource5"></asp:Literal>: <%# DameDuracion(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS"),DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal58" runat="server" Text="Clima"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"AC_CLIMA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal144" runat="server" Text="Modo de sala"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_MODO_SALA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal145" runat="server" Text="Tiempo fin de carrera"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_TIEMPOFIN") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-9 col-xs-12">
                                            <table class="table table-bordered">
                                                <caption style="border-top: 1px solid #cccccc; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal289" runat="server" Text="Configuración de Sala"></asp:Literal></caption>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal8" runat="server" Text="Equilibrio Rendimiento"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_RENDIMIENTO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal114" runat="server" Text="Límite de potencia"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_LIMITE_POT") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal115" runat="server" Text="Peso"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_PESO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal116" runat="server" Text="Clasif. Neum. Máxima"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_CLAS_NEUM_MAX") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal117" runat="server" Text="Clasif. Neum. Mínima"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_CLAS_NEUM_MIN") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal87" runat="server" Text="Restricciones de diseño"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_DISENOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal89" runat="server" Text="Tipo Número Coche"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_TIPO_NUM_COCHE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal91" runat="server" Text="Configuración"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_CONFIG") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal92" runat="server" Text="Kart"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_KART") %>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal94" runat="server" Text="Fantasmas en carrera"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_FANTASMAS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal146" runat="server" Text="Fantasmas coches doblados"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_FANTASMA_DOBLADO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal29" runat="server" Text="Penalización por atajo"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_ATAJO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal30" runat="server" Text="Penalización choque muros"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_MURO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal35" runat="server" Text="Detección choque muros"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_DETEC_MURO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal36" runat="server" Text="Penalización contacto lateral"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_LATERAL") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal37" runat="server" Text="Corregir trayectoria"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_TRAYECTORIA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal124" runat="server" Text="Reposicionar coche abandono"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_REPOSICIONAR") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal127" runat="server" Text="Reglas de banderas"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_BANDERAS") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal128" runat="server" Text="Ayuda al contravolantear"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_CONTRAVOLANTE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal129" runat="server" Text="Gestion estabilidad (ASM)"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_ASM") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal130" runat="server" Text="Asistencia trazada"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_TRAZADA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal131" runat="server" Text="Control de tracción (TCS)"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_TCS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal132" runat="server" Text="ABS"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_aBS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal133" runat="server" Text="Piloto automático"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_PILOTO_AUT") %>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p>
                                                                <asp:Literal ID="Literal134" runat="server" Text="Tipo de salida"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_TIPO_SALIDA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal135" runat="server" Text="Parrilla de salida"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_PARRILLA") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal136" runat="server" Text="Impulso"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_IMPULSO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal137" runat="server" Text="Fuerza del rebufo"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_REBUFO") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal138" runat="server" Text="Daños visibles"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_DANOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal139" runat="server" Text="Daños mecánicos"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_DANOS_MEC") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal140" runat="server" Text="Desgaste de neumáticos"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_NEUMATICOS") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal141" runat="server" Text="Gasto de combustible"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_COMBUSTIBLE") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal142" runat="server" Text="Combustible inicial"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_COMB_INICIAL") %>
                                                            </p>
                                                            <p>
                                                                <asp:Literal ID="Literal143" runat="server" Text="Agarre reducido en mojado"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"GT_AGARRE") %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </section>



        <!-- Sponsors Section Start -->
        <asp:Panel ID="panSponsors" runat="server" Visible="False" meta:resourcekey="panSponsorsResource1">
            <a name="sponsors"></a>
            <section id="sponsors" class="section">
                <div class="container">
                    <div class="row" style="align-content: center;">
                        <div class="col-md-12">
                            <h2 class="section-title wow fadeInUp" data-wow-delay="0s">
                                <asp:Literal ID="Literal42" runat="server" meta:resourcekey="Literal42Resource1" Text="Nuestros Sponsor"></asp:Literal>s</h2>
                        </div>
                        <asp:Repeater ID="repSponsors" runat="server">
                            <ItemTemplate>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                    <div class="spnsors-logo wow fadeInUp" data-wow-delay="0.1s">
                                        <a target="_blank" href="<%# DataBinder.Eval(Container.DataItem,"URL") %>">
                                            <img style="width: 156px; height: 156px;" src="../Content/img/sponsors/<%# DataBinder.Eval(Container.DataItem,"IDUSUARIO") %>/<%# DataBinder.Eval(Container.DataItem,"FICHERO") %>" alt="<%# DataBinder.Eval(Container.DataItem,"URL") %>"></a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </section>
        </asp:Panel>

        <asp:Panel ID="panIncripcion" runat="server" meta:resourcekey="panIncripcionResource1">
            <a name="inscripcion"></a>
            <section id="inscripcion" class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12 contact-form">
                            <h2 class="section-title wow fadeInUp" data-wow-delay="0s">
                                <asp:Literal ID="Literal43" runat="server" meta:resourcekey="Literal43Resource1" Text="Inscripción"></asp:Literal></h2>
                            <p class="section-subcontent wow fadeInUp" data-wow-delay="0.2s">
                                <asp:Literal ID="Literal44" runat="server" meta:resourcekey="Literal44Resource1" Text="El plazo de inscripción es del"></asp:Literal>
                                <%=desde %>
                                <asp:Literal ID="Literal45" runat="server" meta:resourcekey="Literal45Resource1" Text="al"></asp:Literal>
                                <%=hasta %><br />
                                <%=nummax %><br />
                                <span id="tweet" runat="server">
                                    <i class="icon icon-social-twitter"></i>
                                    <asp:Literal ID="Literal34" runat="server" meta:resourcekey="Literal34Resource2" Text="&lt;a href=&quot;http://twitter.com/simracingchamps&quot;&gt;Síguenos en Twitter&lt;/a&gt; y recibirás un tweet cuando se abra la inscripción"></asp:Literal>
                                </span>
                            </p>
                        </div>
                        <div class="col-md-12 col-xs-12 contact-form" role="form" id="incricpcionForm" data-toggle="validator" runat="server">
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <asp:Literal ID="Literal46" runat="server" meta:resourcekey="Literal46Resource1" Text="Indica los datos de acceso de tu cuenta y selecciona el coche de cada carrera para realizar la inscripción"></asp:Literal>:
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 col-xs-12">
                                    <div class="label-line">
                                        <label class="label transition"><i class="icon-user" aria-hidden="true"></i>Email</label>
                                        <asp:TextBox ID="tUser" CssClass="form-control" runat="server" meta:resourcekey="tUserResource1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tUser" ErrorMessage="Indica tus datos de acceso" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12">
                                    <div class="label-line">
                                        <span class="span"></span>
                                        <label class="label transition">
                                            <i class="icon-lock" aria-hidden="true"></i>
                                            <asp:Literal ID="Literal47" runat="server" meta:resourcekey="Literal47Resource1" Text="Contraseña"></asp:Literal></label>
                                        <asp:TextBox ID="tPass" CssClass="form-control" runat="server" TextMode="Password" meta:resourcekey="tPassResource1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tPass" ErrorMessage="Indica tus datos de acceso" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <% if (dorsal)
                                    { %>
                                <div class="col-md-5 col-xs-12">
                                    <div class="label-line">
                                        <label class="label transition">
                                            <asp:Literal runat="server" meta:resourcekey="dorsal" ID="litdorsal" Text="Dorsal"></asp:Literal></label>
                                        <asp:TextBox ID="tDorsal" CssClass="form-control" runat="server" meta:resourcekey="tDorsalResource1"></asp:TextBox>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <%} %>
                                <% if (skin)
                                    { %>
                                <div class="col-md-5 col-xs-12">
                                    <div class="label-line">
                                        <label class="label transition">
                                            <asp:Literal runat="server" meta:resourcekey="skin" ID="Literal25" Text="Subir Skin"></asp:Literal></label>
                                        <asp:FileUpload ID="fuSkin" CssClass="form-control" runat="server" meta:resourcekey="fuSkinResource1" />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">

                                    <asp:Panel ID="panCoches" runat="server" meta:resourcekey="panCochesResource1">
                                        <div class="label-line textarea">
                                            <span class="span"></span>
                                            <table class="table table-hover">
                                                <caption style="text-align: center; background-color: whitesmoke;">
                                                    <asp:Literal ID="Literal48" runat="server" meta:resourcekey="Literal48Resource1" Text="Selecciona el coche a usar en cada carrera"></asp:Literal></caption>
                                                <thead>
                                                    <tr class="hidden-xs">
                                                        <th>
                                                            <asp:Literal ID="Literal49" runat="server" meta:resourcekey="Literal49Resource1" Text="Fecha"></asp:Literal></th>
                                                        <th>
                                                            <asp:Literal ID="Literal50" runat="server" meta:resourcekey="Literal50Resource1" Text="Carrera"></asp:Literal></th>
                                                        <th>
                                                            <asp:Literal ID="Literal51" runat="server" meta:resourcekey="Literal51Resource1" Text="Coche"></asp:Literal></th>
                                                    </tr>
                                                    <tr class="visible-xs">
                                                        <th>
                                                            <asp:Literal ID="Literal125" runat="server" meta:resourcekey="Literal50Resource1" Text="Carrera"></asp:Literal>/<asp:Literal ID="Literal147" runat="server" meta:resourcekey="Literal51Resource1" Text="Coche"></asp:Literal></th>

                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%=cochescad %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </asp:Panel>
                                    <%--<input class="btn btn-common pull-right" id="bInscribe" type="submit" />--%>
                                    <asp:Button ID="bInscribete" CssClass="btn btn-common pull-right" runat="server" Text="Inscríbete" OnClick="bInscribete_Click" meta:resourcekey="bInscribeteResource1" />
                                    <a href="register_driver.aspx" class="btn btn-primary span3">
                                        <asp:Literal ID="Literal52" runat="server" meta:resourcekey="Literal52Resource1" Text="Regístrate"></asp:Literal></a>
                                    <a name="resinscripcion"></a>
                                    <asp:Label ID="lblmensaje" runat="server" Visible="False" CssClass="alert alert-danger" meta:resourcekey="lblmensajeResource1"></asp:Label>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </asp:Panel>

        <asp:Panel ID="panInscritos" runat="server" meta:resourcekey="panInscritosResource1">
            <a name="inscritos"></a>
            <section id="featured" class="section gray-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="section-title wow fadeInUp animated" data-wow-delay="0s" style="visibility: visible; -webkit-animation-delay: 0s; -moz-animation-delay: 0s; animation-delay: 0s;">
                                <asp:Literal ID="Literal53" runat="server" meta:resourcekey="Literal53Resource1" Text="Pilotos inscritos"></asp:Literal></h2>
                            <div class="col-md-12 col-sm-12">
                                <table class="table table-bordered" style="background-color: white;">
                                    <asp:Repeater ID="repInscritos" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center; vertical-align: middle;"><%# Container.ItemIndex + 1 %></td>
                                                <td>
                                                    <div style='float: left; padding-right: 10px; margin-right: 0px;'>
                                                        <img class="img-circle" style='height: 40px; width: 40px; vertical-align: middle;' src='<%# DameAvatar(DataBinder.Eval(Container.DataItem,"IDUSUARIO").ToString(), DataBinder.Eval(Container.DataItem,"AVATAR")) %>'>
                                                    </div>
                                                    <p style='float: left; margin-bottom: 0px;'>
                                                        <b><a href='rank.aspx?n=<%# DataBinder.Eval(Container.DataItem,"NID") %>'><%# DataBinder.Eval(Container.DataItem,"INSCRITO") %></a></b>&nbsp;<img src='Content/img/flags/<%# DataBinder.Eval(Container.DataItem,"CODPAIS").ToString().Trim() %>.png'><br>
                                                        <%# DameEquipo(DataBinder.Eval(Container.DataItem,"EQUIPO"),DataBinder.Eval(Container.DataItem,"IDEQUIPO"), DataBinder.Eval(Container.DataItem,"ESCUDERIA"), DataBinder.Eval(Container.DataItem,"IDJUEGO"), DataBinder.Eval(Container.DataItem,"COMUNIDAD")) %>
                                                    </p>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </asp:Panel>

        <asp:Panel ID="panResultados" runat="server" meta:resourcekey="panResultadosResource1">
            <a name="resultados"></a>
            <section id="resultados" class="section gray-bg">
                <div class="container" style="width: 80%">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <h2 class="section-title" data-wow-delay="0s" style="visibility: visible; -webkit-animation-delay: 0s; -moz-animation-delay: 0s; animation-delay: 0s;">
                                <asp:Literal ID="Literal54" runat="server" meta:resourcekey="Literal54Resource1" Text="Resultados"></asp:Literal></h2>
                            <div class="main-board">
                                <div class="col-md-12 col-sm-12">
                                    <%=resultados %>
                                    <% if (resultados != "")
                                        { %>
                                    <p><b>DNS</b> - No corrió - Do not start / <b>DSQ</b> - Descalificado - Disqualified / <b>RET</b> - Retirado - Retired / <span style="background-color: #d298d2; color: #d298d2;">__</span> Vuelta Rápida - Quick Lap / <span style="background-color: red; color: red;">__</span> Bonificación negativa - Penalties - Incidencias</p>
                                    <%} %>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </section>

        </asp:Panel>

        <div class="clearfix"></div>

        <asp:Panel ID="panNoticias" runat="server" meta:resourcekey="panNoticiasResource1">
            <a name="noticias"></a>
            <section id="content" class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <h2 class="section-title" data-wow-delay="0s" style="visibility: visible; -webkit-animation-delay: 0s; -moz-animation-delay: 0s; animation-delay: 0s;">
                                <asp:Literal ID="Literal112" runat="server" meta:resourcekey="Noticias" Text="Noticias"></asp:Literal></h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-xs-12" style="padding-top: 10px;">

                            <asp:Repeater ID="repNoticias" runat="server">
                                <ItemTemplate>
                                    <div class="blog-post2">
                                        <!-- Post feature-inner -->
                                        <div class="feature-inner">
                                            <a class="lightbox" href="<%# DameFotoNoticia(DataBinder.Eval(Container.DataItem,"ID"), DataBinder.Eval(Container.DataItem,"IMAGEN")) %>">
                                                <img src="<%# DameFotoNoticia(DataBinder.Eval(Container.DataItem,"ID"), DataBinder.Eval(Container.DataItem,"IMAGEN")) %>" alt=""></a>
                                        </div>
                                        <!-- End Post feature-inner -->
                                        <!-- Post format icon -->
                                        <div class="post-format">
                                            <span>
                                                <a href="#"><i class="icon-picture"></i></a>
                                            </span>
                                        </div>
                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <h3 class="post-title"><a href="#"><%# DataBinder.Eval(Container.DataItem,"TITULO") %></a></h3>
                                            <div class="meta">
                                                <span class="meta-part"><a href="#"><i class="icon-user"></i><%# DataBinder.Eval(Container.DataItem,"AUTOR") %></a></span>
                                                <span class="meta-part"><a href="#"><i class="icon-calendar"></i><%# DataBinder.Eval(Container.DataItem,"FECHA") %></a></a></span>
                                                <span class="meta-part"><a href="#"><i class="icon-event"></i>Blog</a></span>
                                            </div>
                                            <p><%# DameInicio(DataBinder.Eval(Container.DataItem,"TEXTO")) %></p>
                                            <a class="btn btn-common btn-small" href="noticia.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&ev=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">Sigue leyendo</a>
                                        </div>
                                        <!-- Post Content -->
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <aside id="sidebar" class="col-md-4 col-xs-12 right-sidebar">
                            <div class="widget widget-popular-posts">
                                <h5 class="widget-title">Todas las noticias</h5>
                                <ul class="posts-list">
                                    <asp:Repeater ID="repTodasNoticias" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <div class="widget-thumb">
                                                    <a href="noticia.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&ev=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">
                                                        <img style="height: 86px; width: 80px;" src="<%# DameFotoNoticia(DataBinder.Eval(Container.DataItem,"ID"), DataBinder.Eval(Container.DataItem,"IMAGEN")) %>" alt=""></a>
                                                </div>
                                                <div class="widget-content" style="line-height: 14px; font-size: 13px;">
                                                    <a href="noticia.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&ev=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>"><%# DataBinder.Eval(Container.DataItem,"TITULO") %></a>
                                                    <span><i class="icon-user"></i><%# DataBinder.Eval(Container.DataItem,"AUTOR") %></span>
                                                    <span><i class="icon-calendar"></i><%# DataBinder.Eval(Container.DataItem,"FECHA") %></span>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="widget">
                                <h5 class="widget-title"><i class="fa fa-gamepad"></i>
                                    <asp:Literal ID="Literal122" runat="server" Text="Publicidad"></asp:Literal></h5>
                                <p><a target="_blank" href="https://www.instant-gaming.com/igr/simracingchamps/">Tus juegos en Instant-Gaming al mejor precio</a></p>
                                <iframe src="https://www.instant-gaming.com/affgames/igr2989455/296x200?prod_ids=2006" scrolling="no" frameborder="0" style="border: 1px solid #ccc; border-radius: 5px; overflow: hidden; width: 296px; height: 200px;" allowtransparency="true"></iframe>
                                <iframe src="https://www.instant-gaming.com/affgames/igr2989455/296x200?prod_ids=891" scrolling="no" frameborder="0" style="border: 1px solid #ccc; border-radius: 5px; overflow: hidden; width: 296px; height: 200px;" allowtransparency="true"></iframe>
                                <iframe src="https://www.instant-gaming.com/affgames/igr2989455/296x200?prod_ids=2143" scrolling="no" frameborder="0" style="border: 1px solid #ccc; border-radius: 5px; overflow: hidden; width: 296px; height: 200px;" allowtransparency="true"></iframe>
                                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                <!-- SRC_Lateral -->
                                <ins class="adsbygoogle"
                                    style="display: block"
                                    data-ad-client="ca-pub-1139835080906338"
                                    data-ad-slot="3506349370"
                                    data-ad-format="auto"></ins>
                                <script>
                                    (adsbygoogle = window.adsbygoogle || []).push({});
                                </script>
                            </div>
                        </aside>
                    </div>
                </div>
            </section>

        </asp:Panel>

        <!-- Sponsors Section End -->
        <a name="contacto"></a>
        <section id="map">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="section-title wow fadeInUp" data-wow-delay="0s">
                            <asp:Literal ID="Literal55" runat="server" meta:resourcekey="Literal55Resource1" Text="¿Alguna duda?"></asp:Literal></h2>
                        <p class="section-subcontent wow fadeInUp" data-wow-delay="0.2s">
                            <asp:Literal ID="Literal56" runat="server" meta:resourcekey="Literal56Resource1" Text="Puedes contactar con el organizador y te resolverán cualquier duda que tengas sobre el campeonato"></asp:Literal>
                        </p>
                        <div style="font-size: 30px; padding-bottom: 30px;" class="text-center">
                            <%=DameSocial() %>
                        </div>
                        <%-- <div id="disqus_thread"></div>--%>
                    </div>
                </div>
            </div>
        </section>


        <!-- Copytight Start -->
        <section id="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p class="copyright-text text-center">
                            ©2017 <a href="http://simracingchamps.net/default.aspx">SimRacingChamps.net</a>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Copytight End -->

        <!-- Go to Top Link -->
        <a href="#" class="back-to-top">
            <i class="icon-arrow-up"></i>
        </a>



        <!-- jQuery Load -->
        <script src="assets/js/jquery.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Countdown Js -->
        <script src="assets/js/jquery.countdown.min.js"></script>
        <!-- Smooth scroll JS -->
        <script src="assets/js/smooth-scroll.js"></script>
        <!-- Wow Scroll -->
        <script src="assets/js/wow.js"></script>
        <!-- Owl carousel -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- Slicknav js -->
        <script src="assets/js/jquery.slicknav.js"></script>
        <!--  Nivo lightbox Js -->
        <script src="assets/js/nivo-lightbox.js"></script>
        <!-- Contact Form Scripts -->
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/contact-form-script.js"></script>

        <!-- All Js plugin -->
        <script src="assets/js/main.js"></script>
        <!-- Map JS -->
        <script type="text/javascript" src="assets/js/jquery.mapit.min.js"></script>
        <script src="assets/js/initializers.js"></script>
        <script>
            $(document).ready(function () {
                jQuery('#clock').countdown('<%=relojini%>');
            });

            $('bInscribe').on('click', function (e) {
                e.defaultPrevented();
                var valido = 1;
                $('#miform').find("select:required").each(function (index, element) {
                    if (element.value === '') {
                        valido = 0;
                    }
                });
                if (valido == 1) {
                    var datastring = $('#miform input,#miform select').serialize();
                    $.ajax({
                        type: 'POST',
                        url: 'datos.aspx?ev=<%=Request.QueryString["id"].ToString()%>',
                        data: datastring,
                        success: function (response) {
                            if (response == '0') {
                                $.gritter.add({
                                    title: 'SimRacingChamps',
                                    text: 'Te has inscrito correctamente',
                                    class_name: 'gritter-success gritter-dark',
                                    time: 1000
                                });
                                window.location.reload();
                            }
                            else
                                bootbox.alert("Error al realizar la inscripción");
                        }
                    }); //end ajax
                    return false;
                }
                else {
                    e.preventDefault();
                    alert('Por favor rellena todos los datos');
                    return false;
                }
            });

             <%--var disqus_config = function () {
                 this.page.url = 'http://simracingchamps.net/eventos.aspx';  
                 this.page.identifier = '<%# Request.QueryString["id"].ToString() %>' 
             };

             (function () { // DON'T EDIT BELOW THIS LINE
                 var d = document, s = d.createElement('script');
                 s.src = 'https://simracingchamps.disqus.com/embed.js';
                 s.setAttribute('data-timestamp', +new Date());
                 (d.head || d.body).appendChild(s);
             })();--%>
</script>

    </form>
</body>
</html>
