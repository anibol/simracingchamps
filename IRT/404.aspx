<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="IRT._404" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="page-header">
        <div class="container">
            <div class="page-header-inner">
                <ol class="breadcrumb wow fadeInDown" data-wow-delay="300ms">
                    <li><a href="default.aspx">
                        <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1" Text="Inicio"></asp:Literal></a></li>
                    <li class="page">
                        <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="Error 404"></asp:Literal></li>
                </ol>
                <h1 class="page-title wow fadeInRight" data-wow-delay="300ms">
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="Error 404"></asp:Literal>
                </h1>
            </div>
        </div>
    </div>

    <section id="about" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="section-title wow fadeInUp" data-wow-delay="0s">
                        <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="La página indicada no existe"></asp:Literal></h2>
                                  
                </div>
            </div>
        </div>
    </section>

</asp:Content>
