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
    public partial class Default : System.Web.UI.Page
    {
        string connectionString = null;
        SqlConnection cnn;
        SqlCommand command;

        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = "Data Source=DESKTOP-8HLQGJP;Initial Catalog = CarSalesDB; " +
                "Integrated Security = SSPI; Persist Security Info = false";

            cnn = new SqlConnection(connectionString);
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void SignInBtn_Click(object sender, EventArgs e)
        {
            try
            {
                cnn.Open();
                command = new SqlCommand("SELECT * FROM dbo.Customers " +
                    "WHERE CustName = @CustName AND Password = @Password", cnn);

                command.Parameters.AddWithValue("@CustName", this.UsernameText.Text);
                command.Parameters.AddWithValue("@Password", this.PasswordText.Text);

                int r = command.ExecuteNonQuery();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read()) {
                    if (reader["CustName"].ToString() == this.UsernameText.Text &&
                        reader["Password"].ToString() == this.PasswordText.Text)
                    {
                        Session["Username"] = UsernameText.Text;
                        Session["Password"] = PasswordText.Text;
                        Session["CustId"] = reader["CustId"].ToString();
                        Response.Redirect("Profile.aspx", false);
                    }
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