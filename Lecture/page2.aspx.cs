using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lecture
{
    public partial class page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Request.UrlReferrer.ToString().Contains("Default"))
                {

                }
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string recordId = Request.QueryString["id"];

                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;

                    string query = "SELECT * FROM Workers WHERE ID = @RecordId";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@RecordId", recordId);

                            connection.Open();

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    string surname = reader["Surname"].ToString();
                                    byte[] photoData = reader["Photo"] as byte[] ?? new byte[0];
                                    string education = reader["Education"].ToString();
                                    string position = reader["Position"].ToString();
                                    string status = reader["Status"].ToString();
                                    string email = reader["Email"].ToString();
                                    bool isEmailVerified = (bool)reader["IsEmailVerified"];

                                    txtEducation.Text = education;
                                    txtPosition.Text = position;
                                    txtName.Text = surname;
                                    TextBox2.Text = status;
                                    TextBox1.Text = email;

                                    if (isEmailVerified)
                                    {
                                        emailStatus.Text = "Підтверджений";
                                    }
                                    else
                                    {
                                        emailStatus.Text = "Не підтверджений";
                                    }

                                    // Застосовуємо фото до тегу img
                                    if (photoData.Length > 0)
                                    {
                                        string base64String = Convert.ToBase64String(photoData);
                                        string imageUrl = $"data:image/jpeg;base64,{base64String}";
                                        imgTag.Attributes["src"] = imageUrl;
                                    } 
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            Response.Redirect("Default.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            Response.Redirect("page3.aspx?id=" + Request.QueryString["id"]);
        }
    }
}