<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="IRT.faq" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx">
                        <asp:Literal ID="Literal1" runat="server" Text="Inicio" meta:resourcekey="Literal1Resource1"></asp:Literal></a></li>
                    <li class="page">
                        <asp:Literal ID="Literal2" runat="server" Text="F.A.Q." meta:resourcekey="Literal2Resource1"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">
                    <asp:Literal ID="Literal3" runat="server" Text="Preguntas Frequentes" meta:resourcekey="Literal3Resource1"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="content" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="post-title">
                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="1. ¿Puedo organizar mi campeonato en SimRacingChamps?¿Cuánto cuesta?"></asp:Literal>
                    </h3>
                    <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="&lt;p&gt;SimRacingChamps es una herramienta para la gestión de campeonatos de simracing de cualquier índole y tamaño y no tiene ningún coste para ningún usuario ya sea organizador o piloto.&lt;/p&gt;"></asp:Literal>
                      <h3 class="post-title">
                        <asp:Literal ID="Literal10" runat="server"  Text="2. ¿Cómo me inscribo en un campeonato?" meta:resourcekey="Literal10Resource1"></asp:Literal>
                    </h3>
                    <asp:Literal ID="Literal11" runat="server"  Text="&lt;p&gt;Para poder inscribirte en un campeonato primero debes REGISTRATE COMO PILOTO usando la opción en el menú superior de esta página. Una vez registrado usarás tu correo y contraseña para registrarte en el campeonato que quieras.&lt;/p&gt;" meta:resourcekey="Literal11Resource1"></asp:Literal>
                    <h3 class="post-title">
                        <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="3. ¿Qué es el perfil Jefe de Equipo?"></asp:Literal></h3>
                    <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="
                        &lt;p&gt;El perfil Jefe de Equipo es un perfil de piloto ampliado que además de permitirte inscribirte en cualquier campeonato como un piloto más, te permite añadir tu equipo y gestionarlo.&lt;br /&gt;
                        El jefe de equipo puede:&lt;/p&gt;
                    &lt;ul&gt;
                        &lt;li&gt;- Subir el logo del equipo.&lt;/li&gt;
                        &lt;li&gt;- Especificar año de fundación e información general del mismo.&lt;/li&gt;
                        &lt;li&gt;- Asociar perfiles de pilotos ya registrados en SimRacingChamps.net al equipo: Esto permite que a lo largo de los distintos apartados de la web en donde aparezca el nombre del piloto (listado de inscritos, resultados de carreras, etc) aparezca acompañado de un enlace al equipo. &lt;b&gt;Esta asociación es necesaria para los campeonatos por equipos/escuderías&lt;/b&gt;.&lt;/li&gt;
                    &lt;/ul&gt;
                    "></asp:Literal>
                    <h3 class="post-title">
                        <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="4. ¿Cómo organizar un campeonatos por equipos?"></asp:Literal></h3>
                    <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="&lt;p&gt;La organización de un campeonato por equipos se lleva a cabo de la misma forma que un campeonato normal con las siguientes características:&lt;/p&gt;
                    &lt;ul&gt;
                        &lt;li&gt;- Las inscripciones se hacen como un campeonato normal. Los pilotos se registran primero en SimRacingChamps.net en el perfil de pilotos y se inscriben en el campeonato.&lt;/li&gt;
                        &lt;li&gt;- Uno de los pilotos debe registrase en SimRacingChamps.net con el perfil &quot;Jefe de Equipo&quot;, dar de alta el equipo y asociar a sus pilotos en el apartado de su panel de control.&lt;/li&gt;
                        &lt;li&gt;- El organizador, al dar de alta el campeonato debe elegir la opción de &quot;Puntuan los equipos&quot; en los datos generales. También puede elegir &quot;Puntuan equipos y pilotos&quot; si quiere ver la clasificación por pilotos además de por equipos.&lt;/li&gt;
                    &lt;/ul&gt;"></asp:Literal>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
