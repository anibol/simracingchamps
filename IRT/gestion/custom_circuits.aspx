<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="custom_circuits.aspx.cs" Inherits="IRT.gestion.custom_circuits" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal6" runat="server" Text="Gestión de Circuitos" meta:resourcekey="Literal6Resource1"></asp:Literal>&nbsp;<a href="custom_circuits.aspx?n=1" class="btn btn-xs btn-success"><asp:Literal ID="Literal5" runat="server"  Text="Nuevo Circuito" meta:resourcekey="Literal5Resource1"></asp:Literal></a>
        </h1>
        <ol class="breadcrumb">
            <li class="active">
                <asp:Literal ID="Literal1" runat="server" Text="Ayuda" meta:resourcekey="Literal1Resource1"></asp:Literal></li>
        </ol>

        <asp:Literal ID="lblmsg" runat="server" Visible="False" Text="
            &lt;div class=&quot;callout callout-success lead&quot;&gt;
            &lt;h4&gt;!Atención!&lt;/h4&gt;
            &lt;p&gt;Datos actualizados&lt;/p&gt;
        &lt;/div&gt;
        " meta:resourcekey="lblmsgResource1"></asp:Literal>
         <div id="panerror" class="callout callout-danger lead" runat="server" visible="false">
            <h4><asp:Literal ID="lblmsg2" runat="server"  Text="¡Error!" meta:resourcekey="lblmsg2Resource1"></asp:Literal></h4>
            <p><asp:Literal ID="lblmsg2b" runat="server" Text="Se ha producido un error al guardar los cambios" meta:resourcekey="lblmsg2bResource1"></asp:Literal></p>
        </div>
    </section>

    <section class="content">

        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-info" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal2" runat="server" Text="Listado de circuitos" meta:resourcekey="Literal2Resource1"></asp:Literal></h3>
                    </div>
                    <div class="box-body">
                        <asp:Repeater ID="repCircuitos" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <asp:Literal ID="Literal13" runat="server" Text="Juego" meta:resourcekey="Literal13Resource1"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal14" runat="server" Text="Circuito" meta:resourcekey="Literal14Resource1"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal15" runat="server" Text="URL Mod" meta:resourcekey="Literal15Resource1"></asp:Literal></th>
                                            <th>
                                                <asp:Literal ID="Literal17" runat="server"  Text="Opciones" meta:resourcekey="Literal17Resource1"></asp:Literal></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# DataBinder.Eval(Container.DataItem,"JUEGO") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"CIRCUITO") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem,"MOD") %></td>
                                    <td><a href='custom_circuits.aspx?ed=<%# DataBinder.Eval(Container.DataItem,"ID") %>' class="btn btn-xs btn-primary">
                                        <asp:Literal ID="Literal18" runat="server" Text="Editar" meta:resourcekey="Literal18Resource1"></asp:Literal></a></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="panCircuitos" runat="server" Visible="False" meta:resourcekey="panCircuitosResource1">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label CssClass="label label-info" ID="Label1" runat="server" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">
                                <asp:Literal ID="Literal4" runat="server" Text="Añadir/Editar Circuito" meta:resourcekey="Literal4Resource1"></asp:Literal></h3>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal20" runat="server" Text="Simulador" meta:resourcekey="Literal20Resource1"></asp:Literal>:</label>
                                        <asp:DropDownList CssClass="form-control" ID="cbSimulador" runat="server" meta:resourcekey="cbSimuladorResource1"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="cbSimulador" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-xs-8">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal22" runat="server" Text="Circuito" meta:resourcekey="Literal22Resource1"></asp:Literal>:</label>
                                        <asp:TextBox ID="tNombre" CssClass="form-control" runat="server" MaxLength="250" meta:resourcekey="tNombreResource1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal3" runat="server" Text="URL Descarga MOD" meta:resourcekey="Literal3Resource1"></asp:Literal>:</label>
                                        <asp:TextBox ID="tUrl" CssClass="form-control" runat="server" MaxLength="250" meta:resourcekey="tUrlResource1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:Button ID="bGuardar" CssClass="btn btn-info" runat="server" Text="Guardar" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />&nbsp;
                                    <asp:Button ID="bBorrar" CssClass="btn btn-danger" runat="server" Text="Borrar" OnClick="bBorrar_Click" meta:resourcekey="bBorrarResource1" />
                                    <ajaxToolkit:ConfirmButtonExtender ID="bEliminar_ConfirmButtonExtender" runat="server" BehaviorID="bEliminar_ConfirmButtonExtender" ConfirmText="¿Estás segur@?" TargetControlID="bBorrar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </section>
</asp:Content>
