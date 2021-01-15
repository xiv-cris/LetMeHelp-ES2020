using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LetMeHelp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uID"] != null)
            {
                Nome.Text = Session["uFullName"].ToString();
                logged.Visible = true;
                login.Visible = false;
            }

            else
            {
                logged.Visible = false;
                login.Visible = true;
            }
        }
    }
}