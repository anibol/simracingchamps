<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="cartel.aspx.cs" Inherits="IRT.gestion.cartel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 950px;
            height: 297px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal6" runat="server" Text="Diseño de Cartel"></asp:Literal>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal2" runat="server" Text="Información"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">
                        <p>
                            <asp:Literal ID="Literal3" runat="server" Text="El proceso es sencillo, haznos una <b>donación de 10&euro;</b> y luego envíanos a <a href='mailto:info@simracingchamps.net'>info@simracingchamps.net</a> la información, logos, etc que quieres que aparezca en el cartel. Nosotros lo diseñaremos por ti."></asp:Literal></p>
                        <p>
                           
                            <img class="auto-style1" src="../Content/img/web/banenr.png" /></p>
                        <p>
                            <iframe style="border:0px;" src="cartel.html" height="200" width="100%"></iframe>

                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

</asp:Content>
