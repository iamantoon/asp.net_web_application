using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Xml.Linq;
using System.Threading.Tasks;

namespace Lecture
{
    public partial class page3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Request.UrlReferrer.ToString().Contains("page2"))
                {

                }
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                if (int.TryParse(Request.QueryString["id"], out int id))
                {
                    string verificationPassword = GetVerificationPasswordById(id);
                    string email = GetEmailById(id);
                    
                    SendEmail(email, "Верифікація email", verificationPassword);
                }
            }
        }

        private string GetVerificationPasswordById(int id)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Labs\\lab5\\lab5.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT VerificationPassword FROM Workers WHERE ID = @ID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);

                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        return result.ToString();
                    }
                    else
                    {
                        return string.Empty; 
                    }
                }
            }
        }

        private string GetEmailById(int id)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Labs\\lab5\\lab5.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT Email FROM Workers WHERE ID = @ID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);

                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        return result.ToString();
                    }
                    else
                    {
                        return string.Empty;
                    }
                }
            }
        }

        private async Task SendEmail(string toAddress, string subject, string body)
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com");

                client.Port = 587;
                client.Credentials = new NetworkCredential("2504apr2015", "hpiwazyzqalwiawx");
                client.EnableSsl = true;

                client.Send(new MailMessage("2504apr2015@gmail.com", toAddress, subject, body));
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error sending email: " + ex.Message);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect("page2.aspx?id=" + id);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);

            int id = Convert.ToInt32(Request.QueryString["id"]);
            string enteredPassword = TextBox1.Text;

            string verificationPassword = GetVerificationPasswordById(id);

            if (enteredPassword == verificationPassword)
            {
                UpdateIsEmailVerified(id);
            }

            Response.Redirect("page4.aspx?id=" + id);
        }

        private void UpdateIsEmailVerified(int id)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Labs\\lab5\\lab5.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "UPDATE Workers SET IsEmailVerified = 1 WHERE ID = @ID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);

                    int rowsAffected = command.ExecuteNonQuery();
                }
            }
        }
    }
}