<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="gestor_articulos_web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Productos</h1>
    
    <div class="row row-cols-1 row-cols-md-3 g-4">
         <%
            foreach(dominio.Articulo articulo in ListaArticulos)  
             { 

         %>
            <div class="col">
                <div class="card">
                    <img src="<%: articulo.ImagenUrl %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%: articulo.Nombre %></h5>
                        <p class="card-text"><%: articulo.Descripcion %></p>
                    </div>
                </div>
            </div>
         <%  }  %>
    </div>

</asp:Content>
