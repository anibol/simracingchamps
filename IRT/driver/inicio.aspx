<%@ Page Title="" Language="C#" MasterPageFile="~/driver/driver.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="IRT.driver.inicio" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">

        <h1>
            <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Inicio"></asp:Literal>
            <small>
                <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Panel de control"></asp:Literal></small>
        </h1>
        <asp:Literal ID="lblmsg" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>
        <asp:Literal ID="lblmsg2" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-danger lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Se ha producido un error al guardar los datos&lt;/p&gt;
        &lt;/div&gt;
        "></asp:Literal>

    </section>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Mis campeonatos"></asp:Literal></h3>
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
                                                    <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Plataforma"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Simulador"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Fecha Inicio"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal9" runat="server" Text="Campeonato"></asp:Literal></th>
                                                <th>
                                                    <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Opciones"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/plataformas/<%# DataBinder.Eval(Container.DataItem,"IDPLATAFORMA") %>.jpg" /></td>
                                            <td>
                                                <img style="height: 30px; width: auto;" src="../Content/img/juegos/<%# DataBinder.Eval(Container.DataItem,"IDJUEGO") %>.jpg" /></td>
                                            <td><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHAPRIMERA").ToString()).ToShortDateString() %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EVENTO") %></td>
                                          
                                            <td><a target="_blank" class="btn btn-xs btn-default" href="../eventos.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>#resultados">Ver Resultados</a>&nbsp;<a class="btn btn-xs btn-default" href="reclamaciones.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">Reclamaciones</a>
                                                &nbsp;<a class="btn btn-xs btn-warning" href="ausencia.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>">Notificar Ausencia</a>
                                                <%# HayResultados(DataBinder.Eval(Container.DataItem,"IDEVENTO")) %>                                                                                           
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
    </section>
</asp:Content>
