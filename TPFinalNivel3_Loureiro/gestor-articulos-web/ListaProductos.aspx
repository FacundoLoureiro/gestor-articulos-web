<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="gestor_articulos_web.ListaProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de productos</h1>
    <asp:GridView ID="dgvArticulos" runat="server" CssClass="table"> </asp:GridView>
</asp:Content>
