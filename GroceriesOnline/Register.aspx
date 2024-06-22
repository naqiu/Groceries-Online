<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GroceriesOnline.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - GroceriesOnline</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
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
        .register-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 340px;
        }

            .register-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .register-container label {
                display: block;
                margin-top: 10px;
            }

            .register-container .btn {
                padding-left: 20px;
                padding-right: 20px;
                display: block;
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
            <div class="register-container">
                <h2>Register</h2>
                <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                <label for="username">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="Please enter your Username" ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
          
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter your password" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <label for="confirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your Confirm Password" ControlToValidate="txtConfirmPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn btn-primary mt-3 mx-auto" />
                <p class="text-center mt-3">Already register? <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="Login.aspx" CssClass="login-link">Login</asp:HyperLink></p>
            </div>
        </form>
    </div>
</body>
</html>
