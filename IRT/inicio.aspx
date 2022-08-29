<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="IRT.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/events.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="carousel-area">
        <div id="carousel-slider" class="carousel slide" data-ride="carousel">

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="assets/img/slider/bg-1.jpg" alt="">
                    <div class="carousel-caption">
                        <h2 class="wow fadeInRight" data-wow-delay="300ms">Impression - Startup Event<br>
                            Join us be The First to Book Your Ticket</h2>
                        <div class="buttons wow fadeInDown" data-wow-delay="0.2s"><a class="btn btn-lg btn-border" href="#">Registration</a></div>
                        <a data-scroll href="#featured">
                            <div class="rev-scroll-btn wow fadeInUp" data-wow-delay="600ms">
                                <span></span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <img src="assets/img/slider/bg-2.jpg" alt="">
                    <div class="carousel-caption">
                        <h2 class="wow fadeInUp" data-wow-delay="300ms">Opportunity to showcase<br>
                            your product and services to attendees</h2>
                        <div class="buttons">
                            <a class="btn btn-lg btn-common wow fadeInLeft" data-wow-delay="300ms" href="#">Buy Tickets</a>
                            <a class="btn btn-lg btn-border wow fadeInRight" data-wow-delay="300ms" href="#">Know More</a>
                        </div>
                        <a data-scroll href="#featured">
                            <div class="rev-scroll-btn wow fadeInUp" data-wow-delay="600ms">
                                <span></span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <img src="assets/img/slider/bg-3.jpg" alt="">
                    <div class="carousel-caption">
                        <h2 class="wow fadeInDown" data-wow-delay="300ms">Expert and Love to Speak?
                            <br>
                            Apply as Speaker for Taking Session</h2>
                        <div class="wow fadeInUp" data-wow-delay="300ms"><a class="btn btn-lg btn-common" href="#">Apply Now</a></div>
                        <a data-scroll href="#featured">
                            <div class="rev-scroll-btn wow fadeInUp" data-wow-delay="600ms">
                                <span></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <a class="left carousel-control" href="#carousel-slider" role="button" data-slide="prev">
                <span class="icon-arrow-left" aria-hidden="true"></span>
            </a>
            <a class="right carousel-control" href="#carousel-slider" role="button" data-slide="next">
                <span class="icon-arrow-right" aria-hidden="true"></span>
            </a>
        </div>
    </div>
    <section id="content" class="section">
        <div class="container">
            <div class="row">

                <div class="col-md-8">
                    <div class="widget widget-popular-posts">
                        <h5 class="widget-title"><i class="fa fa-calendar"></i> Incripciones abiertas</h5>
                        <ul class="event-list">

                            <asp:Repeater ID="repEventos" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAALTA").ToString()).Year  %></span>
                                        </time>

                                        <img alt="<%# DataBinder.Eval(Container.DataItem,"NOMBRE") %>" style="height: 79px; width: auto;" src="Content/img/avatar/<%# DataBinder.Eval(Container.DataItem,"IDUSUARIO") %>/<%# DataBinder.Eval(Container.DataItem,"AVATAR") %>" />

                                        <div class="info">
                                            <h2 class="title"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></h2>
                                            <p class="desc">Plazo de Inscripción: <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %>  al <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %></p>

                                            <ul>
                                                <li style="width: 40%;"><a href="<%# DataBinder.Eval(Container.DataItem,"WEB") %>">Organiza:&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<span class="fa fa-globe"></span><%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"FACEBOOK") %>"><span class="fa fa-facebook"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"TWITTER") %>"><span class="fa fa-twitter"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"YOUTUBE") %>"><span class="fa fa-youtube"></span></a></li>
                                                <li>
                                                    <a style="border-radius: 5px; width: 80px; color: white; font-weight: bold; padding-left: 10px; background-color: darkorange;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">Inscríbete</a></li>
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
                    </div>
                    <div class="widget widget-popular-posts">
                        <h5 class="widget-title"><i class="fa fa-trophy"></i> Próximas carreras</h5>
                        <ul class="event-list">

                            <asp:Repeater ID="repProxCarreras" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <time datetime="<%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %>">
                                            <span class="day"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Day %></span>
                                            <span class="month"><%# DameMes(DataBinder.Eval(Container.DataItem,"FECHA").ToString()) %></span>
                                            <span class="year"><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).Year  %></span>

                                        </time>

                                        <img alt="<%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %>" style="height: 79px; width: auto;" src="Content/img/circuitos/<%# DataBinder.Eval(Container.DataItem,"IDLOGO") %>.jpg" />

                                        <div class="info">
                                            <h2 class="title"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %> / <%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></h2>
                                            <p class="desc">
                                                Hora: <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %> | Duración: <%# DameDuracion(DataBinder.Eval(Container.DataItem,"CARRERAVUELTAS"),DataBinder.Eval(Container.DataItem,"CARRERATIEMPO")) %> | Coches: <%# DataBinder.Eval(Container.DataItem,"COCHES") %>
                                            </p>
                                            <ul>
                                                <li style="width: 40%;"><a href="<%# DataBinder.Eval(Container.DataItem,"WEB") %>">Organiza:&nbsp;<%# DameBandera(DataBinder.Eval(Container.DataItem,"CODPAIS"))%>&nbsp;<span class="fa fa-globe"></span><%# DataBinder.Eval(Container.DataItem,"NOMBRE") %></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"FACEBOOK") %>"><span class="fa fa-facebook"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"TWITTER") %>"><span class="fa fa-twitter"></span></a></li>
                                                <li style="width: 5%;"><a href="<%# DataBinder.Eval(Container.DataItem,"YOUTUBE") %>"><span class="fa fa-youtube"></span></a></li>
                                                <li>
                                                    <a style="border-radius: 5px; width: 80px; color: white; font-weight: bold; padding-left: 10px; background-color: Highlight;" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">Más info</a></li>
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
                    </div>
                </div>

                <aside id="sidebar" class="col-md-4 right-sidebar">

                    <div class="widget widget-popular-posts">
                        <h5 class="widget-title"><i class="fa fa-youtube"></i> Próximas emisiones YouTube</h5>
                        <ul class="posts-list">
                            <asp:Repeater ID="repProximasTV" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <div class="widget-thumb">
                                           
                                                <img style="width:98px;height:81px;" src="Content/img/circuitos/<%# DataBinder.Eval(Container.DataItem,"IDLOGO") %>.jpg" alt="" />
                                        </div>
                                        <div class="widget-content">
                                            <a href="#"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></a>
                                            <span><i class="icon-calendar"></i><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).ToShortDateString() %> <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %></span>
                                            <span><i class="icon-youtube"></i><a href="<%# DataBinder.Eval(Container.DataItem,"URLEMISIONTV") %>">Ver aquí</a></span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>                            
                        </ul>
                    </div>

                     <div class="widget widget-popular-posts">
                        <h5 class="widget-title"><i class="fa fa-youtube"></i> Últimas emisiones YouTube</h5>
                        <ul class="posts-list">
                            <asp:Repeater ID="repUltimasTV" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <div class="widget-thumb">
                                           
                                                <img style="width:98px;height:81px;" src="Content/img/circuitos/<%# DataBinder.Eval(Container.DataItem,"IDLOGO") %>.jpg" alt="" />
                                        </div>
                                        <div class="widget-content">
                                            <a href="#"><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></a>
                                            <span><i class="icon-calendar"></i><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).ToShortDateString() %> <%# DataBinder.Eval(Container.DataItem,"HORACARRERA") %></span>
                                            <span><i class="icon-youtube"></i><a href="<%# DataBinder.Eval(Container.DataItem,"URLEMISIONTV") %>">Ver aquí</a></span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>                            
                        </ul>
                    </div>

                    <div class="widget widget-social">
                        <h5 class="widget-title">Social Media</h5>
                        <div class="social-link">
                            <a class="twitter" target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                            <a class="facebook" target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="google" target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                            <a class="linkedin" target="_blank" href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>

                </aside>
            </div>
        </div>
    </section>
</asp:Content>
