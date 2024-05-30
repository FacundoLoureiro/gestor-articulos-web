<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="gestor_articulos_web.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 d-flex justify-content-center">
    <div class="card p-4 shadow-lg" style="width: 100%; max-width: 500px;">
        <h2 class="text-center mb-4">Registrarse</h2>
        <div class="mb-3">
            <label for="txtEmailRegistro" class="form-label">Email</label>
            <asp:TextBox ID="txtEmaiRegistro" runat="server" CssClass="form-control" placeholder="nombre@ejemplo.com" TextMode="Email"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtPasswordRegistro" class="form-label">Password</label>
            <asp:TextBox ID="txtPassRegistro" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>
        <div class="d-grid">
            <asp:Button ID="btnRegistro" runat="server" Text="Registro" CssClass="btn btn-primary" OnClick="btnRegistro_Click1"/>
        </div>
    </div>
</div>
</asp:Content>
