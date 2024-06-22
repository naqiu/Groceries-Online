using System;
using System.Configuration;
using System.Data.SqlClient;
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
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // Add validation and registration logic
            if (password == confirmPassword)
            {
                // Register the user
                // For example, save to database
                // Show success message or redirect to another page

                
                PBKDF2Hash hash = new PBKDF2Hash(password);
                string passwordHash = hash.HashedPassword;
                bool enable = true;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connGrocerShop"].ConnectionString);

                string sql = @"INSERT INTO Users VALUES (@username,@passwordhash,@role,@enabled)";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@username",username);
                cmd.Parameters.AddWithValue("@passwordhash",passwordHash);
                cmd.Parameters.AddWithValue("@role","user");
                cmd.Parameters.AddWithValue("enabled", enable);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblStatus.Text = "Status : Data successfully saved.";
                    lblStatus.ForeColor = System.Drawing.Color.Green;


                }
                catch (SqlException Ex)
                {
                    lblStatus.Text = Ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;

                }
                finally
                {
                    conn.Close();
                }


            }
            else
            {
                lblStatus.Text = "Passwords do not match";
                lblStatus.Visible = true;
            }
        }
    }
}
