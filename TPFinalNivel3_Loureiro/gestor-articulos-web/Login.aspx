<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="gestor_articulos_web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>
    function validar() {
        // Capturar el control del email y la contraseña
        const txtEmail = document.getElementById("txtEmail");
        const txtPassword = document.getElementById("txtPassword");

        if (txtEmail.value == "") {
            txtEmail.classList.add("is-invalid");
            txtEmail.classList.remove("is-valid");
            return false;
        } else {
            txtEmail.classList.remove("is-invalid");
            txtEmail.classList.add("is-valid");
        }

        if (txtPassword.value == "") {
            txtPassword.classList.add("is-invalid");
            txtPassword.classList.remove("is-valid");
            return false;
        } else {
            txtPassword.classList.remove("is-invalid");
            txtPassword.classList.add("is-valid");
        }
        return true;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-5 d-flex justify-content-center">
    <div class="card p-4 shadow-lg" style="width: 100%; max-width: 500px;">
        <h2 class="text-center mb-4">Login</h2>
        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="nombre@ejemplo.com" TextMode="Email" ClientIDMode="Static"></asp:TextBox>
            <asp:RegularExpressionValidator ErrorMessage="Formato email por favor" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
        </div>
        <div class="mb-3">
            <label for="txtPassword" class="form-label">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
        </div>
        <div class="d-grid">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" OnClientClick="return validar();"/>
        </div>
    </div>
</div>
</asp:Content>
