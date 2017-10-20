<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="ProyectoWeb.Web.GestionUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- 1st column -->
    <div class="c4">
        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Foto") %>'  />
    </div>
    <!-- 2nd column -->
    <div class="c8">
        <h2 class="title"><i class="icon-twitter"></i>GESTION DE USUARIOS</h2>
        <hr class="footerstress">
        <h3 class="title">
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="IdUsuario" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" OnPageIndexChanged="UpdateButton_Click">
                <EditItemTemplate>
                    IdUsuario:
                    <asp:Label ID="IdUsuarioLabel1" runat="server" Text='<%# Eval("IdUsuario") %>' />
                    <br />NombreUsuario:
                    <asp:TextBox ID="NombreUsuarioTextBox" runat="server" Text='<%# Bind("NombreUsuario") %>' />
                    <br />NickUsuario:
                    <asp:TextBox ID="NickUsuarioTextBox" runat="server" Text='<%# Bind("NickUsuario") %>' />
                    <br />ClaveUsuario:
                    <asp:TextBox ID="ClaveUsuarioTextBox" runat="server" Text='<%# Bind("ClaveUsuario") %>' />
                    <br />Administrador:
                    <asp:TextBox ID="AdministradorTextBox" runat="server" Text='<%# Bind("Administrador") %>' />
                    <br />Foto:
                    <asp:TextBox ID="FotoTextBox" runat="server" Text='<%# Bind("Foto") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <InsertItemTemplate>
                    NombreUsuario:
                    <asp:TextBox ID="NombreUsuarioTextBox" runat="server" Text='<%# Bind("NombreUsuario") %>' />
                    <br />NickUsuario:
                    <asp:TextBox ID="NickUsuarioTextBox" runat="server" Text='<%# Bind("NickUsuario") %>' />
                    <br />ClaveUsuario:
                    <asp:TextBox ID="ClaveUsuarioTextBox" runat="server" Text='<%# Bind("ClaveUsuario") %>' />
                    <br />Administrador:
                    <asp:TextBox ID="AdministradorTextBox" runat="server" Text='<%# Bind("Administrador") %>' />
                    <br />Foto:
                    <asp:TextBox ID="FotoTextBox" runat="server" Text='<%# Bind("Foto") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </InsertItemTemplate>
                <ItemTemplate>
                    IdUsuario:
                    <asp:Label ID="IdUsuarioLabel" runat="server" Text='<%# Eval("IdUsuario") %>' />
                    <br />NombreUsuario:
                    <asp:Label ID="NombreUsuarioLabel" runat="server" Text='<%# Bind("NombreUsuario") %>' />
                    <br />NickUsuario:
                    <asp:Label ID="NickUsuarioLabel" runat="server" Text='<%# Bind("NickUsuario") %>' />
                    <br />ClaveUsuario:
                    <asp:Label ID="ClaveUsuarioLabel" runat="server" Text='<%# Bind("ClaveUsuario") %>' />
                    <br />Administrador:
                    <asp:Label ID="AdministradorLabel" runat="server" Text='<%# Bind("Administrador") %>' />
                    <br />Foto:
                    <asp:Label ID="FotoLabel" runat="server" Text='<%# Bind("Foto") %>' />
                    
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                </ItemTemplate>
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM [UsuariosSet] WHERE [IdUsuario] = @IdUsuario" InsertCommand="INSERT INTO [UsuariosSet] ([NombreUsuario], [NickUsuario], [ClaveUsuario], [Administrador], [Foto]) VALUES (@NombreUsuario, @NickUsuario, @ClaveUsuario, @Administrador, @Foto)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsuariosSet]" UpdateCommand="UPDATE [UsuariosSet] SET [NombreUsuario] = @NombreUsuario, [NickUsuario] = @NickUsuario, [ClaveUsuario] = @ClaveUsuario, [Administrador] = @Administrador, [Foto] = @Foto WHERE [IdUsuario] = @IdUsuario">
                <DeleteParameters>
                    <asp:Parameter Name="IdUsuario" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NombreUsuario" Type="String" />
                    <asp:Parameter Name="NickUsuario" Type="String" />
                    <asp:Parameter Name="ClaveUsuario" Type="String" />
                    <asp:Parameter Name="Administrador" Type="Byte" />
                    <asp:Parameter Name="Foto" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NombreUsuario" Type="String" />
                    <asp:Parameter Name="NickUsuario" Type="String" />
                    <asp:Parameter Name="ClaveUsuario" Type="String" />
                    <asp:Parameter Name="Administrador" Type="Byte" />
                    <asp:Parameter Name="Foto" Type="String" />
                    <asp:Parameter Name="IdUsuario" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </h3>
    </div><hr />
    <div class="pageline">
    </div>

    </asp:Content>
