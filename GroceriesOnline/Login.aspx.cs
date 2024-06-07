using System;
using System.Web.UI;

namespace GroceriesOnline
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Dummy check for demonstration purposes. Replace with actual authentication logic.
            if (username == "admin" && password == "password")
            {
                // Redirect to a different page upon successful login
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                Label1.Text = "Invalid username or password";
                Label1.Visible = true;
            }
        }
    }
}
