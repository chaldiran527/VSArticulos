using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Artículos
{
    public partial class Articulo_i : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-38G492P;Initial Catalog=Prueba1;Integrated Security=True");
        protected void Button2_Click(object sender, EventArgs e)//boton insertar
        {
            string nombreArticulo = TextBox1.Text;
            double precioArticulo = 0;
            if (int.TryParse(TextBox2.Text, out int value))
            {
                 precioArticulo = double.Parse(TextBox2.Text);
            }

            SqlCommand command = new SqlCommand();
            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_InsertArticulo";

            command.Parameters.AddWithValue("inNombre", nombreArticulo);
            command.Parameters.AddWithValue("inPrecio", precioArticulo);
            command.Parameters.AddWithValue("outResultCode", 0);

            conexion.Open();
            command.Parameters[2].Direction = ParameterDirection.Output;
            command.ExecuteNonQuery();
            String resultCode = Convert.ToString(command.Parameters[2].Value);
            conexion.Close();

            string strInsertOk = "alert('Inserción exitosa!');";
            
            if (resultCode == "0") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertOk, true);
            else ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Inserción fallida')", true);
        }

        protected void Button1_Click(object sender, EventArgs e)//boton cerrar
        {
            Response.Redirect("Default.aspx");
        }
    }
}