<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="GestionSubMenus.aspx.cs" Inherits="ProyectoWeb.Web.GestionSubMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <asp:SqlDataSource ID="SqlDataMenu" runat="server" 
            ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" 
            DeleteCommand="DELETE FROM SubMenuSet WHERE (IdSubMenu = @IdSubMenu)" 
            InsertCommand="INSERT INTO SubMenuSet(GrupoMenu, Posicion, NombreSubMenu, Logo, TipoUsuario, IdMenu) VALUES (@GrupoMenu, @Posicion, @NombresubMenu, @Logo, @TipoUsuario, @IdMenu)" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT IdSubMenu, GrupoMenu, Posicion, NombreSubMenu, Logo, TipoUsuario, IdMenu FROM SubMenuSet WHERE (GrupoMenu = @GrupoMenuF) AND (TipoUsuario = @TipoUsuario) AND (IdMenu = @IdMenu)"
            UpdateCommand="UPDATE SubMenuSet SET GrupoMenu = @GrupoMenu, NombreSubMenu = @NombreSubMenu, Logo = @Logo, TipoUsuario = @TipUsuario, Posicion = @Posicion, IdMenu = @IdMenu WHERE (IdSubMenu = @IdSubMenu)">
            <DeleteParameters>
                <asp:Parameter Name="IdSubMenu" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="GrupoMenu" />
                <asp:Parameter Name="Posicion" />
                <asp:Parameter Name="NombreSubMenu" />
                <asp:Parameter Name="Logo" />
                <asp:Parameter Name="TipoUsuario" />
                <asp:Parameter Name="IdMenu" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GrupoMenu" />
                <asp:Parameter Name="NombreSubMenu" />
                <asp:Parameter Name="Logo" />
                <asp:Parameter Name="TipUsuario" />
                <asp:Parameter Name="Posicion" />
                <asp:Parameter Name="IdMenu" />
                <asp:Parameter Name="IdSubMenu" />
            </UpdateParameters>
            
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGrupoMenu" DefaultValue="principal" Name="GrupoMenuF" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlTipoUsuario" DefaultValue="admin" Name="TipoUsuario" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlMenu" DefaultValue="6" Name="IdMenu" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        
    </div>
    <!-- 1st column -->
    <div class="c1">
    </div>
    <!-- 2nd column -->
    <div class="c8">
        <h2 class="title"><i class="icon-twitter"></i>GESTION DE SUB MENUS</h2>
        <hr class="footerstress">
                <div class="title">
            <table>
                <tr style="color: #FFFFFF; font-weight: bold; font-size: 14px">
                    <td>
                        Pagina: <asp:DropDownList ID="ddlGrupoMenu" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="GrupoMenu" DataValueField="GrupoMenu" AppendDataBoundItems="true" Width="280"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [GrupoMenu] FROM [SubMenuSet]"></asp:SqlDataSource>
                    </td>
                    <td>
                        Tipo Usuario: 
                        <asp:DropDownList ID="ddlTipoUsuario" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TipoUsuario" DataValueField="TipoUsuario" Width="280"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [TipoUsuario] FROM [SubMenuSet]"></asp:SqlDataSource>
                    </td>
                    <td>
                        MENU : 
                        <asp:DropDownList ID="ddlMenu" runat="server"  AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="NombreMenu" DataValueField="IdMenu"  Width="280"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM MenusSet WHERE (GrupoMenu = @GrupoMenu) AND (TipoUsuario = @TipoUsuario)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlGrupoMenu" DefaultValue="principal" Name="GrupoMenu" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlTipoUsuario" DefaultValue="todos" Name="TipoUsuario" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="IdSubMenu" DataSourceID="SqlDataMenu" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" Text="Editar" ImageUrl="~/Imagenes/edit_icon_color.gif" Width="25" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" Text="DeleteSS" ImageUrl="~/imagenes/delete_icon_color.gif" OnClientClick="return confirm('Estas seguro que quieres eliminar este registro??');" ToolTip="Delete"  Width="25"/>
                        </td>
                        <td >
                            <asp:Label ID="IdSubMenuLabel" runat="server" Text='<%# Eval("IdSubMenu") %>' Width="75"  />
                        </td>
                        <td>
                            <asp:Label ID="GrupoMenuLabel" runat="server" Text='<%# Eval("GrupoMenu") %>' Width="100"   />
                        </td>
                        <td>
                            <asp:Label ID="PosicionLabel" runat="server" Text='<%# Eval("Posicion") %>' Width="100"   />
                        </td>
                        <td>
                            <asp:Label ID="NombreSubMenuLabel" runat="server" Text='<%# Eval("NombreSubMenu") %>' Width="100"  />
                        </td>
                        <td>
                            <asp:Label ID="LogoLabel" runat="server" Text='<%# Eval("Logo") %>' Width="100"   />
                        </td>
                        <td>
                            <asp:Label ID="TipoUsuarioLabel" runat="server" Text='<%# Eval("TipoUsuario") %>' Width="100"   />
                        </td>
                        <td>
                            <asp:Label ID="IdMenuLabel" runat="server" Text='<%# Eval("IdMenu") %>' Width="100"   />
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
                            <asp:Label ID="IdSubMenuLabel1" runat="server" Text='<%# Eval("IdSubMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="GrupoMenuTextBox" runat="server" Text='<%# Bind("GrupoMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="PosicionTextBox" runat="server" Text='<%# Bind("Posicion") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="NombreSubMenuTextBox" runat="server" Text='<%# Bind("NombreSubMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="LogoTextBox" runat="server" Text='<%# Bind("Logo") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="TipoUsuarioTextBox" runat="server" Text='<%# Bind("TipoUsuario") %>' Width="100" />
                        </td>
                        <td>
                            <asp:TextBox ID="IdMenuTextBox" runat="server" Text='<%# Bind("IdMenu") %>' Width="100" />
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
                    <tr  style="background-color: cornflowerblue;">
                        <td>
                            <asp:ImageButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" ImageUrl="~/Imagenes/undo_icon_color.gif" Width="25"/>
                            <!--<asp:ImageButton ID="CancelButton" runat="server" CommandName="Delete" Text="DeleteSS" ImageUrl="~/imagenes/delete_icon_color.gif" OnClientClick="return confirm('Estas seguro que quieres eliminar este registro??');" ToolTip="Delete"  Width="25"/>-->
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="GrupoMenuTextBox" runat="server" Text='<%# Bind("GrupoMenu") %>' Width="75" BackColor="YellowGreen" />
                        </td>
                        <td>
                            <asp:TextBox ID="PosicionTextBox" runat="server" Text='<%# Bind("Posicion") %>' Width="100" BackColor="YellowGreen"/>
                        </td>
                        <td>
                            <asp:TextBox ID="NombreSubMenuTextBox" runat="server" Text='<%# Bind("NombreSubMenu") %>' Width="100" BackColor="YellowGreen"/>
                        </td>
                        <td>
                            <asp:TextBox ID="LogoTextBox" runat="server" Text='<%# Bind("Logo") %>' Width="100" BackColor="YellowGreen"/>
                        </td>
                        <td>
                            <asp:TextBox ID="TipoUsuarioTextBox" runat="server" Text='<%# Bind("TipoUsuario") %>' Width="100" BackColor="YellowGreen"/>
                        </td>
                        <td>
                            <asp:TextBox ID="IdMenuTextBox" runat="server" Text='<%# Bind("IdMenu") %>' Width="100" BackColor="YellowGreen"/>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            
                            <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" Text="Editar" ImageUrl="~/Imagenes/edit_icon_color.gif" Width="25" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" Text="DeleteSS" ImageUrl="~/imagenes/delete_icon_color.gif" OnClientClick="return confirm('Estas seguro que quieres eliminar este registro??');" ToolTip="Delete"  Width="25"/>
                            
                        </td>
                        <td>
                            <asp:Label ID="IdSubMenuLabel" runat="server" Text='<%# Eval("IdSubMenu") %>' Width="75"  />
                        </td>
                        <td>
                            <asp:Label ID="GrupoMenuLabel" runat="server" Text='<%# Eval("GrupoMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="PosicionLabel" runat="server" Text='<%# Eval("Posicion") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="NombreSubMenuLabel" runat="server" Text='<%# Eval("NombreSubMenu") %>' Width="100"  />
                        </td>
                        <td>
                            <asp:Label ID="LogoLabel" runat="server" Text='<%# Eval("Logo") %>' Width="100"  />
                        </td>
                        <td>
                            <asp:Label ID="TipoUsuarioLabel" runat="server" Text='<%# Eval("TipoUsuario") %>' Width="100"  />
                        </td>
                        <td>
                            <asp:Label ID="IdMenuLabel" runat="server" Text='<%# Eval("IdMenu") %>' Width="100"  />
                        </td
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server" width="75px"></th>
                                        <th runat="server" width="100px">IdSubMenu</th>
                                        <th runat="server" width="200px">GrupoMenu</th>
                                        <th runat="server" width="100px">Posicion</th>
                                        <th runat="server" width="200px">NombreSubMenu</th>
                                        <th runat="server" width="200px">Logo</th>
                                        <th runat="server" width="100px">TipoUsuario</th>
                                        <th runat="server" width="100px">IdMenu</th>
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
                            <asp:ImageButton ID="EditButton" runat="server" CommandName="Edit" Text="Editar" ImageUrl="~/Imagenes/edit_icon_color.gif" Width="25" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" Text="DeleteSS" ImageUrl="~/imagenes/delete_icon_color.gif" OnClientClick="return confirm('Estas seguro que quieres eliminar este registro??');" ToolTip="Delete"  Width="25"/>
                            
                        </td>
                        <td>
                            <asp:Label ID="IdSubMenuLabel" runat="server" Text='<%# Eval("IdSubMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="GrupoMenuLabel" runat="server" Text='<%# Eval("GrupoMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="PosicionLabel" runat="server" Text='<%# Eval("Posicion") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="NombreSubMenuLabel" runat="server" Text='<%# Eval("NombreSubMenu") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="LogoLabel" runat="server" Text='<%# Eval("Logo") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="TipoUsuarioLabel" runat="server" Text='<%# Eval("TipoUsuario") %>' Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="IdMenuLabel" runat="server" Text='<%# Eval("IdMenu") %>' Width="100" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>

    </div><hr />
    <div class="pageline">    
    </div>
</asp:Content>
