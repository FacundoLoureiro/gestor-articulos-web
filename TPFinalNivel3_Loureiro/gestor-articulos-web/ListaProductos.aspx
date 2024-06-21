<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="gestor_articulos_web.ListaProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de productos</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" OnTextChanged="txtFiltro_TextChanged" AutoPostBack="true" />
            </div>
        </div>
           <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
            <div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" 
                    CssClass="" ID="chkAvanzado" runat="server" 
                    AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged"
                    />
            </div>
        </div>

        <%if (chkAvanzado.Checked)
            { %>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                        <asp:ListItem Text="Precio" />
                        <asp:ListItem Text="Nombre" />
                        <asp:ListItem Text="Descripcion" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Criterio" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Filtro" runat="server" />
                    <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                </div>
            </div>           
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" id="btnBuscar" OnClick="btnBuscar_Click"/>
                </div>
            </div>
        </div>
        <%} %>
    </div>
    <asp:GridView  ID="dgvArticulos" runat="server" CssClass="table table-dark table-striped" 
        DataKeyNames="Id" AutoGenerateColumns="false" 
        OnPageIndexChanging="dgvArticulos_PageIndexChanging" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" 
        AllowPaging="true" PageSize="5"> 
        <Columns>
            <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✏️" />           
        </Columns>
    </asp:GridView>
    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>    
</asp:Content>
