using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesOnline.UserControls
{
    public partial class LoginStatus : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null && Session["Role"] != null)
            {
                // User has logged in
                btnLogin.Visible = false;
                HyperLinkRegister.Visible = false;
                btnLogout.Visible = true;
                lblLoginStatus.Text = "You are logged in as "
                + Session["UserName"].ToString();
            }
            else
            {
                // User has not logged in
                btnLogin.Visible = true;
                HyperLinkRegister.Visible = true;
                btnLogout.Visible = false;
                lblLoginStatus.Text = "You are not logged in.";
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

    }
}