<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="GroceriesOnline.UserControls.LoginStatus" %>

<asp:Label ID="lblLoginStatus" runat="server" ></asp:Label>&nbsp;&nbsp;
<asp:Button ID="btnLogin" runat="server" Text="Login" PostBackUrl="~/Login.aspx" CssClass="btn btn-outline-primary"/>&nbsp;&nbsp;
<asp:HyperLink ID="HyperLinkRegister" runat="server" NavigateUrl="~/Register.aspx" CssClass="text-primary">Register</asp:HyperLink>&nbsp;&nbsp;
<asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline-primary" OnClick="btnLogout_Click" />