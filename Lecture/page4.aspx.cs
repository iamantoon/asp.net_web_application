using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lecture
{
    public partial class page4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Request.UrlReferrer.ToString().Contains("page3"))
                {

                }
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }

            int id = Convert.ToInt32(Request.QueryString["id"]);

            bool isEmailVerified = GetIsEmailVerifiedById(id);

            if (isEmailVerified)
            {
                successMessage.Visible = true;
                failureMessage.Visible = false;
            }
            else
            {
                successMessage.Visible = false;
                failureMessage.Visible = true;
            }
        }

        private bool GetIsEmailVerifiedById(int id)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Labs\\lab5\\lab5.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT IsEmailVerified FROM Workers WHERE ID = @ID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);

                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToBoolean(result);
                    }
                }
            }
            return false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            Response.Redirect("Default.aspx");
        }
    }
}