<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register_driver.aspx.cs" Inherits="IRT.register_driver" meta:resourcekey="PageResource1" %>

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
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Regístro"></asp:Literal>
                    </li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">
                   <% if (Request.QueryString["j"]==null) { %>
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Registrate como Piloto"></asp:Literal>
                    <% } else { 
                        %>
                    <asp:Literal ID="Literal13" runat="server" Text="Registrate como Jefe de Equipo" meta:resourcekey="Literal13Resource1"></asp:Literal>
                    <% } %>
                </h1>
            </div>
        </div>
    </div>

    <section id="princing">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <h2>
                            <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Indica tus datos"></asp:Literal></h2>
                        <h5>
                            <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Podrás inscribirte a tus campeonatos preferidos fácilmente, acceder a tu historial de participaciones, tener tu perfil de piloto y mucho más"></asp:Literal>.</h5>
                        <asp:Panel ID="panMensaje" runat="server" Visible="False" meta:resourcekey="panMensajeResource1">
                            <h3>
                                <label id="lblmsgerror" runat="server" class="label label-danger" visible="false"></label>
                                <label id="lblmsgok" runat="server" class="label label-success" visible="false"></label>
                            </h3>
                        </asp:Panel>
                        <div class="subscribe-box">
                            <div class="subscribe-form">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="inputEmail">
                                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="E-mail (se usará como usuario para el acceso)"></asp:Literal>:</label>
                                        <asp:TextBox ID="tUsuario" class="form-control" runat="server"  meta:resourcekey="tUsuarioResource1" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert-danger" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tUsuario" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputEmail">
                                            <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Nombre"></asp:Literal>:</label>
                                        <asp:TextBox ID="tNombre" class="form-control" runat="server" meta:resourcekey="tNombreResource1" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="alert-danger" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tNombre" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputEmail">
                                            <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Apellidos"></asp:Literal>:</label>
                                        <asp:TextBox ID="tApellidos" class="form-control" runat="server" meta:resourcekey="tApellidosResource1" MaxLength="250"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="alert-danger" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tApellidos" meta:resourcekey="RequiredFieldValidator6Resource1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="inputPassword">Alias/Nick:</label>
                                        <asp:TextBox ID="tAlias" class="form-control" runat="server"  meta:resourcekey="tAliasResource1" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="inputEmail">
                                            <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="País"></asp:Literal>:</label>
                                        <asp:DropDownList ID="cbPais" class="form-control" runat="server" DataSourceID="objPais" DataTextField="EN" DataValueField="COD" meta:resourcekey="cbPaisResource1"></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" ControlToValidate="cbPais" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                                        <asp:ObjectDataSource ID="objPais" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.PAISESTableAdapter" UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_COD" Type="String" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="COD" Type="String" />
                                                <asp:Parameter Name="EN" Type="String" />
                                                <asp:Parameter Name="ES" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="EN" Type="String" />
                                                <asp:Parameter Name="ES" Type="String" />
                                                <asp:Parameter Name="Original_COD" Type="String" />
                                            </UpdateParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                       <div class="col-md-3">
                                        <label for="inputPassword"><asp:Literal ID="Literal18" meta:resourcekey="zonahoraria" runat="server" Text="Zona Horaria"></asp:Literal>:</label>
                                        <asp:DropDownList ID="cbZonaHoraria"  CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="inputPassword">Avatar:</label>
                                        <asp:FileUpload class="form-control" ID="fUpload" runat="server" meta:resourcekey="fUploadResource1" />
                                    </div>
                                </div>
                                  <div class="row">
                                    <div class="col-md-2">
                                        <label for="inputPassword">
                                            <asp:Literal ID="Literal14" runat="server"  Text="PSN"></asp:Literal>:</label>
                                        <asp:TextBox ID="tPSN" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="inputPassword">
                                            <asp:Literal ID="Literal15" runat="server" Text="XBOX ID"></asp:Literal>:</label>
                                        <asp:TextBox ID="tXBOX" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="inputPassword">
                                            <asp:Literal ID="Literal16" runat="server"  Text="iRacing ID"></asp:Literal>:</label>
                                        <asp:TextBox ID="tIRID" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                    </div>
                                       <div class="col-md-4">
                                        <label for="inputPassword">
                                            <asp:Literal ID="Literal17" runat="server" meta:resourcekey="nombreiracing" Text="Nombre en iRacing"></asp:Literal>:</label>
                                        <asp:TextBox ID="tIRNombre" class="form-control" runat="server"  MaxLength="50"></asp:TextBox>
                                    </div>
                                        <div class="col-md-2">
                                        <label for="inputPassword">
                                            <asp:Literal ID="Literal19" runat="server"  Text="RaceRoom ID"></asp:Literal>:</label>
                                        <asp:TextBox ID="tRRID" class="form-control" runat="server"  MaxLength="150"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="inputPassword">
                                            <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Contraseña"></asp:Literal>:</label>
                                        <asp:TextBox ID="tPass" class="form-control" runat="server" TextMode="Password"  meta:resourcekey="tPassResource1" MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="alert-danger" ErrorMessage="Campo requerido" ControlToValidate="tPass" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator><br />
                                        <asp:RegularExpressionValidator ID="RegExp1" CssClass="alert-danger" runat="server" ErrorMessage="La contraseña debe tener entre 7 y 15 caracteres y admite @&#." ControlToValidate="tPass" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,15}$" meta:resourcekey="RegExp1Resource1" />
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputPassword">
                                            <asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="Repite contraseña"></asp:Literal>:</label>
                                        <asp:TextBox ID="tPass2" class="form-control" runat="server" TextMode="Password"  meta:resourcekey="tPass2Resource1" MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="alert-danger" ErrorMessage="Campo requerido" ControlToValidate="tPass2" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator><br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="alert-danger" runat="server" ErrorMessage="La contraseña debe tener entre 7 y 15 caracteres y adminte @&#." ControlToValidate="tPass2" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,15}$" meta:resourcekey="RegularExpressionValidator1Resource1" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:CompareValidator ID="CompareValidator1" CssClass="alert-danger" runat="server" ErrorMessage="Las contraseñas no son iguales" ControlToCompare="tPass" ControlToValidate="tPass2" meta:resourcekey="CompareValidator1Resource1"></asp:CompareValidator>
                                    </div>
                                </div>
                               <%-- <div class="row">
                                    <div class="col-md-12">
                                            <div class="g-recaptcha" data-sitekey="6LfjMiwUAAAAABFyu9KrUd3T2zYFnj-IwYsvNlpd"></div>
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" id="chTerminos" checked />
                                                <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="Acepto los &lt;a href=&quot;terminos.aspx&quot;&gt;términos y condiciones de uso&lt;/a&gt;"></asp:Literal>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="bEntrar" runat="server" class="btn btn-lg btn-primary btn-block btnEntrar" Text="Regístrate" OnClick="bEntrar_Click" meta:resourcekey="bEntrarResource1" /><br />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="Label1" runat="server" ForeColor="White" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(function () {
            $('#chTerminos').click(function () {
                if ($(this).is(':checked')) {
                    $('.btnEntrar').first().attr('disabled', 'disabled');
                } else {
                    $('.btnEntrar').first().removeAttr('disabled');
                }
            });
        });
    </script>
</asp:Content>


