<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="copiar.aspx.cs" Inherits="IRT.gestion.copiar" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="content-header">
        <h1><asp:Literal ID="Literal6" runat="server" Text="Copiar Campeonato" meta:resourcekey="Literal6Resource1"></asp:Literal>        
        </h1>      
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <asp:Label CssClass="label label-danger" ID="lblmesg" runat="server" Visible="False" meta:resourcekey="lblmesgResource1"></asp:Label>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><asp:Literal ID="Literal2" runat="server"  Text="Gestión de Campeonatos" meta:resourcekey="Literal2Resource1"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    
                    <div class="box-body">

                        <p>
                            <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="ATENCIÓN: Vas a copiar un campeonato, eso implica la creación de un nuevo campeonato con la misma información general y carreras que el original. El nuevo campeonato se llamará igual con el apóstrofe '-copia'"></asp:Literal>. <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Sólo tendrás que editar el nombre, revisar las fechas y publicarlo"></asp:Literal>.</p>
                        <p>
                            <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="La copia es interesante cuando quieras crear nuevas ediciones de un mismo campeonato sin tener que volver a introducir toda la información"></asp:Literal>.</p>

                        <asp:Button ID="bCopiar" runat="server" CssClass="btn btn-success" Text="COPIAR CAMPEONATO" OnClick="bCopiar_Click" meta:resourcekey="bCopiarResource1" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
