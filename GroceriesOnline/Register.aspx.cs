using System;
using System.Web.UI;

namespace GroceriesOnline
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Implement your registration logic here
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // Add validation and registration logic
            if (password == confirmPassword)
            {
                // Register the user
                // For example, save to database
                // Show success message or redirect to another page
            }
            else
            {
                Label1.Text = "Passwords do not test";
                Label1.Visible = true;
            }
        }
    }
}
