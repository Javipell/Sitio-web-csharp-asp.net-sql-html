<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoWeb.Web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="row space-top">
    <div class="c3">

    </div>
    <!-- CONTACT FORM -->
    <div class="c8 space-top">
        <h1 class="maintitle" >
            <span style="background: #0E8FAB;"><i class="icon-group" ></i> Iniciar Sesion</span>
        </h1>
        <!-- enlace -->
        <div class="vuzz-pricing">

            <h1 class="wrapcontact">
                <h1 class="form">
                    <h1 class="maintitle">
                        <span  style="background: #0E8FAB;"><i class="icon-user"></i> USUARIO</span><br /><br />
                        <asp:TextBox ID="txtUsuario" type="text" placeholder="usuario o email" required="" runat="server"></asp:TextBox>
                    </h1>
                    <h1 class="maintitle">
                        <span style="background: #0E8FAB;"><i class="icon-key"></i> CONTRASEÑA</span><br /><br />
                        <asp:TextBox ID="txtPassword" type="password" placeholder="password o email" required="" runat="server"></asp:TextBox>
                    </h1>
                  </h1>

                    <!-- boton -->
                    <div id="pricing-table" class="clear" >
                        <div class="plan" style="background: #0E8FAB; width: 250px;" >
                            <asp:Button ID="btnlogin" runat="server" class="signup" Text="Acceder" OnClick="btnlogin_Click" Width="100px" />
						    <ul>
							    <li><a href="#" style="color:aliceblue; font-size:16px">Registrate</a></li>
							    <li><a href="#" style="color:aliceblue; font-size:16px">¿Se te olvido la contraseña?</a></li>
						    </ul>
					    </div>
                    </div>

                
           </div>
        </div>
    </div>
</div>
</asp:Content>
