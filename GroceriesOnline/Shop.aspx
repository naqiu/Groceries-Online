<%@ Page Title="BitesShop - Shop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="GroceriesOnline.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="leftColumn col-md">
            <h4>Shop</h4>
            <p>
                Select category:
      <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="sdsCategory" DataTextField="CatTitle" DataValueField="CatId" CssClass="form-control fit-content mt-1 mb-1">
      </asp:DropDownList>
            </p>
            <asp:GridView ID="GridViewItems" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="sdsItem" AllowPaging="True" AllowSorting="True" CssClass="table table-hover" GridLines="None" BorderStyle="None">
                <Columns>
                    <asp:ImageField DataImageUrlField="ItemImage" DataImageUrlFormatString="Images/Items/{0}">
                        <ControlStyle Width="70px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="ItemId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
                    <asp:BoundField DataField="ItemTitle" HeaderText="Item" SortExpression="ItemTitle" />
                    <asp:BoundField DataField="ItemDesc" HeaderText="Description" SortExpression="ItemDesc" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="Price" SortExpression="ItemPrice" DataFormatString="{0:c2}" />
                    <asp:CommandField ButtonType="Button" ShowHeader="True" ShowSelectButton="True" ControlStyle-CssClass="btn btn-outline-primary" />
                </Columns>
                <HeaderStyle CssClass="th" />
            </asp:GridView>
            <p>
                Item id:
      <asp:Label ID="lblItemId" runat="server"></asp:Label>&nbsp;|
      Item title:
      <asp:Label ID="lblItemTitle" runat="server"></asp:Label>&nbsp;|
      Item price:
      <asp:Label ID="lblItemPrice" runat="server"></asp:Label>
            </p>
            <p>
                Quantity:
       <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Width="50px" CssClass="form-control">1</asp:TextBox>&nbsp;
       <asp:Button ID="btnAddItem" runat="server" Text="Add Item to Cart" CssClass="btn" />
            </p>
            <p>
                <asp:Label ID="lblMessage1" runat="server"></asp:Label>
            </p>
        </div>
        <div class="rightColumn card col-md-auto">
            <h4>Cart</h4>
            <p>
                Sales id:
          <asp:Label ID="lblSalesId" runat="server"></asp:Label>&nbsp;|
          Date and time:
          <asp:Label ID="lblDateTime" runat="server"></asp:Label>
            </p>
            <p>

                <asp:GridView ID="GridViewCart" runat="server"></asp:GridView>
                Total amount:
          <asp:Label ID="lblTotalAmountCart" runat="server" Text="RM0.00">
          </asp:Label>
            </p>
            <p>
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Sales" CssClass="btn btn-primary" />&nbsp;
          <asp:Button ID="btnCancel" runat="server" Text="Cancel Sales" CssClass="btn" />&nbsp;
          <asp:Button ID="btnNew" runat="server" Text="New Sales" CssClass="btn" />
            </p>
            <p>
                <asp:Label ID="lblMessage2" runat="server"></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblTotalAmount" runat="server"></asp:Label><br />
                <asp:Label ID="lblServiceTax" runat="server"></asp:Label><br />
                <asp:Label ID="lblAmountAfterTax" runat="server"></asp:Label><br />
                <asp:Label ID="lblRounding" runat="server"></asp:Label><br />
                <asp:Label ID="lblAmountRounded" runat="server"></asp:Label><br />
            </p>
        </div>
    </div>
    <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="SELECT * FROM [Category] ORDER BY [CatTitle]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsItem" runat="server" ConnectionString="<%$ ConnectionStrings:connGrocerShop %>" SelectCommand="SELECT * FROM [Item] WHERE ([CatId] = @CatId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategory" Name="CatId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
