<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="GestionMenus.aspx.cs" Inherits="ProyectoWeb.Web.GestionMenus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataMenu" runat="server" 
            ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" 
            DeleteCommand="DELETE FROM MenusSet WHERE (IdMenu = @IdMenu)" 
            InsertCommand="INSERT INTO MenusSet(GrupoMenu, Posicion, NombreMenu, Logo, TipoUsuario) VALUES (@GrupoMenu, @Posicion, @NombreMenu, @Logo, @TipoUsuario)" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT IdMenu, GrupoMenu, Posicion, NombreMenu, Logo, TipoUsuario FROM MenusSet" 
            UpdateCommand="UPDATE MenusSet SET GrupoMenu = @GrupoMenu, NombreMenu = @NombreMenu, Logo = @Logo, TipoUsuario = @TipUsuario, Posicion = @Posicion WHERE (IdMenu = @IdMenu)">
            <DeleteParameters>
                <asp:Parameter Name="IdMenu" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="GrupoMenu" />
                <asp:Parameter Name="Posicion" />
                <asp:Parameter Name="NombreMenu" />
                <asp:Parameter Name="Logo" />
                <asp:Parameter Name="TipoUsuario" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GrupoMenu" />
                <asp:Parameter Name="NombreMenu" />
                <asp:Parameter Name="Logo" />
                <asp:Parameter Name="TipUsuario" />
                <asp:Parameter Name="Posicion" />
                <asp:Parameter Name="IdMenu" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    
    <!-- 1st column -->
    <div class="c1">
    </div>
    <!-- 2nd column -->
    <div class="c8">
        <h2 class="title"><i class="icon-twitter"></i>GESTION DE MENUS</h2>
        <hr class="footerstress">
        <div class="title">
            <table>
                <tr style="color: #FFFFFF; font-weight: bold; font-size: 14px">
                    <td width="300px">
                        Pagina: <asp:DropDownList ID="ddlGrupoMenu" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="GrupoMenu" DataValueField="GrupoMenu"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [GrupoMenu] FROM [MenusSet]"></asp:SqlDataSource>
                    </td>
                    <td width="400px">
                        Tipo Usuario: <asp:DropDownList ID="ddlTipoUsuario" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TipoUsuario" DataValueField="TipoUsuario"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [TipoUsuario] FROM [MenusSet]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="IdMenu" DataSourceID="SqlDataMenu" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" Width="75" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" Width="75" />
                        </td>
                        <td>
                            <asp:Label ID="IdMenuLabel" runat="server" Text='<%# Eval("IdMenu") %>' Width="75" />
                        </td>
                        <td>
                            <asp:Label ID="GrupoMenuLabel" runat="server" Text='<%# Eval("GrupoMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="PosicionLabel" runat="server" Text='<%# Eval("Posicion") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="NombreMenuLabel" runat="server" Text='<%# Eval("NombreMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="LogoLabel" runat="server" Text='<%# Eval("Logo") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="TipoUsuarioLabel" runat="server" Text='<%# Eval("TipoUsuario") %>' Width="100" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #999999;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" Width="75" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" Width="75" />
                        </td>
                        <td>
                            <asp:Label ID="IdMenuLabel1" runat="server" Text='<%# Eval("IdMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="GrupoMenuTextBox" runat="server" Text='<%# Bind("GrupoMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="PosicionTextBox" runat="server" Text='<%# Bind("Posicion") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="NombreMenuTextBox" runat="server" Text='<%# Bind("NombreMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="LogoTextBox" runat="server" Text='<%# Bind("Logo") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="TipoUsuarioTextBox" runat="server" Text='<%# Bind("TipoUsuario") %>' Width="100" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No se han devuelto datos.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" Width="75" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" Width="75" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="GrupoMenuTextBox" runat="server" Text='<%# Bind("GrupoMenu") %>' Width="75" />
                        </td>
                        <td>
                            <asp:TextBox ID="PosicionTextBox" runat="server" Text='<%# Bind("Posicion") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="NombreMenuTextBox" runat="server" Text='<%# Bind("NombreMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="LogoTextBox" runat="server" Text='<%# Bind("Logo") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="TipoUsuarioTextBox" runat="server" Text='<%# Bind("TipoUsuario") %>' Width="100" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" Width="75"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" Width="75" />
                        </td>
                        <td>
                            <asp:Label ID="IdMenuLabel" runat="server" Text='<%# Eval("IdMenu") %>' Width="75" />
                        </td>
                        <td>
                            <asp:Label ID="GrupoMenuLabel" runat="server" Text='<%# Eval("GrupoMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="PosicionLabel" runat="server" Text='<%# Eval("Posicion") %>' Width="100" />
                        </td>
                        <td">
                            <asp:Label ID="NombreMenuLabel" runat="server" Text='<%# Eval("NombreMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="LogoLabel" runat="server" Text='<%# Eval("Logo") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="TipoUsuarioLabel" runat="server" Text='<%# Eval("TipoUsuario") %>' Width="100" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server" width="75px"></th>
                                        <th runat="server" width="100px">IdMenu</th>
                                        <th runat="server" width="200px">GrupoMenu</th>
                                        <th runat="server" width="100px">Posicion</th>
                                        <th runat="server" width="200px">NombreMenu</th>
                                        <th runat="server" width="200px">Logo</th>
                                        <th runat="server" width="100px">TipoUsuario</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" Width="75" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" Width="75" />
                        </td>
                        <td>
                            <asp:Label ID="IdMenuLabel" runat="server" Text='<%# Eval("IdMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="GrupoMenuLabel" runat="server" Text='<%# Eval("GrupoMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="PosicionLabel" runat="server" Text='<%# Eval("Posicion") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="NombreMenuLabel" runat="server" Text='<%# Eval("NombreMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="LogoLabel" runat="server" Text='<%# Eval("Logo") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="TipoUsuarioLabel" runat="server" Text='<%# Eval("TipoUsuario") %>' Width="100" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
    </div><hr />
    <div class="pageline">    
    </div>
    
</asp:Content>
