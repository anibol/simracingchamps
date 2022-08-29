<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="sponsors.aspx.cs" Inherits="IRT.gestion.sponsors" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Gestion general de Patrocinadores"></asp:Literal>
        <small><asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Aqui puedes añadir la lista general de patrocinadores para luego poder seleccionar los que te interesen para cada evento"></asp:Literal></small>
        </h1>
        <asp:Label CssClass="alert alert-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
        <ol class="breadcrumb">
            <li class="active"><asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Inicio"></asp:Literal></li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Adjuntar nuevo patrocinador"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Nombre patrocinador"></asp:Literal>:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tNombre" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="tNombre" CssClass="form-control" MaxLength="150" runat="server" meta:resourcekey="tNombreResource1"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Dirección Web"></asp:Literal>:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" CssClass="label label-danger" ControlToValidate="tNombre" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="tUrl"  CssClass="form-control" MaxLength="500" runat="server" meta:resourcekey="tUrlResource1"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Selecciona logo"></asp:Literal>:</label>
                                    <asp:FileUpload ID="fUpload"   CssClass="form-control" runat="server" meta:resourcekey="fUploadResource1" />
                                    <p><label class="label label-info">Atención:</label> El logo debe tener un tamaño de 150x150px para que aparezca correctamente</p>

                                </div>
                            </div>
                            <div class="col-xs-3">
                                <asp:Button ID="bAdju" CssClass="form-control btn btn-primary" runat="server" Text="Subir documentos" OnClick="bAdj_Click" meta:resourcekey="bAdjuResource1" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Listado de patrocinadores"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <asp:GridView ID="dgAdj" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="objAdj" OnRowDeleting="dgAdj_RowDeleting" meta:resourcekey="dgAdjResource1">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="SPONSOR" HeaderText="SPONSOR" SortExpression="SPONSOR" meta:resourcekey="BoundFieldResource2" />
                                <asp:TemplateField HeaderText="FICHERO" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FICHERO") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# DameRuta(Eval("FICHERO")) %>' meta:resourcekey="Image1Resource1" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IDUSUARIO" HeaderText="IDUSUARIO" SortExpression="IDUSUARIO" Visible="False" meta:resourcekey="BoundFieldResource3" />
                                <asp:CommandField ButtonType="Button" DeleteText="Borrar" ShowDeleteButton="True" HeaderText="Opciones" meta:resourcekey="CommandFieldResource1">
                                    <ControlStyle CssClass="btn btn-xs btn-danger" />
                                </asp:CommandField>

                            </Columns>
                        </asp:GridView>
                        <p><label class="label label-danger">Atención:</label>Borrar un sponsor de la lista general lo elimina tambien de todos aquellos campeonatos donde esté seleccionado</p>
                        <asp:ObjectDataSource ID="objAdj" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy1" TypeName="DL.AuxliaresDSTableAdapters.SPONSORSTableAdapter" InsertMethod="Insert" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="SPONSOR" Type="String" />
                                <asp:Parameter Name="LOGO" Type="String" />
                                <asp:Parameter DbType="Guid" Name="IDUSUARIO" />
                                <asp:Parameter Name="FICHERO" Type="String" />
                                <asp:Parameter Name="URL" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter DbType="Guid" Name="ID" SessionField="idu" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="SPONSOR" Type="String" />
                                <asp:Parameter Name="LOGO" Type="String" />
                                <asp:Parameter DbType="Guid" Name="IDUSUARIO" />
                                <asp:Parameter Name="FICHERO" Type="String" />
                                <asp:Parameter Name="URL" Type="String" />
                                <asp:Parameter Name="Original_Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
