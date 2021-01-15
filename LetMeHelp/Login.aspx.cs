using LetMeHelp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LetMeHelp
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["uID"] !=null)
                Response.Redirect("~/");

            divErrors.Visible = false;

            if (Request.QueryString["registed"] != null)
                StatusText.Text = "Registado com sucesso. Entre agora na sua conta!";
            else if(Request.QueryString["logout"] != null)
                StatusText.Text = "Terminou a sua sessão!";
            else
                divMessage.Visible = false;
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            using (var db = new ModelLMH())
            {
                if ( db.Utilizadores.Any(u => u.UserMail == TextBoxEmail.Text.Trim()
                                            && u.UserPass == TextBoxPass.Text.Trim() ))
                {
                    var myQery = from b in db.Utilizadores
                                          where b.UserMail == TextBoxEmail.Text.Trim()
                                          select b;

                    foreach (var item in myQery)
                    {
                        Session["uID"] = item.UserId.ToString();
                        Session["uFullName"] = item.UserFullName.ToString();
                    }

                    Response.Redirect("~/");
                }
                else
                {
                    StatusErrorText.Text = "A palavra-passe e o email introduzidos não coincidem!";
                    divErrors.Visible = true;
                }
                    
            }

        }
    }
}