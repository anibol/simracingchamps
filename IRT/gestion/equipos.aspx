<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="equipos.aspx.cs" Inherits="IRT.gestion.equipos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Mi Equipo"></asp:Literal>
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
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Gestión de Equipos"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Este apartado te permite añadir tu equipo, su logo y seleccionar qué pilotos pertenecen a él. 
                            Sólo debes dar de alta el equipo si eres el &lt;b&gt;manager&lt;/b&gt; del mismo, además los pilotos deben estar dados de alta en el portal para 
                            poder ser adscritos a tu equipo.&lt;br /&gt;
                                Si tu manager no se ha dado de alta aún espera a que lo haga y te adscriba al equipo"></asp:Literal>
                            </div>

                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Equipo"></asp:Literal>:</label>
                                    <asp:TextBox ID="tEquipo" CssClass="form-control" runat="server" meta:resourcekey="tEquipoResource1"></asp:TextBox>
                                    <asp:TextBox ID="tId" CssClass="form-control" runat="server" Visible="False" meta:resourcekey="tIdResource1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tEquipo" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-xs-8">
                                <div class="form-group">
                                    <label for="exampleInputFile">Logo:</label>
                                    <asp:FileUpload ID="fUpload" runat="server" meta:resourcekey="fUploadResource1" />
                                    <%=imagenactual %>
                                    <p class="help-block">
                                        <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Para que encaje con el estilo del portal debe tener un tamaño de 80x80"></asp:Literal>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <asp:Button ID="bGuardar" runat="server" Text="Guardar Equipo" CssClass="btn btn-success" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="panPilotos" runat="server" Visible="False" meta:resourcekey="panPilotosResource1">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">
                                <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Listado de pilotos de tu equipo"></asp:Literal></h3>
                            <p>
                                <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Añade pilotos al equipo"></asp:Literal>
                            </p>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">
                                            <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Email Piloto"></asp:Literal>:</label>
                                        <asp:TextBox ID="tEmail" CssClass="form-control" runat="server" meta:resourcekey="tEmailResource1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:Button ID="bAddPiloto" runat="server" Text="Añadir piloto al equipo" CssClass="btn btn-primary" OnClick="bAddPiloto_Click" meta:resourcekey="bAddPilotoResource1" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:GridView ID="dgUsuarios" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="IDUSUARIO" DataSourceID="objEquipos" meta:resourcekey="dgUsuariosResource1">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Seleccionar" meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chSelector" runat="server" meta:resourcekey="chSelectorResource1" />
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IDUSUARIO" HeaderText="IDUSUARIO" ReadOnly="True" SortExpression="IDUSUARIO" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                            <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO" meta:resourcekey="BoundFieldResource2" />
                                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" meta:resourcekey="BoundFieldResource3" />
                                            <asp:BoundField DataField="APELLIDOS" HeaderText="APELLIDOS" SortExpression="APELLIDOS" meta:resourcekey="BoundFieldResource4" />
                                            <asp:BoundField DataField="ALIAS" HeaderText="ALIAS" SortExpression="ALIAS" meta:resourcekey="BoundFieldResource5" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="objEquipos" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy5" TypeName="IRT.Models.UsuariosDSTableAdapters.USUARIOSTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter DbType="Guid" Name="Original_IDUSUARIO" />
                                            <asp:Parameter Name="Original_USUARIO" Type="String" />
                                            <asp:Parameter Name="Original_FECHAALTA" Type="DateTime" />
                                            <asp:Parameter Name="Original_NOMBRE" Type="String" />
                                            <asp:Parameter Name="Original_APELLIDOS" Type="String" />
                                            <asp:Parameter Name="Original_ALIAS" Type="String" />
                                            <asp:Parameter Name="Original_AVATAR" Type="String" />
                                            <asp:Parameter Name="Original_PASS" Type="String" />
                                            <asp:Parameter Name="Original_ORG" Type="Boolean" />
                                            <asp:Parameter Name="Original_FACEBOOK" Type="String" />
                                            <asp:Parameter Name="Original_TWITTER" Type="String" />
                                            <asp:Parameter Name="Original_YOUTUBE" Type="String" />
                                            <asp:Parameter Name="Original_WEB" Type="String" />
                                            <asp:Parameter Name="Original_IDEQUIPO" Type="Int32" />
                                            <asp:Parameter Name="Original_CODPAIS" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter DbType="Guid" Name="IDUSUARIO" />
                                            <asp:Parameter Name="USUARIO" Type="String" />
                                            <asp:Parameter Name="FECHAALTA" Type="DateTime" />
                                            <asp:Parameter Name="NOMBRE" Type="String" />
                                            <asp:Parameter Name="APELLIDOS" Type="String" />
                                            <asp:Parameter Name="ALIAS" Type="String" />
                                            <asp:Parameter Name="AVATAR" Type="String" />
                                            <asp:Parameter Name="PASS" Type="String" />
                                            <asp:Parameter Name="ORG" Type="Boolean" />
                                            <asp:Parameter Name="FACEBOOK" Type="String" />
                                            <asp:Parameter Name="TWITTER" Type="String" />
                                            <asp:Parameter Name="YOUTUBE" Type="String" />
                                            <asp:Parameter Name="WEB" Type="String" />
                                            <asp:Parameter Name="IDEQUIPO" Type="Int32" />
                                            <asp:Parameter Name="CODPAIS" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="tId" Name="IDEQUIPO" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="USUARIO" Type="String" />
                                            <asp:Parameter Name="FECHAALTA" Type="DateTime" />
                                            <asp:Parameter Name="NOMBRE" Type="String" />
                                            <asp:Parameter Name="APELLIDOS" Type="String" />
                                            <asp:Parameter Name="ALIAS" Type="String" />
                                            <asp:Parameter Name="AVATAR" Type="String" />
                                            <asp:Parameter Name="PASS" Type="String" />
                                            <asp:Parameter Name="ORG" Type="Boolean" />
                                            <asp:Parameter Name="FACEBOOK" Type="String" />
                                            <asp:Parameter Name="TWITTER" Type="String" />
                                            <asp:Parameter Name="YOUTUBE" Type="String" />
                                            <asp:Parameter Name="WEB" Type="String" />
                                            <asp:Parameter Name="IDEQUIPO" Type="Int32" />
                                            <asp:Parameter Name="CODPAIS" Type="String" />
                                            <asp:Parameter DbType="Guid" Name="Original_IDUSUARIO" />
                                            <asp:Parameter Name="Original_USUARIO" Type="String" />
                                            <asp:Parameter Name="Original_FECHAALTA" Type="DateTime" />
                                            <asp:Parameter Name="Original_NOMBRE" Type="String" />
                                            <asp:Parameter Name="Original_APELLIDOS" Type="String" />
                                            <asp:Parameter Name="Original_ALIAS" Type="String" />
                                            <asp:Parameter Name="Original_AVATAR" Type="String" />
                                            <asp:Parameter Name="Original_PASS" Type="String" />
                                            <asp:Parameter Name="Original_ORG" Type="Boolean" />
                                            <asp:Parameter Name="Original_FACEBOOK" Type="String" />
                                            <asp:Parameter Name="Original_TWITTER" Type="String" />
                                            <asp:Parameter Name="Original_YOUTUBE" Type="String" />
                                            <asp:Parameter Name="Original_WEB" Type="String" />
                                            <asp:Parameter Name="Original_IDEQUIPO" Type="Int32" />
                                            <asp:Parameter Name="Original_CODPAIS" Type="String" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col-xs-12">
                                    <br />
                                    <asp:Button ID="bBorrar" runat="server" Text="Borrar seleccionados" CssClass="btn btn-danger" OnClick="bBorrar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </section>
</asp:Content>

