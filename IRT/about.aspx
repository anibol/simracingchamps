<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="IRT.about" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx">
                        <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page">
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Acerca de"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Acerca de SimRacingChamps.net"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="about" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="section-title wow fadeInUp" data-wow-delay="0s">
                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="¿Qué es SimRacingChamps.net?"></asp:Literal></h2>
                    <div class="col-md-6 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.1s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/img-1.jpg" style="width:100%" alt="">
                            </div>
                            <div class="descr">
                                <h4>
                                    <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Para los Organizadores"></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Ofrecemos un portal que te permita organizar tu campeonato de forma sencilla, ágil y automatizada, nada de hojas de cálculo manuales ni leer decenas de mensajes en tus foros para ver quién se inscribe en tus campeonatos. Fácil para ti, fácil para tus participantes."></asp:Literal></p>
                                <a href="register.aspx" class="btn btn-common btn-small">
                                    <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Organiza tu campeonato, regístrate"></asp:Literal></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.2s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/img-2.jpg"  style="width:100%" alt="">
                            </div>
                            <div class="descr">
                                <h4>
                                    <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1"  Text="Para los Jefes de Equipo y Pilotos "></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Te proporcionamos un lugar donde encontrar y seguir los campeonatos de simracing de tu combinación plataforma/simulador preferida. Sólo necesitas una única cuenta para inscribirte fácilmente en cualquiera de ellos."></asp:Literal><br /></p>
                                <a href="register_driver.aspx?j=1" class="btn btn-common btn-small">
                                    <asp:Literal ID="Literal10" runat="server"  meta:resourcekey="jefe" Text="Regístrate como Jefe de Equipo"></asp:Literal></a>
                                <a href="register_driver.aspx" class="btn btn-common btn-small">
                                    <asp:Literal ID="Literal11" runat="server" meta:resourcekey="piloto" Text="Regístrate como Piloto"></asp:Literal></a>
                            </div>
                        </div>
                    </div>                  
                </div>
            </div>
        </div>
    </section>


   <%-- <section id="featured" class="section gray-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="section-title wow fadeInUp" data-wow-delay="0s">Our Feature</h2>
                    <div class="col-md-4 col-sm-6">
                        <div class="featured-box wow fadeInLeft" data-wow-delay="0.1s">
                            <div class="icon">
                                <i class="icon-event"></i>
                            </div>
                            <div class="featured-content">
                                <h4>Issues</h4>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="featured-box wow fadeInLeft" data-wow-delay="0.2s">
                            <div class="icon">
                                <i class="icon-clock"></i>
                            </div>
                            <div class="featured-content">
                                <h4>Maintenance</h4>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="featured-box wow fadeInLeft" data-wow-delay="0.3s">
                            <div class="icon">
                                <i class="icon-compass"></i>
                            </div>
                            <div class="featured-content">
                                <h4>Destination</h4>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
</asp:Content>
