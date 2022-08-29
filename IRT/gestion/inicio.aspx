<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="IRT.gestion.inicio" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Label ID="Label1" runat="server" Text="Gestión de Campeonatos" meta:resourcekey="Label1Resource1"></asp:Label>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="&lt;small&gt;Panel de control&lt;/small&gt;&amp;nbsp;&lt;a href=&quot;eventos.aspx&quot; class=&quot;btn btn-success btn-xs&quot;&gt;Nuevo Campeonato&lt;/a&gt;"></asp:Literal>
        </h1>
        <asp:Literal ID="lblmsg" runat="server" Visible="False" meta:resourcekey="lblmsgResource1" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>
        <asp:Literal ID="lblmsg2" runat="server" Visible="False" meta:resourcekey="lblmsg2Resource1" Text="
            &lt;div class=&quot;callout callout-danger lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Se ha producido un error al guardar los datos&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>
        <ol class="breadcrumb">
            <li class="active">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-question-circle"></i>
                    <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Ayuda"></asp:Literal>
                </button>
            </li>
        </ol>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">
                            <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Inicio"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text=" &lt;p&gt;Esta es la pantalla de inicio, en ella ves los campeonatos que tienes dados de alta en función de su estado el cual puede ser:&lt;/p&gt;
                        &lt;ul&gt;
                            &lt;li&gt;&lt;label class=&quot;label label-primary&quot;&gt;Pendiente de Publicar&lt;/label&gt;: Este es el estado que tiene el campeonato mientras lo estas dando de alta, añadiendo documentos, carreras, etc.&lt;/li&gt;
                            &lt;li&gt;&lt;label class=&quot;label label-info&quot;&gt;Pendiente de Validar&lt;/label&gt;: Este es el estado al que pasa el campeonato cuando decides publicarlo. Este estado es gestionado por SimRacingChamps.net con el fin de revisar el contenido de tu campeonato para que no tenga ninguna errata y sea visualmente correcto.&lt;/li&gt;
                            &lt;li&gt;&lt;label class=&quot;label label-success&quot;&gt;Publicado&lt;/label&gt; : Este es el estado al que pasa tu campeonato cuando lo validamos. Está listo para aparecer en la web pública y lo hará automáticamente cuando llegue la fecha de inicio de inscripción&lt;/li&gt;
                        &lt;/ul&gt;
                        &lt;p&gt;Para crear un campeonato usa el boton &lt;a href=&quot;eventos.aspx&quot; class=&quot;btn btn-success btn-xs&quot;&gt;Nuevo Campeonato&lt;/a&gt; que tienes en la barra superior o en el menù lateral. En esa ventana podrás introducir los datos generales del campeonato.&lt;/p&gt;
                        &lt;p&gt;Después de guardar los datos generales tu campeonato aparecerá en esta pantalla de inicio junto con una serie de botones&lt;/p&gt;
                        &lt;ul&gt;
                            &lt;li&gt;Datos Campeonato: Sirve para editar de nuevo los datos generales del camepeonato&lt;/li&gt;
                            &lt;li&gt;Documentos: Sirve para añadir los PDFs de reglamento, normativa y premios&lt;/li&gt;
                            &lt;li&gt;Carreras: Sirve para añadir los circuitos al campeonato con la información de clima, prácticas, clasificación y carrera, así como los coches que se usarán&lt;/li&gt;
                            &lt;li&gt;Inscritos: Una vez publicado tu campeonato, desde esta ventana podrás gestionar los inscritos, separarlos por divisiones y splits/grupos&lt;/li&gt;
                            &lt;li&gt;Resultados: Aquí introducirás los resultados de cada carrera seleccionando la división/split (si los hay)&lt;/li&gt;
                            &lt;li&gt;Ver: Sirve para revisualizar la web de tu campeonato&lt;/li&gt;
                            &lt;li&gt;Publicar/Cancelar publicación: Sirve para cambiar el estado de tu cameponato&lt;/li&gt;
                        &lt;/ul&gt;
                        &lt;p&gt;En el menú lateral tienes otros apartados que son:&lt;/p&gt;
                        &lt;ul&gt;
                            &lt;li&gt;Mis campeonatos: Te lleva a la pantalla de inicio del panel&lt;/li&gt;
                            &lt;li&gt;Mis patrocinadores: Aquí puedes añadir tu listado general de patrocinadores. Añádelos una vez y podrás seleccionar de la lista los que necesites en la ventana de datos generales de cada campeonato&lt;/li&gt;
                            &lt;li&gt;Mi cuenta: Gestiona los datos de tu cuenta&lt;/li&gt;                            
                        &lt;/ul&gt;"></asp:Literal>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Cerrar"></asp:Literal></button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-lg-4 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3><%=numcampeonatos %></h3>
                        <p>
                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Campeonatos organizados"></asp:Literal>
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-calendar"></i>
                    </div>
                    <a href="#" class="small-box-footer">
                        <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Total de campeonatos publicados"></asp:Literal>
                        <i class="fa fa-info-sign"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3><%=numinscritos %></h3>
                        <p>
                            <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Inscritos"></asp:Literal>
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="#" class="small-box-footer">
                        <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Participantes de tus campeonatos"></asp:Literal><i class="fa fa-info-sign"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3>
                            <asp:Literal ID="Literal48" meta:resourcekey="colaboratitulo" runat="server">Colabora</asp:Literal></h3>
                        <p>
                            <asp:Literal ID="Literal46" runat="server" meta:resourcekey="colaboratexto" Text="Ayuda a mantener SimRacingChamps"></asp:Literal>
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-cash"></i>
                    </div>
                    <a href="donar.aspx" class="small-box-footer">
                        <asp:Literal ID="Literal47" runat="server" meta:resourcekey="colaborapie" Text="¿Te gusta nuestra web?"></asp:Literal><i class="fa fa-info-sign"></i></a>
                </div>
            </div>
            <!-- ./col -->
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Campeonatos Pendientes de Publicar"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered table-hover">
                            <tbody>
                                <asp:Repeater ID="repPendientes" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource2" Text="Plataforma"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Simulador"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Inscripcion"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="Campeonato"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Estado"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal15" runat="server" meta:resourcekey="Literal15Resource1" Text="Opciones"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg" /></td>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg" /></td>
                                            <td><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %> - <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></td>
                                            <td><%# Estado(DataBinder.Eval(Container.DataItem,"PUBLICADO"),DataBinder.Eval(Container.DataItem,"VALIDADO"),DataBinder.Eval(Container.DataItem,"ID")) %></td>
                                            <td><a class="btn btn-xs btn-default" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="Datos Campeonato"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="docs.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource3" Text="Documentos"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="circuitos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="Carreras"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-info" target="_blank" href="../eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&preview=1">
                                                    <asp:Literal ID="Literal18" runat="server" meta:resourcekey="Literal18Resource1" Text="Vista Previa"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-primary" href="publish.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal19" runat="server" meta:resourcekey="Literal19Resource1" Text="Publicar"></asp:Literal></a>
                                                <a class="btn btn-xs btn-danger" href="borrarevento.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal49" runat="server" meta:resourcekey="Literal49Resource1" Text="Borrar"></asp:Literal></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal20" runat="server" meta:resourcekey="Literal20Resource1" Text="Campeonatos Pendientes de Validar"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered table-hover">
                            <tbody>
                                <asp:Repeater ID="repValidar" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource4" Text="Plataforma"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal21" runat="server" meta:resourcekey="Literal21Resource1" Text="Simulador"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal22" runat="server" meta:resourcekey="Literal22Resource1" Text="Inscripcion"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal23" runat="server" meta:resourcekey="Literal23Resource1" Text="Campeonato"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal24" runat="server" meta:resourcekey="Literal24Resource1" Text="Estado"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal25" runat="server" meta:resourcekey="Literal25Resource1" Text="Opciones"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg" /></td>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg" /></td>
                                            <td><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %> - <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></td>
                                            <td><%# Estado(DataBinder.Eval(Container.DataItem,"PUBLICADO"),DataBinder.Eval(Container.DataItem,"VALIDADO"),DataBinder.Eval(Container.DataItem,"ID")) %></td>
                                            <td><a class="btn btn-xs btn-default" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                <asp:Literal ID="Literal26" runat="server" meta:resourcekey="Literal26Resource1" Text="Datos Campeonato"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="docs.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal27" runat="server" meta:resourcekey="Literal27Resource1" Text="Documentos"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="circuitos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal28" runat="server" meta:resourcekey="Literal28Resource1" Text="Carreras"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-info" target="_blank" href="../eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&preview=1">
                                                    <asp:Literal ID="Literal29" runat="server" meta:resourcekey="Literal29Resource1" Text="Vista Previa"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-danger" href="publish.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal30" runat="server" meta:resourcekey="Literal30Resource1" Text="Cancelar Publicación"></asp:Literal></a>
                                                <% if (Session["usr"].ToString() == "admin@simracingchamps.net")
                                                    { %>
                                                <a class="btn btn-xs btn-warning" href="validar.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&a=1">
                                                    <asp:Literal ID="Literal31" runat="server" meta:resourcekey="Literal31Resource1" Text="Validar"></asp:Literal></a>
                                                <% } %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <% if (Session["usr"].ToString() == "admin@simracingchamps.net")
            { %>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal51" runat="server" Text="Noticias pendientes de validar"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered table-hover">
                            <tbody>
                                <asp:Repeater ID="repNoticias" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Literal ID="Literal3" runat="server" Text="Evento"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal13" runat="server" Text="Fecha"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal14" runat="server" Text="Título"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal15" runat="server" Text="Estado"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal17" runat="server" Text="Opciones"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"FECHA") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"TITULO") %></td>
                                            <td><%# EstadoNoticia(DataBinder.Eval(Container.DataItem,"PUBLICADA"),DataBinder.Eval(Container.DataItem,"VALIDADA")) %></td>
                                            <td><a href='noticias.aspx?id=<%#  DataBinder.Eval(Container.DataItem,"IDEVENTO") %>&ed=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-primary">
                                                <asp:Literal ID="Literal18" runat="server" Text="Editar"></asp:Literal></a>
                                                <a target="_blank" href='../noticia.aspx?ev=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>&id=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-success">
                                                    <asp:Literal ID="Literal9" runat="server" Text="Preview"></asp:Literal></a>
                                                <a class="btn btn-xs btn-warning" href="noticias.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&v=1&ev=<%#  DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">
                                                    <asp:Literal ID="Literal31" runat="server" Text="Validar"></asp:Literal></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <% } %>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal26" runat="server" meta:resourcekey="Literal26Resource2" Text="Campeonatos Publicados"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered table-hover" id="table_resultados">
                            <tbody>
                                <asp:Repeater ID="repPublicados" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Literal ID="Literal26" runat="server" meta:resourcekey="Literal26Resource3" Text="Plataforma"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal32" runat="server" meta:resourcekey="Literal32Resource1" Text="Simulador"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal33" runat="server" meta:resourcekey="Literal33Resource1" Text="Inscripcion"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal34" runat="server" meta:resourcekey="Literal34Resource1" Text="Campeonato"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal35" runat="server" meta:resourcekey="Literal35Resource1" Text="Estado"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal36" runat="server" meta:resourcekey="Literal36Resource1" Text="Opciones"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg" /></td>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg" /></td>
                                            <td><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAINI").ToString()).ToShortDateString() %> - <%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAFIN").ToString()).ToShortDateString() %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></td>
                                            <td><%# Estado(DataBinder.Eval(Container.DataItem,"PUBLICADO"),DataBinder.Eval(Container.DataItem,"VALIDADO"),DataBinder.Eval(Container.DataItem,"ID")) %></td>
                                            <td><a class="btn btn-xs btn-default" href="eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                <asp:Literal ID="Literal26" runat="server" meta:resourcekey="Literal26Resource4" Text="Datos Campeonato"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="docs.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal37" runat="server" meta:resourcekey="Literal37Resource1" Text="Documentos"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="circuitos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal38" runat="server" meta:resourcekey="Literal38Resource1" Text="Carreras"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="inscritos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal39" runat="server" meta:resourcekey="Literal39Resource1" Text="Inscritos"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="resultados.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal40" runat="server" meta:resourcekey="Literal40Resource1" Text="Resultados"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="reclamaciones.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal44" runat="server" Text="Reclamaciones" meta:resourcekey="Literal44Resource1"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="noticias.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal50" runat="server" Text="Noticias" meta:resourcekey="noticias"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-default" href="widgets.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">Widgets</a>&nbsp;
                                                <a class="btn btn-xs btn-info" target="_blank" href="../eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal41" runat="server" meta:resourcekey="Literal41Resource1" Text="Ver Minisite"></asp:Literal></a>&nbsp;
                                                <a class="btn btn-xs btn-danger" href="publish.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                                    <asp:Literal ID="Literal42" runat="server" meta:resourcekey="Literal42Resource1" Text="Cancelar Publicación"></asp:Literal></a>
                                                <a href="copiar.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>" class="btn btn-primary btn-xs">
                                                    <asp:Literal ID="Literal45" runat="server">Copiar campeonato</asp:Literal></a>
                                                <a href="comm.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>" class="btn btn-primary btn-xs">
                                                    <i class="fa fa-envelope"></i> Enviar e-mail</a>
                                                <% if (Session["usr"].ToString() == "admin@simracingchamps.net")
                                                    { %>
                                                <a class="btn btn-xs btn-warning" href="validar.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>&a=0">
                                                    <asp:Literal ID="Literal43" runat="server" meta:resourcekey="Literal43Resource1" Text="Cancelar Validación"></asp:Literal>n</a>
                                                <%} %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
    </section>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#myModal').modal();
            //$("#table_resultados").DataTable();
        });
    </script>
</asp:Content>
