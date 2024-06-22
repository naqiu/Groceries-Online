<%@ Page Title="BitesShop - Location" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="GroceriesOnline.Location" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <label style="padding-top:15px;">Village grocer location:</label>
    <div style="padding-top:5px;overflow:hidden;resize:none;max-width:100%;height:500px;"><div id="canvas-for-googlemap" style="height:100%; width:100%;max-width:100%;"><iframe style="height:100%;width:100%;border:0;" frameborder="0" src="https://www.google.com/maps/embed/v1/search?q=Village+grocer&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8"></iframe></div><a class="googlecoder" rel="nofollow" href="https://www.bootstrapskins.com/themes" id="grab-map-data">premium bootstrap themes</a><style>#canvas-for-googlemap img.text-marker{max-width:none!important;background:none!important;}img{max-width:none}</style></div>
</asp:Content>
