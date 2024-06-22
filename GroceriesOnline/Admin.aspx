<%@ Page Title="BitesShop - Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GroceriesOnline.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <h2>
        Sales Report
    </h2>
    </p>
     
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SalesId,UserId,ItemId,Expr1,ItemId1" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover" GridLines="None" BorderStyle="None" >
            <Columns>
                <asp:BoundField DataField="SalesId" HeaderText="SalesId" ReadOnly="True" SortExpression="SalesId" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                <asp:BoundField DataField="ItemId" HeaderText="ItemId" ReadOnly="True" SortExpression="ItemId" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="SalesDate" HeaderText="SalesDate" SortExpression="SalesDate" />
                <asp:BoundField DataField="ItemTitle" HeaderText="ItemTitle" SortExpression="ItemTitle" />
                <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" DataFormatString="{0:c2}" />
            </Columns>
            <HeaderStyle CssClass="th" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="SELECT Sales.*, Users.UserId AS Expr1, Item.* FROM Item INNER JOIN Sales ON Item.ItemId = Sales.ItemId INNER JOIN Users ON Sales.UserId = Users.UserId WHERE Sales.Confirmed = 'True'"></asp:SqlDataSource>
    </p>
</asp:Content>
