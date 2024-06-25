<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="gestor_articulos_web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>Productos</h1>
 <head>
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
                        <asp:Button Text="Ver Detalle" CssClass="btn btn-dark" ID="btnVerDetalle" CommandArgument='<%#Eval("Id") %>' CommandName="articuloId" runat="server" OnClick="btnVerDetalle_Click" />
                        <asp:UpdatePanel ID="UpdatePanelDetalle" runat="server" class="mb-3">
                        <ContentTemplate>
                            <% if (VerDetalle) { %>
                                
                                <p class="card-text"><%#Eval("Marca") %></p>
                                <p class="card-text"><%#Eval("Categoria") %></p>
                                <p class="card-text"><%#Eval("Precio") %></p>
                            <% } %>
                         </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Button Text="🤍" CssClass="btn btn-dark" ID="btnAgregarFavorito" CommandArgument='<%#Eval("Id") %>' CommandName="agregarFavorito" runat="server" OnClick="btnAgregarFavorito_Click" />
                    </div>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
