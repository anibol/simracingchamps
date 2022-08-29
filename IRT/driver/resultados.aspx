<%@ Page Title="" Language="C#" MasterPageFile="~/driver/driver.Master" AutoEventWireup="true" CodeBehind="resultados.aspx.cs" Inherits="IRT.driver.resultados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .blog-post .post-content {
  float: none;
  width: 100%;
  clear: both;
  padding: 0px;
}
    .blog-post .feature-inner {
        background: url('http://simracingchamps.net/assets/img/background/resultados-bg-1.jpg') no-repeat;
    }
    
    .blog-post .feature-inner h1 {
    color: white;
    padding-left: 40px;
    padding-top:40px;
    font-size: 40px;
    height:120px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content-header">
        <h1>Resultados
        </h1>       
    </section>
    
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- Profile Image -->
                <div class="box box-primary">
                   <%=result %>
                </div>                
            </div>
            <!-- /.col -->
          
        </div>
        <!-- /.row -->

    </section>
</asp:Content>
