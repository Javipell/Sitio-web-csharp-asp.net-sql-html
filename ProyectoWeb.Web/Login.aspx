<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoWeb.Web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">    
	<div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info" >
			<div class="panel-heading">
				<div class="panel-title">Iniciar Sesi&oacute;n</div>
					<div style="float:right; font-size: 80%; position: relative; top:-10px">
						<a href="recupera.php">¿Se te olvid&oacute; tu contraseña?</a>
					</div>
				</div>
				<div style="padding-top:30px" class="panel-body" >
					<div style="display:none" id="login-alert" class="alert alert-danger col-sm-12">
					</div>
					<div id="loginform" class="form-horizontal" role="form" >
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
							</span>
                            <asp:TextBox ID="txtUsuario"  type="text" class="form-control" name="usuario" value="" placeholder="usuario o email" required="" runat="server"></asp:TextBox>
							<!--<input id="usuario" type="text" class="form-control" name="usuario" value="" placeholder="usuario o email" required>-->                                       
						</div>
						<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i>
						</span>
						    <asp:TextBox ID="txtPassword"  type="password" class="form-control" name="password" value="" placeholder="password o email" required="" runat="server"></asp:TextBox>
                            <!--<input id="password" type="password" class="form-control" name="password" placeholder="password" required>-->
					    </div>
					<div style="margin-top:10px" class="form-group">
						<div class="col-sm-12 controls">
                            <asp:Button ID="btnlogin" class="c8" runat="server" Text="Iniciar Sesi&oacute;n" OnClick="btnlogin_Click" />
                            <!--<button id="btn-login" type="submit" class="btn btn-success">Iniciar Sesi&oacute;n</a>-->
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12 control">
							<div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                <asp:Label ID="Label1" runat="server" Text="No tiene una cuenta!"></asp:Label>
                                 
								<a href="tienda.php?p=login.php">Registrate aquí</a>
							</div>
						</div>
					</div>    
				    </div>
			    </div>                     
		</div>  
	</div>
    </div>



</asp:Content>
