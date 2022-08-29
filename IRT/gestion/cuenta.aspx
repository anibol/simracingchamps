<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="cuenta.aspx.cs" Inherits="IRT.gestion.cuenta" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal49" runat="server" meta:resourcekey="Literal49Resource1" Text="Mi Cuenta"></asp:Literal>
            <small>
                <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Edita tus datos de acceso al sistema"></asp:Literal></small>
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
        <%-- <ol class="breadcrumb">
            <li class="active"><a href="#">Ayuda</a></li>
        </ol>--%>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="<%=Session["avatar"].ToString() %>" alt="">
                        <h3 class="profile-username text-center"><%= Session["NombrePersona"].ToString() %></h3>
                        <p class="text-muted text-center">
                            <%=organizador %><br />
                            <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Miembro desde"></asp:Literal>
                            <%= ano %>
                        </p>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#informacion" data-toggle="tab">
                            <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Información de la cuenta"></asp:Literal></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-panel" id="informacion">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">
                                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Organizador"></asp:Literal></label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="tOrg" class="form-control" runat="server" meta:resourcekey="tOrgResource1" ToolTip="Nombre del organizador"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">
                                        <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Pais"></asp:Literal></label>
                                    <div class="col-sm-10">
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
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword"  class="col-sm-2 control-label"><asp:Literal ID="Literal12" meta:resourcekey="zonahoraria" runat="server" Text="Zona Horaria"></asp:Literal>:</label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList ID="cbZonaHoraria"  CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="tEmail" class="form-control" runat="server" meta:resourcekey="tEmailResource1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">Web</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="tWeb" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Twitter</label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="sizing-addon2">@</span>
                                            <asp:TextBox ID="tTwitter" class="form-control" runat="server" meta:resourcekey="tTwitterResource1"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Facebook</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="tFacebook" class="form-control" runat="server" meta:resourcekey="tFacebookResource1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">YouTube</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="tYouTube" class="form-control" runat="server" meta:resourcekey="tYouTubeResource1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputExperience" class="col-sm-2 control-label">
                                        <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Nueva Contraseña"></asp:Literal></label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="tPass" class="form-control" runat="server" TextMode="Password" placeholder="Cambiar contraseña" meta:resourcekey="tPassResource1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSkills" class="col-sm-2 control-label">
                                        <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Repite la contraseña"></asp:Literal>:</label>

                                    <div class="col-sm-10">
                                        <asp:TextBox ID="tPass2" class="form-control" runat="server" TextMode="Password" placeholder="Repite Contraseña" meta:resourcekey="tPass2Resource1"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword" class="col-sm-2 control-label">Avatar:</label>
                                    <div class="col-sm-10">
                                        <asp:FileUpload ID="fUpload" runat="server" meta:resourcekey="fUploadResource1" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <asp:Button ID="bGuardar" CssClass="btn btn-danger" runat="server" Text="Guardar" OnClick="bGuardar_Click" meta:resourcekey="bGuardarResource1" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
</asp:Content>
