<%@ Page Title="" Language="C#" MasterPageFile="~/driver/driver.Master" AutoEventWireup="true" CodeBehind="ausencia.aspx.cs" Inherits="IRT.driver.ausencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content-header">
        <h1><asp:Literal ID="Literal6" runat="server" Text="Notificar ausencia" ></asp:Literal>        
        </h1>      
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-danger" ID="lblmesg" runat="server" Visible="False" ></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal2" runat="server"  Text="Notificar ausencia" ></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    
                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal3" runat="server" Text="En el caso de que no puedas participar en alguna prueba puedes enviar un aviso al organizador. Indicar en qué carrera y motivo por el que no podrás participar:"></asp:Literal></p>
                            <asp:TextBox ID="tMotivo" CssClass="form-control col-xs-12" MaxLength="250" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="tMotivo"></asp:RequiredFieldValidator>
                        <p>
                        <asp:Button ID="bCancelar" runat="server" CssClass="btn btn-primary" Text="Enviar notificación de ausencia" meta:resourcekey="bCancelarResource1" OnClick="bCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
