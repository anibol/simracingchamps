<%@ Page Title="" Language="C#" MasterPageFile="~/driver/driver.Master" AutoEventWireup="true" CodeBehind="reclamaciones.aspx.cs" Inherits="IRT.driver.reclamaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" Text="Tus Reclamaciones"></asp:Literal>

        </h1>
           <ol class="breadcrumb">
            <li>
                <!-- Button trigger modal -->
                <a style="color:white;" href="reclamaciones.aspx?id=<%= Request.QueryString["id"].ToString() %>&n=1" class="btn btn-xs btn-success"><asp:Literal ID="Literal3" runat="server" Text="Nueva Reclamación"></asp:Literal></a>
            </li>
        </ol>
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

        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Listado de reclamaciones <%=campeonato %></h3>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <asp:Repeater ID="repDatos" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th>
                                            <asp:Literal ID="Literal5" runat="server" Text="Fecha"></asp:Literal></th>
                                        <th>
                                            <asp:Literal ID="Literal6" runat="server" Text="Piloto Reclamado"></asp:Literal></th>
                                        <th>
                                            <asp:Literal ID="Literal8" runat="server" Text="Opciones"></asp:Literal></th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# DateTime.Parse(DataBinder.Eval(Container.DataItem,"FECHA").ToString()).ToShortDateString() %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"RECLAMADO") %></td>
                                    <td><a class="btn btn-xs btn-default" href="reclamaciones.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>&ed=<%# DataBinder.Eval(Container.DataItem,"ID") %>">Editar</a>&nbsp;<a class="btn btn-xs btn-default" href="respuestas.aspx?id=<%# DataBinder.Eval(Container.DataItem,"IDEVENTO") %>&idr=<%# DataBinder.Eval(Container.DataItem,"ID") %>">Respuestas (<%# DataBinder.Eval(Container.DataItem,"RESPUESTAS") %>)</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <asp:Panel ID="panReclamacion" runat="server" Visible="false">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Nueva/Editar reclamación <%=campeonato %></h3>
            </div>


            <div class="box-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Reclamante</label>
                            <asp:TextBox ID="tReclamante" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Reclamado</label>
                            <asp:TextBox ID="tReclamado" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="exampleInputFile">Acción que se reclama</label>
                                    <asp:DropDownList ID="cbAccion" runat="server" class="form-control">
                                        <asp:ListItem>Maniobra incorrecta</asp:ListItem>
                                        <asp:ListItem>Adelantamiento ilegal</asp:ListItem>
                                        <asp:ListItem>Atajos reiterados</asp:ListItem>
                                        <asp:ListItem>Infracción en boxes</asp:ListItem>
                                        <asp:ListItem>Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Pérdida de tiempo/posición</label>
                                    <asp:DropDownList ID="cbPerdida" runat="server" class="form-control">
                                        <asp:ListItem>Significativa</asp:ListItem>
                                        <asp:ListItem>Media</asp:ListItem>
                                        <asp:ListItem>Leve</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Daños</label>
                                    <asp:DropDownList ID="cbDanos" runat="server" class="form-control">
                                        <asp:ListItem>Graves</asp:ListItem>
                                        <asp:ListItem>Medios</asp:ListItem>
                                        <asp:ListItem>Leves</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="exampleInputFile">Agravantes</label>
                                    <asp:DropDownList ID="cbAgravantes" runat="server" class="form-control">
                                        <asp:ListItem>No devolver posición</asp:ListItem>
                                        <asp:ListItem>Incidente en 1ª vuelta</asp:ListItem>
                                        <asp:ListItem>Incidente en última vuelta</asp:ListItem>
                                        <asp:ListItem>Lag permanente</asp:ListItem>
                                        <asp:ListItem>Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">Atenuantes</label>
                                    <asp:DropDownList ID="cbAtenuantes" runat="server" class="form-control">
                                        <asp:ListItem>Pedir perdón en sala</asp:ListItem>
                                        <asp:ListItem>Lag esporádico</asp:ListItem>
                                        <asp:ListItem>Devolver posición</asp:ListItem>
                                        <asp:ListItem>Otros</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-6">
                         <div class="form-group">
                            <label for="exampleInputEmail1">Observaciones</label>
                            <asp:TextBox ID="tReclamaciobn" TextMode="MultiLine" class="form-control" runat="server" Height="100px"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Prueba de vídeo (hasta un máximo de 5 enlaces de youtube y de duración entre 30 seg. y 2 minutos)</label>
                            <asp:TextBox ID="tVideo1" class="form-control" runat="server"></asp:TextBox>
                            <asp:TextBox ID="tVideo2" class="form-control" runat="server"></asp:TextBox>
                            <asp:TextBox ID="tVideo3" class="form-control" runat="server"></asp:TextBox>
                            <asp:TextBox ID="tVideo4" class="form-control" runat="server"></asp:TextBox>
                            <asp:TextBox ID="tVideo5" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Minuto del incidente en el vídeo (sólo para vídeos de retransmisiones)</label>
                            <asp:TextBox ID="tMinuto" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <asp:Button ID="bEnviar" CssClass="btn btn-primary" runat="server" Text="Guardar Reclamación" OnClick="bEnviar_Click" />&nbsp;
                    <asp:Button ID="bBorrar" CssClass="btn btn-danger" runat="server" Text="Borrar Reclamación" Visible="false" OnClick="bBorrar_Click" />
                            <ajaxToolkit:ConfirmButtonExtender ID="bEliminar_ConfirmButtonExtender" runat="server" BehaviorID="bEliminar_ConfirmButtonExtender" ConfirmText="¿Estás segur@? Esta acción no puede deshacerse" TargetControlID="bBorrar" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </asp:Panel>

    </section>
</asp:Content>
