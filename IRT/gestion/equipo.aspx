<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="equipo.aspx.cs" Inherits="IRT.gestion.equipo" %>
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
                                <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Este apartado te permite añadir tu equipo, su logo y seleccionar qué pilotos pertenecen a él"></asp:Literal></div>

                            <div class="col-xs-3">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Equipo"></asp:Literal>:</label>
                                    <asp:TextBox ID="tEquipo" CssClass="form-control" runat="server" meta:resourcekey="tEquipoResource1"></asp:TextBox>
                                    <asp:TextBox ID="tId" CssClass="form-control" runat="server" Visible="False" meta:resourcekey="tIdResource1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tEquipo" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal13" runat="server" Text="Fecha fundación"></asp:Literal>:</label>
                                    <asp:TextBox ID="tFundacion" runat="server" CssClass="form-control"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="tFini_CalendarExtender" runat="server" BehaviorID="tFini_CalendarExtender" Format="dd/MM/yyyy" TargetControlID="tFundacion" />
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="exampleInputFile">Logo:</label>
                                    <asp:FileUpload ID="fUpload" runat="server" meta:resourcekey="fUploadResource1" />
                                    <%=imagenactual2 %>
                                    <p class="help-block">
                                        <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Para que encaje con el estilo del portal debe tener un tamaño máximo de 280x280"></asp:Literal>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal9" runat="server" Text="Web"></asp:Literal>:</label>
                                    <asp:TextBox ID="tWeb" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal10" runat="server" Text="Twitter"></asp:Literal>:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon" id="sizing-addon2">@</span>
                                        <asp:TextBox ID="tTwitter" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <asp:Literal ID="Literal12" runat="server" Text="Facebook"></asp:Literal>:</label>
                                    <asp:TextBox ID="tFB" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label for="exampleInputPassword1">
                                    <asp:Literal ID="Literal11" runat="server" Text="Información"></asp:Literal>:</label>
                                <asp:TextBox ID="tInfo" runat="server" CssClass="form-control"></asp:TextBox>
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
                                    <asp:ObjectDataSource ID="objEquipos" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy5" TypeName="DL.UsuariosDSTableAdapters.USUARIOSTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="tId" Name="IDEQUIPO" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
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

