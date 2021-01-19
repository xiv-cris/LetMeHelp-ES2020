using LetMeHelp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LetMeHelp
{
    public partial class Resgister : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uID"] != null)
                Response.Redirect("~/");

            divErrors.Visible = false;
        }

        protected void ButtonRegistar_Click(object sender, EventArgs e)
        {

            if (TextBoxPass.Text != TextBoxPass2.Text)
            {
                divErrors.Visible = true;
                StatusText.Text = "As palavras-passe não são iguais!";
                TextBoxPass.Focus();
            }
            else if (EmailInUse(TextBoxEmail.Text))
            {
                divErrors.Visible = true;
                StatusText.Text = "O email introduzido já está em uso!";
                TextBoxEmail.Focus();
            }
            else
                InstanciateUser();

        }

        private bool EmailInUse(string aEmail)
        {
            using (var db = new ModelLMH())
            {
                if (db.Utilizadores.Any(u => u.UserMail == aEmail)) return true;

                return false;
            }
        }

        private void InstanciateUser()
        {

            User user = new User
            {
                UserFullName = TextBoxNome.Text.Trim(),
                UserBirthday = DateTime.Parse(TextBoxData.Text.Trim()),
                UserPhone = int.Parse(TextBoxTel.Text.Trim()),
                UserMail = TextBoxEmail.Text.Trim(),
                UserPass = TextBoxPass.Text.Trim(),
                UserBio = TextAreaDescription.Text.Trim(),
                UserGender = DropDownList1.SelectedItem.Text.Trim(),
                UserPicLink = "~/imgs/profileDefault.png",
                UserReputation = 0
            };

            ExecuteInsert(user);
        }

        private void ExecuteInsert(User aUser)
        {
            using (var db = new ModelLMH())
            {
                db.Utilizadores.Add(aUser);
                db.SaveChanges();
            }

            Response.Redirect("Login.aspx?registed=1");
        }
    }
}