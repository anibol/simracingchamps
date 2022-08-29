<%@ Page Title="" Language="C#" MasterPageFile="~/gestion/irtadmin.Master" AutoEventWireup="true" CodeBehind="validar.aspx.cs" Inherits="IRT.gestion.validar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <h1>
            Privado
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-lg-12">
                <asp:button cssclass="btn btn-success" id="bValidar1" runat="server" text="Validar" onclick="bValidar1_Click" />
                <asp:button Enabled="false" cssclass="btn btn-primary" id="bVAlidar2" runat="server" text="Validar + Tweet" onclick="bVAlidar2_Click" />
                <asp:button Enabled="false" cssclass="btn btn-warning" id="bApertura" runat="server" text="Apertura Tweet" onclick="bApertura_Click" />
                <br />
                <asp:label id="lblmsg" runat="server" text=""></asp:label>
            </div>
        </div>

     <%--   <div class="row">
            <div class="col-lg-12">
                <asp:label id="Label1" runat="server" text=""></asp:label>
                <asp:button cssclass="btn btn-success" id="Button1" runat="server" text="Validar BETA" onclick="bValidar1_Click" />
                <asp:button cssclass="btn btn-primary" id="Button2" runat="server" text="Validar + Tweet BETA" onclick="bVAlidar2_Click" />
                <asp:button cssclass="btn btn-warning" id="Button3" runat="server" text="Apertura Tweet BETA" onclick="bApertura_Click" />
            </div>
        </div>--%>
    </section>
</asp:Content>
