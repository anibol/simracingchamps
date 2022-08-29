<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="reclamaciones.aspx.cs" Inherits="IRT.gestion.reclamaciones" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" Text="Tus Reclamaciones" meta:resourcekey="Literal1Resource1"></asp:Literal>

        </h1>
        <asp:Literal ID="lblmsg" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        " meta:resourcekey="lblmsgResource1"></asp:Literal>
        <asp:Literal ID="lblmsg2" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-danger lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Se ha producido un error al guardar los datos&lt;/p&gt;
        &lt;/div&gt;
        " meta:resourcekey="lblmsg2Resource1"></asp:Literal>
    </section>
    <section class="content">

        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">
                    <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Listado de reclamaciones"></asp:Literal>: <%=campeonato %></h3>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <asp:Repeater ID="repDatos" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th>
                                            <asp:Literal ID="Literal5" runat="server" Text="Fecha" meta:resourcekey="Literal5Resource1"></asp:Literal></th>
                                        <th>
                                            <asp:Literal ID="Literal2" runat="server" Text="Piloto Reclamante" meta:resourcekey="Literal2Resource1"></asp:Literal></th>
                                        <th>
                                            <asp:Literal ID="Literal6" runat="server" Text="Piloto Reclamado" meta:resourcekey="Literal6Resource1"></asp:Literal></th>
                                        <th>
                                            <asp:Literal ID="Literal8" runat="server" Text="Opciones" meta:resourcekey="Literal8Resource1"></asp:Literal></th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).ToShortDateString() %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"RECLAMANTE") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"RECLAMADO") %></td>
                                    <td><a class="btn btn-xs btn-default" href="respuestas.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>&idr=<%# DataBinder.Eval(Container.DataItem,"ID") %>">Respuestas (<%# DataBinder.Eval(Container.DataItem,"RESPUESTAS") %>)</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        
    </section>
</asp:Content>
