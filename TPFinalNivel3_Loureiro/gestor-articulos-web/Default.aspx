<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="gestor_articulos_web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Productos</h1>
    
    <div class="row row-cols-1 row-cols-md-3 g-4">         
        <asp:Repeater runat="server" ID="repRepetidor">
            <ItemTemplate>
                 <div class="col">
                 <div class="card">
                    <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                        <p class="card-text"><%#Eval("Descripcion") %></p>
                        <a href="DetallePorjemon.aspx?id=<%#Eval("Id") %>">Ver Detalle</a>
                        <asp:Button Text="Ejemplo" CssClass="btn btn-primary" runat="server" ID="btnEjemplo" CommandArgument='<%#Eval("Id") %>' CommandName="articuloId" OnClick="btnEjemplo_Click" />
                    </div>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
