<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="gestor_articulos_web.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>
    function validar() {
        // Capturar el control del email y pass
        const txtEmailRegistro = document.getElementById("txtEmailRegistro");
        const txtPassRegistro = document.getElementById("txtPassRegistro");

        // Valida el campo de email
        if (txtEmailRegistro.value == "") {
            txtEmailRegistro.classList.add("is-invalid");
            txtEmailRegistro.classList.remove("is-valid");
            return false;
        } else {
            txtEmailRegistro.classList.remove("is-invalid");
            txtEmailRegistro.classList.add("is-valid");
        }

        // Valida el campo de password
        if (txtPassRegistro.value == "") {
            txtPassRegistro.classList.add("is-invalid");
            txtPassRegistro.classList.remove("is-valid");
            return false;
        } else {
            txtPassRegistro.classList.remove("is-invalid");
            txtPassRegistro.classList.add("is-valid");
        }
        return true;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 d-flex justify-content-center">
    <div class="card p-4 shadow-lg" style="width: 100%; max-width: 500px;">
        <h2 class="text-center mb-4">Registrarse</h2>
        <div class="mb-3">
            <label for="txtEmailRegistro" class="form-label">Email</label>
            <asp:TextBox ID="txtEmaiRegistro" runat="server" CssClass="form-control" placeholder="nombre@ejemplo.com" TextMode="Email" ClientIDMode="Static"></asp:TextBox>
            <asp:RegularExpressionValidator ErrorMessage="Formato email por favor" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
        </div>
        <div class="mb-3">
            <label for="txtPasswordRegistro" class="form-label">Password</label>
            <asp:TextBox ID="txtPassRegistro" runat="server" CssClass="form-control" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
        </div>
        <div class="d-grid">
            <asp:Button ID="btnRegistro" runat="server" Text="Registro" CssClass="btn btn-primary" OnClick="btnRegistro_Click1" OnClientClick="return validar();"/>
        </div>
    </div>
</div>
</asp:Content>
