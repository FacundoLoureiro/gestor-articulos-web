<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="gestor_articulos_web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Productos</h1>
      <head>
    <style>
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background-color: #f0f0f0;
            display: block;
        }

        .card {
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
    </style>
</head>

    <div class="row row-cols-1 row-cols-md-3 g-4">         
        <asp:Repeater runat="server" ID="repRepetidor">
            <ItemTemplate>
                 <div class="col">
                 <div class="card">
                    <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                        <p class="card-text"><%#Eval("Descripcion") %></p>                 
                        <asp:Button Text="Ver Detalle" CssClass="btn btn-primary" ID="btnVerDetalle" CommandArgument='<%#Eval("Id") %>' CommandName="articuloId" runat="server" OnClick="btnVerDetalle_Click" />
                        <asp:Button Text="🤍" CssClass="btn btn-primary" ID="btnAgregarFavorito" CommandArgument='<%#Eval("Id") %>' CommandName="agregarFavorito" runat="server" OnClick="btnAgregarFavorito_Click" />
                    </div>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
