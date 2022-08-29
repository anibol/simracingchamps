<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cuenta.aspx.cs" Inherits="IRT.cuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/sign.css" rel="stylesheet" />
</head>
<body>
    <form class="form-signin" runat="server">
        <h2 class="form-signin-heading">Registro
        </h2>
        <label for="inputEmail" class="sr-only">E-mail:</label>
        <asp:TextBox ID="tUsuario" class="form-control" runat="server" placeholder="e-mail"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tUsuario"></asp:RequiredFieldValidator>
        <% if (Request.QueryString["org"] != null)
            { %>
        <label for="inputEmail" class="sr-only">Organizador:</label>
        <asp:TextBox ID="tOrg" class="form-control" runat="server" placeholder="Organizador"></asp:TextBox>
        <% }
            else
            { %>
        <label for="inputEmail" class="sr-only">Nombre:</label>
        <asp:TextBox ID="tNombre" class="form-control" runat="server" placeholder="Nombre"></asp:TextBox>
        <label for="inputEmail" class="sr-only">Apellidos:</label>
        <asp:TextBox ID="tApellidos" class="form-control" runat="server" placeholder="Apellidos"></asp:TextBox>
        <label for="inputEmail" class="sr-only">Alias:</label>
        <asp:TextBox ID="tAlias" class="form-control" runat="server" placeholder="Alias/Nickname"></asp:TextBox>
        <% } %>
        <label for="inputEmail" class="sr-only">País:</label>
        <asp:DropDownList ID="cbPais" runat="server" DataSourceID="objPais" DataTextField="EN" DataValueField="COD"></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" ControlToValidate="cbPais"></asp:RequiredFieldValidator>        
        <asp:ObjectDataSource ID="objPais" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="IRT.Models.AuxliaresDSTableAdapters.PAISESTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_COD" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COD" Type="String" />
                <asp:Parameter Name="EN" Type="String" />
                <asp:Parameter Name="ES" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EN" Type="String" />
                <asp:Parameter Name="ES" Type="String" />
                <asp:Parameter Name="Original_COD" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <label for="inputPassword" class="sr-only">Contraseña:</label>
        <asp:TextBox ID="tPass" class="form-control" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tPass"></asp:RequiredFieldValidator>
        <label for="inputPassword" class="sr-only">Repite contraseña:</label>
        <asp:TextBox ID="tPass2" class="form-control" runat="server" TextMode="Password" placeholder="Repite la Contraseña"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" ControlToValidate="tPass2"></asp:RequiredFieldValidator>
        <label for="inputPassword" class="sr-only">Avatar:</label>
        <asp:FileUpload ID="fUpload" runat="server" /><br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no son iguales" ControlToCompare="tPass" ControlToValidate="tPass2"></asp:CompareValidator>
        <div class="checkbox">
            <label>
                <asp:CheckBox ID="chTerminos" runat="server" />
                Acepto los <a href="#">términos y condiciones de uso</a>
            </label>
        </div>
        <asp:Button ID="bEntrar" runat="server" class="btn btn-lg btn-primary btn-block" Text="Regístrate" OnClick="bEntrar_Click" /><br />
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="White"></asp:Label>
    </form>
</body>
</html>
