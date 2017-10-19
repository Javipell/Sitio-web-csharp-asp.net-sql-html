<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ProyectoWeb.Web.Inicio1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- SLIDER AREA
	================================================== -->
	<div id="da-slider" class="da-slider">
		<!--Slide 1-->
		<div class="da-slide">
			<h2> <asp:Label ID="lblBienvenido" runat="server" Text="Label"></asp:Label> </h2>
			<p>
                <asp:Label ID="lblComentario" runat="server" Text="Label"></asp:Label>
			</p>
            <asp:Label ID="lblDestino" runat="server" Text="Label" class="da-link" style="width:202px;"></asp:Label>
            <!--<a href="#" class="da-link" style="width:202px;" id="destino">Multi-Purpose</a>-->
			<div class="da-img">
                <asp:Image ID="Image1" runat="server" ImageUrl="www.google.es" />
                <!--<img src="http://placehold.it/238x420&text=Silhouette+here" alt="">-->
			</div>
		</div>
		<!--Slide 2
		<div class="da-slide">
			<h2>Responsive</h2>
			<p>
				 We produce comprehensive mapping of consumers' relationships with communications across bought, owned & earned media based on bespoke insight.
			</p>
			<a href="#" class="da-link" style="width:192px;">MEDIA DEVICES</a>
			<div class="da-img">
				<img src="http://placehold.it/238x420&text=Silhouette+here" alt="">
			</div>
		</div>-->
		<!--Slide 3
		<div class="da-slide">
			<h2> Easy to modify </h2>
			<p>
				 We design, create and manage fully integrated social media platforms, online PR strategy and campaigns for our clients, ability to analyse, monitor and optimise brand presence.
			</p>
			<a href="#" class="da-link" style="width:224px;">fully supported</a>
			<div class="da-img">
				<img src="http://placehold.it/238x420" alt="">
			</div>
		</div>-->
		<nav class="da-arrows">
		<span class="da-arrows-prev"></span>
		<span class="da-arrows-next"></span>
		</nav>
	</div>
</asp:Content>
