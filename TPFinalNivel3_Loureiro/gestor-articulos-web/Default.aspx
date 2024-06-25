<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="gestor_articulos_web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Productos</h1>
 <head>
</head>
        <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltroHome" CssClass="form-control" OnTextChanged="txtFiltroHome_TextChanged" AutoPostBack="true" />
            </div>
        </div>
           <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
            <div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" 
                    CssClass="" ID="chkAvanzadoHome" runat="server" 
                    AutoPostBack="true" OnCheckedChanged="chkAvanzadoHome_CheckedChanged"
                    />
            </div>
        </div>

        <%if (chkAvanzadoHome.Checked)
            { %>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="ddlCampoHome" OnSelectedIndexChanged="ddlCampoHome_SelectedIndexChanged">
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
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" id="btnBuscarHome" OnClick="btnBuscarHome_Click"/>
                </div>
            </div>
        </div>
        <%} %>
    </div>

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
                        <asp:Button Text="🤍" CssClass="btn btn-dark" ID="btnAgregarFavorito" CommandArgument='<%#Eval("Id") %>' CommandName="agregarFavorito" runat="server" OnClick="btnAgregarFavorito_Click" />
                    </div>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
