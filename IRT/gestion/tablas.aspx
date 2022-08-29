<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="tablas.aspx.cs" Inherits="IRT.gestion.tablas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            <asp:Literal ID="Literal6" runat="server"
                Text="Tablas de Puntos"></asp:Literal>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <asp:Literal ID="Literal2" runat="server" Text="Listado de tablas de puntuación disponibles"></asp:Literal></h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">
                        <asp:Repeater ID="repTablas" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <td style="vertical-align:top;padding-right:10px;"><b style="height:90px;"><%# DataBinder.Eval(Container.DataItem,"TABLA") %></b>
                                
                                <asp:Repeater ID="repPuntos" runat="server" DataSource='<%# Eval("myrelation") %>'>

                                    <HeaderTemplate>
                                        <table class="table table-bordered table-hover">
                                            
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr><td style="text-align:center;"><%# Eval("PUNTOS").ToString() %></td></tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        
                                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                    </td>
                                    
                            </ItemTemplate>
                            <FooterTemplate>
                                </tr>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
