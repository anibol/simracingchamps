<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="IRT._default1" meta:resourcekey="PageResource1" Culture="auto:es-ES" UICulture="auto" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/events3.css" rel="stylesheet" />
    <style>
        .miboton {
            border-radius: 0px;
            width: 80px;
            color: white;
            font-weight: bold;
            padding: 0px;
            background-color: gainsboro;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="carousel-area">
        <div id="carousel-slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner" role="listbox">
                <%=carrusel %>
            </div>

            <a class="left carousel-control" href="#carousel-slider" role="button" data-slide="prev">
                <span class="icon-arrow-left" aria-hidden="true"></span>
            </a>
            <a class="right carousel-control" href="#carousel-slider" role="button" data-slide="next">
                <span class="icon-arrow-right" aria-hidden="true"></span>
            </a>
        </div>
    </div>
    <section id="content" class="section" style="padding-top: 30px">
        <div class="container">
            <div class="row">

                <div class="col-md-8">
                    <div class="widget widget-popular-posts" id="panProximosChamps" runat="server" visible="true">
                        <h5 class="widget-title"><i class="fa fa-trophy"></i>
                            <asp:Label ID="Label1" runat="server" Text="Próximos campeonatos" meta:resourcekey="Label1Resource1"></asp:Label>
                        </h5>

                        <ul class="event-list">

                            <asp:Repeater ID="repProximosCampeonatos" runat="server">
                                <ItemTemplate>
                                    <li class="box <%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>">
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()).Year  %></span>
                                        </time>

                                        <img class="hidden-xs" alt="<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %>" style="height: 79px; width: 140px;" src="Content/img/avatar/<%# DataBinder.Eval(Container.DataItem,"IDUSUARIO") %>/<%# DataBinder.Eval(Container.DataItem,"AVATAR") %>" />

                                        <div class="info">
                                            <h2 class="title" data-id="<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></h2>
                                            <p class="desc" style="line-height: 16px">
                                                <asp:Label ID="lblPlazoInscripcion" runat="server" Text="Plazo de Inscripción:" meta:resourcekey="lblPlazoInscripcionResource1"></asp:Label>
                                                <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %>
                                                <asp:Label ID="lblAl" runat="server" Text="al" meta:resourcekey="lblAlResource1"></asp:Label>
                                                <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %>
                                                <%# DiaHora(DataBinder.Eval(Container.DataItem,"ID"))%>
                                                <%# Plazas(DataBinder.Eval(Container.DataItem,"NUMAX")) %>
                                            </p>

                                            <ul>
                                                <li class="organizador" style="width: 60%;"><a href="rank_org.aspx?n=<%# DataBinder.Eval(Container.DataItem,"NID") %>">
                                                    <asp:Label ID="lblOrganiza3" runat="server" Text="Organiza" CssClass="hidden-xs" meta:resourcekey="lblOrganizaResource1"></asp:Label>&nbsp;</span><%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameFB(DataBinder.Eval(Container.DataItem,"FACEBOOK")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameTwitter(DataBinder.Eval(Container.DataItem,"TWITTER")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameYT(DataBinder.Eval(Container.DataItem,"YOUTUBE")) %></li>
                                                <li>
                                                    <a class="hidden-xs" style="border-radius: 5px; width: 87px; color: white; font-weight: bold; text-align: center; background-color: royalblue;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                        <asp:Literal ID="bInscribete" runat="server" meta:resourcekey="bMasInfoResource1" Text="Más info"></asp:Literal></a>

                                                </li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook">
                                                    <img src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter">
                                                    <img src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>
                                                <li class="visible-xs">
                                                    <a style="height: 39px; width: 39px; color: white; font-weight: bold; text-align: center; background-color: royalblue; font-size: 1.5em;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                        <i class="fa fa-info-circle"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>
                    <div class="widget widget-popular-posts" id="panInscripciones" runat="server" visible="true">
                        <h5 class="widget-title"><i class="fa fa-calendar"></i>
                            <asp:Label ID="lblInscripcionesAbiertas" runat="server" Text="Incripciones abiertas" meta:resourcekey="lblInscripcionesAbiertasResource1"></asp:Label></h5>
                        <ul class="event-list">

                            <asp:Repeater ID="repEventos" runat="server">
                                <ItemTemplate>
                                    <li class="box <%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>">
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()).Year  %></span>
                                        </time>

                                        <img class="hidden-xs" alt="<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %>" style="height: 79px; width: 140px;" src="Content/img/avatar/<%# DataBinder.Eval(Container.DataItem,"IDUSUARIO") %>/<%# DataBinder.Eval(Container.DataItem,"AVATAR") %>" />

                                        <div class="info">
                                            <h2 class="title" data-id="<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></h2>
                                            <p class="desc" style="line-height: 16px">
                                                <asp:Label ID="lblPlazoInscripcion" runat="server" Text="Plazo de Inscripción:" meta:resourcekey="lblPlazoInscripcionResource1"></asp:Label>
                                                <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %>
                                                <asp:Label ID="lblAl" runat="server" Text="al" meta:resourcekey="lblAlResource1"></asp:Label>
                                                <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %>
                                                <%# DiaHora(DataBinder.Eval(Container.DataItem,"ID"))%>
                                                <%# Plazas(DataBinder.Eval(Container.DataItem,"NUMAX")) %>
                                            </p>

                                            <ul>
                                                <li style="width: 58%;"><a href="rank_org.aspx?n=<%# DataBinder.Eval(Container.DataItem,"NID") %>">
                                                    <asp:Label ID="lblOrganiza2" runat="server" Text="Organiza" CssClass="hidden-xs" meta:resourcekey="lblOrganizaResource1"></asp:Label>&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameFB(DataBinder.Eval(Container.DataItem,"FACEBOOK")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameTwitter(DataBinder.Eval(Container.DataItem,"TWITTER")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameYT(DataBinder.Eval(Container.DataItem,"YOUTUBE")) %></li>
                                                <li>
                                                    <a class="hidden-xs" style="border-radius: 5px; width: 95px; color: white; font-weight: bold; text-align: center; background-color: darkorange; font-size: 0.85em;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                        <asp:Literal ID="bInscribete" runat="server" meta:resourcekey="bInscribeteResource1" Text="Inscríbete"></asp:Literal>&nbsp;(<%# DataBinder.Eval(Container.DataItem,"BOTONINSCRITOS") %>)</a>

                                                </li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook">
                                                    <img src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter">
                                                    <img src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>
                                                <li class="visible-xs">
                                                    <a style="height: 39px; width: 39px; color: white; font-weight: bold; text-align: center; background-color: darkorange; font-size: 1.5em;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                        <i class="fa fa-sign-in"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>


                    </div>

                    <div class="widget widget-popular-posts" id="panEnCurso" runat="server" visible="true">
                        <h5 class="widget-title"><i class="fa fa-clock-o"></i>
                            <asp:Label ID="Label3" runat="server" Text="Campeonatos en curso" meta:resourcekey="Label3Resource1"></asp:Label></h5>
                        <ul class="event-list">

                            <asp:Repeater ID="repEnCurso" runat="server">
                                <ItemTemplate>
                                    <li class="box <%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>">
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPROXIMA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPROXIMA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHAPROXIMA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPROXIMA").ToString()).Year  %></span>
                                        </time>

                                        <img class="hidden-xs" alt="<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %>" style="height: 79px; width: 140px;" src="Content/img/avatar/<%# DataBinder.Eval(Container.DataItem,"IDUSUARIO") %>/<%# DataBinder.Eval(Container.DataItem,"AVATAR") %>" />

                                        <div class="info">
                                            <h2 class="title" data-id="<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></h2>
                                            <p class="desc" style="line-height: 16px">
                                                <asp:Label ID="lblPlazoInscripcion" runat="server" Text="Próxima carrera:" meta:resourcekey="lblPlazoInscripcionResource2"></asp:Label>
                                                <%# DataBinder.Eval(Container.DataItem,"PROXIMACARRERA") %>
                                                <%# DiaHora(DataBinder.Eval(Container.DataItem,"ID"), false)%>
                                            </p>

                                            <ul>
                                                <li style="width: 60%;"><a href="rank_org.aspx?n=<%# DataBinder.Eval(Container.DataItem,"NID") %>">
                                                    <asp:Label ID="lblOrganiza2" runat="server" Text="Organiza" CssClass="hidden-xs" meta:resourcekey="lblOrganizaResource1"></asp:Label>&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameFB(DataBinder.Eval(Container.DataItem,"FACEBOOK")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameTwitter(DataBinder.Eval(Container.DataItem,"TWITTER")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameYT(DataBinder.Eval(Container.DataItem,"YOUTUBE")) %></li>
                                                <li>
                                                    <a class="hidden-xs" style="border-radius: 5px; width: 87px; color: white; font-weight: bold; text-align: center; background-color: royalblue;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                        <asp:Literal ID="bInscribete" runat="server" Text="Minisite" meta:resourcekey="bInscribeteResource2"></asp:Literal></a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook">
                                                    <img src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter">
                                                    <img src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>
                                                <li class="visible-xs">
                                                    <a style="height: 39px; width: 39px; color: white; font-weight: bold; text-align: center; background-color: royalblue; font-size: 1.5em;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                        <i class="fa fa-info-circle"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>

                    <div class="widget widget-popular-posts" id="panResultados" runat="server" visible="true">
                        <h5 class="widget-title"><i class="fa fa-road"></i>
                            <asp:Label ID="Label2" runat="server" Text="Últimos resultados" meta:resourcekey="Label2Resource1"></asp:Label></h5>
                        <ul class="event-list">

                            <asp:Repeater ID="repResultados" runat="server">
                                <ItemTemplate>
                                    <li class="box <%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>">
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Year  %></span>

                                        </time>

                                        <%# DameCircuito(DataBinder.Eval(Container.DataItem,"CIRCUITO"),DataBinder.Eval(Container.DataItem,"IDLOGO"),DataBinder.Eval(Container.DataItem,"IDFOTO")) %>
                                        <%-- <div class="top3">
                                            <ul>
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"IDEVENTO"),DataBinder.Eval(Container.DataItem,"ID")) %>
                                            </ul>
                                        </div>--%>
                                        <div class="info">
                                            <h2 class="title" data-id="<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %> / <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h2>
                                            <p class="desc" style="line-height: 16px">
                                                <%# Top3(DataBinder.Eval(Container.DataItem,"IDEVENTO"),DataBinder.Eval(Container.DataItem,"ID")) %>
                                            </p>
                                            <ul>
                                                <li style="width: 60%;"><a href="rank_org.aspx?n=<%# DataBinder.Eval(Container.DataItem,"NID") %>">
                                                    <asp:Label ID="lblOrganiza" runat="server" Text="Organiza" CssClass="hidden-xs" meta:resourcekey="lblOrganizaResource1"></asp:Label>&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameFB(DataBinder.Eval(Container.DataItem,"FACEBOOK")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameTwitter(DataBinder.Eval(Container.DataItem,"TWITTER")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameYT(DataBinder.Eval(Container.DataItem,"YOUTUBE")) %></li>
                                                <li>
                                                    <a class="hidden-xs" style="border-radius: 5px; width: 87px; color: white; font-weight: bold; text-align: center; background-color: forestgreen;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>#resultados">
                                                        <asp:Literal ID="bResultados" runat="server" meta:resourcekey="bResultados" Text="Clasificación"></asp:Literal></a>

                                                </li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook">
                                                    <img src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter">
                                                    <img src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>
                                                <li class="visible-xs">
                                                    <a style="height: 39px; width: 39px; color: white; font-weight: bold; text-align: center; background-color: forestgreen; font-size: 1.5em;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">
                                                        <i class="fa fa-info-circle"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>

                    <%--<div class="widget widget-popular-posts" id="panProximosCarreras" runat="server" visible="true">
                        <h5 class="widget-title"><i class="fa fa-road"></i>
                            <asp:Label ID="lblProximasCarreras" runat="server" Text="Próximas carreras" meta:resourcekey="lblProximasCarrerasResource1"></asp:Label></h5>
                        <ul class="event-list">

                            <asp:Repeater ID="repProxCarreras" runat="server">
                                <ItemTemplate>
                                    <li class="box <%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>">
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Year  %></span>

                                        </time>

                                        <%# DameCircuito(DataBinder.Eval(Container.DataItem,"CIRCUITO"),DataBinder.Eval(Container.DataItem,"IDLOGO"),DataBinder.Eval(Container.DataItem,"IDFOTO")) %>

                                        <div class="info">
                                            <h2 class="title" data-id="<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %> / <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h2>
                                            <p class="desc" style="line-height: 16px">
                                                <asp:Label ID="lblHora" runat="server" Text="Hora:" meta:resourcekey="lblHoraResource1"></asp:Label>
                                                <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %> |
                                                <asp:Label ID="lblDuracion" runat="server" Text="Duración:" meta:resourcekey="lblDuracionResource1"></asp:Label>
                                                <%# DameDuracion(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS"),DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %>
                                                <span class="hidden-xs">|
                                                <asp:Label ID="lblCoches" runat="server" Text="Coches:" meta:resourcekey="lblCochesResource1"></asp:Label>
                                                    <%# DameCoches(DataBinder.Eval(Container.DataItem,"COCHES"),DataBinder.Eval(Container.DataItem,"IDJUEGO")) %></span>
                                            </p>
                                            <ul>
                                                <li style="width: 60%;"><a href="rank_org.aspx?n=<%# DataBinder.Eval(Container.DataItem,"NID") %>">
                                                    <asp:Label ID="lblOrganiza" runat="server" Text="Organiza" CssClass="hidden-xs" meta:resourcekey="lblOrganizaResource1"></asp:Label>&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameFB(DataBinder.Eval(Container.DataItem,"FACEBOOK")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameTwitter(DataBinder.Eval(Container.DataItem,"TWITTER")) %></li>
                                                <li class="hidden-xs" style="width: 5%;"><%# DameYT(DataBinder.Eval(Container.DataItem,"YOUTUBE")) %></li>
                                                <li>
                                                    <a class="hidden-xs" style="border-radius: 5px; width: 87px; color: white; font-weight: bold; text-align: center; background-color: royalblue;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">
                                                        <asp:Literal ID="bMasInfo" runat="server" meta:resourcekey="bMasInfoResource1" Text="Más info"></asp:Literal></a>

                                                </li>
                                            </ul>
                                        </div>

                                        <div class="social">
                                            <ul>
                                                <li class="facebook">
                                                    <img src="Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg"></li>
                                                <li class="twitter">
                                                    <img src="Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg"></li>

                                            </ul>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>--%>

                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- SRC -->
                    <ins class="adsbygoogle"
                        style="display: block"
                        data-ad-client="ca-pub-1139835080906338"
                        data-ad-slot="5703368931"
                        data-ad-format="auto"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>

                </div>

                <aside id="sidebar" class="col-md-4 col-xs-12 right-sidebar">

                    <div class="widget widget-social">
                        <h5 class="widget-title"><i class="fa fa-search"></i>
                            <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Filtrar Campeonatos"></asp:Literal></h5>
                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="miboton" Width="40px" Height="40px" data-filter="1" ImageUrl="~/Content/img/plataformas/1.jpg" meta:resourcekey="ImageButton1Resource1" />
                        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="miboton" Width="40px" Height="40px" data-filter="2" ImageUrl="~/Content/img/plataformas/2.jpg" meta:resourcekey="ImageButton2Resource1" />
                        <asp:ImageButton ID="ImageButton3" runat="server" CssClass="miboton" Width="40px" Height="40px" data-filter="3" ImageUrl="~/Content/img/plataformas/3.jpg" meta:resourcekey="ImageButton3Resource1" />
                        <asp:ImageButton ID="ImageButton4" runat="server" CssClass="miboton btn-default" Width="40px" Height="40px" data-filter="box" ImageUrl="~/Content/img/web/filter_delete-512.png" meta:resourcekey="ImageButton4Resource1" />
                        <br />
                        <a href="historial.aspx"><i class="fa fa-history"></i>
                            <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Historial" Text="Ver Historial de Campeonatos"></asp:Literal></a>
                    </div>
                    <div class="widget widget-social">
                        <h5 class="widget-title"><i class="fa fa-info-circle"></i>
                            <asp:Literal ID="Literal10" runat="server" Text="Ayúdanos a mantener la web"></asp:Literal></h5>
                        <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NNGZ857ADKFVS">
                            <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" style="width:147px;" alt="PayPal - The safer, easier way to pay online!" />
                        </a>

                    </div>

                    <div class="widget widget-social">
                        <h5 class="widget-title"><i class="fa fa-info-circle"></i>
                            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Publica tu campeonato"></asp:Literal></h5>
                        <p>
                            <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Si eres organizador, tienes un equipo o quieres montar una competición con tus amigos, SimRacingChamps te ofrece una herramienta &lt;b&gt;sencilla y gratuita&lt;/b&gt; para la organización de campeonatos de SimRacing.&lt;br /&gt;¿Quieres saber cómo? &lt;a href=&quot;help.aspx&quot;&gt;Sigue estos sencillos pasos&lt;/a&gt;"></asp:Literal>
                        </p>
                    </div>

                    <div class="widget">
                        <h5 class="widget-title"><i class="fa fa-gamepad"></i>
                            <asp:Literal ID="Literal8" runat="server" Text="Publicidad" meta:resourcekey="Publicidad"></asp:Literal></h5>
                        <p>
                            <a target="_blank" href="https://www.instant-gaming.com/igr/simracingchamps/">
                                <asp:Literal ID="Literal9" runat="server" Text="Tus juegos en Instant-Gaming al mejor precio" meta:resourcekey="instant"></asp:Literal></a>
                        </p>
                        <iframe src="https://www.instant-gaming.com/affgames/igr2989455/296x200?prod_ids=3153,2660,1263,3098,891,2143" scrolling="no" frameborder="0" style="border: 1px solid #ccc; border-radius: 5px; overflow: hidden; width: 296px; height: 200px;" allowtransparency="true"></iframe>
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
                    <asp:Panel ID="panNoticias" runat="server" Visible="true">
                        <div class="widget widget-popular-posts">
                            <h5 class="widget-title"><i class="fa fa-newspaper-o"></i>
                                <asp:Label ID="Label5" runat="server" Text="Últimas noticias" meta:resourcekey="noticias"></asp:Label></h5>
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
                                            <div class="clearfix"></div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </asp:Panel>
                    <div class="widget widget-popular-posts">
                        <h5 class="widget-title"><i class="fa fa-shield"></i>
                            <asp:Label ID="Label4" runat="server" Text="Últimos Equipos" meta:resourcekey="Label4Resource1"></asp:Label></h5>
                        <ul class="posts-list">
                            <asp:Repeater ID="repEquipos" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <div class="widget-thumb">
                                            <a href="team.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                <img class='circuito' style='height: 79px; width: 79px;' src="<%# DameAvatarEquipo(DataBinder.Eval(Container.DataItem,"AVATAR"),DataBinder.Eval(Container.DataItem,"ID")) %>" /></a>
                                        </div>
                                        <div class="widget-content">
                                            <a href="team.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"EQUIPO") %></a>
                                            <span><i class="fa fa-calendar"></i>
                                                <asp:Literal ID="Literal5" runat="server" meta:resourcekey="fundado" Text="Fundado"></asp:Literal>: <%# DataBinder.Eval(Container.DataItem,"FUNDACION")%> </span>
                                            <span><i class="fa fa-shield"></i>
                                                <asp:Literal ID="Literal6" runat="server" meta:resourcekey="jefe" Text="Jefe de Equipo"></asp:Literal>: <%# DameJefeEquipo(DataBinder.Eval(Container.DataItem,"IDUSUARIO")) %>
                                            </span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <p>
                            <a href="teams.aspx"><i class="fa fa-shield"></i>
                                <asp:Literal ID="Literal4" runat="server" meta:resourcekey="vertodos">Ver todos</asp:Literal></a>
                        </p>
                    </div>

                    <div class="widget">
                        <h5 class="widget-title">
                            <asp:Label ID="Label6" runat="server" Text="Colaboradores" meta:resourcekey="Colaboradores"></asp:Label></h5>

                        <div id="post-carousel" class="post-slide owl-carousel owl-theme" data-slider-pagination="true" style="opacity: 1; display: block;">
                            <div class="post-list">
                                <a target="_blank" href="https://topclasscomp.wixsite.com/website">
                                    <img src="Content/img/web/topclass.png" /></a>
                                <div class="post-content">
                                    <h3><a target="_blank" href="https://topclasscomp.wixsite.com/website">TopClass Competición</a></h3>
                                    <p>En <a target="_blank" href="https://topclasscomp.wixsite.com/website">TopClass Competición</a> #eSports | Equipo virtual de competiciones Motorsport, fundado el 6 de Enero de 2.011. Actualmente compitiendo en Project CARS y Assetto Corsa.</p>
                                </div>
                            </div>
                            <div class="post-list">
                                <a target="_blank" href="#">
                                    <img src="http://simracingchamps.net/Content/img/avatar/5a556493-a395-4c2f-9eac-ca372018d9d6/logoesc.jpg" /></a>
                                <div class="post-content">
                                    <h3><a target="_blank" href="#">e-Scuderia</a></h3>
                                    <p>En <a target="_blank" href="#">e-Scuderia</a> | SimRacingChamps.net es el organizador oficial para los campeonatos de e-Scuderia, una comunidad dedicada a la organización de pruebas bajo el simulador <a target="_blank" href="http://raceroom.comn">RaceRoom Racing Experience</a></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="widget widget-popular-posts">
                        <h5 class="widget-title"><i class="fa fa-youtube"></i>
                            <asp:Label ID="lblProxYT" runat="server" Text="Próximas emisiones YouTube" meta:resourcekey="lblProxYTResource1"></asp:Label></h5>
                        <ul class="posts-list">
                            <asp:Repeater ID="repProximasTV" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <div class="widget-thumb">
                                            <%# DameCircuito(DataBinder.Eval(Container.DataItem,"CIRCUITO"),DataBinder.Eval(Container.DataItem,"IDLOGO"),DataBinder.Eval(Container.DataItem,"IDFOTO"),1) %>
                                        </div>
                                        <div class="widget-content">
                                            <a href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></a>
                                            <span><i class="fa fa-calendar"></i><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).ToShortDateString() %> <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %></span>
                                            <span><i class="fa fa-youtube"></i><a target="_blank" href="<%# DataBinder.Eval(Container.DataItem,"URLEMISIONTV") %>">
                                                <asp:Literal ID="lblVerAqui" runat="server" meta:resourcekey="lblVerAquiResource1" Text="Ver aquí"></asp:Literal></a></span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>





                    <%--   <div class="widget widget-popular-posts">
                <h5 class="widget-title"><i class="fa fa-youtube"></i>
                    <asp:Label ID="lblUltYT" runat="server" Text="Últimas emisiones YouTube" meta:resourcekey="lblUltYTResource1"></asp:Label></h5>
                <ul class="posts-list">
                    <asp:Repeater ID="repUltimasTV" runat="server">
                        <ItemTemplate>
                            <li>
                                <div class="widget-thumb">
                                    <%# DameCircuito(DataBinder.Eval(Container.DataItem,"CIRCUITO"),DataBinder.Eval(Container.DataItem,"IDLOGO"),DataBinder.Eval(Container.DataItem,"IDFOTO"),1) %>
                                </div>
                                <div class="widget-content">
                                    <a href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></a>
                                    <span><i class="fa fa-calendar"></i><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).ToShortDateString() %> <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %></span>
                                    <span><i class="fa fa-youtube"></i><a target="_blank" href="<%# DataBinder.Eval(Container.DataItem,"URLEMISIONTV") %>">
                                        <asp:Literal ID="lblVerAqui2" runat="server" meta:resourcekey="lblVerAqui2Resource1" Text="Ver aquí"></asp:Literal></a></span>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>--%>

                    <%--<div class="widget widget-social">
                        <h5 class="widget-title">Social Media</h5>
                        <div class="social-link">
                            <a class="twitter" target="_blank" href="http://www.twitter.com/simracingchamps"><i class="fa fa-twitter"></i></a>
                        </div>
                    </div>--%>
                </aside>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {

            var $boxs = $(".event-list > .box");
            var $btns = $(".miboton").on("click", function (e) {
                e.preventDefault();
                var active =
                    $btns.removeClass("active")
                        .filter(this)
                        .addClass("active")
                        .data("filter");

                $boxs
                    .hide()
                    .filter("." + active)
                    .fadeIn(450);

            });

            $('.title').on("click", function (e) {
                window.location = "eventos.aspx?id=" + $(this).data('id');
            })
        });

    </script>
</asp:Content>
