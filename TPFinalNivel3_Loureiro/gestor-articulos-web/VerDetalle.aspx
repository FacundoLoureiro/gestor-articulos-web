<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VerDetalle.aspx.cs" Inherits="gestor_articulos_web.VerDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <img id="imgProducto" runat="server" class="card-img-top" alt="Imagen del Producto" />
                <div class="card-body">
                    <h5 class="card-title" id="lblNombre" runat="server"></h5>
                    <p class="card-text" id="lblDescripcion" runat="server"></p>
                    <p class="card-text"><strong>Marca:</strong> <span id="lblMarca" runat="server"></span></p>
                    <p class="card-text"><strong>Categoría:</strong> <span id="lblCategoria" runat="server"></span></p>
                    <p class="card-text"><strong>Precio:</strong> <span id="lblPrecio" runat="server"></span></p>
                    <a href="Default.aspx" class="btn btn-secondary">Volver</a>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
