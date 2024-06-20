using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceriesOnline
{
    public partial class Shop : System.Web.UI.Page
    {
        static double totalAmount;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["Role"] == null)
                Response.Redirect("Default(3031).aspx");*/

            if (!IsPostBack)
            {
                GenerateSalesId();
            }
        }

        void GenerateSalesId()
        {
            string hexTicks = DateTime.Now.Ticks.ToString("X");
            lblSalesId.Text = hexTicks.Substring(hexTicks.Length - 15, 9);
            lblDateTime.Text = DateTime.Now.ToString();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewItems.PageIndex = 0;
        }

        protected void GridViewItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblItemId.Text = GridViewItems.SelectedRow.Cells[1].Text;
            lblItemTitle.Text = GridViewItems.SelectedRow.Cells[2].Text;
            lblItemPrice.Text = GridViewItems.SelectedRow.Cells[3].Text;
        }

        void SalesAddItem()
        {
            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["connGrocerShop"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesAddItem", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);
            cmd.Parameters.AddWithValue("@itemid", lblItemId.Text);
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                lblMessage1.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

            txtQuantity.Text = "1";
        }

        void SalesGetTotalAmount()
        {

            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
            ConnectionStrings["connGrocerShop"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesGetTotalAmount", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);

            try
            {
                // Open connection
                conn.Open();
                totalAmount = (double)cmd.ExecuteScalar();
                lblTotalAmountCart.Text = "RM" + totalAmount.ToString("n2");
            }

            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        void SalesConfirm()
        {

            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
            ConnectionStrings["connGrocerShop"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesConfirm", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessage2.Text = "Sales confirmed!";
            }

            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            txtQuantity.Text = "1";
        }

        void DisplayInvoice()
        {
            double serviceTax, amountAfterTax, amountRounded, rounding;
            serviceTax = totalAmount * 0.06;
            amountAfterTax = totalAmount + serviceTax;
            amountRounded = Math.Round((amountAfterTax) / 0.05) * 0.05;
            rounding = amountRounded - amountAfterTax;

            lblTotalAmount.Text = "Total amount: RM" + totalAmount.ToString("n2");
            lblServiceTax.Text = "Service tax (6%): RM" + serviceTax.ToString("n2");
            lblAmountAfterTax.Text = "Amount after tax: RM" + amountAfterTax.ToString("n2");
            lblRounding.Text = "Rounding: RM" + rounding.ToString("n2");
            lblAmountRounded.Text = "Amount to pay: RM" + amountRounded.ToString("n2");
        }

        void ClearAll()
        {
            lblItemId.Text = "";
            lblItemTitle.Text = "";
            lblItemPrice.Text = "";
            lblTotalAmountCart.Text = "RM0.00";
            lblTotalAmount.Text = "";
            lblServiceTax.Text = "";
            lblAmountAfterTax.Text = "";
            lblRounding.Text = "";
            lblAmountRounded.Text = "";
            lblMessage1.Text = "";
            lblMessage2.Text = "";

        }

        void SalesRemoveNotConfirmed()
        {
            // Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["connGrocerShop"].ConnectionString);

            // Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spSalesRemoveNotConfirmed", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@salesid", lblSalesId.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            catch (SqlException ex)
            {
                lblMessage2.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            SalesAddItem();
            GridViewCart.DataBind();
            SalesGetTotalAmount();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            SalesConfirm();
            DisplayInvoice();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ClearAll();
            GenerateSalesId();
            ddlCategory.DataBind();
            GridViewItems.PageIndex = 0;
            GridViewItems.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SalesRemoveNotConfirmed();
            ClearAll();
            GenerateSalesId();
            ddlCategory.DataBind();
            GridViewItems.PageIndex = 0;
            GridViewItems.DataBind();
        }
    }
}