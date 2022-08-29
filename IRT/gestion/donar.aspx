<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="donar.aspx.cs" Inherits="IRT.gestion.donar" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="content-header">
        <h1>
            <asp:Literal ID="Literal6" runat="server" Text="Colabora con SimRacingChamps.net" meta:resourcekey="Literal6Resource1"></asp:Literal>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal2" runat="server" Text="Información" meta:resourcekey="Literal2Resource1"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal3" runat="server" Text="Ayúdanos al mantenimiento de servidor y desarrollo de nuevas funciones. Cualquier donación por pequeña que sea ayuda. ¡Gracias!" meta:resourcekey="Literal3Resource1"></asp:Literal>
                        </p>
                        <p>
                             <iframe style="border:0px;" src="donacion.html" height="200" width="100%"></iframe>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
</asp:Content>
