<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GroceriesOnline.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - GroceriesOnline</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="Styles/Style.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            height: 100vh;
            display: flex;
        }

        .left-section, .right-section {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .left-section {
            background-color: #ffffff;
        }

        .right-section {
            background-color: #fce5ff;
        }

        .logo-container img {
            max-width: 100%;
            height: auto;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 340px;
        }

            .login-container .btn {
                padding-left:20px;
                padding-right:20px;
                display: block;
            }

            .login-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .login-container label {
                display: block;
                margin-top: 10px;
            }

    </style>
</head>
<body>
    <div class="left-section">
        <div class="logo-container">
            <img src="Images/ujcegltl.png" alt="GroceriesOnline Logo" />
        </div>
    </div>
    <div class="right-section">
        <form id="form1" runat="server">
            <div class="login-container">
                <h2>Login</h2>
                <asp:Label ID="Label1" runat="server" Text="Please enter your credentials" ForeColor="Red" Visible="false"></asp:Label>
                <label for="username">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary mt-3 mx-auto" />
                <p class="text-center mt-3">Don't have account yet? <asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="Register.aspx" CssClass="register-link">Register</asp:HyperLink></p>
            </div>
        </form>
    </div>
</body>
</html>
