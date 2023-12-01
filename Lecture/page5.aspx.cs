using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lecture
{
    public partial class page5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Request.UrlReferrer.ToString().Contains("Default"))
                {
                    
                }
            } catch
            {
                Response.Redirect("Default.aspx");
            }
        }

        private static readonly Random random = new Random();
        private static readonly string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        private string GenerateRandomString(int length)
        {
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            Response.Redirect("Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);

            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Labs\\lab5\\lab5.mdf;Integrated Security=True";

            string surname = txtName.Text;
            string email = TextBox1.Text;
            string education = txtEducation.Text;
            string position = txtPosition.Text;
            string status = ddlEmploymentType.SelectedItem.Text;
            byte[] photoBytes = FileUploadPhoto.FileBytes;

            string verificationPassword = GenerateRandomString(5);

            string query = "INSERT INTO Workers (Surname, Education, Position, Status, Properties, Email, IsEmailVerified, VerificationPassword, Photo) " +
                    "VALUES (@Surname, @Education, @Position, @Status, 11, @Email, 0, @VerificationPassword, @Photo)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Surname", surname);
                    command.Parameters.AddWithValue("@Education", education);
                    command.Parameters.AddWithValue("@Position", position);
                    command.Parameters.AddWithValue("@Status", status);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@VerificationPassword", verificationPassword);
                    command.Parameters.AddWithValue("@Photo", photoBytes);

                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 1)
                    {
                        FileUploadPhoto.FileContent.Dispose();
                        FileUploadPhoto.PostedFile.InputStream.Dispose();
                    }

                    connection.Close();
                }
            }
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUploadPhoto.HasFile)
            {
                try
                {
                    byte[] photoBytes = FileUploadPhoto.FileBytes;

                    string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Labs\\lab5\\lab5.mdf;Integrated Security=True";
                    string query = "INSERT INTO Workers Photo VALUES @Photo";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@Photo", photoBytes);

                            connection.Open();

                            int rowsAffected = command.ExecuteNonQuery();

                            connection.Close();
                        }
                    }
                    FileUploadPhoto.FileContent.Dispose();
                    FileUploadPhoto.PostedFile.InputStream.Dispose();
                }
                catch (Exception ex)
                {
                    
                }
            }
        }
    }
}