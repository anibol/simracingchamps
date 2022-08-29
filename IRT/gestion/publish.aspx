<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="publish.aspx.cs" Inherits="IRT.gestion.publish" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1><asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Publicación de Campeonatos"></asp:Literal>        
        </h1>

        <ol class="breadcrumb">
            <li class="active"><asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Ayuda"></asp:Literal></li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Estado del evento"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">

                        <asp:Panel ID="panPendientePublicar" runat="server" Visible="False" meta:resourcekey="panPendientePublicarResource1">
                            <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="         
                                &lt;p&gt;Tu campeonato está &lt;span class=&quot;label label-xs label-primary&quot;&gt;Pendiente de Publicar&lt;/span&gt;&lt;br /&gt;
                               Una vez hayas introducido toda la información del evento así como de sus carreras debes proceder a publicarlo para que aparezcan en SimRacingChamps.net. &lt;br /&gt;
                               Mientras puedes usar esta URL temporal para visualizar la web del mismo y verificar que todo está correcto:&lt;/p&gt;"></asp:Literal>
                   
                            <p><asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="URL Previsualizacion"></asp:Literal>: <a target="_blank" href="../eventos.aspx?id=<%= Request.QueryString["id"].ToString() %>&preview=1">Haz clic aqu&iacute;</a></p>
                            <p>&nbsp;</p>
                            <p><asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Verificación de contenidos: Si todo está correcto aparecerá el botón &quot;Publicar&quot; en caso contrario deberás corregir los elementos necesarios para poder publicar tu campeonato"></asp:Literal></p>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Opción"></asp:Literal></th>
                                        <th><asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Estado"></asp:Literal></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Cartel"></asp:Literal></td>
                                        <td><%=cartel %></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Patrocinadores"></asp:Literal></td>
                                        <td><%=patrocinadores %></td>
                                    </tr>
                                    <tr>
                                        <td><asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Carreras"></asp:Literal></td>
                                        <td><%=carreras %></td>
                                    </tr>
                                </tbody>
                            </table>

                            <% if (correcto)
                                { %>

                            <asp:Button ID="bPublicar" CssClass="btn btn-primary" runat="server" Text="Publicar Campeonato" OnClick="bPublicar_Click" meta:resourcekey="bPublicarResource1" />
                            <p><i class="fa fa-info-circle"></i>
                                <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="La publicación del campeonato implica que éste aperecerá en SimRacingChamps.net inmediatament y la inscripción se abrirá a partir de la fecha de inicio de inscripción estipulada"></asp:Literal></p>
                                <p><b>Puedes apoyarnos mediante una pequeña donación que nos ayude a mantener el servidor: <a href="donar.aspx">AQUÍ</a></b></p>
                                <p><b>También puedes ayudarnos dándonos publicidad colocando nuestro logo en tus skins o colocando esta diapositiva en tus retransmisiones: <a href="http://simracingchamps.net/Content/img/web/SimRacingChamps2.png">LOGO</a></b></p>
                            <% } %>
                        </asp:Panel>

                        <asp:Panel ID="panPendienteValidar" runat="server" Visible="False" meta:resourcekey="panPendienteValidarResource1">
                            <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text=" &lt;p&gt;Tu campeonato está &lt;span class=&quot;label label-xs label-info&quot;&gt;Pendiente de Validar&lt;/span&gt;&lt;/p&gt;
                            &lt;p&gt;&lt;b&gt;SimRacingChamps.net&lt;/b&gt; verificará que todo está correcto y validará tu campeonato lo antes posible. Recibirás un correo de aviso cuando realicemos la validación. El fin de la validación no es otro que garantizar la calidad de los contenidos que se visualizan en la web. &lt;/p&gt;
                            &lt;p&gt;Gracias por tu paciencia&lt;/p&gt;"></asp:Literal>
                           
                        </asp:Panel>

                        <asp:Panel ID="panCancelarPublicación" runat="server" Visible="False" meta:resourcekey="panCancelarPublicaciónResource1">
                            <p><asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="Tu campeonato está &lt;span class=&quot;label label-xs label-success&quot;&gt;Publicado&lt;/span&gt;"></asp:Literal></p>
                            <p><asp:Literal ID="Literal15" runat="server" meta:resourcekey="Literal15Resource1" Text="URl definitiva"></asp:Literal>: <a target="_blank" href="../eventos.aspx?id=<%= Request.QueryString["id"].ToString() %>"><asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="Haz clic aqu&amp;iacute"></asp:Literal>;</a></p>
                            <asp:Button ID="bCancelarPublicacion" CssClass="btn btn-danger" runat="server" Text="Cancelar Publicación" OnClick="bCancelarPublicacion_Click" meta:resourcekey="bCancelarPublicacionResource1" />
                            <p><i class="fa fa-info-circle"></i><asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="La cancelación de la publicación hará invisible el campeonato en SimRacingChamps.net. Siempre puedes publicar de nuevo"></asp:Literal></p>
                        </asp:Panel>

                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
