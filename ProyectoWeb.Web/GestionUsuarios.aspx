<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="ProyectoWeb.Web.GestionUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- 1st column -->
    <div class="c1">
    </div>
    <!-- 2nd column -->
    <div class="c10">
        <h2 class="title"><i class="icon-twitter"></i>GESTION DE USUARIOS</h2>
        <hr class="footerstress">
        <h3 class="title">
            <table>
                <tr>
                    <td style="width:400px">Filtro por tipo de Usuario:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFiltroUsuarios" runat="server" AutoPostBack="True"  DataSourceID="SqlDataSource2" DataTextField="Admin" DataValueField="Administrador"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT Administrador, CASE WHEN Administrador = 0 THEN 'ADMINISTRADOR' WHEN Administrador = 1 THEN 'USUARIO' END AS Admin FROM UsuariosSet"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="IdUsuario" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <%-- MODELO SACADO DE :
                    http://blog.siinet.com/2016/01/11/listview-moderno-y-funcional-maquetado-con-bootstrap/ 
                --%>
                <%-- Plantilla para la edición de un registro--%>
                <EditItemTemplate>
                    <tr>
                        
                    <td style="background-color:#ffffcc;">
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" CssClass="btn btn-success" OnClientClick="return confirm('¿Seguro que quiere modificar los datos del registro?');"  Width="100"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-default"  Width="100"/>
                    </td>
                    <td  style="background-color:#ffffcc;">
                        <asp:Label ID="IdUsuarioLabel1" runat="server" Text='<%# Eval("IdUsuario") %>' />
                    </td>
                    <td style="background-color:#ffffcc;">
                        <asp:TextBox ID="NombreUsuarioTextBox" Width="100%" runat="server" Text='<%# Bind("NombreUsuario")%>' CssClass="form-control" />
                    </td>
                    <td style="background-color:#ffffcc;">
                        <asp:TextBox ID="NickUsuarioTextBox" Width="100%" runat="server" Text='<%# Bind("NickUsuario")%>' CssClass="form-control" />
                    </td>
                    <td style="background-color:#ffffcc;">
                        <asp:TextBox ID="ClaveUsuarioTextBox" Width="100%" runat="server" Text='<%# Bind("ClaveUsuario")%>' CssClass="form-control" />
                    </td>
                    <td style="background-color:#ffffcc;">
                        <asp:TextBox ID="AdministradorTextBox" Width="100%" runat="server" Text='<%# Bind("Administrador")%>' CssClass="form-control" />
                    </td>
                    <td style="background-color:#ffffcc;">
                        <asp:TextBox ID="FotoTextBox" Width="200" runat="server" Text='<%# Bind("Foto")%>' CssClass="form-control" />
                    </td>
                    </tr>
                </EditItemTemplate>
                <%-- Plantilla para cuando no se devuelven registros --%>
                <EmptyDataTemplate>
                    <tr>
                        <td colspan="6" style="color: red; border: 1px solid black;">¡No hay datos almacenados!</td>
                    </tr>
                </EmptyDataTemplate>
                <%-- Plantilla para la inserción de un nuevo registro --%>
                <InsertItemTemplate>
                    <tr>
                        <td  colspan="8">
                            <h2 class="title"><i class="icon-twitter"></i>AÑADIR NUEVOS USUARIOS</h2>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Grabar" CssClass="btn btn-success" OnClientClick="return confirm('¿Confirma el nuevo registro?');"  Width="100"/>
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-default"  Width="100"/>
                        </td>
                        <td style="font-size: large;">
                            <asp:Label ID="IdUsuarioLabel1" Width="100%" runat="server" Text='<%# Eval("IdUsuario")%>' CssClass="form-control" placeholder="" />
                        </td>
                        <td style="font-size: 14px;">
                            <asp:TextBox ID="NombreUsuarioTextBox" Width="100%" runat="server" Text='<%# Bind("NombreUsuario")%>' CssClass="form-control" placeholder="NombreUsuario" title="El nombre solo puede contener letra y numeros max 50" />
                            
                        </td>
                        <td style="font-size: large;">
                            <asp:TextBox ID="NickUsuarioTextBox" Width="100%" runat="server" Text='<%# Bind("NickUsuario")%>' CssClass="form-control" placeholder="Nick Usuario" />
                        </td>
                        <td style="font-size: large;">
                            <asp:TextBox ID="ClaveUsuarioTextBox" Width="100%" runat="server" Text='<%# Bind("ClaveUsuario")%>' CssClass="form-control" placeholder="Clave Usuario" />
                        </td>
                        <td style="font-size: large;">
                            <asp:TextBox ID="AdministradorTextBox" Width="100%" runat="server" Text='<%# Bind("Administrador")%>' CssClass="form-control" placeholder="Administrador (1)" />
                        </td>
                        <td style="font-size: large;">
                            <asp:TextBox ID="FotoTextBox" Width="100%" runat="server" Text='<%# Bind("Foto")%>' CssClass="form-control" placeholder="Foto" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <%-- Plantilla para las lineas de detalle del listview --%>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" CssClass="btn btn-danger"
                                OnClientClick="return confirm('¿Seguro que quiere eliminar el registro?');" Width="100" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" CssClass="btn btn-info" Width="100" />
                        </td>
                        <td>
                            <asp:Label ID="IdUsuarioLabel" runat="server" Text='<%# Eval("IdUsuario") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NombreUsuarioLabel" runat="server" Text='<%# Eval("NombreUsuario") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NickUsuarioLabel" runat="server" Text='<%# Eval("NickUsuario") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ClaveUsuarioLabel" runat="server" Text='<%# Eval("ClaveUsuario") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AdministradorLabel" runat="server" Text='<%# Eval("Administrador") %>' />
                        </td>
                        <td>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Foto") %>' Width="200" />
                        </td>
                        <td>
                            <asp:Label ID="FotoLabel" runat="server" Text='<%# Eval("Foto") %>' style="width:100px;"/>
                        </td>
                        
                    </tr>
                </ItemTemplate>
                <%-- Plantilla del contenedor del listview --%>
                <LayoutTemplate>
                    <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-condensed">
                        <tr runat="server">
                            <th style="width: 200px;" runat="server">Opciones</th>
                            <th style="width: 100px;" runat="server">ID</th>
                            <th runat="server">Nombre Usuario</th>
                            <th runat="server">Nick Usuario</th>
                            <th runat="server">Clave</th>
                            <th style="width: 100px;" runat="server">Admin</th>
                            <th  style="width: 200px;" runat="server">Imagen</th>
                            <th style="width:100px;" runat="server">Foto</th>
                            
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                    <%-- Control de Paginas y totalizador de registros --%>
                    <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="link"
                                    FirstPageText="Primera Pág."
                                    ShowFirstPageButton="true"
                                    ShowNextPageButton="false"
                                    ShowPreviousPageButton="true"
                                    RenderDisabledButtonsAsLabels="true"
                                    ButtonCssClass="btn btn-default" />
                                <asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="label label-warning" />
                                <asp:NextPreviousPagerField ButtonType="link"
                                    LastPageText="Última pág."
                                    ShowLastPageButton="true"
                                    ShowNextPageButton="true"
                                    ShowPreviousPageButton="false"
                                    ButtonCssClass="btn btn-default" />
                                <asp:TemplatePagerField>
                                <PagerTemplate>
                                     - <b>Total contactos:</b> <span class="label label-warning" style="font-size: 15px;"><%# Container.TotalRowCount %></span>
                                        
                                    </PagerTemplate>
                                </asp:TemplatePagerField>
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=BdEntrevistas;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" DeleteCommand="DELETE FROM UsuariosSet WHERE (IdUsuario = @IdUsuario)" InsertCommand="INSERT INTO UsuariosSet(NombreUsuario, NickUsuario, ClaveUsuario, Administrador, Foto) VALUES (@NombreUsuario, @NickUsuario, @ClaveUsuario, @Administrador, @Foto)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT IdUsuario, NombreUsuario, NickUsuario, ClaveUsuario, Administrador, Foto FROM UsuariosSet WHERE (Administrador = @AdministradorF)" UpdateCommand="UPDATE UsuariosSet SET NombreUsuario = @NombreUsuario, NickUsuario = @NickUsuario, ClaveUsuario = @ClaveUsuario, Administrador = @Administrador, Foto = @Foto WHERE (IdUsuario = @IdUsuario)">
            <DeleteParameters>
                <asp:Parameter Name="IdUsuario" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NombreUsuario" />
                <asp:Parameter Name="NickUsuario" />
                <asp:Parameter Name="ClaveUsuario" />
                <asp:Parameter Name="Administrador" />
                <asp:Parameter Name="Foto" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlFiltroUsuarios" DefaultValue="0" Name="AdministradorF" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NombreUsuario" />
                <asp:Parameter Name="NickUsuario" />
                <asp:Parameter Name="ClaveUsuario" />
                <asp:Parameter Name="Administrador" />
                <asp:Parameter Name="Foto" />
                <asp:Parameter Name="IdUsuario" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </h3>
    </div><hr />
    <div class="pageline">    
    </div>
    </asp:Content>
