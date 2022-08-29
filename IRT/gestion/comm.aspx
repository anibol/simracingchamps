<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="comm.aspx.cs" Inherits="IRT.gestion.comm" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal6" runat="server" Text="Comunicación con Inscritos" meta:resourcekey="Literal6Resource1" ></asp:Literal>
        </h1>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-header ui-sortable-handle" style="cursor: move;">
                <i class="fa fa-envelope"></i>

                <h3 class="box-title">
                    <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Comunicación por e-mail con los pilotos inscritos"></asp:Literal></h3>
                <p>
                    <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="&lt;b&gt;Por favor usa esta herramienta con cuidado&lt;/b&gt;, el envío masivo de correos puede añadirnos a una lista negra de spam rápidamente, ¡gracias!"></asp:Literal></p>
                <!-- tools box -->
             
                <!-- /. tools -->
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label>
                        <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Asunto"></asp:Literal>:</label>
                    <asp:TextBox ID="tTitulo" runat="server" CssClass="form-control" meta:resourcekey="tTituloResource1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tTitulo" CssClass="label label-danger" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label>
                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Mensaje"></asp:Literal>:</label>
                    <asp:TextBox ID="tMensaje" TextMode="MultiLine" Columns="40" Rows="10" runat="server" CssClass="form-control" meta:resourcekey="tMensajeResource1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tMensaje" CssClass="label label-danger" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="box-footer clearfix">
                <asp:Button ID="bSend" CssClass="pull-right btn btn-default" runat="server" Text="Enviar" OnClick="bSend_Click" meta:resourcekey="bSendResource1" /><br />
                <p>
                    <asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="Una vez pulses enviar aparecerá aquí un log con el resultado del envío. Por favor, espera mientras se envían los correos"></asp:Literal></p>
                 <label>
                     <asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="Resultado del envío"></asp:Literal>:</label>
                <asp:Literal ID="lblmsg" runat="server" meta:resourcekey="lblmsgResource1"></asp:Literal>
            </div>
        </div>
    </section>
</asp:Content>
