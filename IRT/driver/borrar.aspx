<%@ Page Title="" Language="C#" MasterPageFile="~/driver/driver.Master" AutoEventWireup="true" CodeBehind="borrar.aspx.cs" Inherits="IRT.driver.borrar" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1><asp:Literal ID="Literal6" runat="server" Text="Cancelar Cuenta" meta:resourcekey="Literal6Resource1"></asp:Literal>        
        </h1>      
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1" ></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal2" runat="server"  Text="Gestión de Cuenta" meta:resourcekey="Literal2Resource1" ></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    
                    <div class="box-body">

                        <p>
                            <asp:Literal ID="Literal3" runat="server" Text="ATENCIÓN: Vas a proceder a cancelar tu cuenta. Esto te impedirá el acceso a tu panel con este usuario. ¿Estas seguro/a?" meta:resourcekey="Literal3Resource1"></asp:Literal></p>
                        <p>

                        <asp:Button ID="bCancelar" runat="server" CssClass="btn btn-danger" Text="CANCELAR CUENTA" meta:resourcekey="bCancelarResource1" OnClick="bCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
