<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="GestionEntrevistas.aspx.cs" Inherits="ProyectoWeb.Web.GestionEntrevistas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- este contenido ira en la cabezera -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- este contenido ira en el cuerpo -->
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>Nombre </td>
            <td>
                <asp:TextBox id="txtNombre" type="text" class="form-control" style="border-style: groove; border-width: thin; width:350px" maxlength="50" required="1" placeholder="Introduza el nombre" runat="server"></asp:TextBox>
             </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Apellidos    </td>
            <td>
                <asp:TextBox id="txtApellidos" type="text" class="form-control" style="border-style: groove; border-width: thin; width:350px" maxlength="100" required="1" placeholder="Introduza los apellidos" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>DNI   </td>
            <td>
                <asp:TextBox id="txtDni" type="text" class="form-control" style="border-style: groove; border-width: thin; width:350px" maxlength="9" required="1" placeholder="Introduza el DNI" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Telefono   </td>
            <td>                
                <asp:TextBox id="txtTelefono" type="text" class="form-control" style="border-style: groove; border-width: thin; width:350px" maxlength="9" required="1" placeholder="Introduza el telefono" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>ASISTE  </td>    
            <td>
                <asp:CheckBox ID="ckAsiste" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Valoracion   </td>
            <td>
                <asp:TextBox id="txtValoracion" type="text" class="form-control" style="border-style: groove; border-width: thin; width:350px" maxlength="2" required="1" placeholder="Introduza la Valoracion" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
                <tr>
            <td>Fecha de la Entrevista   </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Ver Calendario" OnClick="Button2_Click" BorderStyle="Solid" Font-Bold="True" Width="139px" />
                <asp:Calendar ID="txtFecha2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="2px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" Visible="False">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Hora de la Entrevista   </td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="Hora Actual" OnClick="Button3_Click" Width="122px" />
                <asp:TextBox id="txtHora" type="text" class="form-control" style="border-style: groove; border-width: thin; width:150px" maxlength="5"  placeholder="Introduza  la hora" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>   </td>
            <td>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Entrevista"  OnClick="Button1_Click" BackColor="#3399FF" BorderStyle="Solid" Font-Bold="True" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
