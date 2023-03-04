using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Artículos
{
    public partial class PageLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogButton_Click(object sender, EventArgs e)//boton cerrar
        {
            Response.Redirect("Default.aspx");
        }
    }
}