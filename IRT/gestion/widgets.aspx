<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="widgets.aspx.cs" Inherits="IRT.gestion.widgets" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content-header">
        <h1><asp:Literal ID="Literal6" runat="server" Text="Widgets" meta:resourcekey="Literal6Resource1"></asp:Literal>        
        </h1>
    </section>
    <section class="content">
       <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal20" runat="server" Text="Muestra los resultados en tu web con nuestro Widget" meta:resourcekey="Literal20Resource1"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <p><b>
                                    <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Widget Total"></asp:Literal></b>: <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Muestra los resultados, incluido el desglose por carrera, de este campeonato en tu web gracias a nuestro Widget. Sólo tienes que copiar y pegar en tu web el siguiente código"></asp:Literal>:</p>
                                <code>
                                    <asp:Literal ID="litWidget" runat="server" meta:resourcekey="litWidgetResource1"></asp:Literal>
                                </code>
                            </div>
                           
                        </div>
                        <p>&nbsp;</p>
                        <div class="row">
                            <div class="col-xs-12">
                                <p><b>
                                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Widget Simplificado"></asp:Literal></b>: <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="Muestra los resultados, sin carreras, solo totales, de este campeonato en tu web gracias a nuestro Widget. Sólo tienes que copiar y pegar en tu web el siguiente código"></asp:Literal>:</p>
                                <code>
                                    <asp:Literal ID="litWidgetSimple" runat="server" meta:resourcekey="litWidgetSimpleResource1"></asp:Literal>
                                </code>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
