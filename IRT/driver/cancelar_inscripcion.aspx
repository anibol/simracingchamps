<%@ Page Title="" Language="C#" MasterPageFile="~/driver/driver.Master" AutoEventWireup="true" CodeBehind="cancelar_inscripcion.aspx.cs" Inherits="IRT.driver.cancelar_inscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content-header">
        <h1><asp:Literal ID="Literal6" runat="server" Text="Cancelar Inscripción" ></asp:Literal>        
        </h1>      
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-danger" ID="lblmesg" runat="server" Visible="False" ></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal2" runat="server"  Text="Gestión de tu inscripción" ></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    
                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal3" runat="server" Text="ATENCIÓN: Vas a proceder a cancelar tu inscripción en el campeonato. Esta acción no puede deshacerse. ¿Estas seguro/a?" ></asp:Literal></p>
                        <p>
                        <asp:Button ID="bCancelar" runat="server" CssClass="btn btn-danger" Text="CANCELAR INSCRIPCION" meta:resourcekey="bCancelarResource1" OnClick="bCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
