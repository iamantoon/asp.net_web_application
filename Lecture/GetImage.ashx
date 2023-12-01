<%@ WebHandler Language="C#" Class="GetImage" %>

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public class GetImage : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string idParam = context.Request.QueryString["id"];

        if (!string.IsNullOrEmpty(idParam) && int.TryParse(idParam, out int id))
        {
            byte[] imageData = GetImageDataFromDatabase(id);

            if (imageData != null)
            {
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(imageData);
            }
            else
            {
                // If image not found, you can send a default image or handle it as needed.
                context.Response.Write("Image not found");
            }
        }
        else
        {
            // If id parameter is not provided or invalid, you can handle it accordingly.
            context.Response.Write("Invalid or missing id parameter");
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }

    private byte[] GetImageDataFromDatabase(int id)
    {
        // Fetch image data from the database based on the id.
        // Replace this with your actual database connection and query logic.
        string connectionString = ConfigurationManager.ConnectionStrings["UserDBConnection"].ConnectionString;
        byte[] imageData = null;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT Photo FROM Workers WHERE ID = @ID";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@ID", id);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    imageData = (byte[])reader["Photo"];
                }
            }
        }

        return imageData;
    }
}
