using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LetMeHelp
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["uID"] = null;
            Session["uFullName"] = null;

            Response.Redirect("Login.aspx?logout=1");
        }
    }
}