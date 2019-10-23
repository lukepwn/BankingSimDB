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
using System.Text.RegularExpressions;

namespace LukeDam_KevinKim_Assignment3
{
    public partial class Registration : System.Web.UI.Page
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
            
            try
            {
                cnn.Open();
                command = new SqlCommand("INSERT INTO dbo.Customers values(@CustName, @Address, " +
                    "@Postal, @PhoneNo, @Email, @Password)", cnn);

                if (!(string.IsNullOrEmpty(CustNameTxt.Text) ||
                    string.IsNullOrEmpty(AddressTxt.Text) ||
                    string.IsNullOrEmpty(PostalTxt.Text) ||
                    string.IsNullOrEmpty(PhoneTxt.Text) ||
                    string.IsNullOrEmpty(EmailTxt.Text) ||
                    string.IsNullOrEmpty(PasswordTxt.Text)))
                {
                    command.Parameters.AddWithValue("@CustName", this.CustNameTxt.Text);
                    command.Parameters.AddWithValue("@Address", this.AddressTxt.Text);
                    command.Parameters.AddWithValue("@Postal", this.PostalTxt.Text);
                    command.Parameters.AddWithValue("@PhoneNo", this.PhoneTxt.Text);
                    command.Parameters.AddWithValue("@Email", this.EmailTxt.Text);
                    command.Parameters.AddWithValue("@Password", this.PasswordTxt.Text);
                    int r = command.ExecuteNonQuery();

                    Response.Redirect("Default.aspx", false);
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

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {

                String pattern = "^[ABCEGHJ-NPRSTVXY]{1}[0-9]{1}[ABCEGHJ-NPRSTV-Z]{1}[ ]?[0-9]{1}[ABCEGHJ-NPRSTV-Z]{1}[0-9]{1}$";
                Regex reg = new Regex(pattern, RegexOptions.IgnoreCase | RegexOptions.Compiled);

                if (!(reg.IsMatch(PostalTxt.Text)))
                {
                    args.IsValid = false;
                }

                else
                {
                    args.IsValid = true;
                }
            }

            catch (Exception ex)
            {
                args.IsValid = false;
            }
        }
    }
}