<%@ Page Title="" Language="C#" MasterPageFile="irtadmin.Master" AutoEventWireup="true" CodeBehind="borrarevento.aspx.cs" Inherits="IRT.gestion.borrarevento" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal6" runat="server" Text="Borrar Campeonato" meta:resourcekey="Literal6Resource1"></asp:Literal>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal2" runat="server" Text="Gestión de Campeonatos" meta:resourcekey="Literal2Resource1"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">

                        <p>
                            <asp:Literal ID="Literal3" runat="server" Text="ATENCIÓN: Vas a borrar el campeonato. Esta acción no puede deshacerse" meta:resourcekey="Literal3Resource1"></asp:Literal>
                        </p>

                        <asp:Button ID="bBorrar" runat="server" CssClass="btn btn-danger" Text="CONFIRMAR BORRADO" OnClick="bBorrar_Click" meta:resourcekey="bBorrarResource1" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
