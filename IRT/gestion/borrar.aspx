<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="borrar.aspx.cs" Inherits="IRT.gestion.borrar" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1><asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="Borrar Carrera"></asp:Literal>        
        </h1>

        <ol class="breadcrumb">
            <li class="active"><asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Ayuda"></asp:Literal></li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Gestión de Carreras"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">

                        <p>
                            <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="ATENCIÓN: Vas a borrar la carrera, eso implica que se eliminarán los resultados que se hayan introducido así como cualquier información relativa a esta carrera. Esta acción no puede deshacerse"></asp:Literal></p>

                        <asp:Button ID="bBorrar" runat="server" CssClass="btn btn-danger" Text="CONFIRMAR BORRADO" OnClick="bBorrar_Click" meta:resourcekey="bBorrarResource1" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
