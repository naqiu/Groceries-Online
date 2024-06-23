<%@ Page Title="BitesShop - Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GroceriesOnline.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h2>
        Detailed
        Sales Report
    </h2>
    
     
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SalesId,UserId,ItemId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover" GridLines="None" BorderStyle="None" >
            <Columns>
                <asp:BoundField DataField="SalesId" HeaderText="Sales ID" ReadOnly="True" SortExpression="SalesId" />
                <asp:BoundField DataField="SalesDate" HeaderText="Date" SortExpression="SalesDate" />
                <asp:BoundField DataField="UserId" HeaderText="User ID" ReadOnly="True" SortExpression="UserId" />
                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                <asp:BoundField DataField="ItemId" HeaderText="Item ID" SortExpression="ItemId" ReadOnly="True" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="ItemTitle" HeaderText="Item" SortExpression="ItemTitle" />
                <asp:BoundField DataField="ItemPrice" HeaderText="Price" SortExpression="ItemPrice" DataFormatString="{0:c2}" />
            </Columns>
            <HeaderStyle CssClass="th" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="spDetailedSalesReportQuery" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="spSalesTotalPayment" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="spTotalSalesRevenue" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="spTopSellingItems" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>
    <br>
    <h2>
        Sales Total Payment</h2>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" CssClass="table table-hover" GridLines="None" BorderStyle="None" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="SalesId" HeaderText="Sales ID" SortExpression="SalesId" />
                <asp:BoundField DataField="SalesDate" HeaderText="Date" SortExpression="SalesDate" ReadOnly="True" />
                <asp:BoundField DataField="UserId" HeaderText="User ID" SortExpression="UserId" />
                <asp:BoundField DataField="TotalPayment" DataFormatString="{0:c2}" HeaderText="Total Payment" SortExpression="TotalPayment" />
            </Columns>
            <HeaderStyle CssClass="th" />
        </asp:GridView>
    </p>
    <br>
    <h2>
        Total Sales Revenue
    </h2>
    <p>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CssClass="table table-hover" GridLines="None" BorderStyle="None">
            <Columns>
                <asp:BoundField DataField="TotalSalesRevenue" HeaderText="Total Sales Revenue" ReadOnly="True" SortExpression="TotalSalesRevenue" DataFormatString="{0:c2}" />
            </Columns>
            <HeaderStyle CssClass="th" />
        </asp:GridView>
    </p>
    <br>
    <h2>
        Top-Selling Items
    </h2>
    <p>
        <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource4" AllowPaging="True" CssClass="table table-hover" GridLines="None" BorderStyle="None" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ItemId" HeaderText="ID" SortExpression="ItemId" />
                <asp:BoundField DataField="ItemTitle" HeaderText="Item" SortExpression="ItemTitle" />
                <asp:BoundField DataField="NumberOfSales" HeaderText="No Of Sales" ReadOnly="True" SortExpression="NumberOfSales" />
                <asp:BoundField DataField="TotalQuantitySold" HeaderText="Total Quantity Sold" ReadOnly="True" SortExpression="TotalQuantitySold" DataFormatString="{0:c2}" />
            </Columns>
            <HeaderStyle CssClass="th" />
        </asp:GridView>
        
    </p>
</asp:Content>
