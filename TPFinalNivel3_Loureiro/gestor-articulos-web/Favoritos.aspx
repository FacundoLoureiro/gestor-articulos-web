<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="gestor_articulos_web.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>    Favoritos</h1>
     <div class="row row-cols-1 row-cols-md-3 g-4">         
     <asp:Repeater runat="server" ID="repRepetidor">
         <ItemTemplate>
              <div class="col">
              <div class="card">
                 <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                 <div class="card-body">
                     <h5 class="card-title"><%#Eval("Nombre") %></h5>
                     <p class="card-text"><%#Eval("Descripcion") %></p>                 
                     <asp:Button Text="Ver Detalle" CssClass="btn btn-primary" ID="btnVerDetalle" CommandArgument='<%#Eval("Id") %>' CommandName="articuloId" runat="server"  />
                     <a href="Favoritos.aspx?id=<%#Eval("Id") %>" class="btn btn-primary">
                         🤍
                     </a>
                 </div>
             </div>
         </div>
         </ItemTemplate>
     </asp:Repeater>

 </div>
</asp:Content>
