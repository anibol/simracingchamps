<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="docs.aspx.cs" Inherits="IRT.gestion.docs" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Gestion de documentos"></asp:Literal>
        <small>
            <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Aqui puedes adjuntar el reglamento, normativa, etc, cualquier documento que quieras que esté disponible en la web de información del evento"></asp:Literal></small>
        </h1>
        <asp:Label CssClass="alert alert-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
       <ol class="breadcrumb">
            <li class="active">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-question-circle"></i> <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Ayuda"></asp:Literal>
                </button>
            </li>
        </ol>

         <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">
                            <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Documentos"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="&lt;p&gt;Esta es la pantalla en la que puedes añadir los documentos que quieras ofrecer para descarga en la web de tu campeonato&lt;/p&gt;
                        &lt;p&gt;Existen tres tipo: Reglamento, Normativa y Premios&lt;/p&gt;"></asp:Literal>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Cerrar"></asp:Literal></button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Adjuntar nuevo documento"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                <asp:Literal ID="Literal8" runat="server" meta:resourcekey="Literal8Resource1" Text="Selecciona documento"></asp:Literal>:</label>
                            <asp:FileUpload ID="fUpload" runat="server" meta:resourcekey="fUploadResource1" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal9Resource1" Text="Selecciona tipo"></asp:Literal>:</label>
                            <asp:DropDownList ID="cbTipo" runat="server" DataSourceID="objTipos" DataTextField="DESCRIPCION" DataValueField="ID" meta:resourcekey="cbTipoResource1">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="objTipos" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DL.AuxliaresDSTableAdapters.TIPODOCTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_ID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="DESCRIPCION" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="DESCRIPCION" Type="String" />
                                    <asp:Parameter Name="Original_ID" Type="Int32" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <asp:Button ID="bAdju" CssClass="btn btn-primary" runat="server" Text="Subir documento" OnClick="bAdj_Click" meta:resourcekey="bAdjuResource1" />
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="Listado de documentos"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <asp:GridView ID="dgAdj" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="dgAdj_RowDeleting" meta:resourcekey="dgAdjResource1">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="IDEVENTO" HeaderText="IDEVENTO" SortExpression="IDEVENTO" Visible="False" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="RUTADOC" HeaderText="RUTADOC" SortExpression="RUTADOC" Visible="False" meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="FICHERO" HeaderText="FICHERO" SortExpression="FICHERO" meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="TIPODOC" HeaderText="TIPO" SortExpression="TIPODOC" meta:resourcekey="BoundFieldResource5" />
                                <asp:CommandField ButtonType="Button" DeleteText="Borrar" ShowDeleteButton="True" HeaderText="Opciones" meta:resourcekey="CommandFieldResource1">
                                    <ControlStyle CssClass="btn btn-xs btn-danger" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
