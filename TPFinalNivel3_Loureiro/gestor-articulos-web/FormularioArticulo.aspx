<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="gestor_articulos_web.FormularioUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card p-4 shadow-lg" style="width: 100%; max-width: 1000px;">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="txtId" class="form-label">Id</label>
                        <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtCodigo" class="form-label">Codigo: </label>
                        <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="txtNombre" class="form-label">Nombre: </label>
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="ddlMarca" class="form-label">Marca: </label>
                        <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="ddlCategoria" class="form-label">Categoria: </label>
                        <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
                    </div>

                    <div class="mb-3 d-flex">
                        <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary me-2" OnClick="btnAceptar_Click" runat="server" />
                        <a href="ListaProductos.aspx" class="btn btn-secondary">Cancelar</a>
                    </div>
                </div>
                <div class="col-6">
                    <div class="mb-3">
                        <label for="txtDescripcion" class="form-label">Descripción: </label>
                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" />
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="mb-3">
                        <ContentTemplate>
                            <div class="col-md-6">
                                <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                                <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                    AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                            </div>
                            <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                                runat="server" ID="imgArticulo" Width="60%" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" class="mb-3">
                        <ContentTemplate>
                            <div class="mb-3 d-flex">
                                <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger me-2" runat="server" />
                                <% if (ConfirmaEliminacion) { %>
                                <div class="d-flex align-items-center">
                                    <asp:CheckBox Text="Confirmar Eliminación" ID="chkConfirmarEliminacion" runat="server" CssClass="me-2" />
                                    <asp:Button Text="Eliminar" ID="btnConfirmarEliminar" OnClick="btnConfirmarEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />
                                </div>
                                <% } %>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

