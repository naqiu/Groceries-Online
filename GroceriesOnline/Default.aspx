<%@ Page Title="BitesShop - Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GroceriesOnline.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="carouselExampleIndicators" class="carousel slide mt-3 mb-3" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="Images/Banners/1716191990027.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="Images/Banners/1717202953695.png" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="Images/Banners/1717634727094.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col">
                <img class="img-fluid rounded-8" src="Images/Banners/ads1.jpg" />
            </div>
            <div class="col">
                <img class="img-fluid rounded-8" src="Images/Banners/ads2.jpg" />
            </div>
            <div class="col">
                <img class="img-fluid rounded-8" src="Images/Banners/ads3.jpg" />
            </div>
            <div class="col">
                <img class="img-fluid rounded-8" src="Images/Banners/ads4.jpg" />
            </div>
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" AllowPaging="True">
    <Columns>
        <asp:BoundField DataField="ItemId" HeaderText="ItemId" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
        <asp:BoundField DataField="CatId" HeaderText="CatId" SortExpression="CatId" />
        <asp:BoundField DataField="ItemTitle" HeaderText="ItemTitle" SortExpression="ItemTitle" />
        <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" />
        <asp:BoundField DataField="ItemDesc" HeaderText="ItemDesc" SortExpression="ItemDesc" />
        <asp:ImageField DataImageUrlField="ItemImage" DataImageUrlFormatString="Images/Items/{0}" HeaderText="Image">
            <ControlStyle Width="70px" />
        </asp:ImageField>
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>

</asp:Content>
