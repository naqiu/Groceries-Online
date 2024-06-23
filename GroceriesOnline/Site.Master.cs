using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesOnline
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["Role"] == "admin")
            {
                HyperLink4.Visible = true;
                HyperLink8.Visible = true;
                HyperLink2.Visible = false;
                HyperLink3.Visible = false;
            }


        }
    }
}