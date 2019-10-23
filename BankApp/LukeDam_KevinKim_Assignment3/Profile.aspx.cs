/* Authors: Kevin Kim 991456570, Luke Dam 991457302
 * Date: July 29th, 2018
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace LukeDam_KevinKim_Assignment3
{
    public partial class Profile : System.Web.UI.Page
    {
        string ID = null;
        string connectionString = null;
        SqlConnection cnn;
        SqlCommand command;

        protected void Page_Load(object sender, EventArgs e)
        {
            NameLbl.Text = Session["Username"].ToString();
            ID = Session["CustId"].ToString();

            connectionString = "Data Source=DESKTOP-8HLQGJP;Initial Catalog = CarSalesDB; " +
                "Integrated Security = SSPI; Persist Security Info = false";

            cnn = new SqlConnection(connectionString);

            try
            {
                cnn.Open();
                command = new SqlCommand("SELECT * FROM dbo.Customers WHERE " +
                    "CustId = @CustId", cnn);
                
                command.Parameters.AddWithValue("@CustId", ID);

                int r = command.ExecuteNonQuery();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    UserLbl.Text = "Address: " + reader["Address"].ToString() +
                                   "|\r\nPostal: " + reader["Postal"].ToString() +
                                   "|\r\nTelephone: " + reader["PhoneNo"].ToString() +
                                   "|\r\nEmail: " + reader["Email"].ToString();
                }

                cnn.Close();
            }

            catch (SqlException ex)

            {
                Console.WriteLine("Error in SQL! " + ex.Message);
                Console.ReadKey();

            }
            finally

            {
                if (cnn.State == ConnectionState.Open)

                {
                    cnn.Close();
                }
            }
        }

        protected void OrderBtn_Click(object sender, EventArgs e)
        {
            try
            {
                cnn.Open();
                command = new SqlCommand("INSERT INTO dbo.Orders values(@CustId, @Brand, @Model, " +
                    "@Year, @Color, @Price)", cnn);

                if (!(string.IsNullOrEmpty(BrandTxt.Text) ||
                    string.IsNullOrEmpty(ModelTxt.Text) ||
                    string.IsNullOrEmpty(YearTxt.Text) ||
                    string.IsNullOrEmpty(ColorTxt.Text) ||
                    string.IsNullOrEmpty(PriceTxt.Text)))
                {
                    command.Parameters.AddWithValue("@CustId", int.Parse(ID));
                    command.Parameters.AddWithValue("@Brand", this.BrandTxt.Text);
                    command.Parameters.AddWithValue("@Model", this.ModelTxt.Text);
                    command.Parameters.AddWithValue("@Year", this.YearTxt.Text);
                    command.Parameters.AddWithValue("@Color", this.ColorTxt.Text);
                    command.Parameters.AddWithValue("@Price", this.PriceTxt.Text);

                    int r = command.ExecuteNonQuery();

                    SuccessLbl.Text = "Order Created";


                }

                cnn.Close();
            }

            catch (SqlException ex)

            {
                Console.WriteLine("Error in SQL! " + ex.Message);
                Console.ReadKey();

            }
            finally

            {
                if (cnn.State == ConnectionState.Open)

                {
                    cnn.Close();
                }
            }
        }

        protected void ViewBtn_Click(object sender, EventArgs e)
        {
            ViewBox.Items.Clear();
            try
            {
                cnn.Open();
                command = new SqlCommand("SELECT * FROM dbo.Orders, dbo.Customers " +
                    "WHERE dbo.Orders.CustId = dbo.Customers.CustId " +
                    "AND dbo.Customers.CustId = @CustId", cnn);

                command.Parameters.AddWithValue("@CustId", ID);

                int r = command.ExecuteNonQuery();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    ViewBox.Items.Add ( "Brand: " + reader["Brand"].ToString() +
                                   "\r\nModel: " + reader["Model"].ToString() +
                                   "\r\nYear: " + reader["Year"].ToString() +
                                   "\r\nColor: " + reader["Color"].ToString() +
                                   "\r\nPrice: " + reader["Price"].ToString() );
                }

                cnn.Close();
            }

            catch (SqlException ex)

            {
                Console.WriteLine("Error in SQL! " + ex.Message);
                Console.ReadKey();

            }
            finally

            {
                if (cnn.State == ConnectionState.Open)

                {
                    cnn.Close();
                }
            }
        }
    }
}