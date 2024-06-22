using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
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

            string sql = @"SELECT * FROM Users WHERE UserName = @username";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["connGrocerShop"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@username", username);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Username found
                Object objPasswordHash = dt.Rows[0]["PasswordHash"];
                Object objRole = dt.Rows[0]["Role"];
                Object objEnabled = dt.Rows[0]["Enabled"];
                string storedPasswordHash = objPasswordHash.ToString();
                PBKDF2Hash hash = new PBKDF2Hash(password, storedPasswordHash);
                bool check = hash.PasswordCheck;
                bool enabled = Convert.ToBoolean(objEnabled);

                if (check == true && enabled == true)
                {

                    //password correct and account enabled
                    Session["UserName"] = username;
                    Session["Role"] = objRole;

                    if (Session["Role"].ToString() == "user")
                        Response.Redirect("Shop.aspx");
                    else if (Session["Role"].ToString() == "admin")
                        Response.Redirect("Admin.aspx");


                }
                else
                {
                    //password incorrect or account disabled
                    lblStatus.Text = "Incorrect password or account disabled.";
                }

            }
            else
            {
                //Username not found
                lblStatus.Text = "Incorrect username";
            }


        }
    }
}
