<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="IRT.help" meta:resourcekey="PageResource1" %>
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
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Ayuda"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Ayuda"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>
    <section id="about" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="section-title wow fadeInUp" data-wow-delay="0s">
                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="¿Cómo crear tu campeonato?"></asp:Literal></h3>
                    <div class="col-md-3 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.1s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/ayuda1.jpg" style="width:100%" alt="">
                            </div>
                            <div class="descr"  style="text-align:left;font-size:12px;padding:10px;">
                                <h4 style="font-size:18px;padding-bottom:0px;padding-top:0px;">
                                    <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="1. Regístrate"></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Accede a"></asp:Literal> <a href="http://simracingchamps.net/register.aspx">SimRacingChamps.net</a> <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="y procede a registrarte como organizador. Luego haz login"></asp:Literal> <a href="http://simracingchamps.net/login.aspx">
                                        <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="aquí"></asp:Literal></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.2s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/ayuda2.jpg" style="width:100%" alt="">
                            </div>
                            <div class="descr"  style="text-align:left;font-size:12px;padding:10px;">
                                <h4 style="font-size:18px;padding-bottom:0px;padding-top:0px;">
                                    <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="2. Crea tu campeonato"></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Al logearte en el portal accedes a la pantalla de inicio donde aparecerán tus campeonatos en distintos estados: Pendiente de Publicar, Pendiente de Validar y Publicado. Inicialmente no aparecerá ninguno asi que pulsa el botón &lt;b&gt;Nuevo campeonato&lt;/b&gt; para crearlo. En la ventana de creación de campeonatos indicas los datos básicos del mismo: nombre, plataforma, simulador, fechas de inscripción, etc. Una vez guardes volverás a la pantalla de inicio"></asp:Literal>.</p>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.2s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/ayuda3.jpg" style="width:100%" alt="">
                            </div>
                            <div class="descr" style="text-align:left;font-size:12px;padding:10px;">
                                <h4  style="font-size:18px;padding-bottom:0px;padding-top:0px;">
                                    <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="3. Añade las carrera"></asp:Literal>s</h4>
                                <p>
                                    <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Ahora verás unos nuevos botones: Documentos, Carreras, Pre-visualizar. &lt;br&gt;El botón &lt;b&gt;Documentos&lt;/b&gt; te permite adjuntar la normativa, el reglamento, etc en formato PDF. &lt;br&gt;El botón &lt;b&gt;Carreras&lt;/b&gt; te permite añadir cada etapa del campeonato indicando circuito, datos de prácticas, clasificación y carrera así como los coches que los participantes podrán seleccionar"></asp:Literal>.</p>
                            </div>
                        </div>
                    </div>
                     <div class="col-md-3 col-sm-12">
                        <div class="service-block wow fadeInDown" data-wow-delay="0.2s">
                            <div class="img-wrap">
                                <img src="assets/img/feature/ayuda4.jpg" style="width:100%" alt="">
                            </div>
                            <div class="descr"  style="text-align:left;font-size:12px;padding:10px;">
                                <h4 style="font-size:18px;padding-bottom:0px;padding-top:0px;">
                                    <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="4. Previsualiza y Publica"></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Una vez hayas metido toda la información puedes previsualizar como quedaría tu campeonato y finalmente si todo está bien &lt;b&gt;Publicarlo&lt;/b&gt; para que aparezce en &lt;a href=&quot;http://simracingchamps.net/default.aspx&quot;&gt;SimRacingChamps.net&lt;/a&gt;&lt;br /&gt;Cuando validemos tu campeonato emitiremos un tweet avisando del nuevo campeonato así del momento de apertura de inscripción.&lt;br/&gt;¡No olvides recomendar a todos que nos sigan!"></asp:Literal></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
</asp:Content>
